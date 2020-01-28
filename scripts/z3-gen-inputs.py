
finput="test-inputs"

## parse args
import sys
argnum = len(sys.argv)
if argnum < 3:
	print ("Specify the constraint file and input size.")
	exit(-1)

fconstr = sys.argv[1]
# the size/length of the input array
N = int(sys.argv[2])
counts = int(sys.argv[3])

## run z3
from z3 import *
ctx = Context()
s = Solver(ctx=ctx)
f = parse_smt2_file(fconstr, ctx=ctx)
s.add(f)
s.push()

solutions = []
for i in range(counts):

	if s.check() != sat:
		break

	m = s.model()

	data_z3_array = [m.evaluate(d()) for d in m.decls() if d.name()=="input0"][0]
	data = [int(m.evaluate(data_z3_array[i]).as_long()) for i in range(N*4)]
	solutions.append(data)

	for v in m:
		if v.name() == "input0":
			x = v
	x_value = m.evaluate(x())
	s.add(Not(x() == x_value))
	
s.pop()

## write z3 solutions to input data files
import struct
import os
lib = cdll.LoadLibrary('/home/fptesting/FPTesting/utils/libwquads-ivy.so')
lib.write_quads.argtypes = [c_double]

for i in range(len(solutions)):

	data = solutions[i]

	for j in range(N):
		datastr = struct.pack("BBBB", data[j], data[j+1], data[j+2], data[j+3])
		fpdata = struct.unpack("f", datastr)[0]
		#print ("{0:0.2f}".format(fpdata))
		lib.write_quads(fpdata)

	new_finput=fconstr.replace(".cvc", "-input", 1)+"-"+str(i+1)
	os.rename(finput, new_finput)

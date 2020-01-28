#ifndef _FP_DEBUGGER_HEADER
#define _FP_DEBUGGER_HEADER
#include <string>
#include <set>
using namespace std;

// input file
extern std::string inflist;

// profiling file
extern std::string prof_prefix;

// function name, start/end line number
extern std::string infuncname;
extern unsigned instart;
extern unsigned inend; 
extern bool transWholeFunc; 
extern std::set<string> fnamelist; 
extern std::set<string> fvisited; 

// output file
extern std::string outfilename;
#endif

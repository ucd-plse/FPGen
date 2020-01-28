#include "clang/AST/ASTContext.h"
#include "clang/AST/Decl.h"
#include "clang/AST/Expr.h"
#include <vector>
#include <set>

using namespace clang;
using namespace std;

class _loopRecord {
public:
  string ID;
  unsigned start;
  unsigned end;
  unsigned depth;
  vector<const Stmt*> adds;
  set<const FunctionDecl*> fcalls;
  vector<_loopRecord*> innerloops;
 
  _loopRecord(unsigned s, unsigned e): start(s), end(e), ID(to_string(s)+"_"+to_string(e)) {}

};

#include "clang/AST/Decl.h"
#include "clang/AST/Expr.h"
#include "clang/AST/ASTContext.h"
#include <vector>
#include <map>

using namespace clang;
using namespace std;

class _lineRecord {
  vector<const VarDecl*> vDels;
  vector<const DeclRefExpr*> reads;
  vector<const DeclRefExpr*> writes;
  vector<const CallExpr*> calls;
public:
  unsigned lineNum;
  _lineRecord(unsigned line):lineNum(line){}
  void addVDel(const VarDecl*);
  void addRead(const DeclRefExpr*);
  void addWrite(const DeclRefExpr*);
  void addCall(const CallExpr* cl);
  void printLineRecord(const string filename); 
};

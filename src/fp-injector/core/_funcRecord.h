#include "clang/AST/Decl.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/Expr.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include <vector>
#include <tuple>
#include <map>
#include <set>

#include "_loopRecord.h"
#include "_lineRecord.h"

using namespace clang;
using namespace std;

class _funcRecord{
public:
  const FunctionDecl *funcDel;
  string funcName;
  string fileName;
  map<unsigned, vector<_loopRecord*>> forloops;
  set<const FunctionDecl*> fcalls;
  set<const FunctionDecl*> outterfcalls; 

  ASTContext* context;  
//public:
  //_funcRecord(FunctionDecl *func) : funcDel(func), funcName(func->getNameInfo().getName().getAsString()) {};
  _funcRecord(const FunctionDecl *func, ASTContext* context);
  void processLoops();
  void printFuncRecord(string filename);

private:
  void processStmts(const Stmt* st, unsigned depth, _loopRecord* loopRp);
  void processReturnStmt(const ReturnStmt* rst, _loopRecord* loopRp);
  void processWhileStmt(const WhileStmt* wst, unsigned depth, _loopRecord* loopRp);
  void processForStmt(const ForStmt* forst, unsigned depth, _loopRecord* loopRp);
  void processIfStmt(const IfStmt* ifst, unsigned depth, _loopRecord* loopRp);
  void processSwitchStmt(const SwitchStmt* swst, unsigned depth, _loopRecord* loopRp);
  void processDeclStmt(const DeclStmt* delst, _loopRecord* loopRp);
  void processBinaryOpStmt(const BinaryOperator* bst, _loopRecord* loopRp);
  void processCompoundAOpStmt(const CompoundAssignOperator* comast, _loopRecord* loopRp);
  
  void handleFCall(const CallExpr* call, _loopRecord* loopRd);
  void handleReads(const clang::Expr* epr, _loopRecord* lRp);
  vector<const DeclRefExpr*>& obtainReads(const clang::Expr* epr, unsigned line, _lineRecord* lRp);
};

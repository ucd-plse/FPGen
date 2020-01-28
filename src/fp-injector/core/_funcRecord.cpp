#include "clang/Basic/LangOptions.h"
#include "clang/Analysis/CFG.h"
#include "clang/Basic/SourceManager.h" 
#include "clang/AST/Expr.h"
#include "llvm/Support/raw_ostream.h"
#include "clang/Lex/Lexer.h"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <sys/stat.h>

#include "_fp.h"
#include "_funcRecord.h"

using namespace llvm;

extern map<const FunctionDecl*, _funcRecord*> funcRdList;

_funcRecord::_funcRecord(const FunctionDecl *func, ASTContext* Context){
  context = Context;
  funcDel = func;
  funcName = func->getNameInfo().getName().getAsString();
  fileName = context->getSourceManager().getFilename(func->getLocation()).str();
}

//==================
//analysis
//==================

void _funcRecord::processLoops(){
  const CompoundStmt *fBody = dyn_cast<CompoundStmt>(funcDel->getBody());
  CompoundStmt::const_body_iterator stmtI;
  for (stmtI =fBody->body_begin(); stmtI != fBody->body_end(); stmtI++){
    const Stmt * st = *stmtI;
    processStmts(st, 0, NULL);
  }
}

void _funcRecord::handleFCall(const CallExpr* call, _loopRecord* loopRd){
  const FunctionDecl* fdel = call->getDirectCallee();
  if (fdel==nullptr)
    return;

  if (context->getSourceManager().isInSystemHeader(fdel->getSourceRange().getBegin()))
    return;

  fcalls.insert(fdel);
  if (loopRd==NULL){
    outterfcalls.insert(fdel);
  }else{
    loopRd->fcalls.insert(fdel);
  }

  //if (auto callee = dyn_cast<const clang::NamedDecl>(call->getCalleeDecl()))
  //  llvm::errs() << callee->getNameAsString() << "\n";

  if (fdel->hasBody() && funcRdList.find(fdel) == funcRdList.end()){
    _funcRecord* fRd = new _funcRecord(fdel, context);

    if (auto callee = dyn_cast<const clang::NamedDecl>(call->getCalleeDecl()))
      llvm::errs() << "callee function :\033[1;32m" << callee->getNameAsString() << "\033[0m\n";

    fRd->processLoops();

    funcRdList[fdel] = fRd;
  }   
}

 
void _funcRecord::processStmts(const Stmt* statement, unsigned depth, _loopRecord* loopRd){
  SourceLocation SL = statement->getSourceRange().getBegin();
  unsigned line = context->getFullLoc(SL).getSpellingLineNumber();

  string type = statement->getStmtClassName();
  //llvm::errs() << "Statement: " << type << " , line " << line << "\n"; 
  if (type == "ReturnStmt") {
    auto rs = dyn_cast<const ReturnStmt>(statement);
    processReturnStmt(rs, loopRd);
  } else if (type == "WhileStmt") {
    auto ws = dyn_cast<WhileStmt>(statement);
    processWhileStmt(ws, depth, loopRd);
  } else if (type == "ForStmt") {
    auto fs = dyn_cast<const ForStmt>(statement);
    processForStmt(fs, depth, loopRd);
  } else if (type == "IfStmt") {
    auto is = dyn_cast<const IfStmt>(statement);
    processIfStmt(is, depth, loopRd);
  } else if (type == "SwitchStmt") {
    auto ss = dyn_cast<const SwitchStmt>(statement);
    processSwitchStmt(ss, depth, loopRd);
  } else if (type == "DeclStmt"){
    auto ds = dyn_cast<const DeclStmt>(statement);
    processDeclStmt(ds, loopRd);
  } else if (type == "BinaryOperator") {
    auto bs = dyn_cast<BinaryOperator>(statement);
    processBinaryOpStmt(bs, loopRd);
  } else if (type == "CompoundAssignOperator") {
    auto comas = dyn_cast<CompoundAssignOperator>(statement);
    processCompoundAOpStmt(comas, loopRd);
  } else if (type == "CompoundStmt") {
    auto cs = dyn_cast<const CompoundStmt>(statement);
    for (auto child : cs->children())
    processStmts(child, depth, loopRd);
  } else if (type == "CallExpr") {
    auto cls = dyn_cast<const CallExpr>(statement);
    handleFCall(cls, loopRd);  
  } else {
    llvm::errs() << "Unhandled Statement: " << type << " , line " << line << "\n"; 
  } 
}


void _funcRecord::processForStmt(const ForStmt* forst, unsigned depth, _loopRecord* loopRd){
  // for loops
  SourceLocation BSL = forst->getSourceRange().getBegin();
  SourceLocation ESL = forst->getSourceRange().getEnd();
  unsigned start = context->getFullLoc(BSL).getSpellingLineNumber();
  unsigned end = context->getFullLoc(ESL).getSpellingLineNumber();

  // create a loop record for the for-loop
  _loopRecord* curloopRd = new _loopRecord(start, end);
  curloopRd->depth = ++depth;

  // add the for-loop to the loop list of the same depth
  vector<_loopRecord*>* llist;
  if (forloops.find(depth) == forloops.end()){
    llist = new vector<_loopRecord*>();
    forloops[depth] = *llist;
  }
  llist = &forloops[depth];
  llist->push_back(curloopRd);

  // add the for-loop to the inner loop list of its outter loop
  if (loopRd!=NULL)
    loopRd->innerloops.push_back(curloopRd);

  llvm::errs() << "Loop : " << start << ", " << end <<"\n"; 
  const CompoundStmt *forBody = dyn_cast<CompoundStmt>(forst->getBody());
  CompoundStmt::const_body_iterator stmtI;
  for (stmtI =forBody->body_begin(); stmtI != forBody->body_end(); stmtI++){
    const Stmt * st = *stmtI;
    //st->dump();
    processStmts(st, depth, curloopRd);
    //processLoopStmts(st, curloopRd);
  }
}

void _funcRecord::processWhileStmt(const WhileStmt* wst, unsigned depth, _loopRecord* loopRd){
  llvm::errs() << "Incomplete function : processWhileStmt \n"; 
}

void _funcRecord::processIfStmt(const IfStmt* ifst, unsigned depth, _loopRecord* loopRd){
  // if statement
  const CompoundStmt *thenBody = dyn_cast<CompoundStmt>(ifst->getThen());
  CompoundStmt::const_body_iterator stmtI;
  for (stmtI =thenBody->body_begin(); stmtI != thenBody->body_end(); stmtI++){
    const Stmt * st = *stmtI;
    //st->dump();
    processStmts(st, depth, loopRd);
  }

  if (ifst->hasElseStorage()){
    const CompoundStmt *elseBody = dyn_cast<CompoundStmt>(ifst->getElse());
    for (stmtI =elseBody->body_begin(); stmtI != elseBody->body_end(); stmtI++){
      const Stmt * st = *stmtI;
      //st->dump();
      processStmts(st, depth, loopRd);
    }
  } 
}

void _funcRecord::processReturnStmt(const ReturnStmt* rst, _loopRecord* loopRd){
  //llvm::errs() << "Incomplete function : processReturnStmt \n"; 
  const clang::Expr* epr = rst->getRetValue()->IgnoreParenImpCasts();

  handleReads(epr, loopRd);
  //vector<const DeclRefExpr*>& reads = obtainReads(epr, lRp->lineNum, lRp);
  //for (const auto* readV : reads){
  //  if (isDoubleBase(readV->getDecl()->getType().getTypePtr(), context))
  //    lRp->addRead(readV);
  //}
}


void _funcRecord::processSwitchStmt(const SwitchStmt* swst, unsigned depth, _loopRecord* loopRd){
  llvm::errs() << "Incomplete function : processSwitchStmt \n"; 
}

void _funcRecord::processBinaryOpStmt(const BinaryOperator* bst, _loopRecord* loopRd){
  //llvm::errs() << "Incomplete function : processBinaryOpStmt \n";
  handleReads(bst->getRHS()->IgnoreParenImpCasts(), loopRd); 

  if(!bst->isAssignmentOp() || loopRd==NULL)
    return;

  const clang::Type* ty = bst->getType().getTypePtr();
  //if (!isDouble(ty, context))// double 
  if (!isFloating(ty))
    return;
   
  const clang::Expr* rhs = bst->getRHS()->IgnoreParenImpCasts();
  if (const auto* op = dyn_cast<clang::BinaryOperator>(rhs)){
    if (op->getOpcodeStr()=="+" || op->getOpcodeStr()=="-")
      loopRd->adds.push_back(bst);
  }

 // if (isDouble(ty, context)){ // double 
 //   const clang::Expr* lhs = bst->getLHS()->IgnoreParenImpCasts(); // obtain the variable it writes
 //   if (auto arr = dyn_cast<ArraySubscriptExpr>(lhs)){
 //     lhs = arr->getBase()->IgnoreParenImpCasts();
 //   }
 //   if (auto writeV = dyn_cast<DeclRefExpr>(lhs)){
 //     const clang::Type* ty= writeV->getDecl()->getType().getTypePtr();
 //     if (isDoubleBase(ty, context)) 
 //       //lRp->addWrite(writeV);
 //   } else {
 //     llvm::errs() << "failed to obtain the variable an assignment (line " << lRp->lineNum << ") writes to.\n"; 
 //   }
 // 
 //   const clang::Expr* rhs = bst->getRHS()->IgnoreParenImpCasts();
 //   vector<const DeclRefExpr*>& reads = obtainReads(rhs, lRp->lineNum, lRp);
 //   for (const auto* readV : reads){
 //     if (isDoubleBase(readV->getDecl()->getType().getTypePtr(), context))
 //       //lRp->addRead(readV);
 //   }
 // }
}

void _funcRecord::processCompoundAOpStmt(const CompoundAssignOperator* comast, _loopRecord* loopRd){
  //llvm::errs() << "Incomplete function : processCompoundAOpStmt \n"; 
  SourceLocation SL = comast->getSourceRange().getBegin();
  unsigned line = context->getFullLoc(SL).getSpellingLineNumber();
  //llvm::errs() << "Line: " << line << " compoundassign stmt - "; 
  //SourceRange range = comast->getSourceRange();
  //llvm::StringRef ref = Lexer::getSourceText(CharSourceRange::getCharRange(range), context->getSourceManager(), LangOptions());
  //llvm::errs() << ref.str() << "\n";
  
  handleReads(comast->getRHS()->IgnoreParenImpCasts(), loopRd); 

  const clang::Type* ty = comast->getType().getTypePtr();
  //if (!isDouble(ty, context))// double 
  if (!isFloating(ty) || loopRd==NULL){// double 
    //llvm::errs() << "   -- not floating-point type --\n";
    return;
  }

  //llvm::errs() << "    -- opcode:" << comast->getOpcodeStr() << "\n";
  if (comast->getOpcodeStr()=="+=" || comast->getOpcodeStr()=="-="){
    //llvm::errs() << "    -- opcode:" << comast->getOpcodeStr() << "\n";
    loopRd->adds.push_back(comast);
  }

}

void _funcRecord::processDeclStmt(const DeclStmt* delst, _loopRecord* loopRd){
  //var declaration statements
  const VarDecl *vd = dyn_cast<VarDecl>(*delst->decl_begin());
  const clang::Type* ty = vd->getType().getTypePtr();

  if (vd->hasInit())
    handleReads(vd->getInit()->IgnoreParenImpCasts(), loopRd); 
  //if (!isDouble(ty, context))// double 

  if (!isFloating(ty) || loopRd==NULL)// floating-point
    return;

  if (vd->hasInit()){
    const clang::Expr* epr = vd->getInit()->IgnoreParenImpCasts();
    if (const auto* op = dyn_cast<clang::BinaryOperator>(epr)){
      if (op->getOpcodeStr()=="+" || op->getOpcodeStr()=="-")
        loopRd->adds.push_back(delst);
    }
  }
}

void _funcRecord::handleReads(const clang::Expr* epr, _loopRecord* lRp){
  SourceLocation SL = epr->getExprLoc();
  unsigned line = context->getFullLoc(SL).getSpellingLineNumber();

  vector<const DeclRefExpr*>* reads = new std::vector<const DeclRefExpr*>();

  vector<const clang::Expr*> wlist;
  wlist.push_back(epr);
  while (!wlist.empty()){
    epr = wlist.back(); wlist.pop_back();
    if (auto arr = dyn_cast<ArraySubscriptExpr>(epr)){
    //  epr = arr->getBase()->IgnoreParenImpCasts();
    }else if (auto readV = dyn_cast<DeclRefExpr>(epr)){
    //  const clang::Type* ty= readV->getDecl()->getType().getTypePtr();
    //  if (isDoubleBase(ty, context))
        reads->push_back(readV); 
    }else if (auto bop = dyn_cast<BinaryOperator>(epr)){
      wlist.push_back(bop->getLHS()->IgnoreParenImpCasts());
      wlist.push_back(bop->getRHS()->IgnoreParenImpCasts());
    }else if (auto cop = dyn_cast<ConditionalOperator>(epr)){
      wlist.push_back(cop->getCond()->IgnoreParenImpCasts());
      wlist.push_back(cop->getTrueExpr()->IgnoreParenImpCasts());
      wlist.push_back(cop->getFalseExpr()->IgnoreParenImpCasts());
    }else if (auto uop = dyn_cast<UnaryOperator>(epr)){
      wlist.push_back(uop->getSubExpr()->IgnoreParenImpCasts());
    }else if (auto callop = dyn_cast<CallExpr>(epr)){
      llvm::errs() << "process call expr on line " << line << "\n";
      handleFCall(callop, lRp);
      for (const auto * epr : callop->arguments())
        wlist.push_back(epr->IgnoreParenImpCasts());
    } else if ( string(epr->getStmtClassName()) == "IntegerLiteral" || string(epr->getStmtClassName()) == "FloatingLiteral"){
      // llvm::errs() << "an  interger/floating literal (line " << lRp->lineNum << " )\n"; // non
    } else {
      llvm::errs() << "failed to obtain the variable an assignment (line " << line << ") reads.\n"; 
    }  
  }
}



vector<const DeclRefExpr*>& _funcRecord::obtainReads(const clang::Expr* epr, unsigned line, _lineRecord* lRp){
  vector<const DeclRefExpr*>* reads = new std::vector<const DeclRefExpr*>();

  vector<const clang::Expr*> wlist;
  wlist.push_back(epr);
  while (!wlist.empty()){
    epr = wlist.back(); wlist.pop_back();
    if (auto arr = dyn_cast<ArraySubscriptExpr>(epr)){
      epr = arr->getBase()->IgnoreParenImpCasts();
    }
    if (auto readV = dyn_cast<DeclRefExpr>(epr)){
      const clang::Type* ty= readV->getDecl()->getType().getTypePtr();
      if (isDoubleBase(ty, context))
        reads->push_back(readV); 
    }else if (auto bop = dyn_cast<BinaryOperator>(epr)){
      wlist.push_back(bop->getLHS()->IgnoreParenImpCasts());
      wlist.push_back(bop->getRHS()->IgnoreParenImpCasts());
    }else if (auto cop = dyn_cast<ConditionalOperator>(epr)){
      wlist.push_back(cop->getCond()->IgnoreParenImpCasts());
      wlist.push_back(cop->getTrueExpr()->IgnoreParenImpCasts());
      wlist.push_back(cop->getFalseExpr()->IgnoreParenImpCasts());
    }else if (auto uop = dyn_cast<UnaryOperator>(epr)){
      wlist.push_back(uop->getSubExpr()->IgnoreParenImpCasts());
    }else if (auto callop = dyn_cast<CallExpr>(epr)){
      if (auto callee = dyn_cast<const clang::NamedDecl>(callop->getCalleeDecl())){
        llvm::errs() << "call expr (line " << line << " ): " << callee->getNameAsString() << "\n"; // non
        if(lRp != nullptr)
          lRp->addCall(callop);
      }
      for (const auto * epr : callop->arguments())
        wlist.push_back(epr->IgnoreParenImpCasts());
    } else if ( string(epr->getStmtClassName()) == "IntegerLiteral" || string(epr->getStmtClassName()) == "FloatingLiteral"){
      // llvm::errs() << "an  interger/floating literal (line " << lRp->lineNum << " )\n"; // non
    } else {
      llvm::errs() << "failed to obtain the variable an assignment (line " << line << ") reads.\n"; 
    }  
  }

  return *reads;
 
}
//==================
//print
//==================
void _funcRecord::printFuncRecord(string filename){
  // check whether the file exists and is not empty 
  //struct stat stat_buf;
  //int rc = stat(filename.c_str(), &stat_buf);
  //if(rc!=0 && stat_buf.st_size>0)
  //  return;
    
  llvm::errs() << "to print func record for " << funcName << "\n";
  //ofstream fout (filename, ofstream::out);
  ofstream fout (filename, std::ios_base::trunc);
  fout << "{\n";

  fout << "  \"funcName\" :" << " \"" << funcName << "\",\n";
  fout << "  \"fileName\" :" << " \"" << fileName << "\",\n";

  fout << "  \"forLoops\" : { ";
  for (map<unsigned, vector<_loopRecord*>>::iterator forit=forloops.begin(); forit!=forloops.end(); forit++){
    unsigned depth = forit->first;
    if ((forit == forloops.begin()))
      fout << "\n    " << depth << ": {";
    else 
      fout << ",\n    " << depth << ": {";

    //llvm::errs() << forit->second.size() << " loops are in depth " << depth << "\n";
    //vector<const Stmt*> adds;
    //for (const auto* loop : forit->second)
    //  for (const auto* add : loop->adds)
    //    adds.push_back(add);
    for (vector<_loopRecord*>::iterator depit=forit->second.begin(); depit!=forit->second.end(); depit++){
      _loopRecord* lrd = *depit;
      if ((depit == forit->second.begin()))
        fout << "\n      " << lrd->ID << ": {\n";
      else 
        fout << ",\n      " << lrd->ID << ": {\n";
          
      fout << "        \"adds\" : [ ";
      for (const auto* add : lrd->adds){
        const clang::Stmt* statement = dyn_cast<clang::Stmt>(add);
        if (statement==nullptr)
          continue;
        string ststr;
        raw_string_ostream stream(ststr);
        statement->printPretty(stream, NULL, PrintingPolicy(LangOptions()));
        stream.flush(); 
        if (add == *lrd->adds.begin())
          fout << "\n           " << ststr;
        else
          fout << ",\n           " << ststr; 
      }
      fout <<"\n        ]";
 
      fout << ",\n        \"inner loops\" : [ ";
      for (const auto* inner : lrd->innerloops){
        if (inner == *lrd->innerloops.begin())
          fout << "\n           " << inner->ID;
        else
          fout << ",\n           " << inner->ID; 
      }
      fout <<"\n        ]";

      fout << ",\n        \"fcalls\" : [ ";
      for(set<const FunctionDecl*>::iterator callit=lrd->fcalls.begin(); callit!=lrd->fcalls.end(); callit++){
        //_funcRecord* fRd = funcRdList[*callit];
        string funcName = (*callit)->getNameInfo().getName().getAsString();
        string fileName = context->getSourceManager().getFilename((*callit)->getLocation()).str();
        if ((callit == fcalls.begin()))
          fout << "\n          [" << funcName << ", " << fileName <<"]";
        else 
          fout << ",\n          [" << funcName << ", " << fileName <<"]";
      }
      fout << "\n        ]";

      fout << "\n      }"; //a loop 
    }
    fout << "\n    }"; //at each depth
  }
  fout << "\n  },\n"; //forLoops

  fout << "  \"fcalls\" : [ ";
  for(set<const FunctionDecl*>::iterator callit=fcalls.begin(); callit!=fcalls.end(); callit++){
    //_funcRecord* fRd = funcRdList[*callit];
    string funcName = (*callit)->getNameInfo().getName().getAsString();
    string fileName = context->getSourceManager().getFilename((*callit)->getLocation()).str();
    if ((callit == fcalls.begin()))
      fout << "\n    [" << funcName << ", " << fileName <<"]";
    else 
      fout << ",\n    " << funcName << ", " << fileName <<"]";
  }
  fout << "\n  ]\n";

  fout << "\n}";
  fout.close();
}

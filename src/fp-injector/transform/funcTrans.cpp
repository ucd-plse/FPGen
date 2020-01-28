#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/AST/Stmt.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/raw_ostream.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Rewrite/Core/Rewriter.h"

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>

#include "funcTrans.h"
#include "../FPInjector.h"
#include "../core/_funcRecord.h"

using namespace clang::tooling;

int numTFunctions = 0;
Rewriter TRewriter;

class funcTransVisitor : public RecursiveASTVisitor<funcTransVisitor> {
public:
  explicit funcTransVisitor(ASTContext *Context) : Context(Context) {}

  virtual bool VisitFunctionDecl(FunctionDecl *func) {
    if (!func->doesThisDeclarationHaveABody())
	return true;
    string funcName = func->getNameInfo().getName().getAsString();

    //if (funcName=="rUpdateQuadratureData2D") {
    //if (funcName=="foo" || funcName=="rUpdateQuadratureData2D") {
    if (funcName==infuncname) {
      numTFunctions++;

      _funcRecord frecord(func, Context);

      //if (transWholeFunc)
        //frecord.transWhole(TRewriter);
      //else
        //frecord.transRegion(instart, inend, TRewriter);
 
      outs() << "** function " << numTFunctions << " : " << funcName << "\n";
      //frecord.printFuncRecord(prof_prefix+'-'+funcName);
    }       
    return true;     
  }   
 
private:
  ASTContext *Context;
};

class funcTransConsumer : public clang::ASTConsumer {
public:
  explicit funcTransConsumer(ASTContext *Context) : Visitor(Context) {}

  virtual void HandleTranslationUnit(clang::ASTContext &Context) {
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
  }
private:
  funcTransVisitor Visitor;
};

std::unique_ptr<clang::ASTConsumer> funcTransAction::CreateASTConsumer(
  clang::CompilerInstance &CI, StringRef InFile) {
  outs() << "** Creating funcTrans AST consumer for: " << InFile << "\n";
  TRewriter.setSourceMgr(CI.getSourceManager(), CI.getLangOpts());
  //return llvm::make_unique<MyASTConsumer>(TheRewriter,&CI.getASTContext());
  return std::unique_ptr<clang::ASTConsumer>(
      new funcTransConsumer(&CI.getASTContext()));
}

void funcTransAction::EndSourceFileAction(){
  SourceManager &SM = TRewriter.getSourceMgr();
  outs() << "** End funcTrans Action for: "
               << SM.getFileEntryForID(SM.getMainFileID())->getName() << "\n";

  // Now emit the rewritten buffer.
  //TheRewriter.getEditBuffer(SM.getMainFileID()).write(llvm::outs()); --> this will output to screen as what you got.
  std::error_code error_code;
  llvm::raw_fd_ostream outFile(outfilename, error_code, llvm::sys::fs::F_None);
  TRewriter.getEditBuffer(SM.getMainFileID()).write(outFile); // --> this will write the result to outFile
  outFile.close();
}

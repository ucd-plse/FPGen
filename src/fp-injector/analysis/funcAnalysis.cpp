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

#include "funcAnalysis.h"
#include "../FPInjector.h"
#include "../core/_funcRecord.h"

using namespace clang::tooling;

int numAFunctions = 0;
Rewriter AnRewriter;

extern map<const FunctionDecl*, _funcRecord*> funcRdList;

//string profname = "fp-debugger";
class funcAnalysisVisitor : public RecursiveASTVisitor<funcAnalysisVisitor> {
public:
  explicit funcAnalysisVisitor(ASTContext *Context) : Context(Context) {}

  virtual bool VisitFunctionDecl(FunctionDecl *func) {
    if (!func->doesThisDeclarationHaveABody())
	return true;
    string funcName = func->getNameInfo().getName().getAsString();

    //if (funcName=="foo" || funcName=="rUpdateQuadratureData2D") {
    if (funcName==infuncname || fnamelist.find(funcName)!=fnamelist.end()) {
      if (fvisited.find(funcName)!=fvisited.end())
        return true;
		

      fnamelist.erase(fnamelist.find(funcName));
      numAFunctions++;
      outs() << "** function " << numAFunctions << " : \033[1;32m" << funcName << "\033[0m\n";

      _funcRecord *frecord = new _funcRecord(func, Context);
      funcRdList[func] = frecord;

      //frecord.processFPParameters();
      //frecord.processBBs();
      frecord->processLoops();
 
      
      outs() << "\n\n\033[1;31mUnhandled functions:\033[0m\n";
      //ofstream fout(inflist, ofstream::out);
      //fout << "[";
      for(set<const FunctionDecl*>::iterator it=frecord->fcalls.begin(); it!=frecord->fcalls.end(); it++){
        if (funcRdList.find(*it) == funcRdList.end()){
           outs() << " " << (*it)->getNameInfo().getName().getAsString() << ",";
        }
      }
      //fout << "]\n";
      //fout.close();
      outs() << "\n\033[1;31mEnd of Unhandled functions\033[0m\n\n";

      for(map<const FunctionDecl*, _funcRecord*>::iterator it=funcRdList.begin(); it!=funcRdList.end(); it++){
        string itfname= it->second->funcName;
        outs() << itfname <<"\n"; 
        if (fvisited.find(itfname)==fvisited.end()){
          it->second->printFuncRecord(prof_prefix+'-'+itfname);
          fvisited.insert(itfname);
        }
      }
    }       
    return true;     
  }   
 
private:
  ASTContext *Context;
};

class funcAnalysisConsumer : public clang::ASTConsumer {
public:
  explicit funcAnalysisConsumer(ASTContext *Context) : Visitor(Context) {}

  virtual void HandleTranslationUnit(clang::ASTContext &Context) {
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
  }
private:
  funcAnalysisVisitor Visitor;
};

std::unique_ptr<clang::ASTConsumer> funcAnalysisAction::CreateASTConsumer(
  clang::CompilerInstance &CI, StringRef InFile) {
  
  AnRewriter.setSourceMgr(CI.getSourceManager(), CI.getLangOpts());
  //ifstream myfile (infofname);
  //getline(myfile, inFuncName); 
  
  outs() << "** Creating funcAnalysis AST consumer for: " << InFile << "\n";
  //TheRewriter.setSourceMgr(CI.getSourceManager(), CI.getLangOpts());
  //return llvm::make_unique<MyASTConsumer>(TheRewriter,&CI.getASTContext());
  return std::unique_ptr<clang::ASTConsumer>(
      new funcAnalysisConsumer(&CI.getASTContext()));
}

void funcAnalysisAction::EndSourceFileAction(){
  SourceManager &SM = AnRewriter.getSourceMgr();
  outs() << "** End funcAnalysis Action for: "
               << SM.getFileEntryForID(SM.getMainFileID())->getName() << "\n";
}

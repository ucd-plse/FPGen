#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/AST/Stmt.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendAction.h"
#include "clang/Tooling/Tooling.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Casting.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "llvm/Support/raw_ostream.h"

#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>

#include "FPInjector.h"
#include "analysis/funcAnalysis.h"
#include "transform/funcTrans.h"
#include "core/_funcRecord.h"
#include "utils/json.hpp"

using namespace clang;
using namespace clang::tooling;
using namespace std;
//using namespace llvm;
using json=nlohmann::json;

std::string inflist = "flist.json";
std::string prof_prefix = "fp-injector";

std::string outfilename;

std::string infuncname;
unsigned instart;
unsigned inend; 
bool transWholeFunc = false;

std::set<string> fnamelist; 
std::set<string> fvisited; 

static cl::OptionCategory FPInjectorCat("FPInjector Options");

//static cl::opt<string> inFileName("i",cl::desc("input file that contains the list of functions of interest"),
//                     cl::init("funtion-list.txt"), cl::cat(FPInjectorCat));
static cl::opt<string> outFileName("o",cl::desc("name of the transformed file"),
                     cl::init("output.txt"), cl::cat(FPInjectorCat));
static cl::opt<bool> analysisOnly("ao",cl::desc("flag that specifies whether to perform the analysis only, false in default"),
                     cl::init(false), cl::cat(FPInjectorCat));
static cl::opt<bool> injection("t",cl::desc("flag that specifies whether to perform the injection, true in default"),
                     cl::init(true), cl::cat(FPInjectorCat));

static cl::opt<string> inFuncName("f",cl::desc("funtion name"),
                     cl::init("myfoo"), cl::cat(FPInjectorCat));
static cl::opt<unsigned> inAddID("add",cl::desc("the addition/subtractions for injection"),
                     cl::init(0), cl::cat(FPInjectorCat));
static cl::opt<string> inFileName("i",cl::desc("input file name that contains the function name list"),
                     cl::init("flist.json"), cl::cat(FPInjectorCat));

int main(int argc, const char **argv) {

  //parse the command-line args passed to the code
  CommonOptionsParser op(argc, argv, FPInjectorCat, nullptr);
  //ofstream infofile (infofname, ios::out);  
  //infofile << inFuncName << "\n";

  infuncname = inFuncName;
  if (analysisOnly) {
    injection=false;
  }
  if (injection) {
    if (inAddID == 0){
      //infofile.close();
      //llvm::errs() << "Specify the start and end line number of the code region for transformation!\n";
      transWholeFunc = true;
    }
    instart = 0;
    inend = 0;  
    
    outfilename = outFileName;
  }
  //infofile.close();

  std::ifstream infile;
  infile.open(inFileName);
  json j = json::parse(infile);
  infile.close();
  
  json fnames = j["flist"];

  for(unsigned i=0; i<fnames.size(); i++){
    string fname = fnames[i];
    std::cout << "Input function name: " << fname << "\n";
    fnamelist.insert(fname);
  }
   
  // create a new Clang Tool instance 
  ClangTool Tool(op.getCompilations(), op.getSourcePathList());

  // run the Clang Tool, creating a new FrontendAction
  int result;
  if (analysisOnly){ 
    result = Tool.run(newFrontendActionFactory<funcAnalysisAction>().get());
    return result;
  }

  if (injection)
    result = Tool.run(newFrontendActionFactory<funcTransAction>().get());
  
  return result;
}

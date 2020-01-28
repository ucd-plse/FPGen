#include "clang/AST/ASTContext.h"
#include "clang/AST/Decl.h"
#include <vector>
#include <map>

#include "_funcRecord.h"

using namespace clang;
using namespace std;

map<const FunctionDecl*, _funcRecord*> funcRdList;

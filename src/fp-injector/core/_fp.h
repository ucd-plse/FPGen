#ifndef _FP_DEBUGGER_FP_HEADER
#define _FP_DEBUGGER_FP_HEADER

//We currently only consider double precision.

#include "clang/AST/Type.h"
#include "clang/AST/ASTContext.h"

using namespace clang;
using namespace std;

bool isDouble(const Type* ty, ASTContext* context){
  if (ty->isFloatingType() & (context->getTypeSize(ty)==64)) 
    return true;
  else
    return false; 
}

bool isDoublePointer(const Type* ty, ASTContext* context){
  if (ty->isPointerType()){
    const clang::Type* pty = ty->getPointeeType().getTypePtr(); 
    if(pty->isFloatingType() & (context->getTypeSize(pty)==64)) 
      return true;
  }
  return false;
}

bool isDoubleArray(const Type* ty, ASTContext* context){
  if (const clang::ArrayType* vty = ty->getAsArrayTypeUnsafe())
    if (context->getTypeSize(vty->getElementType().getTypePtr())==64)
      return true;
  return false;
}

bool isDoubleBase(const Type* ty, ASTContext* context){
  if (isDouble(ty, context) || isDoublePointer(ty, context) || isDoubleArray(ty, context))
    return true;
  else
    return false;
}

bool isFloating(const Type* ty){
  return ty->isFloatingType(); 
}

#endif

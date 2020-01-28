; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }

@__getdents = alias bitcast (i64 (i32, %struct.dirent*, i64)* @getdents to i32 (i32, %struct.dirent*, i32)*)

; Function Attrs: nounwind uwtable
define i32 @open(i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !13), !dbg !261
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !14), !dbg !261
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !15), !dbg !262
  %1 = and i32 %flags, 64, !dbg !263
  %2 = icmp eq i32 %1, 0, !dbg !263
  br i1 %2, label %21, label %3, !dbg !263

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !19), !dbg !264
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !265
  call void @llvm.va_start(i8* %4), !dbg !265
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !266
  %6 = load i32* %5, align 16, !dbg !266
  %7 = icmp ult i32 %6, 41, !dbg !266
  br i1 %7, label %8, label %14, !dbg !266

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !266
  %10 = load i8** %9, align 16, !dbg !266
  %11 = sext i32 %6 to i64, !dbg !266
  %12 = getelementptr i8* %10, i64 %11, !dbg !266
  %13 = add i32 %6, 8, !dbg !266
  store i32 %13, i32* %5, align 16, !dbg !266
  br label %18, !dbg !266

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !266
  %16 = load i8** %15, align 8, !dbg !266
  %17 = getelementptr i8* %16, i64 8, !dbg !266
  store i8* %17, i8** %15, align 8, !dbg !266
  br label %18, !dbg !266

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !266
  %20 = load i32* %19, align 4, !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !15), !dbg !266
  call void @llvm.va_end(i8* %4), !dbg !267
  br label %21, !dbg !268

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !269
  ret i32 %22, !dbg !269
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

declare i32 @__fd_open(i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i32 @openat(i32 %fd, i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !40), !dbg !270
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !41), !dbg !270
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !42), !dbg !270
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !43), !dbg !271
  %1 = and i32 %flags, 64, !dbg !272
  %2 = icmp eq i32 %1, 0, !dbg !272
  br i1 %2, label %21, label %3, !dbg !272

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !44), !dbg !273
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !274
  call void @llvm.va_start(i8* %4), !dbg !274
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !275
  %6 = load i32* %5, align 16, !dbg !275
  %7 = icmp ult i32 %6, 41, !dbg !275
  br i1 %7, label %8, label %14, !dbg !275

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !275
  %10 = load i8** %9, align 16, !dbg !275
  %11 = sext i32 %6 to i64, !dbg !275
  %12 = getelementptr i8* %10, i64 %11, !dbg !275
  %13 = add i32 %6, 8, !dbg !275
  store i32 %13, i32* %5, align 16, !dbg !275
  br label %18, !dbg !275

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !275
  %16 = load i8** %15, align 8, !dbg !275
  %17 = getelementptr i8* %16, i64 8, !dbg !275
  store i8* %17, i8** %15, align 8, !dbg !275
  br label %18, !dbg !275

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !275
  %20 = load i32* %19, align 4, !dbg !275
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !43), !dbg !275
  call void @llvm.va_end(i8* %4), !dbg !276
  br label %21, !dbg !277

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !278
  ret i32 %22, !dbg !278
}

declare i32 @__fd_openat(i32, i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i64 @lseek(i32 %fd, i64 %off, i32 %whence) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !54), !dbg !279
  tail call void @llvm.dbg.value(metadata !{i64 %off}, i64 0, metadata !55), !dbg !279
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !56), !dbg !279
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) #2, !dbg !280
  ret i64 %1, !dbg !280
}

declare i64 @__fd_lseek(i32, i64, i32) #3

; Function Attrs: nounwind uwtable
define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) #0 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !98), !dbg !281
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !99), !dbg !281
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !100), !dbg !281
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !282
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !282
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !101), !dbg !282
  %2 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) #2, !dbg !283
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !121), !dbg !283
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !284), !dbg !286
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !287), !dbg !286
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !288
  %4 = load <2 x i64>* %3, align 16, !dbg !288, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !288
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !288, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !293
  %7 = bitcast i32* %6 to i64*, !dbg !293
  %8 = load i64* %7, align 8, !dbg !293
  %9 = trunc i64 %8 to i32, !dbg !293
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !293
  store i32 %9, i32* %10, align 4, !dbg !293, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !298
  %12 = load i64* %11, align 16, !dbg !298, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !298
  store i64 %12, i64* %13, align 8, !dbg !298, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !302
  store i32 %15, i32* %16, align 4, !dbg !302, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !304
  %18 = load i32* %17, align 16, !dbg !304, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !304
  store i32 %18, i32* %19, align 4, !dbg !304, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !307
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !307
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !307
  %23 = load <2 x i64>* %22, align 8, !dbg !307, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !307
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !307, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !308
  %26 = load i64* %25, align 8, !dbg !308, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !308
  store i64 %26, i64* %27, align 8, !dbg !308, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !311
  %29 = load i64* %28, align 8, !dbg !311, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !311
  store i64 %29, i64* %30, align 8, !dbg !311, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !314
  %32 = load i64* %31, align 8, !dbg !314, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !314
  store i64 %32, i64* %33, align 8, !dbg !314, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !317
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !317
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !317
  %37 = load <2 x i64>* %36, align 8, !dbg !317, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !317
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !317, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !318
  %40 = load i64* %39, align 8, !dbg !318, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !318
  store i64 %40, i64* %41, align 8, !dbg !318, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !321
  %43 = load i64* %42, align 8, !dbg !321, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !321
  store i64 %43, i64* %44, align 8, !dbg !321, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !324
  %46 = load i64* %45, align 8, !dbg !324, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !324
  store i64 %46, i64* %47, align 8, !dbg !324, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !327
  ret i32 %2, !dbg !327
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

declare i32 @__fd_stat(i8*, %struct.stat64*) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: inlinehint nounwind uwtable
define i32 @stat(i8* %path, %struct.stat* nocapture %buf) #4 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !126), !dbg !328
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !127), !dbg !328
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !329
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !329
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !128), !dbg !329
  %2 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) #2, !dbg !330
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !129), !dbg !330
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !331), !dbg !333
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !334), !dbg !333
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !335
  %4 = load <2 x i64>* %3, align 16, !dbg !335, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !335
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !335, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !336
  %7 = bitcast i32* %6 to i64*, !dbg !336
  %8 = load i64* %7, align 8, !dbg !336
  %9 = trunc i64 %8 to i32, !dbg !336
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !336
  store i32 %9, i32* %10, align 4, !dbg !336, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !337
  %12 = load i64* %11, align 16, !dbg !337, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !337
  store i64 %12, i64* %13, align 8, !dbg !337, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !338
  store i32 %15, i32* %16, align 4, !dbg !338, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !339
  %18 = load i32* %17, align 16, !dbg !339, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !339
  store i32 %18, i32* %19, align 4, !dbg !339, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !340
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !340
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !340
  %23 = load <2 x i64>* %22, align 8, !dbg !340, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !340
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !340, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !341
  %26 = load i64* %25, align 8, !dbg !341, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !341
  store i64 %26, i64* %27, align 8, !dbg !341, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !342
  %29 = load i64* %28, align 8, !dbg !342, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !342
  store i64 %29, i64* %30, align 8, !dbg !342, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !343
  %32 = load i64* %31, align 8, !dbg !343, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !343
  store i64 %32, i64* %33, align 8, !dbg !343, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !344
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !344
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !344
  %37 = load <2 x i64>* %36, align 8, !dbg !344, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !344
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !344, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !345
  %40 = load i64* %39, align 8, !dbg !345, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !345
  store i64 %40, i64* %41, align 8, !dbg !345, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !346
  %43 = load i64* %42, align 8, !dbg !346, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !346
  store i64 %43, i64* %44, align 8, !dbg !346, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !347
  %46 = load i64* %45, align 8, !dbg !347, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !347
  store i64 %46, i64* %47, align 8, !dbg !347, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !348
  ret i32 %2, !dbg !348
}

; Function Attrs: nounwind uwtable
define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) #0 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !132), !dbg !349
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !133), !dbg !349
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !134), !dbg !349
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !350
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !350
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !135), !dbg !350
  %2 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) #2, !dbg !351
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !136), !dbg !351
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !352), !dbg !354
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !355), !dbg !354
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !356
  %4 = load <2 x i64>* %3, align 16, !dbg !356, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !356
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !356, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !357
  %7 = bitcast i32* %6 to i64*, !dbg !357
  %8 = load i64* %7, align 8, !dbg !357
  %9 = trunc i64 %8 to i32, !dbg !357
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !357
  store i32 %9, i32* %10, align 4, !dbg !357, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !358
  %12 = load i64* %11, align 16, !dbg !358, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !358
  store i64 %12, i64* %13, align 8, !dbg !358, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !359
  store i32 %15, i32* %16, align 4, !dbg !359, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !360
  %18 = load i32* %17, align 16, !dbg !360, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !360
  store i32 %18, i32* %19, align 4, !dbg !360, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !361
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !361
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !361
  %23 = load <2 x i64>* %22, align 8, !dbg !361, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !361
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !361, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !362
  %26 = load i64* %25, align 8, !dbg !362, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !362
  store i64 %26, i64* %27, align 8, !dbg !362, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !363
  %29 = load i64* %28, align 8, !dbg !363, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !363
  store i64 %29, i64* %30, align 8, !dbg !363, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !364
  %32 = load i64* %31, align 8, !dbg !364, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !364
  store i64 %32, i64* %33, align 8, !dbg !364, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !365
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !365
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !365
  %37 = load <2 x i64>* %36, align 8, !dbg !365, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !365
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !365, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !366
  %40 = load i64* %39, align 8, !dbg !366, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !366
  store i64 %40, i64* %41, align 8, !dbg !366, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !367
  %43 = load i64* %42, align 8, !dbg !367, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !367
  store i64 %43, i64* %44, align 8, !dbg !367, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !368
  %46 = load i64* %45, align 8, !dbg !368, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !368
  store i64 %46, i64* %47, align 8, !dbg !368, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !369
  ret i32 %2, !dbg !369
}

declare i32 @__fd_lstat(i8*, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) #4 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !139), !dbg !370
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !140), !dbg !370
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !371
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !371
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !141), !dbg !371
  %2 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) #2, !dbg !372
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !142), !dbg !372
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !373), !dbg !375
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !376), !dbg !375
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !377
  %4 = load <2 x i64>* %3, align 16, !dbg !377, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !377
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !377, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !378
  %7 = bitcast i32* %6 to i64*, !dbg !378
  %8 = load i64* %7, align 8, !dbg !378
  %9 = trunc i64 %8 to i32, !dbg !378
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !378
  store i32 %9, i32* %10, align 4, !dbg !378, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !379
  %12 = load i64* %11, align 16, !dbg !379, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !379
  store i64 %12, i64* %13, align 8, !dbg !379, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !380
  store i32 %15, i32* %16, align 4, !dbg !380, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !381
  %18 = load i32* %17, align 16, !dbg !381, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !381
  store i32 %18, i32* %19, align 4, !dbg !381, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !382
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !382
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !382
  %23 = load <2 x i64>* %22, align 8, !dbg !382, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !382
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !382, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !383
  %26 = load i64* %25, align 8, !dbg !383, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !383
  store i64 %26, i64* %27, align 8, !dbg !383, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !384
  %29 = load i64* %28, align 8, !dbg !384, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !384
  store i64 %29, i64* %30, align 8, !dbg !384, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !385
  %32 = load i64* %31, align 8, !dbg !385, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !385
  store i64 %32, i64* %33, align 8, !dbg !385, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !386
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !386
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !386
  %37 = load <2 x i64>* %36, align 8, !dbg !386, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !386
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !386, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !387
  %40 = load i64* %39, align 8, !dbg !387, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !387
  store i64 %40, i64* %41, align 8, !dbg !387, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !388
  %43 = load i64* %42, align 8, !dbg !388, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !388
  store i64 %43, i64* %44, align 8, !dbg !388, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !389
  %46 = load i64* %45, align 8, !dbg !389, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !389
  store i64 %46, i64* %47, align 8, !dbg !389, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !390
  ret i32 %2, !dbg !390
}

; Function Attrs: nounwind uwtable
define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) #0 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !147), !dbg !391
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !148), !dbg !391
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !149), !dbg !391
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !392
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !392
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !150), !dbg !392
  %2 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) #2, !dbg !393
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !151), !dbg !393
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !394), !dbg !396
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !397), !dbg !396
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !398
  %4 = load <2 x i64>* %3, align 16, !dbg !398, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !398
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !398, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !399
  %7 = bitcast i32* %6 to i64*, !dbg !399
  %8 = load i64* %7, align 8, !dbg !399
  %9 = trunc i64 %8 to i32, !dbg !399
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !399
  store i32 %9, i32* %10, align 4, !dbg !399, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !400
  %12 = load i64* %11, align 16, !dbg !400, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !400
  store i64 %12, i64* %13, align 8, !dbg !400, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !401
  store i32 %15, i32* %16, align 4, !dbg !401, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !402
  %18 = load i32* %17, align 16, !dbg !402, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !402
  store i32 %18, i32* %19, align 4, !dbg !402, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !403
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !403
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !403
  %23 = load <2 x i64>* %22, align 8, !dbg !403, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !403
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !403, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !404
  %26 = load i64* %25, align 8, !dbg !404, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !404
  store i64 %26, i64* %27, align 8, !dbg !404, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !405
  %29 = load i64* %28, align 8, !dbg !405, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !405
  store i64 %29, i64* %30, align 8, !dbg !405, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !406
  %32 = load i64* %31, align 8, !dbg !406, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !406
  store i64 %32, i64* %33, align 8, !dbg !406, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !407
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !407
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !407
  %37 = load <2 x i64>* %36, align 8, !dbg !407, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !407
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !407, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !408
  %40 = load i64* %39, align 8, !dbg !408, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !408
  store i64 %40, i64* %41, align 8, !dbg !408, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !409
  %43 = load i64* %42, align 8, !dbg !409, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !409
  store i64 %43, i64* %44, align 8, !dbg !409, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !410
  %46 = load i64* %45, align 8, !dbg !410, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !410
  store i64 %46, i64* %47, align 8, !dbg !410, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !411
  ret i32 %2, !dbg !411
}

declare i32 @__fd_fstat(i32, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) #4 {
  %tmp = alloca %struct.stat64, align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !156), !dbg !412
  call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !157), !dbg !412
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !413
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !413
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %tmp}, metadata !158), !dbg !413
  %2 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) #2, !dbg !414
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !159), !dbg !414
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %tmp}, i64 0, metadata !415), !dbg !417
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !418), !dbg !417
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !419
  %4 = load <2 x i64>* %3, align 16, !dbg !419, !tbaa !289
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !419
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !419, !tbaa !289
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !420
  %7 = bitcast i32* %6 to i64*, !dbg !420
  %8 = load i64* %7, align 8, !dbg !420
  %9 = trunc i64 %8 to i32, !dbg !420
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !420
  store i32 %9, i32* %10, align 4, !dbg !420, !tbaa !294
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !421
  %12 = load i64* %11, align 16, !dbg !421, !tbaa !299
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !421
  store i64 %12, i64* %13, align 8, !dbg !421, !tbaa !301
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !422
  store i32 %15, i32* %16, align 4, !dbg !422, !tbaa !303
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !423
  %18 = load i32* %17, align 16, !dbg !423, !tbaa !305
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !423
  store i32 %18, i32* %19, align 4, !dbg !423, !tbaa !306
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !424
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !424
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !424
  %23 = load <2 x i64>* %22, align 8, !dbg !424, !tbaa !289
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !424
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !424, !tbaa !289
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !425
  %26 = load i64* %25, align 8, !dbg !425, !tbaa !309
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !425
  store i64 %26, i64* %27, align 8, !dbg !425, !tbaa !310
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !426
  %29 = load i64* %28, align 8, !dbg !426, !tbaa !312
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !426
  store i64 %29, i64* %30, align 8, !dbg !426, !tbaa !313
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !427
  %32 = load i64* %31, align 8, !dbg !427, !tbaa !315
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !427
  store i64 %32, i64* %33, align 8, !dbg !427, !tbaa !316
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !428
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !428
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !428
  %37 = load <2 x i64>* %36, align 8, !dbg !428, !tbaa !289
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !428
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !428, !tbaa !289
  %39 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 1, !dbg !429
  %40 = load i64* %39, align 8, !dbg !429, !tbaa !319
  %41 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 1, !dbg !429
  store i64 %40, i64* %41, align 8, !dbg !429, !tbaa !320
  %42 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 1, !dbg !430
  %43 = load i64* %42, align 8, !dbg !430, !tbaa !322
  %44 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 1, !dbg !430
  store i64 %43, i64* %44, align 8, !dbg !430, !tbaa !323
  %45 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 1, !dbg !431
  %46 = load i64* %45, align 8, !dbg !431, !tbaa !325
  %47 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 1, !dbg !431
  store i64 %46, i64* %47, align 8, !dbg !431, !tbaa !326
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !432
  ret i32 %2, !dbg !432
}

; Function Attrs: nounwind uwtable
define i32 @ftruncate(i32 %fd, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !164), !dbg !433
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !165), !dbg !433
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) #2, !dbg !434
  ret i32 %1, !dbg !434
}

declare i32 @__fd_ftruncate(i32, i64) #3

; Function Attrs: nounwind uwtable
define i32 @statfs(i8* %path, %struct.statfs* %buf32) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !200), !dbg !435
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf32}, i64 0, metadata !201), !dbg !435
  %1 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) #2, !dbg !436
  ret i32 %1, !dbg !436
}

declare i32 @__fd_statfs(i8*, %struct.statfs*) #3

; Function Attrs: nounwind uwtable
define i64 @getdents(i32 %fd, %struct.dirent* %dirp, i64 %nbytes) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !223), !dbg !437
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !224), !dbg !437
  tail call void @llvm.dbg.value(metadata !{i64 %nbytes}, i64 0, metadata !225), !dbg !437
  %1 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !438
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %1}, i64 0, metadata !226), !dbg !438
  %2 = trunc i64 %nbytes to i32, !dbg !439
  %3 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %1, i32 %2) #2, !dbg !439
  %4 = sext i32 %3 to i64, !dbg !439
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !236), !dbg !439
  %5 = icmp sgt i32 %3, 0, !dbg !440
  br i1 %5, label %6, label %.loopexit, !dbg !440

; <label>:6                                       ; preds = %0
  %7 = bitcast %struct.dirent* %dirp to i8*, !dbg !441
  %8 = getelementptr inbounds i8* %7, i64 %4, !dbg !441
  %9 = bitcast i8* %8 to %struct.dirent*, !dbg !442
  %10 = icmp ugt %struct.dirent* %9, %dirp, !dbg !442
  br i1 %10, label %.lr.ph, label %.loopexit, !dbg !442

.lr.ph:                                           ; preds = %6, %.lr.ph
  %dp64.01 = phi %struct.dirent64* [ %16, %.lr.ph ], [ %1, %6 ]
  %11 = getelementptr inbounds %struct.dirent64* %dp64.01, i64 0, i32 2, !dbg !443
  %12 = bitcast %struct.dirent64* %dp64.01 to i8*, !dbg !444
  %13 = load i16* %11, align 2, !dbg !444, !tbaa !445
  %14 = zext i16 %13 to i64, !dbg !444
  %15 = getelementptr inbounds i8* %12, i64 %14, !dbg !444
  %16 = bitcast i8* %15 to %struct.dirent64*, !dbg !444
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %16}, i64 0, metadata !226), !dbg !444
  %17 = icmp ult i8* %15, %8, !dbg !442
  br i1 %17, label %.lr.ph, label %.loopexit, !dbg !442

.loopexit:                                        ; preds = %.lr.ph, %6, %0
  ret i64 %4, !dbg !448
}

declare i32 @__fd_getdents(i32, %struct.dirent64*, i32) #3

; Function Attrs: nounwind uwtable
define weak i32 @open64(i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !245), !dbg !449
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !246), !dbg !449
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !247), !dbg !450
  %1 = and i32 %flags, 64, !dbg !451
  %2 = icmp eq i32 %1, 0, !dbg !451
  br i1 %2, label %21, label %3, !dbg !451

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !248), !dbg !452
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !453
  call void @llvm.va_start(i8* %4), !dbg !453
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !454
  %6 = load i32* %5, align 16, !dbg !454
  %7 = icmp ult i32 %6, 41, !dbg !454
  br i1 %7, label %8, label %14, !dbg !454

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !454
  %10 = load i8** %9, align 16, !dbg !454
  %11 = sext i32 %6 to i64, !dbg !454
  %12 = getelementptr i8* %10, i64 %11, !dbg !454
  %13 = add i32 %6, 8, !dbg !454
  store i32 %13, i32* %5, align 16, !dbg !454
  br label %18, !dbg !454

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !454
  %16 = load i8** %15, align 8, !dbg !454
  %17 = getelementptr i8* %16, i64 8, !dbg !454
  store i8* %17, i8** %15, align 8, !dbg !454
  br label %18, !dbg !454

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !454
  %20 = load i32* %19, align 4, !dbg !454
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !247), !dbg !454
  call void @llvm.va_end(i8* %4), !dbg !455
  br label %21, !dbg !456

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !457
  ret i32 %22, !dbg !457
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!258, !259}
!llvm.ident = !{!260}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !36, metadata !47, metadata !57, metadata !122, metadata !130, metadata !137, metadata !143, metadata !152, metadata !160, metadata !166, metadata !202, metadata !243, metadata !251}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"open", metadata !"open", metadata !"", i32 65, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open, null, null, metadata !12, i32 65} ; [ DW_TAG_subprogram ] [line 65] [def] [open]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !19}
!13 = metadata !{i32 786689, metadata !4, metadata !"pathname", metadata !5, i32 16777281, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 65]
!14 = metadata !{i32 786689, metadata !4, metadata !"flags", metadata !5, i32 33554497, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 65]
!15 = metadata !{i32 786688, metadata !4, metadata !"mode", metadata !5, i32 66, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 66]
!16 = metadata !{i32 786454, metadata !1, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!17 = metadata !{i32 786454, metadata !1, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!18 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!19 = metadata !{i32 786688, metadata !20, metadata !"ap", metadata !5, i32 70, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 70]
!20 = metadata !{i32 786443, metadata !1, metadata !21, i32 68, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!21 = metadata !{i32 786443, metadata !1, metadata !4, i32 68, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!22 = metadata !{i32 786454, metadata !1, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!23 = metadata !{i32 786454, metadata !1, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!24 = metadata !{i32 786454, metadata !1, null, metadata !"__builtin_va_list", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 70, size 0, align 0, offset 0] [from ]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !26, metadata !34, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!26 = metadata !{i32 786454, metadata !1, null, metadata !"__va_list_tag", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [__va_list_tag] [line 70, size 0, align 0, offset 0] [from __va_list_tag]
!27 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 70, i64 192, i64 64, i32 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 70, size 192, align 64, offset 0] [def] [from ]
!28 = metadata !{metadata !29, metadata !30, metadata !31, metadata !33}
!29 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"gp_offset", i32 70, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ] [gp_offset] [line 70, size 32, align 32, offset 0] [from unsigned int]
!30 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"fp_offset", i32 70, i64 32, i64 32, i64 32, i32 0, metadata !18} ; [ DW_TAG_member ] [fp_offset] [line 70, size 32, align 32, offset 32] [from unsigned int]
!31 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"overflow_arg_area", i32 70, i64 64, i64 64, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [overflow_arg_area] [line 70, size 64, align 64, offset 64] [from ]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"reg_save_area", i32 70, i64 64, i64 64, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [reg_save_area] [line 70, size 64, align 64, offset 128] [from ]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 0]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"openat", metadata !"openat", metadata !"", i32 79, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat, null, null, metadata !39, i32 79} ; [ DW_TAG_subprogram ] [line 79] [def] [openat]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !8, metadata !8, metadata !9, metadata !8}
!39 = metadata !{metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!40 = metadata !{i32 786689, metadata !36, metadata !"fd", metadata !5, i32 16777295, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 79]
!41 = metadata !{i32 786689, metadata !36, metadata !"pathname", metadata !5, i32 33554511, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 79]
!42 = metadata !{i32 786689, metadata !36, metadata !"flags", metadata !5, i32 50331727, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 79]
!43 = metadata !{i32 786688, metadata !36, metadata !"mode", metadata !5, i32 80, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 80]
!44 = metadata !{i32 786688, metadata !45, metadata !"ap", metadata !5, i32 84, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 84]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!46 = metadata !{i32 786443, metadata !1, metadata !36, i32 82, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lseek", metadata !"lseek", metadata !"", i32 93, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek, null, null, metadata !53, i32 93} ; [ DW_TAG_subprogram ] [line 93] [def] [lseek]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !50, metadata !8, metadata !52, metadata !8}
!50 = metadata !{i32 786454, metadata !1, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!51 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!52 = metadata !{i32 786454, metadata !1, null, metadata !"off_t", i32 86, i64 0, i64 0, i64 0, i32 0, metadata !50} ; [ DW_TAG_typedef ] [off_t] [line 86, size 0, align 0, offset 0] [from __off_t]
!53 = metadata !{metadata !54, metadata !55, metadata !56}
!54 = metadata !{i32 786689, metadata !47, metadata !"fd", metadata !5, i32 16777309, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 93]
!55 = metadata !{i32 786689, metadata !47, metadata !"off", metadata !5, i32 33554525, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [off] [line 93]
!56 = metadata !{i32 786689, metadata !47, metadata !"whence", metadata !5, i32 50331741, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 93]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__xstat", metadata !"__xstat", metadata !"", i32 97, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat, null, null, metadata !97, i32 97} ; [ DW_TAG_subprogram ] [line 97] [def] [__xstat]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !8, metadata !8, metadata !9, metadata !60}
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!61 = metadata !{i32 786451, metadata !62, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!62 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!63 = metadata !{metadata !64, metadata !67, metadata !69, metadata !71, metadata !72, metadata !74, metadata !76, metadata !77, metadata !78, metadata !79, metadata !81, metadata !83, metadata !91, metadata !92, metadata !93}
!64 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!65 = metadata !{i32 786454, metadata !62, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!66 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!67 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !68} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!68 = metadata !{i32 786454, metadata !62, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!69 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !70} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!70 = metadata !{i32 786454, metadata !62, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!71 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !17} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!72 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !73} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!73 = metadata !{i32 786454, metadata !62, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!74 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !75} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!75 = metadata !{i32 786454, metadata !62, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!76 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !8} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!77 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !65} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!78 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !50} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!79 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !80} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!80 = metadata !{i32 786454, metadata !62, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!81 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !82} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!82 = metadata !{i32 786454, metadata !62, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!83 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !84} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!84 = metadata !{i32 786451, metadata !85, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!85 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!86 = metadata !{metadata !87, metadata !89}
!87 = metadata !{i32 786445, metadata !85, metadata !84, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!88 = metadata !{i32 786454, metadata !85, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!89 = metadata !{i32 786445, metadata !85, metadata !84, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !90} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!90 = metadata !{i32 786454, metadata !85, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!91 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !84} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!92 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !84} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!93 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !94} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!94 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !90, metadata !95, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!97 = metadata !{metadata !98, metadata !99, metadata !100, metadata !101, metadata !121}
!98 = metadata !{i32 786689, metadata !57, metadata !"vers", metadata !5, i32 16777313, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 97]
!99 = metadata !{i32 786689, metadata !57, metadata !"path", metadata !5, i32 33554529, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 97]
!100 = metadata !{i32 786689, metadata !57, metadata !"buf", metadata !5, i32 50331745, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 97]
!101 = metadata !{i32 786688, metadata !57, metadata !"tmp", metadata !5, i32 98, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!102 = metadata !{i32 786451, metadata !62, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!103 = metadata !{metadata !104, metadata !105, metadata !107, metadata !108, metadata !109, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115, metadata !117, metadata !118, metadata !119, metadata !120}
!104 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!105 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !106} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!106 = metadata !{i32 786454, metadata !62, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!107 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !70} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!108 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !17} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!109 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !73} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!110 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !75} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!111 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !8} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!112 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !65} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!113 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !50} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!114 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !80} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!115 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !116} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!116 = metadata !{i32 786454, metadata !62, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!117 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !84} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!118 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !84} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!119 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !84} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!120 = metadata !{i32 786445, metadata !62, metadata !102, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !94} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!121 = metadata !{i32 786688, metadata !57, metadata !"res", metadata !5, i32 99, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 99]
!122 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"stat", metadata !"stat", metadata !"", i32 104, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat, null, null, metadata !125, i32 104} ; [ DW_TAG_subprogram ] [line 104] [def] [stat]
!123 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = metadata !{metadata !8, metadata !9, metadata !60}
!125 = metadata !{metadata !126, metadata !127, metadata !128, metadata !129}
!126 = metadata !{i32 786689, metadata !122, metadata !"path", metadata !5, i32 16777320, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 104]
!127 = metadata !{i32 786689, metadata !122, metadata !"buf", metadata !5, i32 33554536, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 104]
!128 = metadata !{i32 786688, metadata !122, metadata !"tmp", metadata !5, i32 105, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 105]
!129 = metadata !{i32 786688, metadata !122, metadata !"res", metadata !5, i32 106, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 106]
!130 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__lxstat", metadata !"__lxstat", metadata !"", i32 111, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat, null, null, metadata !131, i32 111} ; [ DW_TAG_subprogram ] [line 111] [def] [__lxstat]
!131 = metadata !{metadata !132, metadata !133, metadata !134, metadata !135, metadata !136}
!132 = metadata !{i32 786689, metadata !130, metadata !"vers", metadata !5, i32 16777327, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 111]
!133 = metadata !{i32 786689, metadata !130, metadata !"path", metadata !5, i32 33554543, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 111]
!134 = metadata !{i32 786689, metadata !130, metadata !"buf", metadata !5, i32 50331759, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 111]
!135 = metadata !{i32 786688, metadata !130, metadata !"tmp", metadata !5, i32 112, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 112]
!136 = metadata !{i32 786688, metadata !130, metadata !"res", metadata !5, i32 113, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 113]
!137 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lstat", metadata !"lstat", metadata !"", i32 118, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat, null, null, metadata !138, i32 118} ; [ DW_TAG_subprogram ] [line 118] [def] [lstat]
!138 = metadata !{metadata !139, metadata !140, metadata !141, metadata !142}
!139 = metadata !{i32 786689, metadata !137, metadata !"path", metadata !5, i32 16777334, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 118]
!140 = metadata !{i32 786689, metadata !137, metadata !"buf", metadata !5, i32 33554550, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 118]
!141 = metadata !{i32 786688, metadata !137, metadata !"tmp", metadata !5, i32 119, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 119]
!142 = metadata !{i32 786688, metadata !137, metadata !"res", metadata !5, i32 120, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 120]
!143 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__fxstat", metadata !"__fxstat", metadata !"", i32 125, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat, null, null, metadata !146, i32 125} ; [ DW_TAG_subprogram ] [line 125] [def] [__fxstat]
!144 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !145, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!145 = metadata !{metadata !8, metadata !8, metadata !8, metadata !60}
!146 = metadata !{metadata !147, metadata !148, metadata !149, metadata !150, metadata !151}
!147 = metadata !{i32 786689, metadata !143, metadata !"vers", metadata !5, i32 16777341, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 125]
!148 = metadata !{i32 786689, metadata !143, metadata !"fd", metadata !5, i32 33554557, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 125]
!149 = metadata !{i32 786689, metadata !143, metadata !"buf", metadata !5, i32 50331773, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 125]
!150 = metadata !{i32 786688, metadata !143, metadata !"tmp", metadata !5, i32 126, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 126]
!151 = metadata !{i32 786688, metadata !143, metadata !"res", metadata !5, i32 127, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 127]
!152 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fstat", metadata !"fstat", metadata !"", i32 132, metadata !153, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat, null, null, metadata !155, i32 132} ; [ DW_TAG_subprogram ] [line 132] [def] [fstat]
!153 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !154, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!154 = metadata !{metadata !8, metadata !8, metadata !60}
!155 = metadata !{metadata !156, metadata !157, metadata !158, metadata !159}
!156 = metadata !{i32 786689, metadata !152, metadata !"fd", metadata !5, i32 16777348, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 132]
!157 = metadata !{i32 786689, metadata !152, metadata !"buf", metadata !5, i32 33554564, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 132]
!158 = metadata !{i32 786688, metadata !152, metadata !"tmp", metadata !5, i32 133, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!159 = metadata !{i32 786688, metadata !152, metadata !"res", metadata !5, i32 134, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 134]
!160 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ftruncate", metadata !"ftruncate", metadata !"", i32 139, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate, null, null, metadata !163, i32 139} ; [ DW_TAG_subprogram ] [line 139] [def] [ftruncate]
!161 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!162 = metadata !{metadata !8, metadata !8, metadata !52}
!163 = metadata !{metadata !164, metadata !165}
!164 = metadata !{i32 786689, metadata !160, metadata !"fd", metadata !5, i32 16777355, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 139]
!165 = metadata !{i32 786689, metadata !160, metadata !"length", metadata !5, i32 33554571, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 139]
!166 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"statfs", metadata !"statfs", metadata !"", i32 143, metadata !167, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs, null, null, metadata !199, i32 143} ; [ DW_TAG_subprogram ] [line 143] [def] [statfs]
!167 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !168, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!168 = metadata !{metadata !8, metadata !9, metadata !169}
!169 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !170} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!170 = metadata !{i32 786451, metadata !171, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !172, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!171 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!172 = metadata !{metadata !173, metadata !175, metadata !176, metadata !178, metadata !179, metadata !180, metadata !182, metadata !183, metadata !192, metadata !193, metadata !194, metadata !195}
!173 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!174 = metadata !{i32 786454, metadata !171, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!175 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !174} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!176 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !177} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!177 = metadata !{i32 786454, metadata !171, null, metadata !"__fsblkcnt_t", i32 162, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fsblkcnt_t] [line 162, size 0, align 0, offset 0] [from long unsigned int]
!178 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !177} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!179 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !177} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!180 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !181} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!181 = metadata !{i32 786454, metadata !171, null, metadata !"__fsfilcnt_t", i32 166, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fsfilcnt_t] [line 166, size 0, align 0, offset 0] [from long unsigned int]
!182 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !181} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!183 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !184} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!184 = metadata !{i32 786454, metadata !171, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !185} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!185 = metadata !{i32 786451, metadata !186, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !187, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!186 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!187 = metadata !{metadata !188}
!188 = metadata !{i32 786445, metadata !186, metadata !185, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !189} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!189 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !8, metadata !190, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!190 = metadata !{metadata !191}
!191 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!192 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !174} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!193 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !174} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!194 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !174} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!195 = metadata !{i32 786445, metadata !171, metadata !170, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !196} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!196 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !174, metadata !197, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!197 = metadata !{metadata !198}
!198 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!199 = metadata !{metadata !200, metadata !201}
!200 = metadata !{i32 786689, metadata !166, metadata !"path", metadata !5, i32 16777359, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 143]
!201 = metadata !{i32 786689, metadata !166, metadata !"buf32", metadata !5, i32 33554575, metadata !169, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf32] [line 143]
!202 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"getdents", metadata !"getdents", metadata !"", i32 168, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, %struct.dirent*, i64)* @getdents, null, null, metadata !222, i32 168} ; [ DW_TAG_subprogram ] [line 168] [def] [getdents]
!203 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!204 = metadata !{metadata !205, metadata !8, metadata !207, metadata !221}
!205 = metadata !{i32 786454, metadata !1, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !206} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!206 = metadata !{i32 786454, metadata !1, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!207 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !208} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent]
!208 = metadata !{i32 786451, metadata !209, null, metadata !"dirent", i32 22, i64 2240, i64 64, i32 0, i32 0, null, metadata !210, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent] [line 22, size 2240, align 64, offset 0] [def] [from ]
!209 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !215, metadata !217}
!211 = metadata !{i32 786445, metadata !209, metadata !208, metadata !"d_ino", i32 25, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [d_ino] [line 25, size 64, align 64, offset 0] [from __ino_t]
!212 = metadata !{i32 786445, metadata !209, metadata !208, metadata !"d_off", i32 26, i64 64, i64 64, i64 64, i32 0, metadata !50} ; [ DW_TAG_member ] [d_off] [line 26, size 64, align 64, offset 64] [from __off_t]
!213 = metadata !{i32 786445, metadata !209, metadata !208, metadata !"d_reclen", i32 31, i64 16, i64 16, i64 128, i32 0, metadata !214} ; [ DW_TAG_member ] [d_reclen] [line 31, size 16, align 16, offset 128] [from unsigned short]
!214 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!215 = metadata !{i32 786445, metadata !209, metadata !208, metadata !"d_type", i32 32, i64 8, i64 8, i64 144, i32 0, metadata !216} ; [ DW_TAG_member ] [d_type] [line 32, size 8, align 8, offset 144] [from unsigned char]
!216 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!217 = metadata !{i32 786445, metadata !209, metadata !208, metadata !"d_name", i32 33, i64 2048, i64 8, i64 152, i32 0, metadata !218} ; [ DW_TAG_member ] [d_name] [line 33, size 2048, align 8, offset 152] [from ]
!218 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !11, metadata !219, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!219 = metadata !{metadata !220}
!220 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!221 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!222 = metadata !{metadata !223, metadata !224, metadata !225, metadata !226, metadata !236, metadata !237, metadata !240, metadata !242}
!223 = metadata !{i32 786689, metadata !202, metadata !"fd", metadata !5, i32 16777384, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 168]
!224 = metadata !{i32 786689, metadata !202, metadata !"dirp", metadata !5, i32 33554600, metadata !207, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 168]
!225 = metadata !{i32 786689, metadata !202, metadata !"nbytes", metadata !5, i32 50331816, metadata !221, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbytes] [line 168]
!226 = metadata !{i32 786688, metadata !202, metadata !"dp64", metadata !5, i32 169, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp64] [line 169]
!227 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !228} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!228 = metadata !{i32 786451, metadata !209, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !229, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!229 = metadata !{metadata !230, metadata !231, metadata !233, metadata !234, metadata !235}
!230 = metadata !{i32 786445, metadata !209, metadata !228, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !106} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!231 = metadata !{i32 786445, metadata !209, metadata !228, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !232} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!232 = metadata !{i32 786454, metadata !209, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!233 = metadata !{i32 786445, metadata !209, metadata !228, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !214} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!234 = metadata !{i32 786445, metadata !209, metadata !228, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !216} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!235 = metadata !{i32 786445, metadata !209, metadata !228, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !218} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!236 = metadata !{i32 786688, metadata !202, metadata !"res", metadata !5, i32 170, metadata !205, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 170]
!237 = metadata !{i32 786688, metadata !238, metadata !"end", metadata !5, i32 173, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 173]
!238 = metadata !{i32 786443, metadata !1, metadata !239, i32 172, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!239 = metadata !{i32 786443, metadata !1, metadata !202, i32 172, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!240 = metadata !{i32 786688, metadata !241, metadata !"dp", metadata !5, i32 175, metadata !207, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 175]
!241 = metadata !{i32 786443, metadata !1, metadata !238, i32 174, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!242 = metadata !{i32 786688, metadata !241, metadata !"name_len", metadata !5, i32 176, metadata !221, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name_len] [line 176]
!243 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"open64", metadata !"open64", metadata !"", i32 194, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64, null, null, metadata !244, i32 194} ; [ DW_TAG_subprogram ] [line 194] [def] [open64]
!244 = metadata !{metadata !245, metadata !246, metadata !247, metadata !248}
!245 = metadata !{i32 786689, metadata !243, metadata !"pathname", metadata !5, i32 16777410, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 194]
!246 = metadata !{i32 786689, metadata !243, metadata !"flags", metadata !5, i32 33554626, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 194]
!247 = metadata !{i32 786688, metadata !243, metadata !"mode", metadata !5, i32 195, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 195]
!248 = metadata !{i32 786688, metadata !249, metadata !"ap", metadata !5, i32 199, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 199]
!249 = metadata !{i32 786443, metadata !1, metadata !250, i32 197, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!250 = metadata !{i32 786443, metadata !1, metadata !243, i32 197, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_32.c]
!251 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"", i32 41, metadata !252, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !255, i32 41} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [__stat64_to_stat]
!252 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!253 = metadata !{null, metadata !254, metadata !60}
!254 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !102} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!255 = metadata !{metadata !256, metadata !257}
!256 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 41]
!257 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 41]
!258 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!259 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!260 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!261 = metadata !{i32 65, i32 0, metadata !4, null}
!262 = metadata !{i32 66, i32 0, metadata !4, null}
!263 = metadata !{i32 68, i32 0, metadata !21, null}
!264 = metadata !{i32 70, i32 0, metadata !20, null}
!265 = metadata !{i32 71, i32 0, metadata !20, null}
!266 = metadata !{i32 72, i32 0, metadata !20, null}
!267 = metadata !{i32 73, i32 0, metadata !20, null}
!268 = metadata !{i32 74, i32 0, metadata !20, null}
!269 = metadata !{i32 76, i32 0, metadata !4, null}
!270 = metadata !{i32 79, i32 0, metadata !36, null}
!271 = metadata !{i32 80, i32 0, metadata !36, null}
!272 = metadata !{i32 82, i32 0, metadata !46, null}
!273 = metadata !{i32 84, i32 0, metadata !45, null}
!274 = metadata !{i32 85, i32 0, metadata !45, null}
!275 = metadata !{i32 86, i32 0, metadata !45, null}
!276 = metadata !{i32 87, i32 0, metadata !45, null}
!277 = metadata !{i32 88, i32 0, metadata !45, null}
!278 = metadata !{i32 90, i32 0, metadata !36, null}
!279 = metadata !{i32 93, i32 0, metadata !47, null}
!280 = metadata !{i32 94, i32 0, metadata !47, null}
!281 = metadata !{i32 97, i32 0, metadata !57, null}
!282 = metadata !{i32 98, i32 0, metadata !57, null}
!283 = metadata !{i32 99, i32 0, metadata !57, null}
!284 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !285} ; [ DW_TAG_arg_variable ] [a] [line 41]
!285 = metadata !{i32 100, i32 0, metadata !57, null}
!286 = metadata !{i32 41, i32 0, metadata !251, metadata !285}
!287 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !285} ; [ DW_TAG_arg_variable ] [b] [line 41]
!288 = metadata !{i32 42, i32 0, metadata !251, metadata !285}
!289 = metadata !{metadata !290, metadata !290, i64 0}
!290 = metadata !{metadata !"long", metadata !291, i64 0}
!291 = metadata !{metadata !"omnipotent char", metadata !292, i64 0}
!292 = metadata !{metadata !"Simple C/C++ TBAA"}
!293 = metadata !{i32 44, i32 0, metadata !251, metadata !285}
!294 = metadata !{metadata !295, metadata !296, i64 24}
!295 = metadata !{metadata !"stat", metadata !290, i64 0, metadata !290, i64 8, metadata !290, i64 16, metadata !296, i64 24, metadata !296, i64 28, metadata !296, i64 32, metadata !296, i64 36, metadata !290, i64 40, metadata !290, i64 48, metadata !290, i64 56, metadata !290, i64 64, metadata !297, i64 72, metadata !297, i64 88, metadata !297, i64 104, metadata !291, i64 120}
!296 = metadata !{metadata !"int", metadata !291, i64 0}
!297 = metadata !{metadata !"timespec", metadata !290, i64 0, metadata !290, i64 8}
!298 = metadata !{i32 45, i32 0, metadata !251, metadata !285}
!299 = metadata !{metadata !300, metadata !290, i64 16}
!300 = metadata !{metadata !"stat64", metadata !290, i64 0, metadata !290, i64 8, metadata !290, i64 16, metadata !296, i64 24, metadata !296, i64 28, metadata !296, i64 32, metadata !296, i64 36, metadata !290, i64 40, metadata !290, i64 48, metadata !290, i64 56, metadata !290, i64 64, metadata !297, i64 72, metadata !297, i64 88, metadata !297, i64 104, metadata !291, i64 120}
!301 = metadata !{metadata !295, metadata !290, i64 16}
!302 = metadata !{i32 46, i32 0, metadata !251, metadata !285}
!303 = metadata !{metadata !295, metadata !296, i64 28}
!304 = metadata !{i32 47, i32 0, metadata !251, metadata !285}
!305 = metadata !{metadata !300, metadata !296, i64 32}
!306 = metadata !{metadata !295, metadata !296, i64 32}
!307 = metadata !{i32 48, i32 0, metadata !251, metadata !285}
!308 = metadata !{i32 50, i32 0, metadata !251, metadata !285}
!309 = metadata !{metadata !300, metadata !290, i64 72}
!310 = metadata !{metadata !295, metadata !290, i64 72}
!311 = metadata !{i32 51, i32 0, metadata !251, metadata !285}
!312 = metadata !{metadata !300, metadata !290, i64 88}
!313 = metadata !{metadata !295, metadata !290, i64 88}
!314 = metadata !{i32 52, i32 0, metadata !251, metadata !285}
!315 = metadata !{metadata !300, metadata !290, i64 104}
!316 = metadata !{metadata !295, metadata !290, i64 104}
!317 = metadata !{i32 53, i32 0, metadata !251, metadata !285}
!318 = metadata !{i32 56, i32 0, metadata !251, metadata !285}
!319 = metadata !{metadata !300, metadata !290, i64 80}
!320 = metadata !{metadata !295, metadata !290, i64 80}
!321 = metadata !{i32 57, i32 0, metadata !251, metadata !285}
!322 = metadata !{metadata !300, metadata !290, i64 96}
!323 = metadata !{metadata !295, metadata !290, i64 96}
!324 = metadata !{i32 58, i32 0, metadata !251, metadata !285} ; [ DW_TAG_imported_module ]
!325 = metadata !{metadata !300, metadata !290, i64 112}
!326 = metadata !{metadata !295, metadata !290, i64 112}
!327 = metadata !{i32 102, i32 0, metadata !57, null}
!328 = metadata !{i32 104, i32 0, metadata !122, null}
!329 = metadata !{i32 105, i32 0, metadata !122, null}
!330 = metadata !{i32 106, i32 0, metadata !122, null}
!331 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [a] [line 41]
!332 = metadata !{i32 107, i32 0, metadata !122, null}
!333 = metadata !{i32 41, i32 0, metadata !251, metadata !332}
!334 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [b] [line 41]
!335 = metadata !{i32 42, i32 0, metadata !251, metadata !332}
!336 = metadata !{i32 44, i32 0, metadata !251, metadata !332}
!337 = metadata !{i32 45, i32 0, metadata !251, metadata !332}
!338 = metadata !{i32 46, i32 0, metadata !251, metadata !332}
!339 = metadata !{i32 47, i32 0, metadata !251, metadata !332}
!340 = metadata !{i32 48, i32 0, metadata !251, metadata !332}
!341 = metadata !{i32 50, i32 0, metadata !251, metadata !332}
!342 = metadata !{i32 51, i32 0, metadata !251, metadata !332}
!343 = metadata !{i32 52, i32 0, metadata !251, metadata !332}
!344 = metadata !{i32 53, i32 0, metadata !251, metadata !332}
!345 = metadata !{i32 56, i32 0, metadata !251, metadata !332}
!346 = metadata !{i32 57, i32 0, metadata !251, metadata !332}
!347 = metadata !{i32 58, i32 0, metadata !251, metadata !332} ; [ DW_TAG_imported_module ]
!348 = metadata !{i32 109, i32 0, metadata !122, null}
!349 = metadata !{i32 111, i32 0, metadata !130, null}
!350 = metadata !{i32 112, i32 0, metadata !130, null}
!351 = metadata !{i32 113, i32 0, metadata !130, null}
!352 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [a] [line 41]
!353 = metadata !{i32 114, i32 0, metadata !130, null}
!354 = metadata !{i32 41, i32 0, metadata !251, metadata !353}
!355 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !353} ; [ DW_TAG_arg_variable ] [b] [line 41]
!356 = metadata !{i32 42, i32 0, metadata !251, metadata !353}
!357 = metadata !{i32 44, i32 0, metadata !251, metadata !353}
!358 = metadata !{i32 45, i32 0, metadata !251, metadata !353}
!359 = metadata !{i32 46, i32 0, metadata !251, metadata !353}
!360 = metadata !{i32 47, i32 0, metadata !251, metadata !353}
!361 = metadata !{i32 48, i32 0, metadata !251, metadata !353}
!362 = metadata !{i32 50, i32 0, metadata !251, metadata !353}
!363 = metadata !{i32 51, i32 0, metadata !251, metadata !353}
!364 = metadata !{i32 52, i32 0, metadata !251, metadata !353}
!365 = metadata !{i32 53, i32 0, metadata !251, metadata !353}
!366 = metadata !{i32 56, i32 0, metadata !251, metadata !353}
!367 = metadata !{i32 57, i32 0, metadata !251, metadata !353}
!368 = metadata !{i32 58, i32 0, metadata !251, metadata !353} ; [ DW_TAG_imported_module ]
!369 = metadata !{i32 116, i32 0, metadata !130, null}
!370 = metadata !{i32 118, i32 0, metadata !137, null}
!371 = metadata !{i32 119, i32 0, metadata !137, null}
!372 = metadata !{i32 120, i32 0, metadata !137, null}
!373 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !374} ; [ DW_TAG_arg_variable ] [a] [line 41]
!374 = metadata !{i32 121, i32 0, metadata !137, null}
!375 = metadata !{i32 41, i32 0, metadata !251, metadata !374}
!376 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !374} ; [ DW_TAG_arg_variable ] [b] [line 41]
!377 = metadata !{i32 42, i32 0, metadata !251, metadata !374}
!378 = metadata !{i32 44, i32 0, metadata !251, metadata !374}
!379 = metadata !{i32 45, i32 0, metadata !251, metadata !374}
!380 = metadata !{i32 46, i32 0, metadata !251, metadata !374}
!381 = metadata !{i32 47, i32 0, metadata !251, metadata !374}
!382 = metadata !{i32 48, i32 0, metadata !251, metadata !374}
!383 = metadata !{i32 50, i32 0, metadata !251, metadata !374}
!384 = metadata !{i32 51, i32 0, metadata !251, metadata !374}
!385 = metadata !{i32 52, i32 0, metadata !251, metadata !374}
!386 = metadata !{i32 53, i32 0, metadata !251, metadata !374}
!387 = metadata !{i32 56, i32 0, metadata !251, metadata !374}
!388 = metadata !{i32 57, i32 0, metadata !251, metadata !374}
!389 = metadata !{i32 58, i32 0, metadata !251, metadata !374} ; [ DW_TAG_imported_module ]
!390 = metadata !{i32 123, i32 0, metadata !137, null}
!391 = metadata !{i32 125, i32 0, metadata !143, null}
!392 = metadata !{i32 126, i32 0, metadata !143, null}
!393 = metadata !{i32 127, i32 0, metadata !143, null}
!394 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !395} ; [ DW_TAG_arg_variable ] [a] [line 41]
!395 = metadata !{i32 128, i32 0, metadata !143, null}
!396 = metadata !{i32 41, i32 0, metadata !251, metadata !395}
!397 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !395} ; [ DW_TAG_arg_variable ] [b] [line 41]
!398 = metadata !{i32 42, i32 0, metadata !251, metadata !395}
!399 = metadata !{i32 44, i32 0, metadata !251, metadata !395}
!400 = metadata !{i32 45, i32 0, metadata !251, metadata !395}
!401 = metadata !{i32 46, i32 0, metadata !251, metadata !395}
!402 = metadata !{i32 47, i32 0, metadata !251, metadata !395}
!403 = metadata !{i32 48, i32 0, metadata !251, metadata !395}
!404 = metadata !{i32 50, i32 0, metadata !251, metadata !395}
!405 = metadata !{i32 51, i32 0, metadata !251, metadata !395}
!406 = metadata !{i32 52, i32 0, metadata !251, metadata !395}
!407 = metadata !{i32 53, i32 0, metadata !251, metadata !395}
!408 = metadata !{i32 56, i32 0, metadata !251, metadata !395}
!409 = metadata !{i32 57, i32 0, metadata !251, metadata !395}
!410 = metadata !{i32 58, i32 0, metadata !251, metadata !395} ; [ DW_TAG_imported_module ]
!411 = metadata !{i32 130, i32 0, metadata !143, null}
!412 = metadata !{i32 132, i32 0, metadata !152, null}
!413 = metadata !{i32 133, i32 0, metadata !152, null}
!414 = metadata !{i32 134, i32 0, metadata !152, null}
!415 = metadata !{i32 786689, metadata !251, metadata !"a", metadata !5, i32 16777257, metadata !254, i32 0, metadata !416} ; [ DW_TAG_arg_variable ] [a] [line 41]
!416 = metadata !{i32 135, i32 0, metadata !152, null}
!417 = metadata !{i32 41, i32 0, metadata !251, metadata !416}
!418 = metadata !{i32 786689, metadata !251, metadata !"b", metadata !5, i32 33554473, metadata !60, i32 0, metadata !416} ; [ DW_TAG_arg_variable ] [b] [line 41]
!419 = metadata !{i32 42, i32 0, metadata !251, metadata !416}
!420 = metadata !{i32 44, i32 0, metadata !251, metadata !416}
!421 = metadata !{i32 45, i32 0, metadata !251, metadata !416}
!422 = metadata !{i32 46, i32 0, metadata !251, metadata !416}
!423 = metadata !{i32 47, i32 0, metadata !251, metadata !416}
!424 = metadata !{i32 48, i32 0, metadata !251, metadata !416}
!425 = metadata !{i32 50, i32 0, metadata !251, metadata !416}
!426 = metadata !{i32 51, i32 0, metadata !251, metadata !416}
!427 = metadata !{i32 52, i32 0, metadata !251, metadata !416}
!428 = metadata !{i32 53, i32 0, metadata !251, metadata !416}
!429 = metadata !{i32 56, i32 0, metadata !251, metadata !416}
!430 = metadata !{i32 57, i32 0, metadata !251, metadata !416}
!431 = metadata !{i32 58, i32 0, metadata !251, metadata !416} ; [ DW_TAG_imported_module ]
!432 = metadata !{i32 137, i32 0, metadata !152, null}
!433 = metadata !{i32 139, i32 0, metadata !160, null}
!434 = metadata !{i32 140, i32 0, metadata !160, null}
!435 = metadata !{i32 143, i32 0, metadata !166, null}
!436 = metadata !{i32 162, i32 0, metadata !166, null}
!437 = metadata !{i32 168, i32 0, metadata !202, null}
!438 = metadata !{i32 169, i32 0, metadata !202, null}
!439 = metadata !{i32 170, i32 0, metadata !202, null}
!440 = metadata !{i32 172, i32 0, metadata !239, null}
!441 = metadata !{i32 173, i32 0, metadata !238, null}
!442 = metadata !{i32 174, i32 0, metadata !238, null}
!443 = metadata !{i32 176, i32 0, metadata !241, null}
!444 = metadata !{i32 183, i32 0, metadata !241, null}
!445 = metadata !{metadata !446, metadata !447, i64 16}
!446 = metadata !{metadata !"dirent", metadata !290, i64 0, metadata !290, i64 8, metadata !447, i64 16, metadata !291, i64 18, metadata !291, i64 19}
!447 = metadata !{metadata !"short", metadata !291, i64 0}
!448 = metadata !{i32 187, i32 0, metadata !202, null}
!449 = metadata !{i32 194, i32 0, metadata !243, null}
!450 = metadata !{i32 195, i32 0, metadata !243, null}
!451 = metadata !{i32 197, i32 0, metadata !250, null}
!452 = metadata !{i32 199, i32 0, metadata !249, null}
!453 = metadata !{i32 200, i32 0, metadata !249, null}
!454 = metadata !{i32 201, i32 0, metadata !249, null}
!455 = metadata !{i32 202, i32 0, metadata !249, null}
!456 = metadata !{i32 203, i32 0, metadata !249, null}
!457 = metadata !{i32 205, i32 0, metadata !243, null}

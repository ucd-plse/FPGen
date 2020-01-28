; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c'
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

@__getdents64 = alias i32 (i32, %struct.dirent*, i32)* @getdents64

; Function Attrs: nounwind uwtable
define i32 @open64(i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !13), !dbg !197
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !14), !dbg !197
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !15), !dbg !198
  %1 = and i32 %flags, 64, !dbg !199
  %2 = icmp eq i32 %1, 0, !dbg !199
  br i1 %2, label %21, label %3, !dbg !199

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !19), !dbg !200
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !201
  call void @llvm.va_start(i8* %4), !dbg !201
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !202
  %6 = load i32* %5, align 16, !dbg !202
  %7 = icmp ult i32 %6, 41, !dbg !202
  br i1 %7, label %8, label %14, !dbg !202

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !202
  %10 = load i8** %9, align 16, !dbg !202
  %11 = sext i32 %6 to i64, !dbg !202
  %12 = getelementptr i8* %10, i64 %11, !dbg !202
  %13 = add i32 %6, 8, !dbg !202
  store i32 %13, i32* %5, align 16, !dbg !202
  br label %18, !dbg !202

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !202
  %16 = load i8** %15, align 8, !dbg !202
  %17 = getelementptr i8* %16, i64 8, !dbg !202
  store i8* %17, i8** %15, align 8, !dbg !202
  br label %18, !dbg !202

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !202
  %20 = load i32* %19, align 4, !dbg !202
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !15), !dbg !202
  call void @llvm.va_end(i8* %4), !dbg !203
  br label %21, !dbg !204

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !205
  ret i32 %22, !dbg !205
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

declare i32 @__fd_open(i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i32 @openat64(i32 %fd, i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !40), !dbg !206
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !41), !dbg !206
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !42), !dbg !206
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !43), !dbg !207
  %1 = and i32 %flags, 64, !dbg !208
  %2 = icmp eq i32 %1, 0, !dbg !208
  br i1 %2, label %21, label %3, !dbg !208

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !44), !dbg !209
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !210
  call void @llvm.va_start(i8* %4), !dbg !210
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !211
  %6 = load i32* %5, align 16, !dbg !211
  %7 = icmp ult i32 %6, 41, !dbg !211
  br i1 %7, label %8, label %14, !dbg !211

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !211
  %10 = load i8** %9, align 16, !dbg !211
  %11 = sext i32 %6 to i64, !dbg !211
  %12 = getelementptr i8* %10, i64 %11, !dbg !211
  %13 = add i32 %6, 8, !dbg !211
  store i32 %13, i32* %5, align 16, !dbg !211
  br label %18, !dbg !211

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !211
  %16 = load i8** %15, align 8, !dbg !211
  %17 = getelementptr i8* %16, i64 8, !dbg !211
  store i8* %17, i8** %15, align 8, !dbg !211
  br label %18, !dbg !211

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !211
  %20 = load i32* %19, align 4, !dbg !211
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !43), !dbg !211
  call void @llvm.va_end(i8* %4), !dbg !212
  br label %21, !dbg !213

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !214
  ret i32 %22, !dbg !214
}

declare i32 @__fd_openat(i32, i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i64 @lseek64(i32 %fd, i64 %offset, i32 %whence) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !54), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !55), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !56), !dbg !215
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #2, !dbg !216
  ret i64 %1, !dbg !216
}

declare i64 @__fd_lseek(i32, i64, i32) #3

; Function Attrs: nounwind uwtable
define i32 @__xstat64(i32 %vers, i8* %path, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !99), !dbg !217
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !100), !dbg !217
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !101), !dbg !217
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !218
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #2, !dbg !218
  ret i32 %2, !dbg !218
}

declare i32 @__fd_stat(i8*, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @stat64(i8* %path, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !106), !dbg !219
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !107), !dbg !219
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !220
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #2, !dbg !220
  ret i32 %2, !dbg !220
}

; Function Attrs: nounwind uwtable
define i32 @__lxstat64(i32 %vers, i8* %path, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !110), !dbg !221
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !111), !dbg !221
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !112), !dbg !221
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !222
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #2, !dbg !222
  ret i32 %2, !dbg !222
}

declare i32 @__fd_lstat(i8*, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @lstat64(i8* %path, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !115), !dbg !223
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !116), !dbg !223
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !224
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #2, !dbg !224
  ret i32 %2, !dbg !224
}

; Function Attrs: nounwind uwtable
define i32 @__fxstat64(i32 %vers, i32 %fd, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !121), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !122), !dbg !225
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !123), !dbg !225
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !226
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #2, !dbg !226
  ret i32 %2, !dbg !226
}

declare i32 @__fd_fstat(i32, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstat64(i32 %fd, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !128), !dbg !227
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !129), !dbg !227
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !228
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #2, !dbg !228
  ret i32 %2, !dbg !228
}

; Function Attrs: nounwind uwtable
define i32 @ftruncate64(i32 %fd, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !134), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !135), !dbg !229
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) #2, !dbg !230
  ret i32 %1, !dbg !230
}

declare i32 @__fd_ftruncate(i32, i64) #3

; Function Attrs: nounwind uwtable
define weak i32 @statfs64(i8* %path, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !170), !dbg !231
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !171), !dbg !231
  %1 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #2, !dbg !232
  ret i32 %1, !dbg !232
}

declare i32 @__fd_statfs(i8*, %struct.statfs*) #3

; Function Attrs: nounwind uwtable
define i32 @getdents64(i32 %fd, %struct.dirent* %dirp, i32 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !191), !dbg !233
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !192), !dbg !233
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !193), !dbg !233
  %1 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !234
  %2 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %1, i32 %count) #2, !dbg !234
  ret i32 %2, !dbg !234
}

declare i32 @__fd_getdents(i32, %struct.dirent64*, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!194, !195}
!llvm.ident = !{!196}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !36, metadata !47, metadata !57, metadata !102, metadata !108, metadata !113, metadata !117, metadata !124, metadata !130, metadata !136, metadata !172}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"open", metadata !"open", metadata !"open64", i32 45, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64, null, null, metadata !12, i32 45} ; [ DW_TAG_subprogram ] [line 45] [def] [open]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !19}
!13 = metadata !{i32 786689, metadata !4, metadata !"pathname", metadata !5, i32 16777261, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 45]
!14 = metadata !{i32 786689, metadata !4, metadata !"flags", metadata !5, i32 33554477, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 45]
!15 = metadata !{i32 786688, metadata !4, metadata !"mode", metadata !5, i32 46, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 46]
!16 = metadata !{i32 786454, metadata !1, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!17 = metadata !{i32 786454, metadata !1, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!18 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!19 = metadata !{i32 786688, metadata !20, metadata !"ap", metadata !5, i32 50, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 50]
!20 = metadata !{i32 786443, metadata !1, metadata !21, i32 48, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c]
!21 = metadata !{i32 786443, metadata !1, metadata !4, i32 48, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c]
!22 = metadata !{i32 786454, metadata !1, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!23 = metadata !{i32 786454, metadata !1, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!24 = metadata !{i32 786454, metadata !1, null, metadata !"__builtin_va_list", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 50, size 0, align 0, offset 0] [from ]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !26, metadata !34, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!26 = metadata !{i32 786454, metadata !1, null, metadata !"__va_list_tag", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [__va_list_tag] [line 50, size 0, align 0, offset 0] [from __va_list_tag]
!27 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 50, i64 192, i64 64, i32 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 50, size 192, align 64, offset 0] [def] [from ]
!28 = metadata !{metadata !29, metadata !30, metadata !31, metadata !33}
!29 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"gp_offset", i32 50, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ] [gp_offset] [line 50, size 32, align 32, offset 0] [from unsigned int]
!30 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"fp_offset", i32 50, i64 32, i64 32, i64 32, i32 0, metadata !18} ; [ DW_TAG_member ] [fp_offset] [line 50, size 32, align 32, offset 32] [from unsigned int]
!31 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"overflow_arg_area", i32 50, i64 64, i64 64, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [overflow_arg_area] [line 50, size 64, align 64, offset 64] [from ]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786445, metadata !1, metadata !27, metadata !"reg_save_area", i32 50, i64 64, i64 64, i64 128, i32 0, metadata !32} ; [ DW_TAG_member ] [reg_save_area] [line 50, size 64, align 64, offset 128] [from ]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 0]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"openat", metadata !"openat", metadata !"openat64", i32 59, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat64, null, null, metadata !39, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [openat]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !8, metadata !8, metadata !9, metadata !8}
!39 = metadata !{metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!40 = metadata !{i32 786689, metadata !36, metadata !"fd", metadata !5, i32 16777275, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 59]
!41 = metadata !{i32 786689, metadata !36, metadata !"pathname", metadata !5, i32 33554491, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 59]
!42 = metadata !{i32 786689, metadata !36, metadata !"flags", metadata !5, i32 50331707, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 59]
!43 = metadata !{i32 786688, metadata !36, metadata !"mode", metadata !5, i32 60, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 60]
!44 = metadata !{i32 786688, metadata !45, metadata !"ap", metadata !5, i32 64, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 64]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c]
!46 = metadata !{i32 786443, metadata !1, metadata !36, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd_64.c]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lseek", metadata !"lseek", metadata !"lseek64", i32 73, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek64, null, null, metadata !53, i32 73} ; [ DW_TAG_subprogram ] [line 73] [def] [lseek]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !50, metadata !8, metadata !52, metadata !8}
!50 = metadata !{i32 786454, metadata !1, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!51 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!52 = metadata !{i32 786454, metadata !1, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !50} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!53 = metadata !{metadata !54, metadata !55, metadata !56}
!54 = metadata !{i32 786689, metadata !47, metadata !"fd", metadata !5, i32 16777289, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 73]
!55 = metadata !{i32 786689, metadata !47, metadata !"offset", metadata !5, i32 33554505, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 73]
!56 = metadata !{i32 786689, metadata !47, metadata !"whence", metadata !5, i32 50331721, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 73]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat64", i32 77, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat64, null, null, metadata !98, i32 77} ; [ DW_TAG_subprogram ] [line 77] [def] [__xstat]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !8, metadata !8, metadata !9, metadata !60}
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!61 = metadata !{i32 786451, metadata !62, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!62 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!63 = metadata !{metadata !64, metadata !67, metadata !69, metadata !71, metadata !72, metadata !74, metadata !76, metadata !77, metadata !78, metadata !80, metadata !82, metadata !84, metadata !92, metadata !93, metadata !94}
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
!78 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !79} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!79 = metadata !{i32 786454, metadata !62, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!80 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !81} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!81 = metadata !{i32 786454, metadata !62, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!82 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !83} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!83 = metadata !{i32 786454, metadata !62, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!84 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !85} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!85 = metadata !{i32 786451, metadata !86, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!86 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!87 = metadata !{metadata !88, metadata !90}
!88 = metadata !{i32 786445, metadata !86, metadata !85, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!89 = metadata !{i32 786454, metadata !86, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!90 = metadata !{i32 786445, metadata !86, metadata !85, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !91} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!91 = metadata !{i32 786454, metadata !86, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!92 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !85} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!93 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !85} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!94 = metadata !{i32 786445, metadata !62, metadata !61, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !95} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !91, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!98 = metadata !{metadata !99, metadata !100, metadata !101}
!99 = metadata !{i32 786689, metadata !57, metadata !"vers", metadata !5, i32 16777293, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 77]
!100 = metadata !{i32 786689, metadata !57, metadata !"path", metadata !5, i32 33554509, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 77]
!101 = metadata !{i32 786689, metadata !57, metadata !"buf", metadata !5, i32 50331725, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 77]
!102 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"stat", metadata !"stat", metadata !"stat64", i32 81, metadata !103, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat64, null, null, metadata !105, i32 81} ; [ DW_TAG_subprogram ] [line 81] [def] [stat]
!103 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = metadata !{metadata !8, metadata !9, metadata !60}
!105 = metadata !{metadata !106, metadata !107}
!106 = metadata !{i32 786689, metadata !102, metadata !"path", metadata !5, i32 16777297, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 81]
!107 = metadata !{i32 786689, metadata !102, metadata !"buf", metadata !5, i32 33554513, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 81]
!108 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat64", i32 85, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat64, null, null, metadata !109, i32 85} ; [ DW_TAG_subprogram ] [line 85] [def] [__lxstat]
!109 = metadata !{metadata !110, metadata !111, metadata !112}
!110 = metadata !{i32 786689, metadata !108, metadata !"vers", metadata !5, i32 16777301, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 85]
!111 = metadata !{i32 786689, metadata !108, metadata !"path", metadata !5, i32 33554517, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 85]
!112 = metadata !{i32 786689, metadata !108, metadata !"buf", metadata !5, i32 50331733, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 85]
!113 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lstat", metadata !"lstat", metadata !"lstat64", i32 89, metadata !103, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat64, null, null, metadata !114, i32 89} ; [ DW_TAG_subprogram ] [line 89] [def] [lstat]
!114 = metadata !{metadata !115, metadata !116}
!115 = metadata !{i32 786689, metadata !113, metadata !"path", metadata !5, i32 16777305, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 89]
!116 = metadata !{i32 786689, metadata !113, metadata !"buf", metadata !5, i32 33554521, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 89]
!117 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat64", i32 93, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat64, null, null, metadata !120, i32 93} ; [ DW_TAG_subprogram ] [line 93] [def] [__fxstat]
!118 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!119 = metadata !{metadata !8, metadata !8, metadata !8, metadata !60}
!120 = metadata !{metadata !121, metadata !122, metadata !123}
!121 = metadata !{i32 786689, metadata !117, metadata !"vers", metadata !5, i32 16777309, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 93]
!122 = metadata !{i32 786689, metadata !117, metadata !"fd", metadata !5, i32 33554525, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 93]
!123 = metadata !{i32 786689, metadata !117, metadata !"buf", metadata !5, i32 50331741, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 93]
!124 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fstat", metadata !"fstat", metadata !"fstat64", i32 97, metadata !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat64, null, null, metadata !127, i32 97} ; [ DW_TAG_subprogram ] [line 97] [def] [fstat]
!125 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !126, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!126 = metadata !{metadata !8, metadata !8, metadata !60}
!127 = metadata !{metadata !128, metadata !129}
!128 = metadata !{i32 786689, metadata !124, metadata !"fd", metadata !5, i32 16777313, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 97]
!129 = metadata !{i32 786689, metadata !124, metadata !"buf", metadata !5, i32 33554529, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 97]
!130 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ftruncate64", metadata !"ftruncate64", metadata !"", i32 101, metadata !131, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate64, null, null, metadata !133, i32 101} ; [ DW_TAG_subprogram ] [line 101] [def] [ftruncate64]
!131 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !132, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!132 = metadata !{metadata !8, metadata !8, metadata !52}
!133 = metadata !{metadata !134, metadata !135}
!134 = metadata !{i32 786689, metadata !130, metadata !"fd", metadata !5, i32 16777317, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 101]
!135 = metadata !{i32 786689, metadata !130, metadata !"length", metadata !5, i32 33554533, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 101]
!136 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"statfs", metadata !"statfs", metadata !"statfs64", i32 106, metadata !137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs64, null, null, metadata !169, i32 106} ; [ DW_TAG_subprogram ] [line 106] [def] [statfs]
!137 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !138, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!138 = metadata !{metadata !8, metadata !9, metadata !139}
!139 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !140} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!140 = metadata !{i32 786451, metadata !141, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !142, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!141 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!142 = metadata !{metadata !143, metadata !145, metadata !146, metadata !148, metadata !149, metadata !150, metadata !152, metadata !153, metadata !162, metadata !163, metadata !164, metadata !165}
!143 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !144} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!144 = metadata !{i32 786454, metadata !141, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!145 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !144} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!146 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_blocks", i32 35, i64 64, i64 64, i64 128, i32 0, metadata !147} ; [ DW_TAG_member ] [f_blocks] [line 35, size 64, align 64, offset 128] [from __fsblkcnt64_t]
!147 = metadata !{i32 786454, metadata !141, null, metadata !"__fsblkcnt64_t", i32 163, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fsblkcnt64_t] [line 163, size 0, align 0, offset 0] [from long unsigned int]
!148 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_bfree", i32 36, i64 64, i64 64, i64 192, i32 0, metadata !147} ; [ DW_TAG_member ] [f_bfree] [line 36, size 64, align 64, offset 192] [from __fsblkcnt64_t]
!149 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_bavail", i32 37, i64 64, i64 64, i64 256, i32 0, metadata !147} ; [ DW_TAG_member ] [f_bavail] [line 37, size 64, align 64, offset 256] [from __fsblkcnt64_t]
!150 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_files", i32 38, i64 64, i64 64, i64 320, i32 0, metadata !151} ; [ DW_TAG_member ] [f_files] [line 38, size 64, align 64, offset 320] [from __fsfilcnt64_t]
!151 = metadata !{i32 786454, metadata !141, null, metadata !"__fsfilcnt64_t", i32 167, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fsfilcnt64_t] [line 167, size 0, align 0, offset 0] [from long unsigned int]
!152 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_ffree", i32 39, i64 64, i64 64, i64 384, i32 0, metadata !151} ; [ DW_TAG_member ] [f_ffree] [line 39, size 64, align 64, offset 384] [from __fsfilcnt64_t]
!153 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !154} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!154 = metadata !{i32 786454, metadata !141, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !155} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!155 = metadata !{i32 786451, metadata !156, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !157, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!156 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 786445, metadata !156, metadata !155, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !159} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!159 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !8, metadata !160, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!160 = metadata !{metadata !161}
!161 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!162 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !144} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!163 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !144} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!164 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !144} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!165 = metadata !{i32 786445, metadata !141, metadata !140, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !166} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!166 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !144, metadata !167, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!167 = metadata !{metadata !168}
!168 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!169 = metadata !{metadata !170, metadata !171}
!170 = metadata !{i32 786689, metadata !136, metadata !"path", metadata !5, i32 16777322, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 106]
!171 = metadata !{i32 786689, metadata !136, metadata !"buf", metadata !5, i32 33554538, metadata !139, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 106]
!172 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"getdents64", metadata !"getdents64", metadata !"", i32 110, metadata !173, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent*, i32)* @getdents64, null, null, metadata !190, i32 110} ; [ DW_TAG_subprogram ] [line 110] [def] [getdents64]
!173 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !174, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!174 = metadata !{metadata !8, metadata !18, metadata !175, metadata !18}
!175 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !176} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent]
!176 = metadata !{i32 786451, metadata !177, null, metadata !"dirent", i32 22, i64 2240, i64 64, i32 0, i32 0, null, metadata !178, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent] [line 22, size 2240, align 64, offset 0] [def] [from ]
!177 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!178 = metadata !{metadata !179, metadata !181, metadata !182, metadata !184, metadata !186}
!179 = metadata !{i32 786445, metadata !177, metadata !176, metadata !"d_ino", i32 28, i64 64, i64 64, i64 0, i32 0, metadata !180} ; [ DW_TAG_member ] [d_ino] [line 28, size 64, align 64, offset 0] [from __ino64_t]
!180 = metadata !{i32 786454, metadata !177, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!181 = metadata !{i32 786445, metadata !177, metadata !176, metadata !"d_off", i32 29, i64 64, i64 64, i64 64, i32 0, metadata !50} ; [ DW_TAG_member ] [d_off] [line 29, size 64, align 64, offset 64] [from __off64_t]
!182 = metadata !{i32 786445, metadata !177, metadata !176, metadata !"d_reclen", i32 31, i64 16, i64 16, i64 128, i32 0, metadata !183} ; [ DW_TAG_member ] [d_reclen] [line 31, size 16, align 16, offset 128] [from unsigned short]
!183 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!184 = metadata !{i32 786445, metadata !177, metadata !176, metadata !"d_type", i32 32, i64 8, i64 8, i64 144, i32 0, metadata !185} ; [ DW_TAG_member ] [d_type] [line 32, size 8, align 8, offset 144] [from unsigned char]
!185 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!186 = metadata !{i32 786445, metadata !177, metadata !176, metadata !"d_name", i32 33, i64 2048, i64 8, i64 152, i32 0, metadata !187} ; [ DW_TAG_member ] [d_name] [line 33, size 2048, align 8, offset 152] [from ]
!187 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !11, metadata !188, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!188 = metadata !{metadata !189}
!189 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!190 = metadata !{metadata !191, metadata !192, metadata !193}
!191 = metadata !{i32 786689, metadata !172, metadata !"fd", metadata !5, i32 16777326, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 110]
!192 = metadata !{i32 786689, metadata !172, metadata !"dirp", metadata !5, i32 33554542, metadata !175, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 110]
!193 = metadata !{i32 786689, metadata !172, metadata !"count", metadata !5, i32 50331758, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 110]
!194 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!195 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!196 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!197 = metadata !{i32 45, i32 0, metadata !4, null}
!198 = metadata !{i32 46, i32 0, metadata !4, null}
!199 = metadata !{i32 48, i32 0, metadata !21, null}
!200 = metadata !{i32 50, i32 0, metadata !20, null}
!201 = metadata !{i32 51, i32 0, metadata !20, null}
!202 = metadata !{i32 52, i32 0, metadata !20, null}
!203 = metadata !{i32 53, i32 0, metadata !20, null}
!204 = metadata !{i32 54, i32 0, metadata !20, null}
!205 = metadata !{i32 56, i32 0, metadata !4, null}
!206 = metadata !{i32 59, i32 0, metadata !36, null}
!207 = metadata !{i32 60, i32 0, metadata !36, null}
!208 = metadata !{i32 62, i32 0, metadata !46, null}
!209 = metadata !{i32 64, i32 0, metadata !45, null}
!210 = metadata !{i32 65, i32 0, metadata !45, null}
!211 = metadata !{i32 66, i32 0, metadata !45, null}
!212 = metadata !{i32 67, i32 0, metadata !45, null}
!213 = metadata !{i32 68, i32 0, metadata !45, null}
!214 = metadata !{i32 70, i32 0, metadata !36, null}
!215 = metadata !{i32 73, i32 0, metadata !47, null}
!216 = metadata !{i32 74, i32 0, metadata !47, null}
!217 = metadata !{i32 77, i32 0, metadata !57, null}
!218 = metadata !{i32 78, i32 0, metadata !57, null}
!219 = metadata !{i32 81, i32 0, metadata !102, null}
!220 = metadata !{i32 82, i32 0, metadata !102, null}
!221 = metadata !{i32 85, i32 0, metadata !108, null}
!222 = metadata !{i32 86, i32 0, metadata !108, null}
!223 = metadata !{i32 89, i32 0, metadata !113, null}
!224 = metadata !{i32 90, i32 0, metadata !113, null}
!225 = metadata !{i32 93, i32 0, metadata !117, null}
!226 = metadata !{i32 94, i32 0, metadata !117, null}
!227 = metadata !{i32 97, i32 0, metadata !124, null}
!228 = metadata !{i32 98, i32 0, metadata !124, null}
!229 = metadata !{i32 101, i32 0, metadata !130, null}
!230 = metadata !{i32 102, i32 0, metadata !130, null}
!231 = metadata !{i32 106, i32 0, metadata !136, null}
!232 = metadata !{i32 107, i32 0, metadata !136, null}
!233 = metadata !{i32 110, i32 0, metadata !172, null}
!234 = metadata !{i32 111, i32 0, metadata !172, null}

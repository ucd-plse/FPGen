; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [72 x i8] c"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #0 {
  %x = alloca i32, align 4
  call void @llvm.dbg.value(metadata !{i32 %start}, i64 0, metadata !13), !dbg !20
  call void @llvm.dbg.value(metadata !{i32 %end}, i64 0, metadata !14), !dbg !20
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !15), !dbg !20
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !16), !dbg !21
  %1 = icmp slt i32 %start, %end, !dbg !22
  br i1 %1, label %3, label %2, !dbg !22

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([72 x i8]* @.str, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0)) #4, !dbg !24
  unreachable, !dbg !24

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !25
  %5 = icmp eq i32 %4, %end, !dbg !25
  br i1 %5, label %21, label %6, !dbg !25

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !27
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #5, !dbg !27
  %8 = icmp eq i32 %start, 0, !dbg !29
  call void @llvm.dbg.value(metadata !{i32* %x}, i64 0, metadata !16), !dbg !31
  %9 = load i32* %x, align 4, !dbg !31, !tbaa !33
  br i1 %8, label %10, label %13, !dbg !29

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !31
  %12 = zext i1 %11 to i64, !dbg !31
  call void @klee_assume(i64 %12) #5, !dbg !31
  br label %19, !dbg !37

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !38
  %15 = zext i1 %14 to i64, !dbg !38
  call void @klee_assume(i64 %15) #5, !dbg !38
  call void @llvm.dbg.value(metadata !{i32* %x}, i64 0, metadata !16), !dbg !40
  %16 = load i32* %x, align 4, !dbg !40, !tbaa !33
  %17 = icmp slt i32 %16, %end, !dbg !40
  %18 = zext i1 %17 to i64, !dbg !40
  call void @klee_assume(i64 %18) #5, !dbg !40
  br label %19

; <label>:19                                      ; preds = %13, %10
  call void @llvm.dbg.value(metadata !{i32* %x}, i64 0, metadata !16), !dbg !41
  %20 = load i32* %x, align 4, !dbg !41, !tbaa !33
  br label %21, !dbg !41

; <label>:21                                      ; preds = %3, %19
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #3

declare void @klee_assume(i64) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin noreturn nounwind }
attributes #5 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !12, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [klee_range]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16}
!13 = metadata !{i32 786689, metadata !4, metadata !"start", metadata !5, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!14 = metadata !{i32 786689, metadata !4, metadata !"end", metadata !5, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!15 = metadata !{i32 786689, metadata !4, metadata !"name", metadata !5, i32 50331661, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!16 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!20 = metadata !{i32 13, i32 0, metadata !4, null}
!21 = metadata !{i32 14, i32 0, metadata !4, null}
!22 = metadata !{i32 16, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!24 = metadata !{i32 17, i32 0, metadata !23, null}
!25 = metadata !{i32 19, i32 0, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!27 = metadata !{i32 22, i32 0, metadata !28, null}
!28 = metadata !{i32 786443, metadata !1, metadata !26, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!29 = metadata !{i32 25, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !28, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!31 = metadata !{i32 26, i32 0, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !30, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!33 = metadata !{metadata !34, metadata !34, i64 0}
!34 = metadata !{metadata !"int", metadata !35, i64 0}
!35 = metadata !{metadata !"omnipotent char", metadata !36, i64 0}
!36 = metadata !{metadata !"Simple C/C++ TBAA"}
!37 = metadata !{i32 27, i32 0, metadata !32, null}
!38 = metadata !{i32 28, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !30, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_range.c]
!40 = metadata !{i32 29, i32 0, metadata !39, null}
!41 = metadata !{i32 32, i32 0, metadata !28, null}
!42 = metadata !{i32 34, i32 0, metadata !4, null}

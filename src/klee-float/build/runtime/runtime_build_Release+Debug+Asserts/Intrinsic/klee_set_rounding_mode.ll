; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [84 x i8] c"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"Invalid rounding mode\00", align 1
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define void @klee_set_rounding_mode(i32 %rm) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rm}, i64 0, metadata !19), !dbg !23
  switch i32 %rm, label %6 [
    i32 0, label %1
    i32 1, label %2
    i32 2, label %3
    i32 3, label %4
    i32 4, label %5
  ], !dbg !24

; <label>:1                                       ; preds = %0
  tail call void @klee_set_rounding_mode_internal(i32 0) #4, !dbg !25
  br label %7, !dbg !25

; <label>:2                                       ; preds = %0
  tail call void @klee_set_rounding_mode_internal(i32 1) #4, !dbg !27
  br label %7, !dbg !27

; <label>:3                                       ; preds = %0
  tail call void @klee_set_rounding_mode_internal(i32 2) #4, !dbg !28
  br label %7, !dbg !28

; <label>:4                                       ; preds = %0
  tail call void @klee_set_rounding_mode_internal(i32 3) #4, !dbg !29
  br label %7, !dbg !29

; <label>:5                                       ; preds = %0
  tail call void @klee_set_rounding_mode_internal(i32 4) #4, !dbg !30
  br label %7, !dbg !30

; <label>:6                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([84 x i8]* @.str, i64 0, i64 0), i32 31, i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !31
  unreachable, !dbg !31

; <label>:7                                       ; preds = %5, %4, %3, %2, %1
  ret void, !dbg !32
}

declare void @klee_set_rounding_mode_internal(i32) #1

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nobuiltin nounwind }
attributes #5 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !12, metadata !13, metadata !12, metadata !12, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"KleeRoundingMode", i32 183, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [KleeRoundingMode] [line 183, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/include/klee/klee.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11}
!6 = metadata !{i32 786472, metadata !"KLEE_FP_RNE", i64 0} ; [ DW_TAG_enumerator ] [KLEE_FP_RNE :: 0]
!7 = metadata !{i32 786472, metadata !"KLEE_FP_RNA", i64 1} ; [ DW_TAG_enumerator ] [KLEE_FP_RNA :: 1]
!8 = metadata !{i32 786472, metadata !"KLEE_FP_RU", i64 2} ; [ DW_TAG_enumerator ] [KLEE_FP_RU :: 2]
!9 = metadata !{i32 786472, metadata !"KLEE_FP_RD", i64 3} ; [ DW_TAG_enumerator ] [KLEE_FP_RD :: 3]
!10 = metadata !{i32 786472, metadata !"KLEE_FP_RZ", i64 4} ; [ DW_TAG_enumerator ] [KLEE_FP_RZ :: 4]
!11 = metadata !{i32 786472, metadata !"KLEE_FP_UNKNOWN", i64 5} ; [ DW_TAG_enumerator ] [KLEE_FP_UNKNOWN :: 5]
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786478, metadata !1, metadata !15, metadata !"klee_set_rounding_mode", metadata !"klee_set_rounding_mode", metadata !"", i32 16, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @klee_set_rounding_mode, null, null, metadata !18, i32 16} ; [ DW_TAG_subprogram ] [line 16] [def] [klee_set_rounding_mode]
!15 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !3}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786689, metadata !14, metadata !"rm", metadata !15, i32 16777232, metadata !3, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rm] [line 16]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!23 = metadata !{i32 16, i32 0, metadata !14, null}
!24 = metadata !{i32 19, i32 0, metadata !14, null}
!25 = metadata !{i32 21, i32 0, metadata !26, null}
!26 = metadata !{i32 786443, metadata !1, metadata !14, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/klee_set_rounding_mode.c]
!27 = metadata !{i32 23, i32 0, metadata !26, null}
!28 = metadata !{i32 25, i32 0, metadata !26, null}
!29 = metadata !{i32 27, i32 0, metadata !26, null}
!30 = metadata !{i32 29, i32 0, metadata !26, null}
!31 = metadata !{i32 31, i32 0, metadata !26, null}
!32 = metadata !{i32 33, i32 0, metadata !14, null}

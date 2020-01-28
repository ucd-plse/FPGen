; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fenv.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@switch.table = private unnamed_addr constant [5 x i32] [i32 0, i32 3073, i32 2048, i32 1024, i32 3072]

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fegetround() #0 {
  %1 = tail call i32 (...)* @klee_get_rounding_mode() #3, !dbg !36
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !27), !dbg !36
  %2 = icmp ult i32 %1, 5, !dbg !37
  br i1 %2, label %switch.lookup, label %4, !dbg !37

switch.lookup:                                    ; preds = %0
  %3 = sext i32 %1 to i64, !dbg !37
  %switch.gep = getelementptr inbounds [5 x i32]* @switch.table, i64 0, i64 %3, !dbg !37
  %switch.load = load i32* %switch.gep, align 4, !dbg !37
  ret i32 %switch.load, !dbg !37

; <label>:4                                       ; preds = %0
  ret i32 -1, !dbg !38
}

declare i32 @klee_get_rounding_mode(...) #1

; Function Attrs: nounwind uwtable
define i32 @klee_internal_fesetround(i32 %rm) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rm}, i64 0, metadata !32), !dbg !39
  switch i32 %rm, label %5 [
    i32 0, label %1
    i32 2048, label %2
    i32 1024, label %3
    i32 3072, label %4
  ], !dbg !40

; <label>:1                                       ; preds = %0
  tail call void @klee_set_rounding_mode(i32 0) #3, !dbg !41
  br label %5, !dbg !43

; <label>:2                                       ; preds = %0
  tail call void @klee_set_rounding_mode(i32 2) #3, !dbg !44
  br label %5, !dbg !45

; <label>:3                                       ; preds = %0
  tail call void @klee_set_rounding_mode(i32 3) #3, !dbg !46
  br label %5, !dbg !47

; <label>:4                                       ; preds = %0
  tail call void @klee_set_rounding_mode(i32 4) #3, !dbg !48
  br label %5, !dbg !49

; <label>:5                                       ; preds = %1, %2, %3, %4, %0
  %.0 = phi i32 [ -1, %0 ], [ 0, %4 ], [ 0, %3 ], [ 0, %2 ], [ 0, %1 ]
  ret i32 %.0, !dbg !50
}

declare void @klee_set_rounding_mode(i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !19, metadata !20, metadata !19, metadata !19, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fenv.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fenv.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!2 = metadata !{metadata !3, metadata !12}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"KleeRoundingMode", i32 183, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [KleeRoundingMode] [line 183, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/include/klee/klee.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11}
!6 = metadata !{i32 786472, metadata !"KLEE_FP_RNE", i64 0} ; [ DW_TAG_enumerator ] [KLEE_FP_RNE :: 0]
!7 = metadata !{i32 786472, metadata !"KLEE_FP_RNA", i64 1} ; [ DW_TAG_enumerator ] [KLEE_FP_RNA :: 1]
!8 = metadata !{i32 786472, metadata !"KLEE_FP_RU", i64 2} ; [ DW_TAG_enumerator ] [KLEE_FP_RU :: 2]
!9 = metadata !{i32 786472, metadata !"KLEE_FP_RD", i64 3} ; [ DW_TAG_enumerator ] [KLEE_FP_RD :: 3]
!10 = metadata !{i32 786472, metadata !"KLEE_FP_RZ", i64 4} ; [ DW_TAG_enumerator ] [KLEE_FP_RZ :: 4]
!11 = metadata !{i32 786472, metadata !"KLEE_FP_UNKNOWN", i64 5} ; [ DW_TAG_enumerator ] [KLEE_FP_UNKNOWN :: 5]
!12 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 15, i64 32, i64 32, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 15, size 32, align 32, offset 0] [def] [from ]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !18}
!14 = metadata !{i32 786472, metadata !"FE_TONEAREST", i64 0} ; [ DW_TAG_enumerator ] [FE_TONEAREST :: 0]
!15 = metadata !{i32 786472, metadata !"FE_DOWNWARD", i64 1024} ; [ DW_TAG_enumerator ] [FE_DOWNWARD :: 1024]
!16 = metadata !{i32 786472, metadata !"FE_UPWARD", i64 2048} ; [ DW_TAG_enumerator ] [FE_UPWARD :: 2048]
!17 = metadata !{i32 786472, metadata !"FE_TOWARDZERO", i64 3072} ; [ DW_TAG_enumerator ] [FE_TOWARDZERO :: 3072]
!18 = metadata !{i32 786472, metadata !"FE_TONEAREST_TIES_TO_AWAY", i64 3073} ; [ DW_TAG_enumerator ] [FE_TONEAREST_TIES_TO_AWAY :: 3073]
!19 = metadata !{i32 0}
!20 = metadata !{metadata !21, metadata !28}
!21 = metadata !{i32 786478, metadata !1, metadata !22, metadata !"klee_internal_fegetround", metadata !"klee_internal_fegetround", metadata !"", i32 33, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @klee_internal_fegetround, null, null, metadata !26, i32 33} ; [ DW_TAG_subprogram ] [line 33] [def] [klee_internal_fegetround]
!22 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fenv.c]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786688, metadata !21, metadata !"rm", metadata !22, i32 34, metadata !3, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rm] [line 34]
!28 = metadata !{i32 786478, metadata !1, metadata !22, metadata !"klee_internal_fesetround", metadata !"klee_internal_fesetround", metadata !"", i32 52, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @klee_internal_fesetround, null, null, metadata !31, i32 52} ; [ DW_TAG_subprogram ] [line 52] [def] [klee_internal_fesetround]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !25, metadata !25}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786689, metadata !28, metadata !"rm", metadata !22, i32 16777268, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rm] [line 52]
!33 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!34 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!35 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!36 = metadata !{i32 34, i32 0, metadata !21, null}
!37 = metadata !{i32 35, i32 0, metadata !21, null}
!38 = metadata !{i32 50, i32 0, metadata !21, null}
!39 = metadata !{i32 52, i32 0, metadata !28, null}
!40 = metadata !{i32 53, i32 0, metadata !28, null}
!41 = metadata !{i32 55, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !28, i32 53, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fenv.c]
!43 = metadata !{i32 56, i32 0, metadata !42, null}
!44 = metadata !{i32 66, i32 0, metadata !42, null}
!45 = metadata !{i32 67, i32 0, metadata !42, null}
!46 = metadata !{i32 69, i32 0, metadata !42, null}
!47 = metadata !{i32 70, i32 0, metadata !42, null}
!48 = metadata !{i32 72, i32 0, metadata !42, null}
!49 = metadata !{i32 73, i32 0, metadata !42, null}
!50 = metadata !{i32 79, i32 0, metadata !28, null}

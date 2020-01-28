; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fabs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @klee_internal_fabs(double %d) #0 {
  tail call void @llvm.dbg.value(metadata !{double %d}, i64 0, metadata !10), !dbg !26
  %1 = tail call double @klee_abs_double(double %d) #3, !dbg !27
  ret double %1, !dbg !27
}

declare double @klee_abs_double(double) #1

; Function Attrs: nounwind uwtable
define float @klee_internal_fabsf(float %f) #0 {
  tail call void @llvm.dbg.value(metadata !{float %f}, i64 0, metadata !16), !dbg !28
  %1 = tail call float @klee_abs_float(float %f) #3, !dbg !29
  ret float %1, !dbg !29
}

declare float @klee_abs_float(float) #1

; Function Attrs: nounwind uwtable
define x86_fp80 @klee_internal_fabsl(x86_fp80 %f) #0 {
  tail call void @llvm.dbg.value(metadata !{x86_fp80 %f}, i64 0, metadata !22), !dbg !30
  %1 = tail call x86_fp80 @klee_abs_long_double(x86_fp80 %f) #3, !dbg !31
  ret x86_fp80 %1, !dbg !31
}

declare x86_fp80 @klee_abs_long_double(x86_fp80) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fabs.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fabs.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !11, metadata !17}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_internal_fabs", metadata !"klee_internal_fabs", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @klee_internal_fabs, null, null, metadata !9, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [klee_internal_fabs]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/fabs.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"d", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 11]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_internal_fabsf", metadata !"klee_internal_fabsf", metadata !"", i32 15, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @klee_internal_fabsf, null, null, metadata !15, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [klee_internal_fabsf]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !14, metadata !14}
!14 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786689, metadata !11, metadata !"f", metadata !5, i32 16777231, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 15]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_internal_fabsl", metadata !"klee_internal_fabsl", metadata !"", i32 20, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, x86_fp80 (x86_fp80)* @klee_internal_fabsl, null, null, metadata !21, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [klee_internal_fabsl]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !20}
!20 = metadata !{i32 786468, null, null, metadata !"long double", i32 0, i64 128, i64 128, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786689, metadata !17, metadata !"f", metadata !5, i32 16777236, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 20]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!26 = metadata !{i32 11, i32 0, metadata !4, null}
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 15, i32 0, metadata !11, null}
!29 = metadata !{i32 16, i32 0, metadata !11, null}
!30 = metadata !{i32 20, i32 0, metadata !17, null}
!31 = metadata !{i32 21, i32 0, metadata !17, null}

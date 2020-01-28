; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/memset.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !13), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !14), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !15), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !16), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !15), !dbg !25
  %1 = icmp eq i64 %count, 0, !dbg !25
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !25

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !26
  br label %3, !dbg !25

; <label>:3                                       ; preds = %.lr.ph, %3
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !25
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !16), !dbg !26
  store volatile i8 %2, i8* %a.02, align 1, !dbg !26, !tbaa !27
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !15), !dbg !25
  %6 = icmp eq i64 %4, 0, !dbg !25
  br i1 %6, label %._crit_edge, label %3, !dbg !25

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/memset.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/memset.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !12, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [memset]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/Intrinsic//home/fptesting/FPTesting/src/klee-float/runtime/Intrinsic/memset.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!11 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16}
!13 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !5, i32 16777227, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!14 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !5, i32 33554443, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!15 = metadata !{i32 786689, metadata !4, metadata !"count", metadata !5, i32 50331659, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!16 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 12, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!23 = metadata !{i32 11, i32 0, metadata !4, null}
!24 = metadata !{i32 12, i32 0, metadata !4, null}
!25 = metadata !{i32 13, i32 0, metadata !4, null}
!26 = metadata !{i32 14, i32 0, metadata !4, null}
!27 = metadata !{metadata !28, metadata !28, i64 0}
!28 = metadata !{metadata !"omnipotent char", metadata !29, i64 0}
!29 = metadata !{metadata !"Simple C/C++ TBAA"}
!30 = metadata !{i32 15, i32 0, metadata !4, null}

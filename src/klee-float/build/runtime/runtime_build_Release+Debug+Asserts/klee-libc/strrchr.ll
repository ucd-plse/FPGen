; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @strrchr(i8* readonly %t, i32 %c) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %t}, i64 0, metadata !14), !dbg !21
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !15), !dbg !21
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !17), !dbg !23
  %sext = shl i32 %c, 24, !dbg !24
  %1 = ashr exact i32 %sext, 24, !dbg !24
  br label %2, !dbg !28

; <label>:2                                       ; preds = %2, %0
  %.0 = phi i8* [ %t, %0 ], [ %7, %2 ]
  %l.0 = phi i8* [ null, %0 ], [ %.0.l.0, %2 ]
  %3 = load i8* %.0, align 1, !dbg !24, !tbaa !29
  %4 = sext i8 %3 to i32, !dbg !24
  %5 = icmp eq i32 %4, %1, !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8* %.0}, i64 0, metadata !17), !dbg !24
  %.0.l.0 = select i1 %5, i8* %.0, i8* %l.0, !dbg !24
  %6 = icmp eq i8 %3, 0, !dbg !32
  %7 = getelementptr inbounds i8* %.0, i64 1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !14), !dbg !34
  br i1 %6, label %8, label %2, !dbg !32

; <label>:8                                       ; preds = %2
  ret i8* %.0.l.0, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strrchr", metadata !"strrchr", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32)* @strrchr, null, null, metadata !13, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [strrchr]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !12}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17}
!14 = metadata !{i32 786689, metadata !4, metadata !"t", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 12]
!15 = metadata !{i32 786689, metadata !4, metadata !"c", metadata !5, i32 33554444, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 12]
!16 = metadata !{i32 786688, metadata !4, metadata !"ch", metadata !5, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ch] [line 13]
!17 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 14, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 14]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!21 = metadata !{i32 12, i32 0, metadata !4, null}
!22 = metadata !{i8* null}
!23 = metadata !{i32 14, i32 0, metadata !4, null}
!24 = metadata !{i32 18, i32 0, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !26, i32 18, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c]
!26 = metadata !{i32 786443, metadata !1, metadata !27, i32 17, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c]
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c]
!28 = metadata !{i32 17, i32 0, metadata !27, null}
!29 = metadata !{metadata !30, metadata !30, i64 0}
!30 = metadata !{metadata !"omnipotent char", metadata !31, i64 0}
!31 = metadata !{metadata !"Simple C/C++ TBAA"}
!32 = metadata !{i32 18, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !1, metadata !26, i32 18, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strrchr.c]
!34 = metadata !{i32 18, i32 0, metadata !26, null}

; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @memcmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s1}, i64 0, metadata !14), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %s2}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !16), !dbg !27
  %1 = icmp eq i64 %n, 0, !dbg !28
  br i1 %1, label %.loopexit, label %.preheader, !dbg !28

.preheader:                                       ; preds = %0, %9
  %.0 = phi i64 [ %12, %9 ], [ %n, %0 ]
  %p1.0 = phi i8* [ %11, %9 ], [ %s1, %0 ]
  %p2.0 = phi i8* [ %10, %9 ], [ %s2, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !17), !dbg !29
  %2 = load i8* %p1.0, align 1, !dbg !29, !tbaa !32
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !23), !dbg !29
  %3 = load i8* %p2.0, align 1, !dbg !29, !tbaa !32
  %4 = icmp eq i8 %2, %3, !dbg !29
  br i1 %4, label %9, label %5, !dbg !29

; <label>:5                                       ; preds = %.preheader
  tail call void @llvm.dbg.value(metadata !{i8* %p1.0}, i64 0, metadata !17), !dbg !35
  %6 = zext i8 %2 to i32, !dbg !35
  tail call void @llvm.dbg.value(metadata !{i8* %p2.0}, i64 0, metadata !23), !dbg !35
  %7 = zext i8 %3 to i32, !dbg !35
  %8 = sub nsw i32 %6, %7, !dbg !35
  br label %.loopexit, !dbg !35

; <label>:9                                       ; preds = %.preheader
  %10 = getelementptr inbounds i8* %p2.0, i64 1, !dbg !29
  %11 = getelementptr inbounds i8* %p1.0, i64 1, !dbg !29
  %12 = add i64 %.0, -1, !dbg !37
  tail call void @llvm.dbg.value(metadata !{i64 %12}, i64 0, metadata !16), !dbg !37
  %13 = icmp eq i64 %12, 0, !dbg !37
  br i1 %13, label %.loopexit, label %.preheader, !dbg !37

.loopexit:                                        ; preds = %9, %0, %5
  %.01 = phi i32 [ %8, %5 ], [ 0, %0 ], [ 0, %9 ]
  ret i32 %.01, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"memcmp", metadata !"memcmp", metadata !"", i32 42, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64)* @memcmp, null, null, metadata !13, i32 42} ; [ DW_TAG_subprogram ] [line 42] [def] [memcmp]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !11}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !23}
!14 = metadata !{i32 786689, metadata !4, metadata !"s1", metadata !5, i32 16777258, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s1] [line 42]
!15 = metadata !{i32 786689, metadata !4, metadata !"s2", metadata !5, i32 33554474, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s2] [line 42]
!16 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 50331690, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 42]
!17 = metadata !{i32 786688, metadata !18, metadata !"p1", metadata !5, i32 44, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p1] [line 44]
!18 = metadata !{i32 786443, metadata !1, metadata !19, i32 43, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!19 = metadata !{i32 786443, metadata !1, metadata !4, i32 43, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!22 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!23 = metadata !{i32 786688, metadata !18, metadata !"p2", metadata !5, i32 44, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p2] [line 44]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!27 = metadata !{i32 42, i32 0, metadata !4, null}
!28 = metadata !{i32 43, i32 0, metadata !19, null}
!29 = metadata !{i32 47, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !31, i32 47, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!31 = metadata !{i32 786443, metadata !1, metadata !18, i32 46, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!32 = metadata !{metadata !33, metadata !33, i64 0}
!33 = metadata !{metadata !"omnipotent char", metadata !34, i64 0}
!34 = metadata !{metadata !"Simple C/C++ TBAA"}
!35 = metadata !{i32 48, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !30, i32 47, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memcmp.c]
!37 = metadata !{i32 50, i32 0, metadata !31, null}
!38 = metadata !{i32 53, i32 0, metadata !4, null}

; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @memchr(i8* readonly %s, i32 %c, i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !16), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !17), !dbg !29
  %1 = icmp eq i64 %n, 0, !dbg !30
  br i1 %1, label %.loopexit, label %.preheader, !dbg !30

.preheader:                                       ; preds = %0, %5
  %.0 = phi i64 [ %7, %5 ], [ %n, %0 ]
  %p.0 = phi i8* [ %6, %5 ], [ %s, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !18), !dbg !31
  %2 = load i8* %p.0, align 1, !dbg !31, !tbaa !34
  %3 = zext i8 %2 to i32, !dbg !31
  %4 = icmp eq i32 %3, %c, !dbg !31
  br i1 %4, label %.loopexit, label %5, !dbg !31

; <label>:5                                       ; preds = %.preheader
  %6 = getelementptr inbounds i8* %p.0, i64 1, !dbg !31
  %7 = add i64 %.0, -1, !dbg !37
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !17), !dbg !37
  %8 = icmp eq i64 %7, 0, !dbg !37
  br i1 %8, label %.loopexit, label %.preheader, !dbg !37

.loopexit:                                        ; preds = %5, %.preheader, %0
  %.01 = phi i8* [ null, %0 ], [ null, %5 ], [ %p.0, %.preheader ]
  ret i8* %.01, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"memchr", metadata !"memchr", metadata !"", i32 40, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i8* (i8*, i32, i64)* @memchr, null, null, metadata !14, i32 44} ; [ DW_TAG_subprogram ] [line 40] [def] [scope 44] [memchr]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !11, metadata !12}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18}
!15 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !5, i32 16777257, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 41]
!16 = metadata !{i32 786689, metadata !4, metadata !"c", metadata !5, i32 33554474, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 42]
!17 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 50331691, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 43]
!18 = metadata !{i32 786688, metadata !19, metadata !"p", metadata !5, i32 46, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 46]
!19 = metadata !{i32 786443, metadata !1, metadata !20, i32 45, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c]
!20 = metadata !{i32 786443, metadata !1, metadata !4, i32 45, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!23 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!27 = metadata !{i32 41, i32 0, metadata !4, null}
!28 = metadata !{i32 42, i32 0, metadata !4, null}
!29 = metadata !{i32 43, i32 0, metadata !4, null}
!30 = metadata !{i32 45, i32 0, metadata !20, null}
!31 = metadata !{i32 49, i32 0, metadata !32, null}
!32 = metadata !{i32 786443, metadata !1, metadata !33, i32 49, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c]
!33 = metadata !{i32 786443, metadata !1, metadata !19, i32 48, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/memchr.c]
!34 = metadata !{metadata !35, metadata !35, i64 0}
!35 = metadata !{metadata !"omnipotent char", metadata !36, i64 0}
!36 = metadata !{metadata !"Simple C/C++ TBAA"}
!37 = metadata !{i32 51, i32 0, metadata !33, null}
!38 = metadata !{i32 54, i32 0, metadata !4, null}

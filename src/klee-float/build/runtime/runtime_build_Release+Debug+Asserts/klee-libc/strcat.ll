; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcat.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @strcat(i8* %s, i8* nocapture readonly %append) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !13), !dbg !19
  tail call void @llvm.dbg.value(metadata !{i8* %append}, i64 0, metadata !14), !dbg !19
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !15), !dbg !20
  br label %1, !dbg !21

; <label>:1                                       ; preds = %1, %0
  %.0 = phi i8* [ %s, %0 ], [ %4, %1 ]
  %2 = load i8* %.0, align 1, !dbg !21, !tbaa !23
  %3 = icmp eq i8 %2, 0, !dbg !21
  %4 = getelementptr inbounds i8* %.0, i64 1, !dbg !21
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !13), !dbg !21
  br i1 %3, label %.preheader, label %1, !dbg !21

.preheader:                                       ; preds = %1, %.preheader
  %.01 = phi i8* [ %5, %.preheader ], [ %append, %1 ]
  %.1 = phi i8* [ %7, %.preheader ], [ %.0, %1 ]
  %5 = getelementptr inbounds i8* %.01, i64 1, !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !14), !dbg !26
  %6 = load i8* %.01, align 1, !dbg !26, !tbaa !23
  %7 = getelementptr inbounds i8* %.1, i64 1, !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !13), !dbg !26
  store i8 %6, i8* %.1, align 1, !dbg !26, !tbaa !23
  %8 = icmp eq i8 %6, 0, !dbg !26
  br i1 %8, label %9, label %.preheader, !dbg !26

; <label>:9                                       ; preds = %.preheader
  ret i8* %s, !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcat.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcat.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strcat", metadata !"strcat", metadata !"", i32 39, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*)* @strcat, null, null, metadata !12, i32 39} ; [ DW_TAG_subprogram ] [line 39] [def] [strcat]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcat.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !5, i32 16777255, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 39]
!14 = metadata !{i32 786689, metadata !4, metadata !"append", metadata !5, i32 33554471, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [append] [line 39]
!15 = metadata !{i32 786688, metadata !4, metadata !"save", metadata !5, i32 40, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save] [line 40]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!19 = metadata !{i32 39, i32 0, metadata !4, null}
!20 = metadata !{i32 40, i32 0, metadata !4, null}
!21 = metadata !{i32 42, i32 0, metadata !22, null}
!22 = metadata !{i32 786443, metadata !1, metadata !4, i32 42, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcat.c]
!23 = metadata !{metadata !24, metadata !24, i64 0}
!24 = metadata !{metadata !"omnipotent char", metadata !25, i64 0}
!25 = metadata !{metadata !"Simple C/C++ TBAA"}
!26 = metadata !{i32 44, i32 0, metadata !4, null}
!27 = metadata !{i32 46, i32 0, metadata !4, null}

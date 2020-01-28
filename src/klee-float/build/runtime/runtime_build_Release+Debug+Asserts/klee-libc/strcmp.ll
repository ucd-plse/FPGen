; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @strcmp(i8* nocapture readonly %a, i8* nocapture readonly %b) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %a}, i64 0, metadata !13), !dbg !18
  tail call void @llvm.dbg.value(metadata !{i8* %b}, i64 0, metadata !14), !dbg !18
  %1 = load i8* %a, align 1, !dbg !19, !tbaa !20
  %2 = icmp eq i8 %1, 0, !dbg !19
  br i1 %2, label %.critedge, label %.lr.ph, !dbg !19

.lr.ph:                                           ; preds = %0, %6
  %3 = phi i8 [ %9, %6 ], [ %1, %0 ]
  %.03 = phi i8* [ %8, %6 ], [ %b, %0 ]
  %.012 = phi i8* [ %7, %6 ], [ %a, %0 ]
  %4 = load i8* %.03, align 1, !dbg !19, !tbaa !20
  %5 = icmp eq i8 %3, %4, !dbg !19
  br i1 %5, label %6, label %.critedge

; <label>:6                                       ; preds = %.lr.ph
  %7 = getelementptr inbounds i8* %.012, i64 1, !dbg !23
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !13), !dbg !23
  %8 = getelementptr inbounds i8* %.03, i64 1, !dbg !23
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !14), !dbg !23
  %9 = load i8* %7, align 1, !dbg !19, !tbaa !20
  %10 = icmp eq i8 %9, 0, !dbg !19
  br i1 %10, label %.critedge, label %.lr.ph, !dbg !19

.critedge:                                        ; preds = %6, %.lr.ph, %0
  %11 = phi i8 [ 0, %0 ], [ 0, %6 ], [ %3, %.lr.ph ]
  %.0.lcssa = phi i8* [ %b, %0 ], [ %8, %6 ], [ %.03, %.lr.ph ]
  %12 = sext i8 %11 to i32, !dbg !24
  %13 = load i8* %.0.lcssa, align 1, !dbg !24, !tbaa !20
  %14 = sext i8 %13 to i32, !dbg !24
  %15 = sub nsw i32 %12, %14, !dbg !24
  ret i32 %15, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcmp.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcmp.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strcmp", metadata !"strcmp", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @strcmp, null, null, metadata !12, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [strcmp]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strcmp.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777226, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 10]
!14 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 10]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!18 = metadata !{i32 10, i32 0, metadata !4, null}
!19 = metadata !{i32 11, i32 0, metadata !4, null}
!20 = metadata !{metadata !21, metadata !21, i64 0}
!21 = metadata !{metadata !"omnipotent char", metadata !22, i64 0}
!22 = metadata !{metadata !"Simple C/C++ TBAA"}
!23 = metadata !{i32 12, i32 0, metadata !4, null}
!24 = metadata !{i32 13, i32 0, metadata !4, null}

; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strlen.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i64 @strlen(i8* %str) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %str}, i64 0, metadata !13), !dbg !18
  tail call void @llvm.dbg.value(metadata !{i8* %str}, i64 0, metadata !14), !dbg !19
  br label %1, !dbg !20

; <label>:1                                       ; preds = %1, %0
  %s.0 = phi i8* [ %str, %0 ], [ %4, %1 ]
  %2 = load i8* %s.0, align 1, !dbg !20, !tbaa !21
  %3 = icmp eq i8 %2, 0, !dbg !20
  %4 = getelementptr inbounds i8* %s.0, i64 1, !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !14), !dbg !24
  br i1 %3, label %5, label %1, !dbg !20

; <label>:5                                       ; preds = %1
  %6 = ptrtoint i8* %s.0 to i64, !dbg !25
  %7 = ptrtoint i8* %str to i64, !dbg !25
  %8 = sub i64 %6, %7, !dbg !25
  ret i64 %8, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strlen.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strlen.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"strlen", metadata !"strlen", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*)* @strlen, null, null, metadata !12, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [strlen]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/strlen.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14}
!13 = metadata !{i32 786689, metadata !4, metadata !"str", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [str] [line 12]
!14 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !5, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 13]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!18 = metadata !{i32 12, i32 0, metadata !4, null}
!19 = metadata !{i32 13, i32 0, metadata !4, null}
!20 = metadata !{i32 14, i32 0, metadata !4, null}
!21 = metadata !{metadata !22, metadata !22, i64 0}
!22 = metadata !{metadata !"omnipotent char", metadata !23, i64 0}
!23 = metadata !{metadata !"Simple C/C++ TBAA"}
!24 = metadata !{i32 15, i32 0, metadata !4, null}
!25 = metadata !{i32 16, i32 0, metadata !4, null}

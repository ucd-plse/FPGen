; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/htonl.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define zeroext i16 @htons(i16 zeroext %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !11), !dbg !28
  %1 = tail call i16 @llvm.bswap.i16(i16 %v), !dbg !29
  ret i16 %1, !dbg !29
}

; Function Attrs: nounwind readnone uwtable
define i32 @htonl(i32 %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !18), !dbg !30
  %1 = lshr i32 %v, 16, !dbg !31
  %2 = trunc i32 %1 to i16, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i16 %2}, i64 0, metadata !32) #2, !dbg !33
  %3 = tail call i16 @llvm.bswap.i16(i16 %2) #2, !dbg !34
  %4 = zext i16 %3 to i32, !dbg !31
  %5 = trunc i32 %v to i16, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i16 %5}, i64 0, metadata !32) #2, !dbg !33
  %6 = tail call i16 @llvm.bswap.i16(i16 %5) #2, !dbg !34
  %7 = zext i16 %6 to i32, !dbg !31
  %8 = shl nuw i32 %7, 16, !dbg !31
  %9 = or i32 %8, %4, !dbg !31
  ret i32 %9, !dbg !31
}

; Function Attrs: nounwind readnone uwtable
define zeroext i16 @ntohs(i16 zeroext %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !21), !dbg !35
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !36) #2, !dbg !38
  %1 = tail call i16 @llvm.bswap.i16(i16 %v) #2, !dbg !39
  ret i16 %1, !dbg !37
}

; Function Attrs: nounwind readnone uwtable
define i32 @ntohl(i32 %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !24), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !41) #2, !dbg !43
  %1 = lshr i32 %v, 16, !dbg !44
  %2 = trunc i32 %1 to i16, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i16 %2}, i64 0, metadata !45) #2, !dbg !46
  %3 = tail call i16 @llvm.bswap.i16(i16 %2) #2, !dbg !47
  %4 = zext i16 %3 to i32, !dbg !44
  %5 = trunc i32 %v to i16, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i16 %5}, i64 0, metadata !45) #2, !dbg !46
  %6 = tail call i16 @llvm.bswap.i16(i16 %5) #2, !dbg !47
  %7 = zext i16 %6 to i32, !dbg !44
  %8 = shl nuw i32 %7, 16, !dbg !44
  %9 = or i32 %8, %4, !dbg !44
  ret i32 %9, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind readnone
declare i16 @llvm.bswap.i16(i16) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/htonl.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/htonl.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !12, metadata !19, metadata !22}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"htons", metadata !"htons", metadata !"", i32 26, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i16 (i16)* @htons, null, null, metadata !10, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [htons]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/klee-libc//home/fptesting/FPTesting/src/klee-float/runtime/klee-libc/htonl.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786454, metadata !1, null, metadata !"uint16_t", i32 49, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [uint16_t] [line 49, size 0, align 0, offset 0] [from unsigned short]
!9 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !5, i32 16777242, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 26]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"htonl", metadata !"htonl", metadata !"", i32 29, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @htonl, null, null, metadata !17, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [htonl]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15}
!15 = metadata !{i32 786454, metadata !1, null, metadata !"uint32_t", i32 51, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!16 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786689, metadata !12, metadata !"v", metadata !5, i32 16777245, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 29]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ntohs", metadata !"ntohs", metadata !"", i32 44, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i16 (i16)* @ntohs, null, null, metadata !20, i32 44} ; [ DW_TAG_subprogram ] [line 44] [def] [ntohs]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786689, metadata !19, metadata !"v", metadata !5, i32 16777260, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 44]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ntohl", metadata !"ntohl", metadata !"", i32 47, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @ntohl, null, null, metadata !23, i32 47} ; [ DW_TAG_subprogram ] [line 47] [def] [ntohl]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786689, metadata !22, metadata !"v", metadata !5, i32 16777263, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 47]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!28 = metadata !{i32 26, i32 0, metadata !4, null}
!29 = metadata !{i32 27, i32 0, metadata !4, null}
!30 = metadata !{i32 29, i32 0, metadata !12, null}
!31 = metadata !{i32 30, i32 0, metadata !12, null}
!32 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !5, i32 16777242, metadata !8, i32 0, metadata !31} ; [ DW_TAG_arg_variable ] [v] [line 26]
!33 = metadata !{i32 26, i32 0, metadata !4, metadata !31}
!34 = metadata !{i32 27, i32 0, metadata !4, metadata !31}
!35 = metadata !{i32 44, i32 0, metadata !19, null}
!36 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !5, i32 16777242, metadata !8, i32 0, metadata !37} ; [ DW_TAG_arg_variable ] [v] [line 26]
!37 = metadata !{i32 45, i32 0, metadata !19, null}
!38 = metadata !{i32 26, i32 0, metadata !4, metadata !37}
!39 = metadata !{i32 27, i32 0, metadata !4, metadata !37}
!40 = metadata !{i32 47, i32 0, metadata !22, null}
!41 = metadata !{i32 786689, metadata !12, metadata !"v", metadata !5, i32 16777245, metadata !15, i32 0, metadata !42} ; [ DW_TAG_arg_variable ] [v] [line 29]
!42 = metadata !{i32 48, i32 0, metadata !22, null}
!43 = metadata !{i32 29, i32 0, metadata !12, metadata !42}
!44 = metadata !{i32 30, i32 0, metadata !12, metadata !42}
!45 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !5, i32 16777242, metadata !8, i32 0, metadata !44} ; [ DW_TAG_arg_variable ] [v] [line 26]
!46 = metadata !{i32 26, i32 0, metadata !4, metadata !44}
!47 = metadata !{i32 27, i32 0, metadata !4, metadata !44}

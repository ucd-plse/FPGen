; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/illegal.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"ignoring\00", align 1
@.str2 = private unnamed_addr constant [65 x i8] c"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/illegal.c\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"longjmp unsupported\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"xxx.err\00", align 1
@.str5 = private unnamed_addr constant [18 x i8] c"ignoring (EACCES)\00", align 1
@.str6 = private unnamed_addr constant [18 x i8] c"ignoring (ENOMEM)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @kill(i32 %pid, i32 %sig) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %pid}, i64 0, metadata !12), !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32 %sig}, i64 0, metadata !13), !dbg !92
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0)) #7, !dbg !93
  %1 = tail call i32* @__errno_location() #6, !dbg !94
  store i32 1, i32* %1, align 4, !dbg !94, !tbaa !95
  ret i32 -1, !dbg !99
}

declare void @klee_warning(i8*) #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #2

; Function Attrs: nounwind returns_twice uwtable
define weak i32 @_setjmp(%struct.__jmp_buf_tag* %__env) #3 {
  tail call void @llvm.dbg.value(metadata !{%struct.__jmp_buf_tag* %__env}, i64 0, metadata !39), !dbg !100
  tail call void @klee_warning_once(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) #7, !dbg !101
  ret i32 0, !dbg !102
}

declare void @klee_warning_once(i8*) #1

; Function Attrs: noreturn nounwind uwtable
define void @longjmp(%struct.__jmp_buf_tag* nocapture readnone %env, i32 %val) #4 {
  tail call void @llvm.dbg.value(metadata !{%struct.__jmp_buf_tag* %env}, i64 0, metadata !44), !dbg !103
  tail call void @llvm.dbg.value(metadata !{i32 %val}, i64 0, metadata !45), !dbg !103
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str2, i64 0, i64 0), i32 35, i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0)) #8, !dbg !104
  unreachable, !dbg !104
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind uwtable
define weak i32 @execl(i8* %path, i8* %arg, ...) #0 {
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !53), !dbg !105
  call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !54), !dbg !105
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !105
  %1 = call i32* @__errno_location() #6, !dbg !105
  store i32 13, i32* %1, align 4, !dbg !105, !tbaa !95
  ret i32 -1, !dbg !105
}

; Function Attrs: nounwind uwtable
define weak i32 @execlp(i8* %file, i8* %arg, ...) #0 {
  call void @llvm.dbg.value(metadata !{i8* %file}, i64 0, metadata !57), !dbg !106
  call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !58), !dbg !106
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !106
  %1 = call i32* @__errno_location() #6, !dbg !106
  store i32 13, i32* %1, align 4, !dbg !106, !tbaa !95
  ret i32 -1, !dbg !106
}

; Function Attrs: nounwind uwtable
define weak i32 @execle(i8* %path, i8* %arg, ...) #0 {
  call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !61), !dbg !107
  call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !62), !dbg !107
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !107
  %1 = call i32* @__errno_location() #6, !dbg !107
  store i32 13, i32* %1, align 4, !dbg !107, !tbaa !95
  ret i32 -1, !dbg !107
}

; Function Attrs: nounwind uwtable
define weak i32 @execv(i8* %path, i8** %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !70), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !71), !dbg !108
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !108
  %1 = tail call i32* @__errno_location() #6, !dbg !108
  store i32 13, i32* %1, align 4, !dbg !108, !tbaa !95
  ret i32 -1, !dbg !108
}

; Function Attrs: nounwind uwtable
define weak i32 @execvp(i8* %file, i8** %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %file}, i64 0, metadata !74), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !75), !dbg !109
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !109
  %1 = tail call i32* @__errno_location() #6, !dbg !109
  store i32 13, i32* %1, align 4, !dbg !109, !tbaa !95
  ret i32 -1, !dbg !109
}

; Function Attrs: nounwind uwtable
define weak i32 @execve(i8* %file, i8** %argv, i8** %envp) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %file}, i64 0, metadata !80), !dbg !110
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !81), !dbg !110
  tail call void @llvm.dbg.value(metadata !{i8** %envp}, i64 0, metadata !82), !dbg !110
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0)) #7, !dbg !110
  %1 = tail call i32* @__errno_location() #6, !dbg !110
  store i32 13, i32* %1, align 4, !dbg !110, !tbaa !95
  ret i32 -1, !dbg !110
}

; Function Attrs: nounwind uwtable
define i32 @fork() #0 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str6, i64 0, i64 0)) #7, !dbg !111
  %1 = tail call i32* @__errno_location() #6, !dbg !112
  store i32 12, i32* %1, align 4, !dbg !112, !tbaa !95
  ret i32 -1, !dbg !113
}

; Function Attrs: nounwind returns_twice uwtable
define i32 @vfork() #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str6, i64 0, i64 0)) #7, !dbg !114
  %1 = tail call i32* @__errno_location() #6, !dbg !116
  store i32 12, i32* %1, align 4, !dbg !116, !tbaa !95
  ret i32 -1, !dbg !115
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind returns_twice uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!89, !90}
!llvm.ident = !{!91}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/illegal.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/illegal.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !14, metadata !40, metadata !46, metadata !55, metadata !59, metadata !63, metadata !72, metadata !76, metadata !83, metadata !86}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kill", metadata !"kill", metadata !"", i32 22, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @kill, null, null, metadata !11, i32 22} ; [ DW_TAG_subprogram ] [line 22] [def] [kill]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/illegal.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786454, metadata !1, null, metadata !"pid_t", i32 260, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [pid_t] [line 260, size 0, align 0, offset 0] [from __pid_t]
!10 = metadata !{i32 786454, metadata !1, null, metadata !"__pid_t", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [__pid_t] [line 133, size 0, align 0, offset 0] [from int]
!11 = metadata !{metadata !12, metadata !13}
!12 = metadata !{i32 786689, metadata !4, metadata !"pid", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pid] [line 22]
!13 = metadata !{i32 786689, metadata !4, metadata !"sig", metadata !5, i32 33554454, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sig] [line 22]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"_setjmp", metadata !"_setjmp", metadata !"", i32 29, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.__jmp_buf_tag*)* @_setjmp, null, null, metadata !38, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [_setjmp]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !8, metadata !17}
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __jmp_buf_tag]
!18 = metadata !{i32 786451, metadata !19, null, metadata !"__jmp_buf_tag", i32 34, i64 1600, i64 64, i32 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__jmp_buf_tag] [line 34, size 1600, align 64, offset 0] [def] [from ]
!19 = metadata !{metadata !"/usr/include/setjmp.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!20 = metadata !{metadata !21, metadata !27, metadata !28}
!21 = metadata !{i32 786445, metadata !19, metadata !18, metadata !"__jmpbuf", i32 40, i64 512, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ] [__jmpbuf] [line 40, size 512, align 64, offset 0] [from __jmp_buf]
!22 = metadata !{i32 786454, metadata !19, null, metadata !"__jmp_buf", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [__jmp_buf] [line 31, size 0, align 0, offset 0] [from ]
!23 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 64, i32 0, i32 0, metadata !24, metadata !25, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from long int]
!24 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 8}        ; [ DW_TAG_subrange_type ] [0, 7]
!27 = metadata !{i32 786445, metadata !19, metadata !18, metadata !"__mask_was_saved", i32 41, i64 32, i64 32, i64 512, i32 0, metadata !8} ; [ DW_TAG_member ] [__mask_was_saved] [line 41, size 32, align 32, offset 512] [from int]
!28 = metadata !{i32 786445, metadata !19, metadata !18, metadata !"__saved_mask", i32 42, i64 1024, i64 64, i64 576, i32 0, metadata !29} ; [ DW_TAG_member ] [__saved_mask] [line 42, size 1024, align 64, offset 576] [from __sigset_t]
!29 = metadata !{i32 786454, metadata !19, null, metadata !"__sigset_t", i32 30, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__sigset_t] [line 30, size 0, align 0, offset 0] [from ]
!30 = metadata !{i32 786451, metadata !31, null, metadata !"", i32 27, i64 1024, i64 64, i32 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 27, size 1024, align 64, offset 0] [def] [from ]
!31 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/sigset.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786445, metadata !31, metadata !30, metadata !"__val", i32 29, i64 1024, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_member ] [__val] [line 29, size 1024, align 64, offset 0] [from ]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !35, metadata !36, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from long unsigned int]
!35 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786689, metadata !14, metadata !"__env", metadata !5, i32 16777245, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__env] [line 29]
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"longjmp", metadata !"longjmp", metadata !"", i32 34, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.__jmp_buf_tag*, i32)* @longjmp, null, null, metadata !43, i32 34} ; [ DW_TAG_subprogram ] [line 34] [def] [longjmp]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null, metadata !17, metadata !8}
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !40, metadata !"env", metadata !5, i32 16777250, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [env] [line 34]
!45 = metadata !{i32 786689, metadata !40, metadata !"val", metadata !5, i32 33554466, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 34]
!46 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execl", metadata !"execl", metadata !"", i32 55, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execl, null, null, metadata !52, i32 55} ; [ DW_TAG_subprogram ] [line 55] [def] [execl]
!47 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = metadata !{metadata !8, metadata !49, metadata !49}
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!51 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!52 = metadata !{metadata !53, metadata !54}
!53 = metadata !{i32 786689, metadata !46, metadata !"path", metadata !5, i32 16777271, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 55]
!54 = metadata !{i32 786689, metadata !46, metadata !"arg", metadata !5, i32 33554487, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 55]
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execlp", metadata !"execlp", metadata !"", i32 56, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execlp, null, null, metadata !56, i32 56} ; [ DW_TAG_subprogram ] [line 56] [def] [execlp]
!56 = metadata !{metadata !57, metadata !58}
!57 = metadata !{i32 786689, metadata !55, metadata !"file", metadata !5, i32 16777272, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 56]
!58 = metadata !{i32 786689, metadata !55, metadata !"arg", metadata !5, i32 33554488, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 56]
!59 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execle", metadata !"execle", metadata !"", i32 57, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execle, null, null, metadata !60, i32 57} ; [ DW_TAG_subprogram ] [line 57] [def] [execle]
!60 = metadata !{metadata !61, metadata !62}
!61 = metadata !{i32 786689, metadata !59, metadata !"path", metadata !5, i32 16777273, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 57]
!62 = metadata !{i32 786689, metadata !59, metadata !"arg", metadata !5, i32 33554489, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 57]
!63 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execv", metadata !"execv", metadata !"", i32 58, metadata !64, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**)* @execv, null, null, metadata !69, i32 58} ; [ DW_TAG_subprogram ] [line 58] [def] [execv]
!64 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{metadata !8, metadata !49, metadata !66}
!66 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!67 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!69 = metadata !{metadata !70, metadata !71}
!70 = metadata !{i32 786689, metadata !63, metadata !"path", metadata !5, i32 16777274, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 58]
!71 = metadata !{i32 786689, metadata !63, metadata !"argv", metadata !5, i32 33554490, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 58]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execvp", metadata !"execvp", metadata !"", i32 59, metadata !64, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**)* @execvp, null, null, metadata !73, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [execvp]
!73 = metadata !{metadata !74, metadata !75}
!74 = metadata !{i32 786689, metadata !72, metadata !"file", metadata !5, i32 16777275, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 59]
!75 = metadata !{i32 786689, metadata !72, metadata !"argv", metadata !5, i32 33554491, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 59]
!76 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"execve", metadata !"execve", metadata !"", i32 60, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**, i8**)* @execve, null, null, metadata !79, i32 60} ; [ DW_TAG_subprogram ] [line 60] [def] [execve]
!77 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{metadata !8, metadata !49, metadata !66, metadata !66}
!79 = metadata !{metadata !80, metadata !81, metadata !82}
!80 = metadata !{i32 786689, metadata !76, metadata !"file", metadata !5, i32 16777276, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 60]
!81 = metadata !{i32 786689, metadata !76, metadata !"argv", metadata !5, i32 33554492, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 60]
!82 = metadata !{i32 786689, metadata !76, metadata !"envp", metadata !5, i32 50331708, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [envp] [line 60]
!83 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fork", metadata !"fork", metadata !"", i32 62, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @fork, null, null, metadata !2, i32 62} ; [ DW_TAG_subprogram ] [line 62] [def] [fork]
!84 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = metadata !{metadata !10}
!86 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"vfork", metadata !"vfork", metadata !"", i32 68, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @vfork, null, null, metadata !2, i32 68} ; [ DW_TAG_subprogram ] [line 68] [def] [vfork]
!87 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = metadata !{metadata !8}
!89 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!90 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!91 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!92 = metadata !{i32 22, i32 0, metadata !4, null}
!93 = metadata !{i32 23, i32 0, metadata !4, null}
!94 = metadata !{i32 24, i32 0, metadata !4, null}
!95 = metadata !{metadata !96, metadata !96, i64 0}
!96 = metadata !{metadata !"int", metadata !97, i64 0}
!97 = metadata !{metadata !"omnipotent char", metadata !98, i64 0}
!98 = metadata !{metadata !"Simple C/C++ TBAA"}
!99 = metadata !{i32 25, i32 0, metadata !4, null}
!100 = metadata !{i32 29, i32 0, metadata !14, null}
!101 = metadata !{i32 30, i32 0, metadata !14, null}
!102 = metadata !{i32 31, i32 0, metadata !14, null}
!103 = metadata !{i32 34, i32 0, metadata !40, null}
!104 = metadata !{i32 35, i32 0, metadata !40, null}
!105 = metadata !{i32 55, i32 0, metadata !46, null}
!106 = metadata !{i32 56, i32 0, metadata !55, null}
!107 = metadata !{i32 57, i32 0, metadata !59, null}
!108 = metadata !{i32 58, i32 0, metadata !63, null} ; [ DW_TAG_imported_module ]
!109 = metadata !{i32 59, i32 0, metadata !72, null}
!110 = metadata !{i32 60, i32 0, metadata !76, null}
!111 = metadata !{i32 63, i32 0, metadata !83, null}
!112 = metadata !{i32 64, i32 0, metadata !83, null}
!113 = metadata !{i32 65, i32 0, metadata !83, null}
!114 = metadata !{i32 63, i32 0, metadata !83, metadata !115}
!115 = metadata !{i32 69, i32 0, metadata !86, null}
!116 = metadata !{i32 64, i32 0, metadata !83, metadata !115}

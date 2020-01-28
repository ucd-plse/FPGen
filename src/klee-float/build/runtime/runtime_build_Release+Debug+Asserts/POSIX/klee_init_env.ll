; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str1 = private unnamed_addr constant [964 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least MIN arguments and at most\0A                              MAX arguments, each with maximum length N\0A  -sym-files <NUM> <N>      - Make NUM symbolic files ('A', 'B', 'C', etc.),\0A                              each with size N\0A  -sym-stdin <N>            - Make stdin symbolic with size N.\0A  -sym-stdout               - Make stdout symbolic.\0A  -save-all-writes          - Allow write operations to execute as expected\0A                              even if they exceed the file size. If set to 0, all\0A                              writes exceeding the initial file size are discarded.\0A                              Note: file offset is always incremented.\0A  -max-fail <N>             - Allow up to N injected failures\0A  -fd-fail                  - Shortcut for '-max-fail 1'\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"--sym-arg\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"-sym-arg\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"--sym-args\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"-sym-args\00", align 1
@.str7 = private unnamed_addr constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"n_args\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"--sym-files\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"-sym-files\00", align 1
@.str11 = private unnamed_addr constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 1
@.str12 = private unnamed_addr constant [12 x i8] c"--sym-stdin\00", align 1
@.str13 = private unnamed_addr constant [11 x i8] c"-sym-stdin\00", align 1
@.str14 = private unnamed_addr constant [57 x i8] c"--sym-stdin expects one integer argument <sym-stdin-len>\00", align 1
@.str15 = private unnamed_addr constant [13 x i8] c"--sym-stdout\00", align 1
@.str16 = private unnamed_addr constant [12 x i8] c"-sym-stdout\00", align 1
@.str17 = private unnamed_addr constant [18 x i8] c"--save-all-writes\00", align 1
@.str18 = private unnamed_addr constant [17 x i8] c"-save-all-writes\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"--fd-fail\00", align 1
@.str20 = private unnamed_addr constant [9 x i8] c"-fd-fail\00", align 1
@.str21 = private unnamed_addr constant [11 x i8] c"--max-fail\00", align 1
@.str22 = private unnamed_addr constant [10 x i8] c"-max-fail\00", align 1
@.str23 = private unnamed_addr constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 1
@.str24 = private unnamed_addr constant [37 x i8] c"too many arguments for klee_init_env\00", align 1
@.str25 = private unnamed_addr constant [71 x i8] c"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c\00", align 1
@.str26 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_init_env(i32* nocapture %argcPtr, i8*** nocapture %argvPtr) #0 {
  %new_argv = alloca [1024 x i8*], align 16
  %sym_arg_name = alloca [5 x i8], align 4
  call void @llvm.dbg.value(metadata !{i32* %argcPtr}, i64 0, metadata !15), !dbg !108
  call void @llvm.dbg.value(metadata !{i8*** %argvPtr}, i64 0, metadata !16), !dbg !108
  %1 = load i32* %argcPtr, align 4, !dbg !109, !tbaa !110
  call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !17), !dbg !109
  %2 = load i8*** %argvPtr, align 8, !dbg !114, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8** %2}, i64 0, metadata !18), !dbg !114
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !19), !dbg !117
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !19), !dbg !118
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !19), !dbg !119
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !19), !dbg !120
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !19), !dbg !121
  %3 = bitcast [1024 x i8*]* %new_argv to i8*, !dbg !122
  call void @llvm.lifetime.start(i64 8192, i8* %3) #2, !dbg !122
  call void @llvm.dbg.declare(metadata !{[1024 x i8*]* %new_argv}, metadata !21), !dbg !122
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !29), !dbg !123
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !30), !dbg !123
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !31), !dbg !124
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !32), !dbg !125
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !33), !dbg !126
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !34), !dbg !127
  call void @llvm.dbg.declare(metadata !{[5 x i8]* %sym_arg_name}, metadata !36), !dbg !128
  %4 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 0, !dbg !128
  %5 = bitcast [5 x i8]* %sym_arg_name to i32*, !dbg !128
  store i32 6779489, i32* %5, align 4, !dbg !128
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !40), !dbg !129
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !41), !dbg !130
  %6 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 4, !dbg !131
  store i8 0, i8* %6, align 4, !dbg !131, !tbaa !132
  %7 = icmp eq i32 %1, 2, !dbg !133
  br i1 %7, label %8, label %__streq.exit.thread.preheader, !dbg !133

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds i8** %2, i64 1, !dbg !133
  %10 = load i8** %9, align 8, !dbg !133, !tbaa !115
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !135), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !138), !dbg !136
  %11 = load i8* %10, align 1, !dbg !139, !tbaa !132
  %12 = icmp eq i8 %11, 45, !dbg !139
  br i1 %12, label %.lr.ph.i, label %.lr.ph410, !dbg !139

.lr.ph.i:                                         ; preds = %8, %15
  %13 = phi i8 [ %18, %15 ], [ 45, %8 ]
  %.04.i = phi i8* [ %17, %15 ], [ getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), %8 ]
  %.013.i = phi i8* [ %16, %15 ], [ %10, %8 ]
  %14 = icmp eq i8 %13, 0, !dbg !140
  br i1 %14, label %23, label %15, !dbg !140

; <label>:15                                      ; preds = %.lr.ph.i
  %16 = getelementptr inbounds i8* %.013.i, i64 1, !dbg !143
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !135), !dbg !143
  %17 = getelementptr inbounds i8* %.04.i, i64 1, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i8* %17}, i64 0, metadata !138), !dbg !144
  %18 = load i8* %16, align 1, !dbg !139, !tbaa !132
  %19 = load i8* %17, align 1, !dbg !139, !tbaa !132
  %20 = icmp eq i8 %18, %19, !dbg !139
  br i1 %20, label %.lr.ph.i, label %__streq.exit.thread.preheader, !dbg !139

__streq.exit.thread.preheader:                    ; preds = %15, %0
  %21 = icmp sgt i32 %1, 0, !dbg !145
  br i1 %21, label %.lr.ph410, label %__streq.exit.thread._crit_edge, !dbg !145

.lr.ph410:                                        ; preds = %8, %__streq.exit.thread.preheader
  %22 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 3, !dbg !146
  br label %24, !dbg !145

; <label>:23                                      ; preds = %.lr.ph.i
  call fastcc void @__emit_error(i8* getelementptr inbounds ([964 x i8]* @.str1, i64 0, i64 0)), !dbg !147
  unreachable

; <label>:24                                      ; preds = %.lr.ph410, %__streq.exit.thread.backedge
  %sym_files.0402 = phi i32 [ 0, %.lr.ph410 ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0394 = phi i32 [ 0, %.lr.ph410 ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0386 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0378 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %k.0369 = phi i32 [ 0, %.lr.ph410 ], [ %k.0.be, %__streq.exit.thread.backedge ]
  %sym_arg_num.0360 = phi i32 [ 0, %.lr.ph410 ], [ %sym_arg_num.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0352 = phi i32 [ 0, %.lr.ph410 ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0345 = phi i32 [ 0, %.lr.ph410 ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %25 = phi i32 [ 0, %.lr.ph410 ], [ %.be, %__streq.exit.thread.backedge ]
  %26 = sext i32 %k.0369 to i64, !dbg !149
  %27 = getelementptr inbounds i8** %2, i64 %26, !dbg !149
  %28 = load i8** %27, align 8, !dbg !149, !tbaa !115
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !150), !dbg !151
  tail call void @llvm.dbg.value(metadata !152, i64 0, metadata !153), !dbg !151
  %29 = load i8* %28, align 1, !dbg !154, !tbaa !132
  %30 = icmp eq i8 %29, 45, !dbg !154
  br i1 %30, label %.lr.ph.i7, label %.loopexit162, !dbg !154

.lr.ph.i7:                                        ; preds = %24, %33
  %31 = phi i8 [ %36, %33 ], [ 45, %24 ]
  %.04.i5 = phi i8* [ %35, %33 ], [ getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), %24 ]
  %.013.i6 = phi i8* [ %34, %33 ], [ %28, %24 ]
  %32 = icmp eq i8 %31, 0, !dbg !155
  br i1 %32, label %__streq.exit9.thread124, label %33, !dbg !155

; <label>:33                                      ; preds = %.lr.ph.i7
  %34 = getelementptr inbounds i8* %.013.i6, i64 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i8* %34}, i64 0, metadata !150), !dbg !156
  %35 = getelementptr inbounds i8* %.04.i5, i64 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i8* %35}, i64 0, metadata !153), !dbg !157
  %36 = load i8* %34, align 1, !dbg !154, !tbaa !132
  %37 = load i8* %35, align 1, !dbg !154, !tbaa !132
  %38 = icmp eq i8 %36, %37, !dbg !154
  br i1 %38, label %.lr.ph.i7, label %.loopexit, !dbg !154

.loopexit:                                        ; preds = %33
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !150), !dbg !151
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !153), !dbg !151
  br i1 %30, label %.lr.ph.i13, label %.loopexit162, !dbg !154

.lr.ph.i13:                                       ; preds = %.loopexit, %41
  %39 = phi i8 [ %44, %41 ], [ 45, %.loopexit ]
  %.04.i11 = phi i8* [ %43, %41 ], [ getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), %.loopexit ]
  %.013.i12 = phi i8* [ %42, %41 ], [ %28, %.loopexit ]
  %40 = icmp eq i8 %39, 0, !dbg !155
  br i1 %40, label %__streq.exit9.thread124, label %41, !dbg !155

; <label>:41                                      ; preds = %.lr.ph.i13
  %42 = getelementptr inbounds i8* %.013.i12, i64 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !150), !dbg !156
  %43 = getelementptr inbounds i8* %.04.i11, i64 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i8* %43}, i64 0, metadata !153), !dbg !157
  %44 = load i8* %42, align 1, !dbg !154, !tbaa !132
  %45 = load i8* %43, align 1, !dbg !154, !tbaa !132
  %46 = icmp eq i8 %44, %45, !dbg !154
  br i1 %46, label %.lr.ph.i13, label %.loopexit141, !dbg !154

__streq.exit9.thread124:                          ; preds = %.lr.ph.i13, %.lr.ph.i7
  call void @llvm.dbg.value(metadata !159, i64 0, metadata !43), !dbg !160
  %47 = add nsw i32 %k.0369, 1, !dbg !161
  call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !41), !dbg !161
  %48 = icmp eq i32 %47, %1, !dbg !161
  br i1 %48, label %49, label %50, !dbg !161

; <label>:49                                      ; preds = %__streq.exit9.thread124
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)), !dbg !163
  unreachable

; <label>:50                                      ; preds = %__streq.exit9.thread124
  %51 = add nsw i32 %k.0369, 2, !dbg !164
  call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !41), !dbg !164
  %52 = sext i32 %47 to i64, !dbg !164
  %53 = getelementptr inbounds i8** %2, i64 %52, !dbg !164
  %54 = load i8** %53, align 8, !dbg !164, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !165) #2, !dbg !166
  call void @llvm.dbg.value(metadata !167, i64 0, metadata !168) #2, !dbg !166
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !170) #2, !dbg !171
  %55 = load i8* %54, align 1, !dbg !172, !tbaa !132
  %56 = icmp eq i8 %55, 0, !dbg !172
  br i1 %56, label %57, label %.lr.ph.i19, !dbg !172

; <label>:57                                      ; preds = %50
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !172
  unreachable

.lr.ph.i19:                                       ; preds = %50, %61
  %58 = phi i8 [ %66, %61 ], [ %55, %50 ]
  %s.pn.i16 = phi i8* [ %59, %61 ], [ %54, %50 ]
  %res.02.i17 = phi i64 [ %65, %61 ], [ 0, %50 ]
  %59 = getelementptr inbounds i8* %s.pn.i16, i64 1, !dbg !174
  %.off.i18 = add i8 %58, -48, !dbg !175
  %60 = icmp ult i8 %.off.i18, 10, !dbg !175
  br i1 %60, label %61, label %68, !dbg !175

; <label>:61                                      ; preds = %.lr.ph.i19
  %62 = sext i8 %58 to i64, !dbg !179
  %63 = mul nsw i64 %res.02.i17, 10, !dbg !180
  %64 = add i64 %62, -48, !dbg !180
  %65 = add i64 %64, %63, !dbg !180
  call void @llvm.dbg.value(metadata !{i64 %65}, i64 0, metadata !170) #2, !dbg !180
  call void @llvm.dbg.value(metadata !{i8* %59}, i64 0, metadata !165) #2, !dbg !174
  %66 = load i8* %59, align 1, !dbg !174, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %58}, i64 0, metadata !182) #2, !dbg !174
  %67 = icmp eq i8 %66, 0, !dbg !174
  br i1 %67, label %__str_to_int.exit20, label %.lr.ph.i19, !dbg !174

; <label>:68                                      ; preds = %.lr.ph.i19
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !183
  unreachable

__str_to_int.exit20:                              ; preds = %61
  %69 = trunc i64 %65 to i32, !dbg !164
  call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !25), !dbg !164
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !40), !dbg !146
  %70 = add i32 %sym_arg_num.0360, 48, !dbg !146
  %71 = trunc i32 %70 to i8, !dbg !146
  store i8 %71, i8* %22, align 1, !dbg !146, !tbaa !132
  %72 = call fastcc i8* @__get_sym_str(i32 %69, i8* %4), !dbg !185
  call void @llvm.dbg.value(metadata !186, i64 0, metadata !187) #2, !dbg !189
  %73 = icmp eq i32 %25, 1024, !dbg !190
  br i1 %73, label %74, label %__add_arg.exit21, !dbg !190

; <label>:74                                      ; preds = %__str_to_int.exit20
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !192
  unreachable

__add_arg.exit21:                                 ; preds = %__str_to_int.exit20
  %75 = add i32 %sym_arg_num.0360, 1, !dbg !146
  %76 = sext i32 %25 to i64, !dbg !194
  %77 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %76, !dbg !194
  store i8* %72, i8** %77, align 8, !dbg !194, !tbaa !115
  %78 = add nsw i32 %25, 1, !dbg !196
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !19), !dbg !196
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !19), !dbg !118
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !19), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !19), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !19), !dbg !121
  br label %__streq.exit.thread.backedge, !dbg !197

.loopexit141:                                     ; preds = %41
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !198), !dbg !200
  tail call void @llvm.dbg.value(metadata !201, i64 0, metadata !202), !dbg !200
  br i1 %30, label %.lr.ph.i24, label %.loopexit162, !dbg !203

.lr.ph.i24:                                       ; preds = %.loopexit141, %81
  %79 = phi i8 [ %84, %81 ], [ 45, %.loopexit141 ]
  %.04.i22 = phi i8* [ %83, %81 ], [ getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), %.loopexit141 ]
  %.013.i23 = phi i8* [ %82, %81 ], [ %28, %.loopexit141 ]
  %80 = icmp eq i8 %79, 0, !dbg !204
  br i1 %80, label %__streq.exit26.thread126, label %81, !dbg !204

; <label>:81                                      ; preds = %.lr.ph.i24
  %82 = getelementptr inbounds i8* %.013.i23, i64 1, !dbg !205
  tail call void @llvm.dbg.value(metadata !{i8* %82}, i64 0, metadata !198), !dbg !205
  %83 = getelementptr inbounds i8* %.04.i22, i64 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i8* %83}, i64 0, metadata !202), !dbg !206
  %84 = load i8* %82, align 1, !dbg !203, !tbaa !132
  %85 = load i8* %83, align 1, !dbg !203, !tbaa !132
  %86 = icmp eq i8 %84, %85, !dbg !203
  br i1 %86, label %.lr.ph.i24, label %.loopexit142, !dbg !203

.loopexit142:                                     ; preds = %81
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !198), !dbg !200
  tail call void @llvm.dbg.value(metadata !207, i64 0, metadata !202), !dbg !200
  br i1 %30, label %.lr.ph.i29, label %.loopexit162, !dbg !203

.lr.ph.i29:                                       ; preds = %.loopexit142, %89
  %87 = phi i8 [ %92, %89 ], [ 45, %.loopexit142 ]
  %.04.i27 = phi i8* [ %91, %89 ], [ getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0), %.loopexit142 ]
  %.013.i28 = phi i8* [ %90, %89 ], [ %28, %.loopexit142 ]
  %88 = icmp eq i8 %87, 0, !dbg !204
  br i1 %88, label %__streq.exit26.thread126, label %89, !dbg !204

; <label>:89                                      ; preds = %.lr.ph.i29
  %90 = getelementptr inbounds i8* %.013.i28, i64 1, !dbg !205
  tail call void @llvm.dbg.value(metadata !{i8* %90}, i64 0, metadata !198), !dbg !205
  %91 = getelementptr inbounds i8* %.04.i27, i64 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i8* %91}, i64 0, metadata !202), !dbg !206
  %92 = load i8* %90, align 1, !dbg !203, !tbaa !132
  %93 = load i8* %91, align 1, !dbg !203, !tbaa !132
  %94 = icmp eq i8 %92, %93, !dbg !203
  br i1 %94, label %.lr.ph.i29, label %.loopexit144, !dbg !203

__streq.exit26.thread126:                         ; preds = %.lr.ph.i29, %.lr.ph.i24
  call void @llvm.dbg.value(metadata !208, i64 0, metadata !49), !dbg !209
  %95 = add nsw i32 %k.0369, 3, !dbg !210
  %96 = icmp slt i32 %95, %1, !dbg !210
  br i1 %96, label %98, label %97, !dbg !210

; <label>:97                                      ; preds = %__streq.exit26.thread126
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)), !dbg !212
  unreachable

; <label>:98                                      ; preds = %__streq.exit26.thread126
  %99 = add nsw i32 %k.0369, 1, !dbg !213
  call void @llvm.dbg.value(metadata !{i32 %99}, i64 0, metadata !41), !dbg !213
  %100 = add nsw i32 %k.0369, 2, !dbg !214
  call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !41), !dbg !214
  %101 = sext i32 %99 to i64, !dbg !214
  %102 = getelementptr inbounds i8** %2, i64 %101, !dbg !214
  %103 = load i8** %102, align 8, !dbg !214, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %103}, i64 0, metadata !215) #2, !dbg !216
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !218) #2, !dbg !216
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !219) #2, !dbg !220
  %104 = load i8* %103, align 1, !dbg !221, !tbaa !132
  %105 = icmp eq i8 %104, 0, !dbg !221
  br i1 %105, label %106, label %.lr.ph.i35, !dbg !221

; <label>:106                                     ; preds = %98
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !221
  unreachable

.lr.ph.i35:                                       ; preds = %98, %110
  %107 = phi i8 [ %115, %110 ], [ %104, %98 ]
  %s.pn.i32 = phi i8* [ %108, %110 ], [ %103, %98 ]
  %res.02.i33 = phi i64 [ %114, %110 ], [ 0, %98 ]
  %108 = getelementptr inbounds i8* %s.pn.i32, i64 1, !dbg !222
  %.off.i34 = add i8 %107, -48, !dbg !223
  %109 = icmp ult i8 %.off.i34, 10, !dbg !223
  br i1 %109, label %110, label %117, !dbg !223

; <label>:110                                     ; preds = %.lr.ph.i35
  %111 = sext i8 %107 to i64, !dbg !224
  %112 = mul nsw i64 %res.02.i33, 10, !dbg !225
  %113 = add i64 %111, -48, !dbg !225
  %114 = add i64 %113, %112, !dbg !225
  call void @llvm.dbg.value(metadata !{i64 %114}, i64 0, metadata !219) #2, !dbg !225
  call void @llvm.dbg.value(metadata !{i8* %108}, i64 0, metadata !215) #2, !dbg !222
  %115 = load i8* %108, align 1, !dbg !222, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %107}, i64 0, metadata !226) #2, !dbg !222
  %116 = icmp eq i8 %115, 0, !dbg !222
  br i1 %116, label %__str_to_int.exit36, label %.lr.ph.i35, !dbg !222

; <label>:117                                     ; preds = %.lr.ph.i35
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !227
  unreachable

__str_to_int.exit36:                              ; preds = %110
  %118 = trunc i64 %114 to i32, !dbg !214
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !27), !dbg !214
  call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !41), !dbg !228
  %119 = sext i32 %100 to i64, !dbg !228
  %120 = getelementptr inbounds i8** %2, i64 %119, !dbg !228
  %121 = load i8** %120, align 8, !dbg !228, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %121}, i64 0, metadata !229) #2, !dbg !230
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !231) #2, !dbg !230
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !232) #2, !dbg !233
  %122 = load i8* %121, align 1, !dbg !234, !tbaa !132
  %123 = icmp eq i8 %122, 0, !dbg !234
  br i1 %123, label %124, label %.lr.ph.i40, !dbg !234

; <label>:124                                     ; preds = %__str_to_int.exit36
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !234
  unreachable

.lr.ph.i40:                                       ; preds = %__str_to_int.exit36, %128
  %125 = phi i8 [ %133, %128 ], [ %122, %__str_to_int.exit36 ]
  %s.pn.i37 = phi i8* [ %126, %128 ], [ %121, %__str_to_int.exit36 ]
  %res.02.i38 = phi i64 [ %132, %128 ], [ 0, %__str_to_int.exit36 ]
  %126 = getelementptr inbounds i8* %s.pn.i37, i64 1, !dbg !235
  %.off.i39 = add i8 %125, -48, !dbg !236
  %127 = icmp ult i8 %.off.i39, 10, !dbg !236
  br i1 %127, label %128, label %135, !dbg !236

; <label>:128                                     ; preds = %.lr.ph.i40
  %129 = sext i8 %125 to i64, !dbg !237
  %130 = mul nsw i64 %res.02.i38, 10, !dbg !238
  %131 = add i64 %129, -48, !dbg !238
  %132 = add i64 %131, %130, !dbg !238
  call void @llvm.dbg.value(metadata !{i64 %132}, i64 0, metadata !232) #2, !dbg !238
  call void @llvm.dbg.value(metadata !{i8* %126}, i64 0, metadata !229) #2, !dbg !235
  %133 = load i8* %126, align 1, !dbg !235, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %125}, i64 0, metadata !239) #2, !dbg !235
  %134 = icmp eq i8 %133, 0, !dbg !235
  br i1 %134, label %__str_to_int.exit41, label %.lr.ph.i40, !dbg !235

; <label>:135                                     ; preds = %.lr.ph.i40
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !240
  unreachable

__str_to_int.exit41:                              ; preds = %128
  %136 = trunc i64 %132 to i32, !dbg !228
  call void @llvm.dbg.value(metadata !{i32 %136}, i64 0, metadata !28), !dbg !228
  %137 = add nsw i32 %k.0369, 4, !dbg !241
  call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !41), !dbg !241
  %138 = sext i32 %95 to i64, !dbg !241
  %139 = getelementptr inbounds i8** %2, i64 %138, !dbg !241
  %140 = load i8** %139, align 8, !dbg !241, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %140}, i64 0, metadata !242) #2, !dbg !243
  call void @llvm.dbg.value(metadata !217, i64 0, metadata !244) #2, !dbg !243
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !245) #2, !dbg !246
  %141 = load i8* %140, align 1, !dbg !247, !tbaa !132
  %142 = icmp eq i8 %141, 0, !dbg !247
  br i1 %142, label %143, label %.lr.ph.i45, !dbg !247

; <label>:143                                     ; preds = %__str_to_int.exit41
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !247
  unreachable

.lr.ph.i45:                                       ; preds = %__str_to_int.exit41, %147
  %144 = phi i8 [ %152, %147 ], [ %141, %__str_to_int.exit41 ]
  %s.pn.i42 = phi i8* [ %145, %147 ], [ %140, %__str_to_int.exit41 ]
  %res.02.i43 = phi i64 [ %151, %147 ], [ 0, %__str_to_int.exit41 ]
  %145 = getelementptr inbounds i8* %s.pn.i42, i64 1, !dbg !248
  %.off.i44 = add i8 %144, -48, !dbg !249
  %146 = icmp ult i8 %.off.i44, 10, !dbg !249
  br i1 %146, label %147, label %154, !dbg !249

; <label>:147                                     ; preds = %.lr.ph.i45
  %148 = sext i8 %144 to i64, !dbg !250
  %149 = mul nsw i64 %res.02.i43, 10, !dbg !251
  %150 = add i64 %148, -48, !dbg !251
  %151 = add i64 %150, %149, !dbg !251
  call void @llvm.dbg.value(metadata !{i64 %151}, i64 0, metadata !245) #2, !dbg !251
  call void @llvm.dbg.value(metadata !{i8* %145}, i64 0, metadata !242) #2, !dbg !248
  %152 = load i8* %145, align 1, !dbg !248, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %144}, i64 0, metadata !252) #2, !dbg !248
  %153 = icmp eq i8 %152, 0, !dbg !248
  br i1 %153, label %__str_to_int.exit46, label %.lr.ph.i45, !dbg !248

; <label>:154                                     ; preds = %.lr.ph.i45
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !253
  unreachable

__str_to_int.exit46:                              ; preds = %147
  %155 = trunc i64 %151 to i32, !dbg !241
  call void @llvm.dbg.value(metadata !{i32 %155}, i64 0, metadata !25), !dbg !241
  %156 = add i32 %136, 1, !dbg !254
  %157 = call i32 @klee_range(i32 %118, i32 %156, i8* getelementptr inbounds ([7 x i8]* @.str8, i64 0, i64 0)) #2, !dbg !254
  call void @llvm.dbg.value(metadata !{i32 %157}, i64 0, metadata !20), !dbg !254
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !42), !dbg !255
  %158 = icmp sgt i32 %157, 0, !dbg !255
  br i1 %158, label %.lr.ph, label %__streq.exit.thread.backedge, !dbg !255

.lr.ph:                                           ; preds = %__str_to_int.exit46
  %159 = sext i32 %25 to i64
  br label %160, !dbg !255

; <label>:160                                     ; preds = %.lr.ph, %__add_arg.exit47
  %indvars.iv = phi i64 [ %159, %.lr.ph ], [ %indvars.iv.next, %__add_arg.exit47 ]
  %i.0173 = phi i32 [ 0, %.lr.ph ], [ %171, %__add_arg.exit47 ]
  %sym_arg_num.1172 = phi i32 [ %sym_arg_num.0360, %.lr.ph ], [ %168, %__add_arg.exit47 ]
  %161 = phi i32 [ %25, %.lr.ph ], [ %170, %__add_arg.exit47 ]
  call void @llvm.dbg.value(metadata !{i32 %168}, i64 0, metadata !40), !dbg !257
  %162 = add i32 %sym_arg_num.1172, 48, !dbg !257
  %163 = trunc i32 %162 to i8, !dbg !257
  store i8 %163, i8* %22, align 1, !dbg !257, !tbaa !132
  %164 = call fastcc i8* @__get_sym_str(i32 %155, i8* %4), !dbg !259
  call void @llvm.dbg.value(metadata !186, i64 0, metadata !260) #2, !dbg !262
  %165 = trunc i64 %indvars.iv to i32, !dbg !263
  %166 = icmp eq i32 %165, 1024, !dbg !263
  br i1 %166, label %167, label %__add_arg.exit47, !dbg !263

; <label>:167                                     ; preds = %160
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !264
  unreachable

__add_arg.exit47:                                 ; preds = %160
  %168 = add i32 %sym_arg_num.1172, 1, !dbg !257
  %169 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %indvars.iv, !dbg !265
  store i8* %164, i8** %169, align 8, !dbg !265, !tbaa !115
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !255
  %170 = add nsw i32 %161, 1, !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !19), !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !19), !dbg !118
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !19), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !19), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !19), !dbg !121
  %171 = add nsw i32 %i.0173, 1, !dbg !255
  call void @llvm.dbg.value(metadata !{i32 %171}, i64 0, metadata !42), !dbg !255
  %172 = icmp slt i32 %171, %157, !dbg !255
  br i1 %172, label %160, label %__streq.exit.thread.backedge, !dbg !255

.loopexit144:                                     ; preds = %89
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !267), !dbg !269
  tail call void @llvm.dbg.value(metadata !270, i64 0, metadata !271), !dbg !269
  br i1 %30, label %.lr.ph.i50, label %.loopexit162, !dbg !272

.lr.ph.i50:                                       ; preds = %.loopexit144, %175
  %173 = phi i8 [ %178, %175 ], [ 45, %.loopexit144 ]
  %.04.i48 = phi i8* [ %177, %175 ], [ getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), %.loopexit144 ]
  %.013.i49 = phi i8* [ %176, %175 ], [ %28, %.loopexit144 ]
  %174 = icmp eq i8 %173, 0, !dbg !273
  br i1 %174, label %__streq.exit52.thread128, label %175, !dbg !273

; <label>:175                                     ; preds = %.lr.ph.i50
  %176 = getelementptr inbounds i8* %.013.i49, i64 1, !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %176}, i64 0, metadata !267), !dbg !274
  %177 = getelementptr inbounds i8* %.04.i48, i64 1, !dbg !275
  tail call void @llvm.dbg.value(metadata !{i8* %177}, i64 0, metadata !271), !dbg !275
  %178 = load i8* %176, align 1, !dbg !272, !tbaa !132
  %179 = load i8* %177, align 1, !dbg !272, !tbaa !132
  %180 = icmp eq i8 %178, %179, !dbg !272
  br i1 %180, label %.lr.ph.i50, label %.loopexit145, !dbg !272

.loopexit145:                                     ; preds = %175
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !267), !dbg !269
  tail call void @llvm.dbg.value(metadata !276, i64 0, metadata !271), !dbg !269
  br i1 %30, label %.lr.ph.i55, label %.loopexit162, !dbg !272

.lr.ph.i55:                                       ; preds = %.loopexit145, %183
  %181 = phi i8 [ %186, %183 ], [ 45, %.loopexit145 ]
  %.04.i53 = phi i8* [ %185, %183 ], [ getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0), %.loopexit145 ]
  %.013.i54 = phi i8* [ %184, %183 ], [ %28, %.loopexit145 ]
  %182 = icmp eq i8 %181, 0, !dbg !273
  br i1 %182, label %__streq.exit52.thread128, label %183, !dbg !273

; <label>:183                                     ; preds = %.lr.ph.i55
  %184 = getelementptr inbounds i8* %.013.i54, i64 1, !dbg !274
  tail call void @llvm.dbg.value(metadata !{i8* %184}, i64 0, metadata !267), !dbg !274
  %185 = getelementptr inbounds i8* %.04.i53, i64 1, !dbg !275
  tail call void @llvm.dbg.value(metadata !{i8* %185}, i64 0, metadata !271), !dbg !275
  %186 = load i8* %184, align 1, !dbg !272, !tbaa !132
  %187 = load i8* %185, align 1, !dbg !272, !tbaa !132
  %188 = icmp eq i8 %186, %187, !dbg !272
  br i1 %188, label %.lr.ph.i55, label %.loopexit147, !dbg !272

__streq.exit52.thread128:                         ; preds = %.lr.ph.i55, %.lr.ph.i50
  call void @llvm.dbg.value(metadata !277, i64 0, metadata !52), !dbg !278
  %189 = add nsw i32 %k.0369, 2, !dbg !279
  %190 = icmp slt i32 %189, %1, !dbg !279
  br i1 %190, label %192, label %191, !dbg !279

; <label>:191                                     ; preds = %__streq.exit52.thread128
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)), !dbg !281
  unreachable

; <label>:192                                     ; preds = %__streq.exit52.thread128
  %193 = add nsw i32 %k.0369, 1, !dbg !282
  call void @llvm.dbg.value(metadata !{i32 %193}, i64 0, metadata !41), !dbg !282
  call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !41), !dbg !283
  %194 = sext i32 %193 to i64, !dbg !283
  %195 = getelementptr inbounds i8** %2, i64 %194, !dbg !283
  %196 = load i8** %195, align 8, !dbg !283, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %196}, i64 0, metadata !284) #2, !dbg !285
  call void @llvm.dbg.value(metadata !286, i64 0, metadata !287) #2, !dbg !285
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !288) #2, !dbg !289
  %197 = load i8* %196, align 1, !dbg !290, !tbaa !132
  %198 = icmp eq i8 %197, 0, !dbg !290
  br i1 %198, label %199, label %.lr.ph.i61, !dbg !290

; <label>:199                                     ; preds = %192
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !290
  unreachable

.lr.ph.i61:                                       ; preds = %192, %203
  %200 = phi i8 [ %208, %203 ], [ %197, %192 ]
  %s.pn.i58 = phi i8* [ %201, %203 ], [ %196, %192 ]
  %res.02.i59 = phi i64 [ %207, %203 ], [ 0, %192 ]
  %201 = getelementptr inbounds i8* %s.pn.i58, i64 1, !dbg !291
  %.off.i60 = add i8 %200, -48, !dbg !292
  %202 = icmp ult i8 %.off.i60, 10, !dbg !292
  br i1 %202, label %203, label %210, !dbg !292

; <label>:203                                     ; preds = %.lr.ph.i61
  %204 = sext i8 %200 to i64, !dbg !293
  %205 = mul nsw i64 %res.02.i59, 10, !dbg !294
  %206 = add i64 %204, -48, !dbg !294
  %207 = add i64 %206, %205, !dbg !294
  call void @llvm.dbg.value(metadata !{i64 %207}, i64 0, metadata !288) #2, !dbg !294
  call void @llvm.dbg.value(metadata !{i8* %201}, i64 0, metadata !284) #2, !dbg !291
  %208 = load i8* %201, align 1, !dbg !291, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %200}, i64 0, metadata !295) #2, !dbg !291
  %209 = icmp eq i8 %208, 0, !dbg !291
  br i1 %209, label %__str_to_int.exit62, label %.lr.ph.i61, !dbg !291

; <label>:210                                     ; preds = %.lr.ph.i61
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !296
  unreachable

__str_to_int.exit62:                              ; preds = %203
  %211 = trunc i64 %207 to i32, !dbg !283
  call void @llvm.dbg.value(metadata !{i32 %211}, i64 0, metadata !29), !dbg !283
  %212 = add nsw i32 %k.0369, 3, !dbg !297
  call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !41), !dbg !297
  %213 = sext i32 %189 to i64, !dbg !297
  %214 = getelementptr inbounds i8** %2, i64 %213, !dbg !297
  %215 = load i8** %214, align 8, !dbg !297, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %215}, i64 0, metadata !298) #2, !dbg !299
  call void @llvm.dbg.value(metadata !286, i64 0, metadata !300) #2, !dbg !299
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !301) #2, !dbg !302
  %216 = load i8* %215, align 1, !dbg !303, !tbaa !132
  %217 = icmp eq i8 %216, 0, !dbg !303
  br i1 %217, label %218, label %.lr.ph.i66, !dbg !303

; <label>:218                                     ; preds = %__str_to_int.exit62
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !303
  unreachable

.lr.ph.i66:                                       ; preds = %__str_to_int.exit62, %222
  %219 = phi i8 [ %227, %222 ], [ %216, %__str_to_int.exit62 ]
  %s.pn.i63 = phi i8* [ %220, %222 ], [ %215, %__str_to_int.exit62 ]
  %res.02.i64 = phi i64 [ %226, %222 ], [ 0, %__str_to_int.exit62 ]
  %220 = getelementptr inbounds i8* %s.pn.i63, i64 1, !dbg !304
  %.off.i65 = add i8 %219, -48, !dbg !305
  %221 = icmp ult i8 %.off.i65, 10, !dbg !305
  br i1 %221, label %222, label %229, !dbg !305

; <label>:222                                     ; preds = %.lr.ph.i66
  %223 = sext i8 %219 to i64, !dbg !306
  %224 = mul nsw i64 %res.02.i64, 10, !dbg !307
  %225 = add i64 %223, -48, !dbg !307
  %226 = add i64 %225, %224, !dbg !307
  call void @llvm.dbg.value(metadata !{i64 %226}, i64 0, metadata !301) #2, !dbg !307
  call void @llvm.dbg.value(metadata !{i8* %220}, i64 0, metadata !298) #2, !dbg !304
  %227 = load i8* %220, align 1, !dbg !304, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %219}, i64 0, metadata !308) #2, !dbg !304
  %228 = icmp eq i8 %227, 0, !dbg !304
  br i1 %228, label %__str_to_int.exit67, label %.lr.ph.i66, !dbg !304

; <label>:229                                     ; preds = %.lr.ph.i66
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !309
  unreachable

__str_to_int.exit67:                              ; preds = %222
  %230 = trunc i64 %226 to i32, !dbg !297
  call void @llvm.dbg.value(metadata !{i32 %230}, i64 0, metadata !30), !dbg !297
  br label %__streq.exit.thread.backedge, !dbg !310

.loopexit147:                                     ; preds = %183
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !311), !dbg !313
  tail call void @llvm.dbg.value(metadata !314, i64 0, metadata !315), !dbg !313
  br i1 %30, label %.lr.ph.i70, label %.loopexit162, !dbg !316

.lr.ph.i70:                                       ; preds = %.loopexit147, %233
  %231 = phi i8 [ %236, %233 ], [ 45, %.loopexit147 ]
  %.04.i68 = phi i8* [ %235, %233 ], [ getelementptr inbounds ([12 x i8]* @.str12, i64 0, i64 0), %.loopexit147 ]
  %.013.i69 = phi i8* [ %234, %233 ], [ %28, %.loopexit147 ]
  %232 = icmp eq i8 %231, 0, !dbg !317
  br i1 %232, label %__streq.exit72.thread130, label %233, !dbg !317

; <label>:233                                     ; preds = %.lr.ph.i70
  %234 = getelementptr inbounds i8* %.013.i69, i64 1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i8* %234}, i64 0, metadata !311), !dbg !318
  %235 = getelementptr inbounds i8* %.04.i68, i64 1, !dbg !319
  tail call void @llvm.dbg.value(metadata !{i8* %235}, i64 0, metadata !315), !dbg !319
  %236 = load i8* %234, align 1, !dbg !316, !tbaa !132
  %237 = load i8* %235, align 1, !dbg !316, !tbaa !132
  %238 = icmp eq i8 %236, %237, !dbg !316
  br i1 %238, label %.lr.ph.i70, label %.loopexit148, !dbg !316

.loopexit148:                                     ; preds = %233
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !320), !dbg !322
  tail call void @llvm.dbg.value(metadata !323, i64 0, metadata !324), !dbg !322
  br i1 %30, label %.lr.ph.i75, label %.loopexit162, !dbg !325

.lr.ph.i75:                                       ; preds = %.loopexit148, %241
  %239 = phi i8 [ %244, %241 ], [ 45, %.loopexit148 ]
  %.04.i73 = phi i8* [ %243, %241 ], [ getelementptr inbounds ([11 x i8]* @.str13, i64 0, i64 0), %.loopexit148 ]
  %.013.i74 = phi i8* [ %242, %241 ], [ %28, %.loopexit148 ]
  %240 = icmp eq i8 %239, 0, !dbg !326
  br i1 %240, label %__streq.exit72.thread130, label %241, !dbg !326

; <label>:241                                     ; preds = %.lr.ph.i75
  %242 = getelementptr inbounds i8* %.013.i74, i64 1, !dbg !327
  tail call void @llvm.dbg.value(metadata !{i8* %242}, i64 0, metadata !320), !dbg !327
  %243 = getelementptr inbounds i8* %.04.i73, i64 1, !dbg !328
  tail call void @llvm.dbg.value(metadata !{i8* %243}, i64 0, metadata !324), !dbg !328
  %244 = load i8* %242, align 1, !dbg !325, !tbaa !132
  %245 = load i8* %243, align 1, !dbg !325, !tbaa !132
  %246 = icmp eq i8 %244, %245, !dbg !325
  br i1 %246, label %.lr.ph.i75, label %.loopexit150, !dbg !325

__streq.exit72.thread130:                         ; preds = %.lr.ph.i75, %.lr.ph.i70
  call void @llvm.dbg.value(metadata !329, i64 0, metadata !55), !dbg !330
  %247 = add nsw i32 %k.0369, 1, !dbg !331
  call void @llvm.dbg.value(metadata !{i32 %247}, i64 0, metadata !41), !dbg !331
  %248 = icmp eq i32 %247, %1, !dbg !331
  br i1 %248, label %249, label %250, !dbg !331

; <label>:249                                     ; preds = %__streq.exit72.thread130
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)), !dbg !333
  unreachable

; <label>:250                                     ; preds = %__streq.exit72.thread130
  %251 = add nsw i32 %k.0369, 2, !dbg !334
  call void @llvm.dbg.value(metadata !{i32 %251}, i64 0, metadata !41), !dbg !334
  %252 = sext i32 %247 to i64, !dbg !334
  %253 = getelementptr inbounds i8** %2, i64 %252, !dbg !334
  %254 = load i8** %253, align 8, !dbg !334, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %254}, i64 0, metadata !335) #2, !dbg !336
  call void @llvm.dbg.value(metadata !337, i64 0, metadata !338) #2, !dbg !336
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !339) #2, !dbg !340
  %255 = load i8* %254, align 1, !dbg !341, !tbaa !132
  %256 = icmp eq i8 %255, 0, !dbg !341
  br i1 %256, label %257, label %.lr.ph.i81, !dbg !341

; <label>:257                                     ; preds = %250
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)) #2, !dbg !341
  unreachable

.lr.ph.i81:                                       ; preds = %250, %261
  %258 = phi i8 [ %266, %261 ], [ %255, %250 ]
  %s.pn.i78 = phi i8* [ %259, %261 ], [ %254, %250 ]
  %res.02.i79 = phi i64 [ %265, %261 ], [ 0, %250 ]
  %259 = getelementptr inbounds i8* %s.pn.i78, i64 1, !dbg !342
  %.off.i80 = add i8 %258, -48, !dbg !343
  %260 = icmp ult i8 %.off.i80, 10, !dbg !343
  br i1 %260, label %261, label %268, !dbg !343

; <label>:261                                     ; preds = %.lr.ph.i81
  %262 = sext i8 %258 to i64, !dbg !344
  %263 = mul nsw i64 %res.02.i79, 10, !dbg !345
  %264 = add i64 %262, -48, !dbg !345
  %265 = add i64 %264, %263, !dbg !345
  call void @llvm.dbg.value(metadata !{i64 %265}, i64 0, metadata !339) #2, !dbg !345
  call void @llvm.dbg.value(metadata !{i8* %259}, i64 0, metadata !335) #2, !dbg !342
  %266 = load i8* %259, align 1, !dbg !342, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %258}, i64 0, metadata !346) #2, !dbg !342
  %267 = icmp eq i8 %266, 0, !dbg !342
  br i1 %267, label %__str_to_int.exit82, label %.lr.ph.i81, !dbg !342

; <label>:268                                     ; preds = %.lr.ph.i81
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)) #2, !dbg !347
  unreachable

__str_to_int.exit82:                              ; preds = %261
  %269 = trunc i64 %265 to i32, !dbg !334
  call void @llvm.dbg.value(metadata !{i32 %269}, i64 0, metadata !31), !dbg !334
  br label %__streq.exit.thread.backedge, !dbg !348

__streq.exit.thread.backedge:                     ; preds = %__add_arg.exit47, %__str_to_int.exit46, %__str_to_int.exit82, %__streq.exit97.thread134, %__str_to_int.exit, %__add_arg.exit, %__streq.exit117.thread136, %__streq.exit87.thread132, %__str_to_int.exit67, %__add_arg.exit21
  %.be = phi i32 [ %78, %__add_arg.exit21 ], [ %25, %__str_to_int.exit67 ], [ %25, %__str_to_int.exit82 ], [ %25, %__streq.exit87.thread132 ], [ %25, %__streq.exit97.thread134 ], [ %25, %__streq.exit117.thread136 ], [ %25, %__str_to_int.exit ], [ %366, %__add_arg.exit ], [ %25, %__str_to_int.exit46 ], [ %170, %__add_arg.exit47 ]
  %fd_fail.0.be = phi i32 [ %fd_fail.0345, %__add_arg.exit21 ], [ %fd_fail.0345, %__str_to_int.exit67 ], [ %fd_fail.0345, %__str_to_int.exit82 ], [ %fd_fail.0345, %__streq.exit87.thread132 ], [ %fd_fail.0345, %__streq.exit97.thread134 ], [ 1, %__streq.exit117.thread136 ], [ %360, %__str_to_int.exit ], [ %fd_fail.0345, %__add_arg.exit ], [ %fd_fail.0345, %__str_to_int.exit46 ], [ %fd_fail.0345, %__add_arg.exit47 ]
  %save_all_writes_flag.0.be = phi i32 [ %save_all_writes_flag.0352, %__add_arg.exit21 ], [ %save_all_writes_flag.0352, %__str_to_int.exit67 ], [ %save_all_writes_flag.0352, %__str_to_int.exit82 ], [ %save_all_writes_flag.0352, %__streq.exit87.thread132 ], [ 1, %__streq.exit97.thread134 ], [ %save_all_writes_flag.0352, %__streq.exit117.thread136 ], [ %save_all_writes_flag.0352, %__str_to_int.exit ], [ %save_all_writes_flag.0352, %__add_arg.exit ], [ %save_all_writes_flag.0352, %__str_to_int.exit46 ], [ %save_all_writes_flag.0352, %__add_arg.exit47 ]
  %sym_arg_num.0.be = phi i32 [ %75, %__add_arg.exit21 ], [ %sym_arg_num.0360, %__str_to_int.exit67 ], [ %sym_arg_num.0360, %__str_to_int.exit82 ], [ %sym_arg_num.0360, %__streq.exit87.thread132 ], [ %sym_arg_num.0360, %__streq.exit97.thread134 ], [ %sym_arg_num.0360, %__streq.exit117.thread136 ], [ %sym_arg_num.0360, %__str_to_int.exit ], [ %sym_arg_num.0360, %__add_arg.exit ], [ %sym_arg_num.0360, %__str_to_int.exit46 ], [ %168, %__add_arg.exit47 ]
  %k.0.be = phi i32 [ %51, %__add_arg.exit21 ], [ %212, %__str_to_int.exit67 ], [ %251, %__str_to_int.exit82 ], [ %287, %__streq.exit87.thread132 ], [ %304, %__streq.exit97.thread134 ], [ %321, %__streq.exit117.thread136 ], [ %342, %__str_to_int.exit ], [ %363, %__add_arg.exit ], [ %137, %__str_to_int.exit46 ], [ %137, %__add_arg.exit47 ]
  %sym_stdout_flag.0.be = phi i32 [ %sym_stdout_flag.0378, %__add_arg.exit21 ], [ %sym_stdout_flag.0378, %__str_to_int.exit67 ], [ %sym_stdout_flag.0378, %__str_to_int.exit82 ], [ 1, %__streq.exit87.thread132 ], [ %sym_stdout_flag.0378, %__streq.exit97.thread134 ], [ %sym_stdout_flag.0378, %__streq.exit117.thread136 ], [ %sym_stdout_flag.0378, %__str_to_int.exit ], [ %sym_stdout_flag.0378, %__add_arg.exit ], [ %sym_stdout_flag.0378, %__str_to_int.exit46 ], [ %sym_stdout_flag.0378, %__add_arg.exit47 ]
  %sym_stdin_len.0.be = phi i32 [ %sym_stdin_len.0386, %__add_arg.exit21 ], [ %sym_stdin_len.0386, %__str_to_int.exit67 ], [ %269, %__str_to_int.exit82 ], [ %sym_stdin_len.0386, %__streq.exit87.thread132 ], [ %sym_stdin_len.0386, %__streq.exit97.thread134 ], [ %sym_stdin_len.0386, %__streq.exit117.thread136 ], [ %sym_stdin_len.0386, %__str_to_int.exit ], [ %sym_stdin_len.0386, %__add_arg.exit ], [ %sym_stdin_len.0386, %__str_to_int.exit46 ], [ %sym_stdin_len.0386, %__add_arg.exit47 ]
  %sym_file_len.0.be = phi i32 [ %sym_file_len.0394, %__add_arg.exit21 ], [ %230, %__str_to_int.exit67 ], [ %sym_file_len.0394, %__str_to_int.exit82 ], [ %sym_file_len.0394, %__streq.exit87.thread132 ], [ %sym_file_len.0394, %__streq.exit97.thread134 ], [ %sym_file_len.0394, %__streq.exit117.thread136 ], [ %sym_file_len.0394, %__str_to_int.exit ], [ %sym_file_len.0394, %__add_arg.exit ], [ %sym_file_len.0394, %__str_to_int.exit46 ], [ %sym_file_len.0394, %__add_arg.exit47 ]
  %sym_files.0.be = phi i32 [ %sym_files.0402, %__add_arg.exit21 ], [ %211, %__str_to_int.exit67 ], [ %sym_files.0402, %__str_to_int.exit82 ], [ %sym_files.0402, %__streq.exit87.thread132 ], [ %sym_files.0402, %__streq.exit97.thread134 ], [ %sym_files.0402, %__streq.exit117.thread136 ], [ %sym_files.0402, %__str_to_int.exit ], [ %sym_files.0402, %__add_arg.exit ], [ %sym_files.0402, %__str_to_int.exit46 ], [ %sym_files.0402, %__add_arg.exit47 ]
  %270 = icmp slt i32 %k.0.be, %1, !dbg !145
  br i1 %270, label %24, label %__streq.exit.thread._crit_edge, !dbg !145

.loopexit150:                                     ; preds = %241
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !349), !dbg !351
  tail call void @llvm.dbg.value(metadata !352, i64 0, metadata !353), !dbg !351
  br i1 %30, label %.lr.ph.i85, label %.loopexit162, !dbg !354

.lr.ph.i85:                                       ; preds = %.loopexit150, %273
  %271 = phi i8 [ %276, %273 ], [ 45, %.loopexit150 ]
  %.04.i83 = phi i8* [ %275, %273 ], [ getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0), %.loopexit150 ]
  %.013.i84 = phi i8* [ %274, %273 ], [ %28, %.loopexit150 ]
  %272 = icmp eq i8 %271, 0, !dbg !355
  br i1 %272, label %__streq.exit87.thread132, label %273, !dbg !355

; <label>:273                                     ; preds = %.lr.ph.i85
  %274 = getelementptr inbounds i8* %.013.i84, i64 1, !dbg !356
  tail call void @llvm.dbg.value(metadata !{i8* %274}, i64 0, metadata !349), !dbg !356
  %275 = getelementptr inbounds i8* %.04.i83, i64 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i8* %275}, i64 0, metadata !353), !dbg !357
  %276 = load i8* %274, align 1, !dbg !354, !tbaa !132
  %277 = load i8* %275, align 1, !dbg !354, !tbaa !132
  %278 = icmp eq i8 %276, %277, !dbg !354
  br i1 %278, label %.lr.ph.i85, label %.loopexit151, !dbg !354

.loopexit151:                                     ; preds = %273
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !358), !dbg !360
  tail call void @llvm.dbg.value(metadata !361, i64 0, metadata !362), !dbg !360
  br i1 %30, label %.lr.ph.i90, label %.loopexit162, !dbg !363

.lr.ph.i90:                                       ; preds = %.loopexit151, %281
  %279 = phi i8 [ %284, %281 ], [ 45, %.loopexit151 ]
  %.04.i88 = phi i8* [ %283, %281 ], [ getelementptr inbounds ([12 x i8]* @.str16, i64 0, i64 0), %.loopexit151 ]
  %.013.i89 = phi i8* [ %282, %281 ], [ %28, %.loopexit151 ]
  %280 = icmp eq i8 %279, 0, !dbg !364
  br i1 %280, label %__streq.exit87.thread132, label %281, !dbg !364

; <label>:281                                     ; preds = %.lr.ph.i90
  %282 = getelementptr inbounds i8* %.013.i89, i64 1, !dbg !365
  tail call void @llvm.dbg.value(metadata !{i8* %282}, i64 0, metadata !358), !dbg !365
  %283 = getelementptr inbounds i8* %.04.i88, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata !{i8* %283}, i64 0, metadata !362), !dbg !366
  %284 = load i8* %282, align 1, !dbg !363, !tbaa !132
  %285 = load i8* %283, align 1, !dbg !363, !tbaa !132
  %286 = icmp eq i8 %284, %285, !dbg !363
  br i1 %286, label %.lr.ph.i90, label %.loopexit153, !dbg !363

__streq.exit87.thread132:                         ; preds = %.lr.ph.i90, %.lr.ph.i85
  call void @llvm.dbg.value(metadata !367, i64 0, metadata !32), !dbg !368
  %287 = add nsw i32 %k.0369, 1, !dbg !370
  call void @llvm.dbg.value(metadata !{i32 %287}, i64 0, metadata !41), !dbg !370
  br label %__streq.exit.thread.backedge, !dbg !371

.loopexit153:                                     ; preds = %281
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !372), !dbg !374
  tail call void @llvm.dbg.value(metadata !375, i64 0, metadata !376), !dbg !374
  br i1 %30, label %.lr.ph.i95, label %.loopexit162, !dbg !377

.lr.ph.i95:                                       ; preds = %.loopexit153, %290
  %288 = phi i8 [ %293, %290 ], [ 45, %.loopexit153 ]
  %.04.i93 = phi i8* [ %292, %290 ], [ getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0), %.loopexit153 ]
  %.013.i94 = phi i8* [ %291, %290 ], [ %28, %.loopexit153 ]
  %289 = icmp eq i8 %288, 0, !dbg !378
  br i1 %289, label %__streq.exit97.thread134, label %290, !dbg !378

; <label>:290                                     ; preds = %.lr.ph.i95
  %291 = getelementptr inbounds i8* %.013.i94, i64 1, !dbg !379
  tail call void @llvm.dbg.value(metadata !{i8* %291}, i64 0, metadata !372), !dbg !379
  %292 = getelementptr inbounds i8* %.04.i93, i64 1, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i8* %292}, i64 0, metadata !376), !dbg !380
  %293 = load i8* %291, align 1, !dbg !377, !tbaa !132
  %294 = load i8* %292, align 1, !dbg !377, !tbaa !132
  %295 = icmp eq i8 %293, %294, !dbg !377
  br i1 %295, label %.lr.ph.i95, label %.loopexit154, !dbg !377

.loopexit154:                                     ; preds = %290
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !372), !dbg !374
  tail call void @llvm.dbg.value(metadata !381, i64 0, metadata !376), !dbg !374
  br i1 %30, label %.lr.ph.i120, label %.loopexit162, !dbg !377

.lr.ph.i120:                                      ; preds = %.loopexit154, %298
  %296 = phi i8 [ %301, %298 ], [ 45, %.loopexit154 ]
  %.04.i118 = phi i8* [ %300, %298 ], [ getelementptr inbounds ([17 x i8]* @.str18, i64 0, i64 0), %.loopexit154 ]
  %.013.i119 = phi i8* [ %299, %298 ], [ %28, %.loopexit154 ]
  %297 = icmp eq i8 %296, 0, !dbg !378
  br i1 %297, label %__streq.exit97.thread134, label %298, !dbg !378

; <label>:298                                     ; preds = %.lr.ph.i120
  %299 = getelementptr inbounds i8* %.013.i119, i64 1, !dbg !379
  tail call void @llvm.dbg.value(metadata !{i8* %299}, i64 0, metadata !372), !dbg !379
  %300 = getelementptr inbounds i8* %.04.i118, i64 1, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i8* %300}, i64 0, metadata !376), !dbg !380
  %301 = load i8* %299, align 1, !dbg !377, !tbaa !132
  %302 = load i8* %300, align 1, !dbg !377, !tbaa !132
  %303 = icmp eq i8 %301, %302, !dbg !377
  br i1 %303, label %.lr.ph.i120, label %.loopexit156, !dbg !377

__streq.exit97.thread134:                         ; preds = %.lr.ph.i120, %.lr.ph.i95
  call void @llvm.dbg.value(metadata !367, i64 0, metadata !33), !dbg !382
  %304 = add nsw i32 %k.0369, 1, !dbg !384
  call void @llvm.dbg.value(metadata !{i32 %304}, i64 0, metadata !41), !dbg !384
  br label %__streq.exit.thread.backedge, !dbg !385

.loopexit156:                                     ; preds = %298
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !386), !dbg !388
  tail call void @llvm.dbg.value(metadata !389, i64 0, metadata !390), !dbg !388
  br i1 %30, label %.lr.ph.i115, label %.loopexit162, !dbg !391

.lr.ph.i115:                                      ; preds = %.loopexit156, %307
  %305 = phi i8 [ %310, %307 ], [ 45, %.loopexit156 ]
  %.04.i113 = phi i8* [ %309, %307 ], [ getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0), %.loopexit156 ]
  %.013.i114 = phi i8* [ %308, %307 ], [ %28, %.loopexit156 ]
  %306 = icmp eq i8 %305, 0, !dbg !392
  br i1 %306, label %__streq.exit117.thread136, label %307, !dbg !392

; <label>:307                                     ; preds = %.lr.ph.i115
  %308 = getelementptr inbounds i8* %.013.i114, i64 1, !dbg !393
  tail call void @llvm.dbg.value(metadata !{i8* %308}, i64 0, metadata !386), !dbg !393
  %309 = getelementptr inbounds i8* %.04.i113, i64 1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i8* %309}, i64 0, metadata !390), !dbg !394
  %310 = load i8* %308, align 1, !dbg !391, !tbaa !132
  %311 = load i8* %309, align 1, !dbg !391, !tbaa !132
  %312 = icmp eq i8 %310, %311, !dbg !391
  br i1 %312, label %.lr.ph.i115, label %.loopexit157, !dbg !391

.loopexit157:                                     ; preds = %307
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !386), !dbg !388
  tail call void @llvm.dbg.value(metadata !395, i64 0, metadata !390), !dbg !388
  br i1 %30, label %.lr.ph.i110, label %.loopexit162, !dbg !391

.lr.ph.i110:                                      ; preds = %.loopexit157, %315
  %313 = phi i8 [ %318, %315 ], [ 45, %.loopexit157 ]
  %.04.i108 = phi i8* [ %317, %315 ], [ getelementptr inbounds ([9 x i8]* @.str20, i64 0, i64 0), %.loopexit157 ]
  %.013.i109 = phi i8* [ %316, %315 ], [ %28, %.loopexit157 ]
  %314 = icmp eq i8 %313, 0, !dbg !392
  br i1 %314, label %__streq.exit117.thread136, label %315, !dbg !392

; <label>:315                                     ; preds = %.lr.ph.i110
  %316 = getelementptr inbounds i8* %.013.i109, i64 1, !dbg !393
  tail call void @llvm.dbg.value(metadata !{i8* %316}, i64 0, metadata !386), !dbg !393
  %317 = getelementptr inbounds i8* %.04.i108, i64 1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i8* %317}, i64 0, metadata !390), !dbg !394
  %318 = load i8* %316, align 1, !dbg !391, !tbaa !132
  %319 = load i8* %317, align 1, !dbg !391, !tbaa !132
  %320 = icmp eq i8 %318, %319, !dbg !391
  br i1 %320, label %.lr.ph.i110, label %.loopexit159, !dbg !391

__streq.exit117.thread136:                        ; preds = %.lr.ph.i110, %.lr.ph.i115
  call void @llvm.dbg.value(metadata !367, i64 0, metadata !34), !dbg !396
  %321 = add nsw i32 %k.0369, 1, !dbg !398
  call void @llvm.dbg.value(metadata !{i32 %321}, i64 0, metadata !41), !dbg !398
  br label %__streq.exit.thread.backedge, !dbg !399

.loopexit159:                                     ; preds = %315
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !400), !dbg !402
  tail call void @llvm.dbg.value(metadata !403, i64 0, metadata !404), !dbg !402
  br i1 %30, label %.lr.ph.i105, label %.loopexit162, !dbg !405

.lr.ph.i105:                                      ; preds = %.loopexit159, %324
  %322 = phi i8 [ %327, %324 ], [ 45, %.loopexit159 ]
  %.04.i103 = phi i8* [ %326, %324 ], [ getelementptr inbounds ([11 x i8]* @.str21, i64 0, i64 0), %.loopexit159 ]
  %.013.i104 = phi i8* [ %325, %324 ], [ %28, %.loopexit159 ]
  %323 = icmp eq i8 %322, 0, !dbg !406
  br i1 %323, label %__streq.exit107.thread138, label %324, !dbg !406

; <label>:324                                     ; preds = %.lr.ph.i105
  %325 = getelementptr inbounds i8* %.013.i104, i64 1, !dbg !407
  tail call void @llvm.dbg.value(metadata !{i8* %325}, i64 0, metadata !400), !dbg !407
  %326 = getelementptr inbounds i8* %.04.i103, i64 1, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i8* %326}, i64 0, metadata !404), !dbg !408
  %327 = load i8* %325, align 1, !dbg !405, !tbaa !132
  %328 = load i8* %326, align 1, !dbg !405, !tbaa !132
  %329 = icmp eq i8 %327, %328, !dbg !405
  br i1 %329, label %.lr.ph.i105, label %.loopexit160, !dbg !405

.loopexit160:                                     ; preds = %324
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !400), !dbg !402
  tail call void @llvm.dbg.value(metadata !409, i64 0, metadata !404), !dbg !402
  br i1 %30, label %.lr.ph.i100, label %.loopexit162, !dbg !405

.lr.ph.i100:                                      ; preds = %.loopexit160, %332
  %330 = phi i8 [ %335, %332 ], [ 45, %.loopexit160 ]
  %.04.i98 = phi i8* [ %334, %332 ], [ getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), %.loopexit160 ]
  %.013.i99 = phi i8* [ %333, %332 ], [ %28, %.loopexit160 ]
  %331 = icmp eq i8 %330, 0, !dbg !406
  br i1 %331, label %__streq.exit107.thread138, label %332, !dbg !406

; <label>:332                                     ; preds = %.lr.ph.i100
  %333 = getelementptr inbounds i8* %.013.i99, i64 1, !dbg !407
  tail call void @llvm.dbg.value(metadata !{i8* %333}, i64 0, metadata !400), !dbg !407
  %334 = getelementptr inbounds i8* %.04.i98, i64 1, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i8* %334}, i64 0, metadata !404), !dbg !408
  %335 = load i8* %333, align 1, !dbg !405, !tbaa !132
  %336 = load i8* %334, align 1, !dbg !405, !tbaa !132
  %337 = icmp eq i8 %335, %336, !dbg !405
  br i1 %337, label %.lr.ph.i100, label %.loopexit162, !dbg !405

__streq.exit107.thread138:                        ; preds = %.lr.ph.i100, %.lr.ph.i105
  call void @llvm.dbg.value(metadata !410, i64 0, metadata !58), !dbg !411
  %338 = add nsw i32 %k.0369, 1, !dbg !412
  call void @llvm.dbg.value(metadata !{i32 %338}, i64 0, metadata !41), !dbg !412
  %339 = icmp eq i32 %338, %1, !dbg !412
  br i1 %339, label %340, label %341, !dbg !412

; <label>:340                                     ; preds = %__streq.exit107.thread138
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)), !dbg !414
  unreachable

; <label>:341                                     ; preds = %__streq.exit107.thread138
  %342 = add nsw i32 %k.0369, 2, !dbg !415
  call void @llvm.dbg.value(metadata !{i32 %342}, i64 0, metadata !41), !dbg !415
  %343 = sext i32 %338 to i64, !dbg !415
  %344 = getelementptr inbounds i8** %2, i64 %343, !dbg !415
  %345 = load i8** %344, align 8, !dbg !415, !tbaa !115
  call void @llvm.dbg.value(metadata !{i8* %345}, i64 0, metadata !416) #2, !dbg !417
  call void @llvm.dbg.value(metadata !418, i64 0, metadata !419) #2, !dbg !417
  call void @llvm.dbg.value(metadata !169, i64 0, metadata !420) #2, !dbg !421
  %346 = load i8* %345, align 1, !dbg !422, !tbaa !132
  %347 = icmp eq i8 %346, 0, !dbg !422
  br i1 %347, label %348, label %.lr.ph.i10, !dbg !422

; <label>:348                                     ; preds = %341
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)) #2, !dbg !422
  unreachable

.lr.ph.i10:                                       ; preds = %341, %352
  %349 = phi i8 [ %357, %352 ], [ %346, %341 ]
  %s.pn.i = phi i8* [ %350, %352 ], [ %345, %341 ]
  %res.02.i = phi i64 [ %356, %352 ], [ 0, %341 ]
  %350 = getelementptr inbounds i8* %s.pn.i, i64 1, !dbg !423
  %.off.i = add i8 %349, -48, !dbg !424
  %351 = icmp ult i8 %.off.i, 10, !dbg !424
  br i1 %351, label %352, label %359, !dbg !424

; <label>:352                                     ; preds = %.lr.ph.i10
  %353 = sext i8 %349 to i64, !dbg !425
  %354 = mul nsw i64 %res.02.i, 10, !dbg !426
  %355 = add i64 %353, -48, !dbg !426
  %356 = add i64 %355, %354, !dbg !426
  call void @llvm.dbg.value(metadata !{i64 %356}, i64 0, metadata !420) #2, !dbg !426
  call void @llvm.dbg.value(metadata !{i8* %350}, i64 0, metadata !416) #2, !dbg !423
  %357 = load i8* %350, align 1, !dbg !423, !tbaa !132
  call void @llvm.dbg.value(metadata !{i8 %349}, i64 0, metadata !427) #2, !dbg !423
  %358 = icmp eq i8 %357, 0, !dbg !423
  br i1 %358, label %__str_to_int.exit, label %.lr.ph.i10, !dbg !423

; <label>:359                                     ; preds = %.lr.ph.i10
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)) #2, !dbg !428
  unreachable

__str_to_int.exit:                                ; preds = %352
  %360 = trunc i64 %356 to i32, !dbg !415
  call void @llvm.dbg.value(metadata !{i32 %360}, i64 0, metadata !34), !dbg !415
  br label %__streq.exit.thread.backedge, !dbg !429

.loopexit162:                                     ; preds = %332, %.loopexit148, %.loopexit147, %.loopexit145, %.loopexit144, %.loopexit142, %.loopexit141, %.loopexit, %24, %.loopexit153, %.loopexit154, %.loopexit150, %.loopexit151, %.loopexit157, %.loopexit156, %.loopexit159, %.loopexit160
  call void @llvm.dbg.value(metadata !{i32 %363}, i64 0, metadata !41), !dbg !430
  call void @llvm.dbg.value(metadata !186, i64 0, metadata !432) #2, !dbg !433
  %361 = icmp eq i32 %25, 1024, !dbg !434
  br i1 %361, label %362, label %__add_arg.exit, !dbg !434

; <label>:362                                     ; preds = %.loopexit162
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !435
  unreachable

__add_arg.exit:                                   ; preds = %.loopexit162
  %363 = add nsw i32 %k.0369, 1, !dbg !430
  %364 = sext i32 %25 to i64, !dbg !436
  %365 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %364, !dbg !436
  store i8* %28, i8** %365, align 8, !dbg !436, !tbaa !115
  %366 = add nsw i32 %25, 1, !dbg !437
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !19), !dbg !437
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !19), !dbg !118
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !19), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !19), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !19), !dbg !121
  br label %__streq.exit.thread.backedge

__streq.exit.thread._crit_edge:                   ; preds = %__streq.exit.thread.backedge, %__streq.exit.thread.preheader
  %sym_files.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %.lcssa176 = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %.be, %__streq.exit.thread.backedge ]
  %367 = add nsw i32 %.lcssa176, 1, !dbg !118
  %368 = sext i32 %367 to i64, !dbg !118
  %369 = shl nsw i64 %368, 3, !dbg !118
  %370 = call noalias i8* @malloc(i64 %369) #2, !dbg !118
  %371 = bitcast i8* %370 to i8**, !dbg !118
  call void @llvm.dbg.value(metadata !{i8** %371}, i64 0, metadata !35), !dbg !118
  call void @klee_mark_global(i8* %370) #2, !dbg !438
  %372 = sext i32 %.lcssa176 to i64, !dbg !119
  %373 = shl nsw i64 %372, 3, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %370, i8* %3, i64 %373, i32 8, i1 false), !dbg !119
  %374 = getelementptr inbounds i8** %371, i64 %372, !dbg !120
  store i8* null, i8** %374, align 8, !dbg !120, !tbaa !115
  store i32 %.lcssa176, i32* %argcPtr, align 4, !dbg !121, !tbaa !110
  store i8** %371, i8*** %argvPtr, align 8, !dbg !439, !tbaa !115
  call void @klee_init_fds(i32 %sym_files.0.lcssa, i32 %sym_file_len.0.lcssa, i32 %sym_stdin_len.0.lcssa, i32 %sym_stdout_flag.0.lcssa, i32 %save_all_writes_flag.0.lcssa, i32 %fd_fail.0.lcssa) #2, !dbg !440
  call void @llvm.lifetime.end(i64 8192, i8* %3) #2, !dbg !441
  ret void, !dbg !441
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @__emit_error(i8* %msg) #3 {
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !98), !dbg !442
  tail call void @klee_report_error(i8* getelementptr inbounds ([71 x i8]* @.str25, i64 0, i64 0), i32 24, i8* %msg, i8* getelementptr inbounds ([9 x i8]* @.str26, i64 0, i64 0)) #7, !dbg !443
  unreachable, !dbg !443
}

; Function Attrs: nounwind uwtable
define internal fastcc i8* @__get_sym_str(i32 %numChars, i8* %name) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %numChars}, i64 0, metadata !68), !dbg !444
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !69), !dbg !444
  %1 = add nsw i32 %numChars, 1, !dbg !445
  %2 = sext i32 %1 to i64, !dbg !445
  %3 = tail call noalias i8* @malloc(i64 %2) #2, !dbg !445
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !71), !dbg !445
  tail call void @klee_mark_global(i8* %3) #2, !dbg !446
  tail call void @klee_make_symbolic(i8* %3, i64 %2, i8* %name) #2, !dbg !447
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !70), !dbg !448
  %4 = icmp sgt i32 %numChars, 0, !dbg !448
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !448

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %5 = getelementptr inbounds i8* %3, i64 %indvars.iv, !dbg !450
  %6 = load i8* %5, align 1, !dbg !450, !tbaa !132
  tail call void @llvm.dbg.value(metadata !{i8 %6}, i64 0, metadata !451), !dbg !452
  %7 = icmp sgt i8 %6, 31, !dbg !453
  %8 = icmp ne i8 %6, 127, !dbg !453
  %..i = and i1 %7, %8, !dbg !453
  %9 = zext i1 %..i to i64, !dbg !450
  tail call void @klee_posix_prefer_cex(i8* %3, i64 %9) #2, !dbg !450
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !448
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !448
  %exitcond = icmp eq i32 %lftr.wideiv, %numChars, !dbg !448
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !448

._crit_edge:                                      ; preds = %.lr.ph, %0
  %10 = sext i32 %numChars to i64, !dbg !454
  %11 = getelementptr inbounds i8* %3, i64 %10, !dbg !454
  store i8 0, i8* %11, align 1, !dbg !454, !tbaa !132
  ret i8* %3, !dbg !455
}

declare i32 @klee_range(i32, i32, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

declare void @klee_mark_global(i8*) #4

declare void @klee_init_fds(i32, i32, i32, i32, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #4

declare void @klee_posix_prefer_cex(i8*, i64) #4

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!105, !106}
!llvm.ident = !{!107}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !64, metadata !72, metadata !77, metadata !85, metadata !94, metadata !99}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"klee_init_env", metadata !"klee_init_env", metadata !"", i32 85, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8***)* @klee_init_env, null, null, metadata !14, i32 85} ; [ DW_TAG_subprogram ] [line 85] [def] [klee_init_env]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!13 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !25, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !40, metadata !41, metadata !42, metadata !43, metadata !49, metadata !52, metadata !55, metadata !58}
!15 = metadata !{i32 786689, metadata !4, metadata !"argcPtr", metadata !5, i32 16777301, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcPtr] [line 85]
!16 = metadata !{i32 786689, metadata !4, metadata !"argvPtr", metadata !5, i32 33554517, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argvPtr] [line 85]
!17 = metadata !{i32 786688, metadata !4, metadata !"argc", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argc] [line 86]
!18 = metadata !{i32 786688, metadata !4, metadata !"argv", metadata !5, i32 87, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv] [line 87]
!19 = metadata !{i32 786688, metadata !4, metadata !"new_argc", metadata !5, i32 89, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argc] [line 89]
!20 = metadata !{i32 786688, metadata !4, metadata !"n_args", metadata !5, i32 89, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n_args] [line 89]
!21 = metadata !{i32 786688, metadata !4, metadata !"new_argv", metadata !5, i32 90, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argv] [line 90]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 64, i32 0, i32 0, metadata !12, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 1024}     ; [ DW_TAG_subrange_type ] [0, 1023]
!25 = metadata !{i32 786688, metadata !4, metadata !"max_len", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_len] [line 91]
!26 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!27 = metadata !{i32 786688, metadata !4, metadata !"min_argvs", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_argvs] [line 91]
!28 = metadata !{i32 786688, metadata !4, metadata !"max_argvs", metadata !5, i32 91, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_argvs] [line 91]
!29 = metadata !{i32 786688, metadata !4, metadata !"sym_files", metadata !5, i32 92, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_files] [line 92]
!30 = metadata !{i32 786688, metadata !4, metadata !"sym_file_len", metadata !5, i32 92, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_file_len] [line 92]
!31 = metadata !{i32 786688, metadata !4, metadata !"sym_stdin_len", metadata !5, i32 93, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdin_len] [line 93]
!32 = metadata !{i32 786688, metadata !4, metadata !"sym_stdout_flag", metadata !5, i32 94, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdout_flag] [line 94]
!33 = metadata !{i32 786688, metadata !4, metadata !"save_all_writes_flag", metadata !5, i32 95, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save_all_writes_flag] [line 95]
!34 = metadata !{i32 786688, metadata !4, metadata !"fd_fail", metadata !5, i32 96, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd_fail] [line 96]
!35 = metadata !{i32 786688, metadata !4, metadata !"final_argv", metadata !5, i32 97, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_argv] [line 97]
!36 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_name", metadata !5, i32 98, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_name] [line 98]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 40, i64 8, i32 0, i32 0, metadata !13, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 40, align 8, offset 0] [from char]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!40 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_num", metadata !5, i32 99, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_num] [line 99]
!41 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 100, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 100]
!42 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 100, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 100]
!43 = metadata !{i32 786688, metadata !44, metadata !"msg", metadata !5, i32 125, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 125]
!44 = metadata !{i32 786443, metadata !1, metadata !45, i32 124, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 124, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 123, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!47 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!48 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!49 = metadata !{i32 786688, metadata !50, metadata !"msg", metadata !5, i32 136, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 136]
!50 = metadata !{i32 786443, metadata !1, metadata !51, i32 135, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!51 = metadata !{i32 786443, metadata !1, metadata !45, i32 135, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!52 = metadata !{i32 786688, metadata !53, metadata !"msg", metadata !5, i32 156, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 156]
!53 = metadata !{i32 786443, metadata !1, metadata !54, i32 155, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!54 = metadata !{i32 786443, metadata !1, metadata !51, i32 155, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!55 = metadata !{i32 786688, metadata !56, metadata !"msg", metadata !5, i32 167, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 167]
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 166, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!58 = metadata !{i32 786688, metadata !59, metadata !"msg", metadata !5, i32 188, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 188]
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 187, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!60 = metadata !{i32 786443, metadata !1, metadata !61, i32 187, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 183, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!62 = metadata !{i32 786443, metadata !1, metadata !63, i32 179, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!63 = metadata !{i32 786443, metadata !1, metadata !57, i32 174, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!64 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__get_sym_str", metadata !"__get_sym_str", metadata !"", i32 63, metadata !65, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32, i8*)* @__get_sym_str, null, null, metadata !67, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_sym_str]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !12, metadata !9, metadata !12}
!67 = metadata !{metadata !68, metadata !69, metadata !70, metadata !71}
!68 = metadata !{i32 786689, metadata !64, metadata !"numChars", metadata !5, i32 16777279, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numChars] [line 63]
!69 = metadata !{i32 786689, metadata !64, metadata !"name", metadata !5, i32 33554495, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 63]
!70 = metadata !{i32 786688, metadata !64, metadata !"i", metadata !5, i32 64, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!71 = metadata !{i32 786688, metadata !64, metadata !"s", metadata !5, i32 65, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 65]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__isprint", metadata !"__isprint", metadata !"", i32 48, metadata !73, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !75, i32 48} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [__isprint]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !9, metadata !48}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786689, metadata !72, metadata !"c", metadata !5, i32 16777264, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 48]
!77 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__add_arg", metadata !"__add_arg", metadata !"", i32 76, metadata !78, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !80, i32 76} ; [ DW_TAG_subprogram ] [line 76] [local] [def] [__add_arg]
!78 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{null, metadata !8, metadata !11, metadata !12, metadata !9}
!80 = metadata !{metadata !81, metadata !82, metadata !83, metadata !84}
!81 = metadata !{i32 786689, metadata !77, metadata !"argc", metadata !5, i32 16777292, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 76]
!82 = metadata !{i32 786689, metadata !77, metadata !"argv", metadata !5, i32 33554508, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 76]
!83 = metadata !{i32 786689, metadata !77, metadata !"arg", metadata !5, i32 50331724, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 76]
!84 = metadata !{i32 786689, metadata !77, metadata !"argcMax", metadata !5, i32 67108940, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!85 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__str_to_int", metadata !"__str_to_int", metadata !"", i32 30, metadata !86, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !89, i32 30} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [__str_to_int]
!86 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{metadata !88, metadata !12, metadata !47}
!88 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!89 = metadata !{metadata !90, metadata !91, metadata !92, metadata !93}
!90 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 30]
!91 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!92 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 31]
!93 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!94 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__emit_error", metadata !"__emit_error", metadata !"", i32 23, metadata !95, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @__emit_error, null, null, metadata !97, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [__emit_error]
!95 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !96, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!96 = metadata !{null, metadata !47}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786689, metadata !94, metadata !"msg", metadata !5, i32 16777239, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 23]
!99 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"__streq", metadata !"__streq", metadata !"", i32 53, metadata !100, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !102, i32 53} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [__streq]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !9, metadata !47, metadata !47}
!102 = metadata !{metadata !103, metadata !104}
!103 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 53]
!104 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 53]
!105 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!106 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!107 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!108 = metadata !{i32 85, i32 0, metadata !4, null}
!109 = metadata !{i32 86, i32 0, metadata !4, null}
!110 = metadata !{metadata !111, metadata !111, i64 0}
!111 = metadata !{metadata !"int", metadata !112, i64 0}
!112 = metadata !{metadata !"omnipotent char", metadata !113, i64 0}
!113 = metadata !{metadata !"Simple C/C++ TBAA"}
!114 = metadata !{i32 87, i32 0, metadata !4, null}
!115 = metadata !{metadata !116, metadata !116, i64 0}
!116 = metadata !{metadata !"any pointer", metadata !112, i64 0}
!117 = metadata !{i32 89, i32 0, metadata !4, null}
!118 = metadata !{i32 200, i32 0, metadata !4, null}
!119 = metadata !{i32 202, i32 0, metadata !4, null}
!120 = metadata !{i32 203, i32 0, metadata !4, null}
!121 = metadata !{i32 205, i32 0, metadata !4, null}
!122 = metadata !{i32 90, i32 0, metadata !4, null}
!123 = metadata !{i32 92, i32 0, metadata !4, null}
!124 = metadata !{i32 93, i32 0, metadata !4, null}
!125 = metadata !{i32 94, i32 0, metadata !4, null}
!126 = metadata !{i32 95, i32 0, metadata !4, null}
!127 = metadata !{i32 96, i32 0, metadata !4, null}
!128 = metadata !{i32 98, i32 0, metadata !4, null}
!129 = metadata !{i32 99, i32 0, metadata !4, null}
!130 = metadata !{i32 100, i32 0, metadata !4, null}
!131 = metadata !{i32 102, i32 0, metadata !4, null}
!132 = metadata !{metadata !112, metadata !112, i64 0}
!133 = metadata !{i32 105, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!135 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !133} ; [ DW_TAG_arg_variable ] [a] [line 53]
!136 = metadata !{i32 53, i32 0, metadata !99, metadata !133}
!137 = metadata !{i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0)}
!138 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !133} ; [ DW_TAG_arg_variable ] [b] [line 53]
!139 = metadata !{i32 54, i32 0, metadata !99, metadata !133}
!140 = metadata !{i32 55, i32 0, metadata !141, metadata !133}
!141 = metadata !{i32 786443, metadata !1, metadata !142, i32 55, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!142 = metadata !{i32 786443, metadata !1, metadata !99, i32 54, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!143 = metadata !{i32 57, i32 0, metadata !142, metadata !133}
!144 = metadata !{i32 58, i32 0, metadata !142, metadata !133} ; [ DW_TAG_imported_module ]
!145 = metadata !{i32 123, i32 0, metadata !4, null}
!146 = metadata !{i32 130, i32 0, metadata !44, null}
!147 = metadata !{i32 106, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !134, i32 105, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!149 = metadata !{i32 124, i32 0, metadata !45, null}
!150 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !149} ; [ DW_TAG_arg_variable ] [a] [line 53]
!151 = metadata !{i32 53, i32 0, metadata !99, metadata !149}
!152 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)}
!153 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !149} ; [ DW_TAG_arg_variable ] [b] [line 53]
!154 = metadata !{i32 54, i32 0, metadata !99, metadata !149}
!155 = metadata !{i32 55, i32 0, metadata !141, metadata !149}
!156 = metadata !{i32 57, i32 0, metadata !142, metadata !149}
!157 = metadata !{i32 58, i32 0, metadata !142, metadata !149} ; [ DW_TAG_imported_module ]
!158 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)}
!159 = metadata !{null}
!160 = metadata !{i32 125, i32 0, metadata !44, null}
!161 = metadata !{i32 126, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !44, i32 126, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!163 = metadata !{i32 127, i32 0, metadata !162, null}
!164 = metadata !{i32 129, i32 0, metadata !44, null}
!165 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !164} ; [ DW_TAG_arg_variable ] [s] [line 30]
!166 = metadata !{i32 30, i32 0, metadata !85, metadata !164}
!167 = metadata !{i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)}
!168 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !164} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!169 = metadata !{i64 0}
!170 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [res] [line 31]
!171 = metadata !{i32 31, i32 0, metadata !85, metadata !164}
!172 = metadata !{i32 34, i32 0, metadata !173, metadata !164}
!173 = metadata !{i32 786443, metadata !1, metadata !85, i32 34, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!174 = metadata !{i32 36, i32 0, metadata !85, metadata !164}
!175 = metadata !{i32 39, i32 0, metadata !176, metadata !164}
!176 = metadata !{i32 786443, metadata !1, metadata !177, i32 39, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!177 = metadata !{i32 786443, metadata !1, metadata !178, i32 37, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!178 = metadata !{i32 786443, metadata !1, metadata !85, i32 36, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!179 = metadata !{i32 37, i32 0, metadata !177, metadata !164}
!180 = metadata !{i32 40, i32 0, metadata !181, metadata !164}
!181 = metadata !{i32 786443, metadata !1, metadata !176, i32 39, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!182 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [c] [line 32]
!183 = metadata !{i32 42, i32 0, metadata !184, metadata !164}
!184 = metadata !{i32 786443, metadata !1, metadata !176, i32 41, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!185 = metadata !{i32 132, i32 0, metadata !44, null}
!186 = metadata !{i32 1024}
!187 = metadata !{i32 786689, metadata !77, metadata !"argcMax", metadata !5, i32 67108940, metadata !9, i32 0, metadata !188} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!188 = metadata !{i32 131, i32 0, metadata !44, null}
!189 = metadata !{i32 76, i32 0, metadata !77, metadata !188}
!190 = metadata !{i32 77, i32 0, metadata !191, metadata !188}
!191 = metadata !{i32 786443, metadata !1, metadata !77, i32 77, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!192 = metadata !{i32 78, i32 0, metadata !193, metadata !188}
!193 = metadata !{i32 786443, metadata !1, metadata !191, i32 77, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!194 = metadata !{i32 80, i32 0, metadata !195, metadata !188}
!195 = metadata !{i32 786443, metadata !1, metadata !191, i32 79, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!196 = metadata !{i32 81, i32 0, metadata !195, metadata !188}
!197 = metadata !{i32 134, i32 0, metadata !44, null}
!198 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !199} ; [ DW_TAG_arg_variable ] [a] [line 53]
!199 = metadata !{i32 135, i32 0, metadata !51, null}
!200 = metadata !{i32 53, i32 0, metadata !99, metadata !199}
!201 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0)}
!202 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !199} ; [ DW_TAG_arg_variable ] [b] [line 53]
!203 = metadata !{i32 54, i32 0, metadata !99, metadata !199}
!204 = metadata !{i32 55, i32 0, metadata !141, metadata !199}
!205 = metadata !{i32 57, i32 0, metadata !142, metadata !199}
!206 = metadata !{i32 58, i32 0, metadata !142, metadata !199} ; [ DW_TAG_imported_module ]
!207 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0)}
!208 = metadata !{null}
!209 = metadata !{i32 136, i32 0, metadata !50, null}
!210 = metadata !{i32 139, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !50, i32 139, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!212 = metadata !{i32 140, i32 0, metadata !211, null}
!213 = metadata !{i32 142, i32 0, metadata !50, null}
!214 = metadata !{i32 143, i32 0, metadata !50, null}
!215 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [s] [line 30]
!216 = metadata !{i32 30, i32 0, metadata !85, metadata !214}
!217 = metadata !{i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)}
!218 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!219 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !214} ; [ DW_TAG_auto_variable ] [res] [line 31]
!220 = metadata !{i32 31, i32 0, metadata !85, metadata !214}
!221 = metadata !{i32 34, i32 0, metadata !173, metadata !214}
!222 = metadata !{i32 36, i32 0, metadata !85, metadata !214}
!223 = metadata !{i32 39, i32 0, metadata !176, metadata !214}
!224 = metadata !{i32 37, i32 0, metadata !177, metadata !214}
!225 = metadata !{i32 40, i32 0, metadata !181, metadata !214}
!226 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !214} ; [ DW_TAG_auto_variable ] [c] [line 32]
!227 = metadata !{i32 42, i32 0, metadata !184, metadata !214}
!228 = metadata !{i32 144, i32 0, metadata !50, null}
!229 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !228} ; [ DW_TAG_arg_variable ] [s] [line 30]
!230 = metadata !{i32 30, i32 0, metadata !85, metadata !228}
!231 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !228} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!232 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !228} ; [ DW_TAG_auto_variable ] [res] [line 31]
!233 = metadata !{i32 31, i32 0, metadata !85, metadata !228}
!234 = metadata !{i32 34, i32 0, metadata !173, metadata !228}
!235 = metadata !{i32 36, i32 0, metadata !85, metadata !228}
!236 = metadata !{i32 39, i32 0, metadata !176, metadata !228}
!237 = metadata !{i32 37, i32 0, metadata !177, metadata !228}
!238 = metadata !{i32 40, i32 0, metadata !181, metadata !228}
!239 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !228} ; [ DW_TAG_auto_variable ] [c] [line 32]
!240 = metadata !{i32 42, i32 0, metadata !184, metadata !228}
!241 = metadata !{i32 145, i32 0, metadata !50, null}
!242 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !241} ; [ DW_TAG_arg_variable ] [s] [line 30]
!243 = metadata !{i32 30, i32 0, metadata !85, metadata !241}
!244 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !241} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!245 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !241} ; [ DW_TAG_auto_variable ] [res] [line 31]
!246 = metadata !{i32 31, i32 0, metadata !85, metadata !241}
!247 = metadata !{i32 34, i32 0, metadata !173, metadata !241}
!248 = metadata !{i32 36, i32 0, metadata !85, metadata !241}
!249 = metadata !{i32 39, i32 0, metadata !176, metadata !241}
!250 = metadata !{i32 37, i32 0, metadata !177, metadata !241}
!251 = metadata !{i32 40, i32 0, metadata !181, metadata !241}
!252 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !241} ; [ DW_TAG_auto_variable ] [c] [line 32]
!253 = metadata !{i32 42, i32 0, metadata !184, metadata !241}
!254 = metadata !{i32 147, i32 0, metadata !50, null}
!255 = metadata !{i32 148, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !50, i32 148, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!257 = metadata !{i32 149, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !256, i32 148, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!259 = metadata !{i32 151, i32 0, metadata !258, null}
!260 = metadata !{i32 786689, metadata !77, metadata !"argcMax", metadata !5, i32 67108940, metadata !9, i32 0, metadata !261} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!261 = metadata !{i32 150, i32 0, metadata !258, null}
!262 = metadata !{i32 76, i32 0, metadata !77, metadata !261}
!263 = metadata !{i32 77, i32 0, metadata !191, metadata !261}
!264 = metadata !{i32 78, i32 0, metadata !193, metadata !261}
!265 = metadata !{i32 80, i32 0, metadata !195, metadata !261}
!266 = metadata !{i32 81, i32 0, metadata !195, metadata !261}
!267 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !268} ; [ DW_TAG_arg_variable ] [a] [line 53]
!268 = metadata !{i32 155, i32 0, metadata !54, null}
!269 = metadata !{i32 53, i32 0, metadata !99, metadata !268}
!270 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0)}
!271 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !268} ; [ DW_TAG_arg_variable ] [b] [line 53]
!272 = metadata !{i32 54, i32 0, metadata !99, metadata !268}
!273 = metadata !{i32 55, i32 0, metadata !141, metadata !268}
!274 = metadata !{i32 57, i32 0, metadata !142, metadata !268}
!275 = metadata !{i32 58, i32 0, metadata !142, metadata !268} ; [ DW_TAG_imported_module ]
!276 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0)}
!277 = metadata !{null}
!278 = metadata !{i32 156, i32 0, metadata !53, null}
!279 = metadata !{i32 158, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !53, i32 158, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!281 = metadata !{i32 159, i32 0, metadata !280, null}
!282 = metadata !{i32 161, i32 0, metadata !53, null}
!283 = metadata !{i32 162, i32 0, metadata !53, null}
!284 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !283} ; [ DW_TAG_arg_variable ] [s] [line 30]
!285 = metadata !{i32 30, i32 0, metadata !85, metadata !283}
!286 = metadata !{i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)}
!287 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !283} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!288 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !283} ; [ DW_TAG_auto_variable ] [res] [line 31]
!289 = metadata !{i32 31, i32 0, metadata !85, metadata !283}
!290 = metadata !{i32 34, i32 0, metadata !173, metadata !283}
!291 = metadata !{i32 36, i32 0, metadata !85, metadata !283}
!292 = metadata !{i32 39, i32 0, metadata !176, metadata !283}
!293 = metadata !{i32 37, i32 0, metadata !177, metadata !283}
!294 = metadata !{i32 40, i32 0, metadata !181, metadata !283}
!295 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !283} ; [ DW_TAG_auto_variable ] [c] [line 32]
!296 = metadata !{i32 42, i32 0, metadata !184, metadata !283}
!297 = metadata !{i32 163, i32 0, metadata !53, null}
!298 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [s] [line 30]
!299 = metadata !{i32 30, i32 0, metadata !85, metadata !297}
!300 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!301 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [res] [line 31]
!302 = metadata !{i32 31, i32 0, metadata !85, metadata !297}
!303 = metadata !{i32 34, i32 0, metadata !173, metadata !297}
!304 = metadata !{i32 36, i32 0, metadata !85, metadata !297}
!305 = metadata !{i32 39, i32 0, metadata !176, metadata !297}
!306 = metadata !{i32 37, i32 0, metadata !177, metadata !297}
!307 = metadata !{i32 40, i32 0, metadata !181, metadata !297}
!308 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [c] [line 32]
!309 = metadata !{i32 42, i32 0, metadata !184, metadata !297}
!310 = metadata !{i32 165, i32 0, metadata !53, null}
!311 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !312} ; [ DW_TAG_arg_variable ] [a] [line 53]
!312 = metadata !{i32 165, i32 0, metadata !57, null}
!313 = metadata !{i32 53, i32 0, metadata !99, metadata !312}
!314 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str12, i64 0, i64 0)}
!315 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !312} ; [ DW_TAG_arg_variable ] [b] [line 53]
!316 = metadata !{i32 54, i32 0, metadata !99, metadata !312}
!317 = metadata !{i32 55, i32 0, metadata !141, metadata !312}
!318 = metadata !{i32 57, i32 0, metadata !142, metadata !312}
!319 = metadata !{i32 58, i32 0, metadata !142, metadata !312} ; [ DW_TAG_imported_module ]
!320 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [a] [line 53]
!321 = metadata !{i32 166, i32 0, metadata !57, null}
!322 = metadata !{i32 53, i32 0, metadata !99, metadata !321}
!323 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str13, i64 0, i64 0)}
!324 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [b] [line 53]
!325 = metadata !{i32 54, i32 0, metadata !99, metadata !321}
!326 = metadata !{i32 55, i32 0, metadata !141, metadata !321}
!327 = metadata !{i32 57, i32 0, metadata !142, metadata !321}
!328 = metadata !{i32 58, i32 0, metadata !142, metadata !321} ; [ DW_TAG_imported_module ]
!329 = metadata !{null}
!330 = metadata !{i32 167, i32 0, metadata !56, null}
!331 = metadata !{i32 170, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !56, i32 170, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!333 = metadata !{i32 171, i32 0, metadata !332, null}
!334 = metadata !{i32 173, i32 0, metadata !56, null}
!335 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !334} ; [ DW_TAG_arg_variable ] [s] [line 30]
!336 = metadata !{i32 30, i32 0, metadata !85, metadata !334}
!337 = metadata !{i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)}
!338 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !334} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!339 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !334} ; [ DW_TAG_auto_variable ] [res] [line 31]
!340 = metadata !{i32 31, i32 0, metadata !85, metadata !334}
!341 = metadata !{i32 34, i32 0, metadata !173, metadata !334}
!342 = metadata !{i32 36, i32 0, metadata !85, metadata !334}
!343 = metadata !{i32 39, i32 0, metadata !176, metadata !334}
!344 = metadata !{i32 37, i32 0, metadata !177, metadata !334}
!345 = metadata !{i32 40, i32 0, metadata !181, metadata !334}
!346 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !334} ; [ DW_TAG_auto_variable ] [c] [line 32]
!347 = metadata !{i32 42, i32 0, metadata !184, metadata !334}
!348 = metadata !{i32 174, i32 0, metadata !56, null}
!349 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !350} ; [ DW_TAG_arg_variable ] [a] [line 53]
!350 = metadata !{i32 174, i32 0, metadata !63, null}
!351 = metadata !{i32 53, i32 0, metadata !99, metadata !350}
!352 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)}
!353 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !350} ; [ DW_TAG_arg_variable ] [b] [line 53]
!354 = metadata !{i32 54, i32 0, metadata !99, metadata !350}
!355 = metadata !{i32 55, i32 0, metadata !141, metadata !350}
!356 = metadata !{i32 57, i32 0, metadata !142, metadata !350}
!357 = metadata !{i32 58, i32 0, metadata !142, metadata !350} ; [ DW_TAG_imported_module ]
!358 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !359} ; [ DW_TAG_arg_variable ] [a] [line 53]
!359 = metadata !{i32 175, i32 0, metadata !63, null}
!360 = metadata !{i32 53, i32 0, metadata !99, metadata !359}
!361 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str16, i64 0, i64 0)}
!362 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !359} ; [ DW_TAG_arg_variable ] [b] [line 53]
!363 = metadata !{i32 54, i32 0, metadata !99, metadata !359}
!364 = metadata !{i32 55, i32 0, metadata !141, metadata !359}
!365 = metadata !{i32 57, i32 0, metadata !142, metadata !359}
!366 = metadata !{i32 58, i32 0, metadata !142, metadata !359} ; [ DW_TAG_imported_module ]
!367 = metadata !{i32 1}
!368 = metadata !{i32 176, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !63, i32 175, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!370 = metadata !{i32 177, i32 0, metadata !369, null}
!371 = metadata !{i32 178, i32 0, metadata !369, null}
!372 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !373} ; [ DW_TAG_arg_variable ] [a] [line 53]
!373 = metadata !{i32 179, i32 0, metadata !62, null}
!374 = metadata !{i32 53, i32 0, metadata !99, metadata !373}
!375 = metadata !{i8* getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0)}
!376 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !373} ; [ DW_TAG_arg_variable ] [b] [line 53]
!377 = metadata !{i32 54, i32 0, metadata !99, metadata !373}
!378 = metadata !{i32 55, i32 0, metadata !141, metadata !373}
!379 = metadata !{i32 57, i32 0, metadata !142, metadata !373}
!380 = metadata !{i32 58, i32 0, metadata !142, metadata !373} ; [ DW_TAG_imported_module ]
!381 = metadata !{i8* getelementptr inbounds ([17 x i8]* @.str18, i64 0, i64 0)}
!382 = metadata !{i32 180, i32 0, metadata !383, null}
!383 = metadata !{i32 786443, metadata !1, metadata !62, i32 179, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!384 = metadata !{i32 181, i32 0, metadata !383, null}
!385 = metadata !{i32 182, i32 0, metadata !383, null}
!386 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [a] [line 53]
!387 = metadata !{i32 183, i32 0, metadata !61, null}
!388 = metadata !{i32 53, i32 0, metadata !99, metadata !387}
!389 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0)}
!390 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [b] [line 53]
!391 = metadata !{i32 54, i32 0, metadata !99, metadata !387}
!392 = metadata !{i32 55, i32 0, metadata !141, metadata !387}
!393 = metadata !{i32 57, i32 0, metadata !142, metadata !387}
!394 = metadata !{i32 58, i32 0, metadata !142, metadata !387} ; [ DW_TAG_imported_module ]
!395 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str20, i64 0, i64 0)}
!396 = metadata !{i32 184, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !61, i32 183, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!398 = metadata !{i32 185, i32 0, metadata !397, null}
!399 = metadata !{i32 186, i32 0, metadata !397, null}
!400 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 16777269, metadata !47, i32 0, metadata !401} ; [ DW_TAG_arg_variable ] [a] [line 53]
!401 = metadata !{i32 187, i32 0, metadata !60, null}
!402 = metadata !{i32 53, i32 0, metadata !99, metadata !401}
!403 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str21, i64 0, i64 0)}
!404 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 33554485, metadata !47, i32 0, metadata !401} ; [ DW_TAG_arg_variable ] [b] [line 53]
!405 = metadata !{i32 54, i32 0, metadata !99, metadata !401}
!406 = metadata !{i32 55, i32 0, metadata !141, metadata !401}
!407 = metadata !{i32 57, i32 0, metadata !142, metadata !401}
!408 = metadata !{i32 58, i32 0, metadata !142, metadata !401} ; [ DW_TAG_imported_module ]
!409 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0)}
!410 = metadata !{null}
!411 = metadata !{i32 188, i32 0, metadata !59, null}
!412 = metadata !{i32 189, i32 0, metadata !413, null}
!413 = metadata !{i32 786443, metadata !1, metadata !59, i32 189, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!414 = metadata !{i32 190, i32 0, metadata !413, null}
!415 = metadata !{i32 192, i32 0, metadata !59, null}
!416 = metadata !{i32 786689, metadata !85, metadata !"s", metadata !5, i32 16777246, metadata !12, i32 0, metadata !415} ; [ DW_TAG_arg_variable ] [s] [line 30]
!417 = metadata !{i32 30, i32 0, metadata !85, metadata !415}
!418 = metadata !{i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)}
!419 = metadata !{i32 786689, metadata !85, metadata !"error_msg", metadata !5, i32 33554462, metadata !47, i32 0, metadata !415} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!420 = metadata !{i32 786688, metadata !85, metadata !"res", metadata !5, i32 31, metadata !88, i32 0, metadata !415} ; [ DW_TAG_auto_variable ] [res] [line 31]
!421 = metadata !{i32 31, i32 0, metadata !85, metadata !415}
!422 = metadata !{i32 34, i32 0, metadata !173, metadata !415}
!423 = metadata !{i32 36, i32 0, metadata !85, metadata !415}
!424 = metadata !{i32 39, i32 0, metadata !176, metadata !415}
!425 = metadata !{i32 37, i32 0, metadata !177, metadata !415}
!426 = metadata !{i32 40, i32 0, metadata !181, metadata !415}
!427 = metadata !{i32 786688, metadata !85, metadata !"c", metadata !5, i32 32, metadata !13, i32 0, metadata !415} ; [ DW_TAG_auto_variable ] [c] [line 32]
!428 = metadata !{i32 42, i32 0, metadata !184, metadata !415}
!429 = metadata !{i32 193, i32 0, metadata !59, null}
!430 = metadata !{i32 196, i32 0, metadata !431, null}
!431 = metadata !{i32 786443, metadata !1, metadata !60, i32 194, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!432 = metadata !{i32 786689, metadata !77, metadata !"argcMax", metadata !5, i32 67108940, metadata !9, i32 0, metadata !430} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!433 = metadata !{i32 76, i32 0, metadata !77, metadata !430}
!434 = metadata !{i32 77, i32 0, metadata !191, metadata !430}
!435 = metadata !{i32 78, i32 0, metadata !193, metadata !430}
!436 = metadata !{i32 80, i32 0, metadata !195, metadata !430}
!437 = metadata !{i32 81, i32 0, metadata !195, metadata !430}
!438 = metadata !{i32 201, i32 0, metadata !4, null}
!439 = metadata !{i32 206, i32 0, metadata !4, null}
!440 = metadata !{i32 208, i32 0, metadata !4, null}
!441 = metadata !{i32 210, i32 0, metadata !4, null}
!442 = metadata !{i32 23, i32 0, metadata !94, null}
!443 = metadata !{i32 24, i32 0, metadata !94, null}
!444 = metadata !{i32 63, i32 0, metadata !64, null}
!445 = metadata !{i32 65, i32 0, metadata !64, null}
!446 = metadata !{i32 66, i32 0, metadata !64, null}
!447 = metadata !{i32 67, i32 0, metadata !64, null}
!448 = metadata !{i32 69, i32 0, metadata !449, null}
!449 = metadata !{i32 786443, metadata !1, metadata !64, i32 69, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/klee_init_env.c]
!450 = metadata !{i32 70, i32 0, metadata !449, null}
!451 = metadata !{i32 786689, metadata !72, metadata !"c", metadata !5, i32 16777264, metadata !48, i32 0, metadata !450} ; [ DW_TAG_arg_variable ] [c] [line 48]
!452 = metadata !{i32 48, i32 0, metadata !72, metadata !450}
!453 = metadata !{i32 50, i32 0, metadata !72, metadata !450}
!454 = metadata !{i32 72, i32 0, metadata !64, null}
!455 = metadata !{i32 73, i32 0, metadata !64, null}

; ModuleID = '/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.timeval = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.fd_set = type { [16 x i64] }

@__exe_env = external global %struct.exe_sym_env_t
@.str1 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1
@.str2 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1
@close.n_calls = internal unnamed_addr global i32 0, align 4
@__exe_fs = external global %struct.exe_file_system_t
@read.n_calls = internal unnamed_addr global i32 0, align 4
@.str3 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@.str4 = private unnamed_addr constant [60 x i8] c"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c\00", align 1
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1
@write.n_calls = internal unnamed_addr global i32 0, align 4
@.str5 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.write = private unnamed_addr constant [41 x i8] c"ssize_t write(int, const void *, size_t)\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str7 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1
@.str8 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.__fd_lseek = private unnamed_addr constant [38 x i8] c"off64_t __fd_lseek(int, off64_t, int)\00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 1
@chmod.n_calls = internal unnamed_addr global i32 0, align 4
@fchmod.n_calls = internal unnamed_addr global i32 0, align 4
@__fd_ftruncate.n_calls = internal unnamed_addr global i32 0, align 4
@.str10 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1
@__PRETTY_FUNCTION__.__fd_getdents = private unnamed_addr constant [65 x i8] c"int __fd_getdents(unsigned int, struct dirent64 *, unsigned int)\00", align 1
@.str13 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 1
@.str14 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 1
@.str15 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 1
@.str16 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 1
@.str17 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 1
@.str18 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 1
@.str19 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 1
@.str20 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 1
@.str21 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 1
@.str22 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@getcwd.n_calls = internal unnamed_addr global i32 0, align 4
@.str23 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str24 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @access(i8* %pathname, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !33), !dbg !688
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !34), !dbg !688
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !689), !dbg !691
  %1 = load i8* %pathname, align 1, !dbg !692, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !696), !dbg !692
  %2 = sext i8 %1 to i32, !dbg !697
  %3 = icmp eq i8 %1, 0, !dbg !697
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !697

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !697
  %6 = load i8* %5, align 1, !dbg !697, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !697
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !697

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !699, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !699
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !699

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !699
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !699

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !704
  %12 = ashr exact i32 %sext.i, 24, !dbg !704
  %13 = add nsw i32 %12, 65, !dbg !704
  %14 = icmp eq i32 %2, %13, !dbg !704
  %15 = add i32 %i.02.i, 1, !dbg !699
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !705), !dbg !699
  br i1 %14, label %16, label %10, !dbg !704

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !706
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !706, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !708
  %20 = load %struct.stat64** %19, align 8, !dbg !708, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !708
  %22 = load i64* %21, align 8, !dbg !708, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !708
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !706
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !716
  %or.cond = or i1 %23, %25, !dbg !708
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %56, !dbg !708

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !717) #5, !dbg !719
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !720) #5, !dbg !722
  %26 = ptrtoint i8* %pathname to i64, !dbg !723
  %27 = tail call i64 @klee_get_valuel(i64 %26) #5, !dbg !723
  %28 = inttoptr i64 %27 to i8*, !dbg !723
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !724) #5, !dbg !723
  %29 = icmp eq i8* %28, %pathname, !dbg !725
  %30 = zext i1 %29 to i64, !dbg !725
  tail call void @klee_assume(i64 %30) #5, !dbg !725
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !726) #5, !dbg !721
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !727) #5, !dbg !728
  br label %31, !dbg !728

; <label>:31                                      ; preds = %48, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %49, %48 ]
  %sc.0.i = phi i8* [ %28, %__get_sym_file.exit.thread ], [ %sc.1.i, %48 ]
  %32 = load i8* %sc.0.i, align 1, !dbg !729, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %32}, i64 0, metadata !730) #5, !dbg !729
  %33 = add i32 %i.0.i, -1, !dbg !731
  %34 = and i32 %33, %i.0.i, !dbg !731
  %35 = icmp eq i32 %34, 0, !dbg !731
  br i1 %35, label %36, label %40, !dbg !731

; <label>:36                                      ; preds = %31
  switch i8 %32, label %48 [
    i8 0, label %37
    i8 47, label %38
  ], !dbg !732

; <label>:37                                      ; preds = %36
  store i8 0, i8* %sc.0.i, align 1, !dbg !735, !tbaa !693
  br label %__concretize_string.exit, !dbg !737

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !738
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !726) #5, !dbg !738
  store i8 47, i8* %sc.0.i, align 1, !dbg !738, !tbaa !693
  br label %48, !dbg !741

; <label>:40                                      ; preds = %31
  %41 = sext i8 %32 to i64, !dbg !742
  %42 = tail call i64 @klee_get_valuel(i64 %41) #5, !dbg !742
  %43 = trunc i64 %42 to i8, !dbg !742
  tail call void @llvm.dbg.value(metadata !{i8 %43}, i64 0, metadata !743) #5, !dbg !742
  %44 = icmp eq i8 %43, %32, !dbg !744
  %45 = zext i1 %44 to i64, !dbg !744
  tail call void @klee_assume(i64 %45) #5, !dbg !744
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !745
  tail call void @llvm.dbg.value(metadata !{i8* %46}, i64 0, metadata !726) #5, !dbg !745
  store i8 %43, i8* %sc.0.i, align 1, !dbg !745, !tbaa !693
  %47 = icmp eq i8 %43, 0, !dbg !746
  br i1 %47, label %__concretize_string.exit, label %48, !dbg !746

; <label>:48                                      ; preds = %40, %38, %36
  %sc.1.i = phi i8* [ %46, %40 ], [ %39, %38 ], [ %sc.0.i, %36 ]
  %49 = add i32 %i.0.i, 1, !dbg !728
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !727) #5, !dbg !728
  br label %31, !dbg !728

__concretize_string.exit:                         ; preds = %40, %37
  %50 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) #5, !dbg !718
  %51 = trunc i64 %50 to i32, !dbg !718
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !85), !dbg !718
  %52 = icmp eq i32 %51, -1, !dbg !748
  br i1 %52, label %53, label %56, !dbg !748

; <label>:53                                      ; preds = %__concretize_string.exit
  %54 = tail call i32 @klee_get_errno() #5, !dbg !750
  %55 = tail call i32* @__errno_location() #1, !dbg !750
  store i32 %54, i32* %55, align 4, !dbg !750, !tbaa !751
  br label %56, !dbg !750

; <label>:56                                      ; preds = %16, %__concretize_string.exit, %53
  %.0 = phi i32 [ -1, %53 ], [ %51, %__concretize_string.exit ], [ 0, %16 ]
  ret i32 %.0, !dbg !752
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) #2

declare i32 @klee_get_errno() #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

; Function Attrs: nounwind uwtable
define i32 @umask(i32 %mask) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !93), !dbg !753
  %1 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !754, !tbaa !755
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !94), !dbg !754
  %2 = and i32 %mask, 511, !dbg !757
  store i32 %2, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !757, !tbaa !755
  ret i32 %1, !dbg !758
}

; Function Attrs: nounwind uwtable
define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !99), !dbg !759
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !100), !dbg !759
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !101), !dbg !759
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !114), !dbg !760
  br label %4, !dbg !760

; <label>:1                                       ; preds = %4
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !760
  %3 = icmp slt i32 %2, 32, !dbg !760
  br i1 %3, label %4, label %10, !dbg !760

; <label>:4                                       ; preds = %0, %1
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %1 ]
  %fd.04 = phi i32 [ 0, %0 ], [ %9, %1 ]
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !762
  %6 = load i32* %5, align 4, !dbg !762, !tbaa !764
  %7 = and i32 %6, 1, !dbg !762
  %8 = icmp eq i32 %7, 0, !dbg !762
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !760
  %9 = add nsw i32 %fd.04, 1, !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !114), !dbg !760
  br i1 %8, label %10, label %1, !dbg !762

; <label>:10                                      ; preds = %4, %1
  %fd.0.lcssa = phi i32 [ %fd.04, %4 ], [ %9, %1 ]
  %11 = icmp eq i32 %fd.0.lcssa, 32, !dbg !766
  br i1 %11, label %12, label %14, !dbg !766

; <label>:12                                      ; preds = %10
  %13 = tail call i32* @__errno_location() #1, !dbg !768
  store i32 24, i32* %13, align 4, !dbg !768, !tbaa !751
  br label %104, !dbg !770

; <label>:14                                      ; preds = %10
  %15 = sext i32 %fd.0.lcssa to i64, !dbg !771
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, !dbg !771
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %16}, i64 0, metadata !103), !dbg !771
  %17 = bitcast %struct.exe_file_t* %16 to i8*, !dbg !772
  tail call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 24, i32 8, i1 false), !dbg !772
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !773), !dbg !775
  %18 = load i8* %pathname, align 1, !dbg !776, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %18}, i64 0, metadata !777), !dbg !776
  %19 = sext i8 %18 to i32, !dbg !778
  %20 = icmp eq i8 %18, 0, !dbg !778
  br i1 %20, label %__get_sym_file.exit.thread, label %21, !dbg !778

; <label>:21                                      ; preds = %14
  %22 = getelementptr inbounds i8* %pathname, i64 1, !dbg !778
  %23 = load i8* %22, align 1, !dbg !778, !tbaa !693
  %24 = icmp eq i8 %23, 0, !dbg !778
  br i1 %24, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !778

.preheader.i:                                     ; preds = %21
  %25 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !779, !tbaa !700
  %26 = icmp eq i32 %25, 0, !dbg !779
  br i1 %26, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !779

; <label>:27                                      ; preds = %.lr.ph.i
  %28 = icmp ult i32 %32, %25, !dbg !779
  br i1 %28, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !779

.lr.ph.i:                                         ; preds = %.preheader.i, %27
  %i.02.i = phi i32 [ %32, %27 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !780
  %29 = ashr exact i32 %sext.i, 24, !dbg !780
  %30 = add nsw i32 %29, 65, !dbg !780
  %31 = icmp eq i32 %19, %30, !dbg !780
  %32 = add i32 %i.02.i, 1, !dbg !779
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !781), !dbg !779
  br i1 %31, label %33, label %27, !dbg !780

; <label>:33                                      ; preds = %.lr.ph.i
  %34 = zext i32 %i.02.i to i64, !dbg !782
  %35 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !782, !tbaa !707
  %36 = getelementptr inbounds %struct.exe_disk_file_t* %35, i64 %34, i32 2, !dbg !783
  %37 = load %struct.stat64** %36, align 8, !dbg !783, !tbaa !710
  %38 = getelementptr inbounds %struct.stat64* %37, i64 0, i32 1, !dbg !783
  %39 = load i64* %38, align 8, !dbg !783, !tbaa !712
  %40 = icmp eq i64 %39, 0, !dbg !783
  br i1 %40, label %__get_sym_file.exit.thread, label %__get_sym_file.exit, !dbg !783

__get_sym_file.exit:                              ; preds = %33
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %35, i64 %34, !dbg !782
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %41}, i64 0, metadata !102), !dbg !774
  %42 = icmp eq %struct.exe_disk_file_t* %41, null, !dbg !784
  br i1 %42, label %__get_sym_file.exit.thread, label %43, !dbg !784

; <label>:43                                      ; preds = %__get_sym_file.exit
  %44 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, i32 3, !dbg !785
  store %struct.exe_disk_file_t* %41, %struct.exe_disk_file_t** %44, align 8, !dbg !785, !tbaa !787
  %45 = and i32 %flags, 192, !dbg !788
  switch i32 %45, label %50 [
    i32 192, label %46
    i32 128, label %48
  ], !dbg !788

; <label>:46                                      ; preds = %43
  %47 = tail call i32* @__errno_location() #1, !dbg !790
  store i32 17, i32* %47, align 4, !dbg !790, !tbaa !751
  br label %104, !dbg !792

; <label>:48                                      ; preds = %43
  tail call void @klee_warning(i8* getelementptr inbounds ([47 x i8]* @.str1, i64 0, i64 0)) #5, !dbg !793
  %49 = tail call i32* @__errno_location() #1, !dbg !796
  store i32 13, i32* %49, align 4, !dbg !796, !tbaa !751
  br label %104, !dbg !797

; <label>:50                                      ; preds = %43
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !798), !dbg !801
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %37}, i64 0, metadata !802), !dbg !801
  %51 = getelementptr inbounds %struct.stat64* %37, i64 0, i32 3, !dbg !803
  %52 = load i32* %51, align 4, !dbg !803, !tbaa !804
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !805), !dbg !803
  %53 = and i32 %flags, 2, !dbg !806
  %54 = icmp eq i32 %53, 0, !dbg !806
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !808), !dbg !809
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !810), !dbg !811
  %55 = and i32 %52, 292, !dbg !813
  %56 = icmp eq i32 %55, 0, !dbg !813
  %or.cond3.i = or i1 %54, %56, !dbg !813
  br i1 %or.cond3.i, label %has_permission.exit, label %has_permission.exit.thread, !dbg !813

has_permission.exit:                              ; preds = %50
  %57 = and i32 %flags, 3, !dbg !815
  %not..i = icmp ne i32 %57, 0, !dbg !815
  %58 = and i32 %52, 146, !dbg !816
  %59 = icmp eq i32 %58, 0, !dbg !816
  %or.cond5.i = and i1 %not..i, %59, !dbg !816
  br i1 %or.cond5.i, label %has_permission.exit.thread, label %61, !dbg !799

has_permission.exit.thread:                       ; preds = %50, %has_permission.exit
  %60 = tail call i32* @__errno_location() #1, !dbg !818
  store i32 13, i32* %60, align 4, !dbg !818, !tbaa !751
  br label %104, !dbg !820

; <label>:61                                      ; preds = %has_permission.exit
  %62 = and i32 %52, -512, !dbg !821
  %63 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !821, !tbaa !755
  %64 = xor i32 %63, -1, !dbg !821
  %65 = and i32 %64, %mode, !dbg !821
  %66 = or i32 %65, %62, !dbg !821
  store i32 %66, i32* %51, align 4, !dbg !821, !tbaa !804
  br label %99, !dbg !822

__get_sym_file.exit.thread:                       ; preds = %27, %.preheader.i, %33, %14, %21, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !823) #5, !dbg !825
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !826) #5, !dbg !828
  %67 = ptrtoint i8* %pathname to i64, !dbg !829
  %68 = tail call i64 @klee_get_valuel(i64 %67) #5, !dbg !829
  %69 = inttoptr i64 %68 to i8*, !dbg !829
  tail call void @llvm.dbg.value(metadata !{i8* %69}, i64 0, metadata !830) #5, !dbg !829
  %70 = icmp eq i8* %69, %pathname, !dbg !831
  %71 = zext i1 %70 to i64, !dbg !831
  tail call void @klee_assume(i64 %71) #5, !dbg !831
  tail call void @llvm.dbg.value(metadata !{i8* %69}, i64 0, metadata !832) #5, !dbg !827
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !833) #5, !dbg !834
  br label %72, !dbg !834

; <label>:72                                      ; preds = %89, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %90, %89 ]
  %sc.0.i = phi i8* [ %69, %__get_sym_file.exit.thread ], [ %sc.1.i, %89 ]
  %73 = load i8* %sc.0.i, align 1, !dbg !835, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !836) #5, !dbg !835
  %74 = add i32 %i.0.i, -1, !dbg !837
  %75 = and i32 %74, %i.0.i, !dbg !837
  %76 = icmp eq i32 %75, 0, !dbg !837
  br i1 %76, label %77, label %81, !dbg !837

; <label>:77                                      ; preds = %72
  switch i8 %73, label %89 [
    i8 0, label %78
    i8 47, label %79
  ], !dbg !838

; <label>:78                                      ; preds = %77
  store i8 0, i8* %sc.0.i, align 1, !dbg !839, !tbaa !693
  br label %__concretize_string.exit, !dbg !840

; <label>:79                                      ; preds = %77
  %80 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !841
  tail call void @llvm.dbg.value(metadata !{i8* %80}, i64 0, metadata !832) #5, !dbg !841
  store i8 47, i8* %sc.0.i, align 1, !dbg !841, !tbaa !693
  br label %89, !dbg !842

; <label>:81                                      ; preds = %72
  %82 = sext i8 %73 to i64, !dbg !843
  %83 = tail call i64 @klee_get_valuel(i64 %82) #5, !dbg !843
  %84 = trunc i64 %83 to i8, !dbg !843
  tail call void @llvm.dbg.value(metadata !{i8 %84}, i64 0, metadata !844) #5, !dbg !843
  %85 = icmp eq i8 %84, %73, !dbg !845
  %86 = zext i1 %85 to i64, !dbg !845
  tail call void @klee_assume(i64 %86) #5, !dbg !845
  %87 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !846
  tail call void @llvm.dbg.value(metadata !{i8* %87}, i64 0, metadata !832) #5, !dbg !846
  store i8 %84, i8* %sc.0.i, align 1, !dbg !846, !tbaa !693
  %88 = icmp eq i8 %84, 0, !dbg !847
  br i1 %88, label %__concretize_string.exit, label %89, !dbg !847

; <label>:89                                      ; preds = %81, %79, %77
  %sc.1.i = phi i8* [ %87, %81 ], [ %80, %79 ], [ %sc.0.i, %77 ]
  %90 = add i32 %i.0.i, 1, !dbg !834
  tail call void @llvm.dbg.value(metadata !{i32 %90}, i64 0, metadata !833) #5, !dbg !834
  br label %72, !dbg !834

__concretize_string.exit:                         ; preds = %81, %78
  %91 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) #5, !dbg !824
  %92 = trunc i64 %91 to i32, !dbg !824
  tail call void @llvm.dbg.value(metadata !{i32 %92}, i64 0, metadata !115), !dbg !824
  %93 = icmp eq i32 %92, -1, !dbg !848
  br i1 %93, label %94, label %97, !dbg !848

; <label>:94                                      ; preds = %__concretize_string.exit
  %95 = tail call i32 @klee_get_errno() #5, !dbg !850
  %96 = tail call i32* @__errno_location() #1, !dbg !850
  store i32 %95, i32* %96, align 4, !dbg !850, !tbaa !751
  br label %104, !dbg !852

; <label>:97                                      ; preds = %__concretize_string.exit
  %98 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !853
  store i32 %92, i32* %98, align 8, !dbg !853, !tbaa !854
  %.pre = and i32 %flags, 3, !dbg !855
  br label %99

; <label>:99                                      ; preds = %97, %61
  %.pre-phi = phi i32 [ %.pre, %97 ], [ %57, %61 ], !dbg !855
  %100 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, i32 1, !dbg !857
  store i32 1, i32* %100, align 4, !dbg !857, !tbaa !764
  switch i32 %.pre-phi, label %103 [
    i32 0, label %101
    i32 1, label %102
  ], !dbg !855

; <label>:101                                     ; preds = %99
  store i32 5, i32* %100, align 4, !dbg !858, !tbaa !764
  br label %104, !dbg !860

; <label>:102                                     ; preds = %99
  store i32 9, i32* %100, align 4, !dbg !861, !tbaa !764
  br label %104, !dbg !864

; <label>:103                                     ; preds = %99
  store i32 13, i32* %100, align 4, !dbg !865, !tbaa !764
  br label %104

; <label>:104                                     ; preds = %101, %103, %102, %94, %has_permission.exit.thread, %48, %46, %12
  %.0 = phi i32 [ -1, %12 ], [ -1, %46 ], [ -1, %has_permission.exit.thread ], [ -1, %48 ], [ -1, %94 ], [ %fd.0.lcssa, %102 ], [ %fd.0.lcssa, %103 ], [ %fd.0.lcssa, %101 ]
  ret i32 %.0, !dbg !867
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

declare void @klee_warning(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @__fd_openat(i32 %basefd, i8* %pathname, i32 %flags, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !122), !dbg !868
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !123), !dbg !868
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !124), !dbg !868
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !125), !dbg !868
  %1 = icmp eq i32 %basefd, -100, !dbg !869
  br i1 %1, label %22, label %2, !dbg !869

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !870), !dbg !872
  %3 = icmp ult i32 %basefd, 32, !dbg !873
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !873

; <label>:4                                       ; preds = %2
  %5 = sext i32 %basefd to i64, !dbg !874
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !875
  %7 = load i32* %6, align 4, !dbg !875, !tbaa !764
  %8 = and i32 %7, 1, !dbg !875
  %9 = icmp eq i32 %8, 0, !dbg !875
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !875

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !874
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !128), !dbg !871
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !877
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !877

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !879
  store i32 9, i32* %12, align 4, !dbg !879, !tbaa !751
  br label %103, !dbg !881

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !882
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !882, !tbaa !787
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !882
  br i1 %16, label %19, label %17, !dbg !882

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !884
  %18 = tail call i32* @__errno_location() #1, !dbg !886
  store i32 2, i32* %18, align 4, !dbg !886, !tbaa !751
  br label %103, !dbg !887

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !888
  %21 = load i32* %20, align 8, !dbg !888, !tbaa !854
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !122), !dbg !888
  %phitmp = sext i32 %21 to i64, !dbg !889
  br label %22, !dbg !889

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !890), !dbg !893
  %23 = load i8* %pathname, align 1, !dbg !894, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !895), !dbg !894
  %24 = sext i8 %23 to i32, !dbg !896
  %25 = icmp eq i8 %23, 0, !dbg !896
  br i1 %25, label %__get_sym_file.exit.thread.preheader, label %26, !dbg !896

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %pathname, i64 1, !dbg !896
  %28 = load i8* %27, align 1, !dbg !896, !tbaa !693
  %29 = icmp eq i8 %28, 0, !dbg !896
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread.preheader, !dbg !896

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !897, !tbaa !700
  %31 = icmp eq i32 %30, 0, !dbg !897
  br i1 %31, label %__get_sym_file.exit.thread.preheader, label %.lr.ph.i, !dbg !897

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !897
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread.preheader, !dbg !897

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !898
  %34 = ashr exact i32 %sext.i, 24, !dbg !898
  %35 = add nsw i32 %34, 65, !dbg !898
  %36 = icmp eq i32 %24, %35, !dbg !898
  %37 = add i32 %i.02.i, 1, !dbg !897
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !899), !dbg !897
  br i1 %36, label %38, label %32, !dbg !898

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !900
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !900, !tbaa !707
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !901
  %42 = load %struct.stat64** %41, align 8, !dbg !901, !tbaa !710
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !901
  %44 = load i64* %43, align 8, !dbg !901, !tbaa !712
  %45 = icmp eq i64 %44, 0, !dbg !901
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !900
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !891
  %or.cond = or i1 %45, %47, !dbg !901
  br i1 %or.cond, label %__get_sym_file.exit.thread.preheader, label %48, !dbg !901

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode), !dbg !902
  br label %103, !dbg !902

__get_sym_file.exit.thread:                       ; preds = %__get_sym_file.exit.thread.preheader
  %50 = trunc i64 %indvars.iv.next to i32, !dbg !904
  %51 = icmp slt i32 %50, 32, !dbg !904
  br i1 %51, label %__get_sym_file.exit.thread.preheader, label %57, !dbg !904

__get_sym_file.exit.thread.preheader:             ; preds = %.preheader.i, %38, %22, %26, %32, %__get_sym_file.exit.thread
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %26 ], [ 0, %22 ], [ 0, %38 ], [ 0, %.preheader.i ]
  %fd.05 = phi i32 [ %56, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %26 ], [ 0, %22 ], [ 0, %38 ], [ 0, %.preheader.i ]
  %52 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !906
  %53 = load i32* %52, align 4, !dbg !906, !tbaa !764
  %54 = and i32 %53, 1, !dbg !906
  %55 = icmp eq i32 %54, 0, !dbg !906
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !904
  %56 = add nsw i32 %fd.05, 1, !dbg !904
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !127), !dbg !904
  br i1 %55, label %57, label %__get_sym_file.exit.thread, !dbg !906

; <label>:57                                      ; preds = %__get_sym_file.exit.thread.preheader, %__get_sym_file.exit.thread
  %fd.0.lcssa = phi i32 [ %fd.05, %__get_sym_file.exit.thread.preheader ], [ %56, %__get_sym_file.exit.thread ]
  %58 = icmp eq i32 %fd.0.lcssa, 32, !dbg !908
  br i1 %58, label %59, label %61, !dbg !908

; <label>:59                                      ; preds = %57
  %60 = tail call i32* @__errno_location() #1, !dbg !910
  store i32 24, i32* %60, align 4, !dbg !910, !tbaa !751
  br label %103, !dbg !912

; <label>:61                                      ; preds = %57
  %62 = sext i32 %fd.0.lcssa to i64, !dbg !913
  %63 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %62, !dbg !913
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %63}, i64 0, metadata !126), !dbg !913
  %64 = bitcast %struct.exe_file_t* %63 to i8*, !dbg !914
  tail call void @llvm.memset.p0i8.i64(i8* %64, i8 0, i64 24, i32 8, i1 false), !dbg !914
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !915) #5, !dbg !917
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !918) #5, !dbg !920
  %65 = ptrtoint i8* %pathname to i64, !dbg !921
  %66 = tail call i64 @klee_get_valuel(i64 %65) #5, !dbg !921
  %67 = inttoptr i64 %66 to i8*, !dbg !921
  tail call void @llvm.dbg.value(metadata !{i8* %67}, i64 0, metadata !922) #5, !dbg !921
  %68 = icmp eq i8* %67, %pathname, !dbg !923
  %69 = zext i1 %68 to i64, !dbg !923
  tail call void @klee_assume(i64 %69) #5, !dbg !923
  tail call void @llvm.dbg.value(metadata !{i8* %67}, i64 0, metadata !924) #5, !dbg !919
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !925) #5, !dbg !926
  br label %70, !dbg !926

; <label>:70                                      ; preds = %87, %61
  %i.0.i = phi i32 [ 0, %61 ], [ %88, %87 ]
  %sc.0.i = phi i8* [ %67, %61 ], [ %sc.1.i, %87 ]
  %71 = load i8* %sc.0.i, align 1, !dbg !927, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %71}, i64 0, metadata !928) #5, !dbg !927
  %72 = add i32 %i.0.i, -1, !dbg !929
  %73 = and i32 %72, %i.0.i, !dbg !929
  %74 = icmp eq i32 %73, 0, !dbg !929
  br i1 %74, label %75, label %79, !dbg !929

; <label>:75                                      ; preds = %70
  switch i8 %71, label %87 [
    i8 0, label %76
    i8 47, label %77
  ], !dbg !930

; <label>:76                                      ; preds = %75
  store i8 0, i8* %sc.0.i, align 1, !dbg !931, !tbaa !693
  br label %__concretize_string.exit, !dbg !932

; <label>:77                                      ; preds = %75
  %78 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !933
  tail call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !924) #5, !dbg !933
  store i8 47, i8* %sc.0.i, align 1, !dbg !933, !tbaa !693
  br label %87, !dbg !934

; <label>:79                                      ; preds = %70
  %80 = sext i8 %71 to i64, !dbg !935
  %81 = tail call i64 @klee_get_valuel(i64 %80) #5, !dbg !935
  %82 = trunc i64 %81 to i8, !dbg !935
  tail call void @llvm.dbg.value(metadata !{i8 %82}, i64 0, metadata !936) #5, !dbg !935
  %83 = icmp eq i8 %82, %71, !dbg !937
  %84 = zext i1 %83 to i64, !dbg !937
  tail call void @klee_assume(i64 %84) #5, !dbg !937
  %85 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !938
  tail call void @llvm.dbg.value(metadata !{i8* %85}, i64 0, metadata !924) #5, !dbg !938
  store i8 %82, i8* %sc.0.i, align 1, !dbg !938, !tbaa !693
  %86 = icmp eq i8 %82, 0, !dbg !939
  br i1 %86, label %__concretize_string.exit, label %87, !dbg !939

; <label>:87                                      ; preds = %79, %77, %75
  %sc.1.i = phi i8* [ %85, %79 ], [ %78, %77 ], [ %sc.0.i, %75 ]
  %88 = add i32 %i.0.i, 1, !dbg !926
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !925) #5, !dbg !926
  br label %70, !dbg !926

__concretize_string.exit:                         ; preds = %79, %76
  %89 = sext i32 %flags to i64, !dbg !916
  %90 = tail call i64 (i64, ...)* @syscall(i64 257, i64 %.01, i8* %pathname, i64 %89, i32 %mode) #5, !dbg !916
  %91 = trunc i64 %90 to i32, !dbg !916
  tail call void @llvm.dbg.value(metadata !{i32 %91}, i64 0, metadata !131), !dbg !916
  %92 = icmp eq i32 %91, -1, !dbg !940
  br i1 %92, label %93, label %96, !dbg !940

; <label>:93                                      ; preds = %__concretize_string.exit
  %94 = tail call i32 @klee_get_errno() #5, !dbg !942
  %95 = tail call i32* @__errno_location() #1, !dbg !942
  store i32 %94, i32* %95, align 4, !dbg !942, !tbaa !751
  br label %103, !dbg !944

; <label>:96                                      ; preds = %__concretize_string.exit
  %97 = getelementptr inbounds %struct.exe_file_t* %63, i64 0, i32 0, !dbg !945
  store i32 %91, i32* %97, align 8, !dbg !945, !tbaa !854
  %98 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %62, i32 1, !dbg !946
  store i32 1, i32* %98, align 4, !dbg !946, !tbaa !764
  %99 = and i32 %flags, 3, !dbg !947
  switch i32 %99, label %102 [
    i32 0, label %100
    i32 1, label %101
  ], !dbg !947

; <label>:100                                     ; preds = %96
  store i32 5, i32* %98, align 4, !dbg !949, !tbaa !764
  br label %103, !dbg !951

; <label>:101                                     ; preds = %96
  store i32 9, i32* %98, align 4, !dbg !952, !tbaa !764
  br label %103, !dbg !955

; <label>:102                                     ; preds = %96
  store i32 13, i32* %98, align 4, !dbg !956, !tbaa !764
  br label %103

; <label>:103                                     ; preds = %100, %102, %101, %93, %59, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %59 ], [ -1, %93 ], [ -1, %__get_file.exit.thread ], [ %fd.0.lcssa, %101 ], [ %fd.0.lcssa, %102 ], [ %fd.0.lcssa, %100 ]
  ret i32 %.0, !dbg !958
}

; Function Attrs: nounwind uwtable
define i32 @utimes(i8* %path, %struct.timeval* %times) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !144), !dbg !959
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !145), !dbg !959
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !960), !dbg !962
  %1 = load i8* %path, align 1, !dbg !963, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !964), !dbg !963
  %2 = sext i8 %1 to i32, !dbg !965
  %3 = icmp eq i8 %1, 0, !dbg !965
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !965

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !965
  %6 = load i8* %5, align 1, !dbg !965, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !965
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !965

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !966, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !966
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !966

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !966
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !966

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !967
  %12 = ashr exact i32 %sext.i, 24, !dbg !967
  %13 = add nsw i32 %12, 65, !dbg !967
  %14 = icmp eq i32 %2, %13, !dbg !967
  %15 = add i32 %i.02.i, 1, !dbg !966
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !968), !dbg !966
  br i1 %14, label %16, label %10, !dbg !967

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !969
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !969, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !970
  %20 = load %struct.stat64** %19, align 8, !dbg !970, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !970
  %22 = load i64* %21, align 8, !dbg !970, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !970
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !969
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !971
  %or.cond = or i1 %23, %25, !dbg !970
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !970

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.timeval* %times, i64 0, i32 0, !dbg !973
  %28 = load i64* %27, align 8, !dbg !973, !tbaa !975
  %29 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 11, i32 0, !dbg !973
  store i64 %28, i64* %29, align 8, !dbg !973, !tbaa !977
  %30 = getelementptr inbounds %struct.timeval* %times, i64 1, i32 0, !dbg !978
  %31 = load i64* %30, align 8, !dbg !978, !tbaa !975
  %32 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 12, i32 0, !dbg !978
  store i64 %31, i64* %32, align 8, !dbg !978, !tbaa !979
  %33 = mul nsw i64 %28, 1000000000, !dbg !980
  %34 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 11, i32 1, !dbg !980
  store i64 %33, i64* %34, align 8, !dbg !980, !tbaa !981
  %35 = mul nsw i64 %31, 1000000000, !dbg !982
  %36 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 12, i32 1, !dbg !982
  store i64 %35, i64* %36, align 8, !dbg !982, !tbaa !983
  br label %67, !dbg !984

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !985) #5, !dbg !987
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !988) #5, !dbg !990
  %37 = ptrtoint i8* %path to i64, !dbg !991
  %38 = tail call i64 @klee_get_valuel(i64 %37) #5, !dbg !991
  %39 = inttoptr i64 %38 to i8*, !dbg !991
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !992) #5, !dbg !991
  %40 = icmp eq i8* %39, %path, !dbg !993
  %41 = zext i1 %40 to i64, !dbg !993
  tail call void @klee_assume(i64 %41) #5, !dbg !993
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !994) #5, !dbg !989
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !995) #5, !dbg !996
  br label %42, !dbg !996

; <label>:42                                      ; preds = %59, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %60, %59 ]
  %sc.0.i = phi i8* [ %39, %__get_sym_file.exit.thread ], [ %sc.1.i, %59 ]
  %43 = load i8* %sc.0.i, align 1, !dbg !997, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %43}, i64 0, metadata !998) #5, !dbg !997
  %44 = add i32 %i.0.i, -1, !dbg !999
  %45 = and i32 %44, %i.0.i, !dbg !999
  %46 = icmp eq i32 %45, 0, !dbg !999
  br i1 %46, label %47, label %51, !dbg !999

; <label>:47                                      ; preds = %42
  switch i8 %43, label %59 [
    i8 0, label %48
    i8 47, label %49
  ], !dbg !1000

; <label>:48                                      ; preds = %47
  store i8 0, i8* %sc.0.i, align 1, !dbg !1001, !tbaa !693
  br label %__concretize_string.exit, !dbg !1002

; <label>:49                                      ; preds = %47
  %50 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1003
  tail call void @llvm.dbg.value(metadata !{i8* %50}, i64 0, metadata !994) #5, !dbg !1003
  store i8 47, i8* %sc.0.i, align 1, !dbg !1003, !tbaa !693
  br label %59, !dbg !1004

; <label>:51                                      ; preds = %42
  %52 = sext i8 %43 to i64, !dbg !1005
  %53 = tail call i64 @klee_get_valuel(i64 %52) #5, !dbg !1005
  %54 = trunc i64 %53 to i8, !dbg !1005
  tail call void @llvm.dbg.value(metadata !{i8 %54}, i64 0, metadata !1006) #5, !dbg !1005
  %55 = icmp eq i8 %54, %43, !dbg !1007
  %56 = zext i1 %55 to i64, !dbg !1007
  tail call void @klee_assume(i64 %56) #5, !dbg !1007
  %57 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1008
  tail call void @llvm.dbg.value(metadata !{i8* %57}, i64 0, metadata !994) #5, !dbg !1008
  store i8 %54, i8* %sc.0.i, align 1, !dbg !1008, !tbaa !693
  %58 = icmp eq i8 %54, 0, !dbg !1009
  br i1 %58, label %__concretize_string.exit, label %59, !dbg !1009

; <label>:59                                      ; preds = %51, %49, %47
  %sc.1.i = phi i8* [ %57, %51 ], [ %50, %49 ], [ %sc.0.i, %47 ]
  %60 = add i32 %i.0.i, 1, !dbg !996
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !995) #5, !dbg !996
  br label %42, !dbg !996

__concretize_string.exit:                         ; preds = %51, %48
  %61 = tail call i64 (i64, ...)* @syscall(i64 235, i8* %path, %struct.timeval* %times) #5, !dbg !986
  %62 = trunc i64 %61 to i32, !dbg !986
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !147), !dbg !986
  %63 = icmp eq i32 %62, -1, !dbg !1010
  br i1 %63, label %64, label %67, !dbg !1010

; <label>:64                                      ; preds = %__concretize_string.exit
  %65 = tail call i32 @klee_get_errno() #5, !dbg !1012
  %66 = tail call i32* @__errno_location() #1, !dbg !1012
  store i32 %65, i32* %66, align 4, !dbg !1012, !tbaa !751
  br label %67, !dbg !1012

; <label>:67                                      ; preds = %__concretize_string.exit, %64, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %64 ], [ %62, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1013
}

; Function Attrs: nounwind uwtable
define i32 @futimesat(i32 %fd, i8* %path, %struct.timeval* %times) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !152), !dbg !1014
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !153), !dbg !1014
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !154), !dbg !1014
  %1 = icmp eq i32 %fd, -100, !dbg !1015
  br i1 %1, label %22, label %2, !dbg !1015

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1016), !dbg !1018
  %3 = icmp ult i32 %fd, 32, !dbg !1019
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1019

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !1020
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1021
  %7 = load i32* %6, align 4, !dbg !1021, !tbaa !764
  %8 = and i32 %7, 1, !dbg !1021
  %9 = icmp eq i32 %8, 0, !dbg !1021
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1021

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1020
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !155), !dbg !1017
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1022
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1022

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1024
  store i32 9, i32* %12, align 4, !dbg !1024, !tbaa !751
  br label %83, !dbg !1026

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1027
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !1027, !tbaa !787
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !1027
  br i1 %16, label %19, label %17, !dbg !1027

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1029
  %18 = tail call i32* @__errno_location() #1, !dbg !1031
  store i32 2, i32* %18, align 4, !dbg !1031, !tbaa !751
  br label %83, !dbg !1032

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1033
  %21 = load i32* %20, align 8, !dbg !1033, !tbaa !854
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !152), !dbg !1033
  %phitmp = sext i32 %21 to i64, !dbg !1034
  br label %22, !dbg !1034

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1035), !dbg !1038
  %23 = load i8* %path, align 1, !dbg !1039, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !1040), !dbg !1039
  %24 = sext i8 %23 to i32, !dbg !1041
  %25 = icmp eq i8 %23, 0, !dbg !1041
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !1041

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !1041
  %28 = load i8* %27, align 1, !dbg !1041, !tbaa !693
  %29 = icmp eq i8 %28, 0, !dbg !1041
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1041

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1042, !tbaa !700
  %31 = icmp eq i32 %30, 0, !dbg !1042
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1042

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !1042
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1042

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1043
  %34 = ashr exact i32 %sext.i, 24, !dbg !1043
  %35 = add nsw i32 %34, 65, !dbg !1043
  %36 = icmp eq i32 %24, %35, !dbg !1043
  %37 = add i32 %i.02.i, 1, !dbg !1042
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !1044), !dbg !1042
  br i1 %36, label %38, label %32, !dbg !1043

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !1045
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1045, !tbaa !707
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !1046
  %42 = load %struct.stat64** %41, align 8, !dbg !1046, !tbaa !710
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !1046
  %44 = load i64* %43, align 8, !dbg !1046, !tbaa !712
  %45 = icmp eq i64 %44, 0, !dbg !1046
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !1045
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !1036
  %or.cond = or i1 %45, %47, !dbg !1046
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !1046

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @utimes(i8* %path, %struct.timeval* %times), !dbg !1047
  br label %83, !dbg !1047

__get_sym_file.exit.thread:                       ; preds = %32, %.preheader.i, %38, %22, %26
  %50 = icmp eq i8* %path, null, !dbg !1049
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1049

; <label>:51                                      ; preds = %__get_sym_file.exit.thread
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1050) #5, !dbg !1052
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1053) #5, !dbg !1055
  %52 = ptrtoint i8* %path to i64, !dbg !1056
  %53 = tail call i64 @klee_get_valuel(i64 %52) #5, !dbg !1056
  %54 = inttoptr i64 %53 to i8*, !dbg !1056
  tail call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !1057) #5, !dbg !1056
  %55 = icmp eq i8* %54, %path, !dbg !1058
  %56 = zext i1 %55 to i64, !dbg !1058
  tail call void @klee_assume(i64 %56) #5, !dbg !1058
  tail call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !1059) #5, !dbg !1054
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1060) #5, !dbg !1061
  br label %57, !dbg !1061

; <label>:57                                      ; preds = %74, %51
  %i.0.i = phi i32 [ 0, %51 ], [ %75, %74 ]
  %sc.0.i = phi i8* [ %54, %51 ], [ %sc.1.i, %74 ]
  %58 = load i8* %sc.0.i, align 1, !dbg !1062, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %58}, i64 0, metadata !1063) #5, !dbg !1062
  %59 = add i32 %i.0.i, -1, !dbg !1064
  %60 = and i32 %59, %i.0.i, !dbg !1064
  %61 = icmp eq i32 %60, 0, !dbg !1064
  br i1 %61, label %62, label %66, !dbg !1064

; <label>:62                                      ; preds = %57
  switch i8 %58, label %74 [
    i8 0, label %63
    i8 47, label %64
  ], !dbg !1065

; <label>:63                                      ; preds = %62
  store i8 0, i8* %sc.0.i, align 1, !dbg !1066, !tbaa !693
  br label %__concretize_string.exit, !dbg !1067

; <label>:64                                      ; preds = %62
  %65 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1068
  tail call void @llvm.dbg.value(metadata !{i8* %65}, i64 0, metadata !1059) #5, !dbg !1068
  store i8 47, i8* %sc.0.i, align 1, !dbg !1068, !tbaa !693
  br label %74, !dbg !1069

; <label>:66                                      ; preds = %57
  %67 = sext i8 %58 to i64, !dbg !1070
  %68 = tail call i64 @klee_get_valuel(i64 %67) #5, !dbg !1070
  %69 = trunc i64 %68 to i8, !dbg !1070
  tail call void @llvm.dbg.value(metadata !{i8 %69}, i64 0, metadata !1071) #5, !dbg !1070
  %70 = icmp eq i8 %69, %58, !dbg !1072
  %71 = zext i1 %70 to i64, !dbg !1072
  tail call void @klee_assume(i64 %71) #5, !dbg !1072
  %72 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1073
  tail call void @llvm.dbg.value(metadata !{i8* %72}, i64 0, metadata !1059) #5, !dbg !1073
  store i8 %69, i8* %sc.0.i, align 1, !dbg !1073, !tbaa !693
  %73 = icmp eq i8 %69, 0, !dbg !1074
  br i1 %73, label %__concretize_string.exit, label %74, !dbg !1074

; <label>:74                                      ; preds = %66, %64, %62
  %sc.1.i = phi i8* [ %72, %66 ], [ %65, %64 ], [ %sc.0.i, %62 ]
  %75 = add i32 %i.0.i, 1, !dbg !1061
  tail call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !1060) #5, !dbg !1061
  br label %57, !dbg !1061

__concretize_string.exit:                         ; preds = %66, %63, %__get_sym_file.exit.thread
  %76 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %63 ], [ %path, %66 ], !dbg !1051
  %77 = tail call i64 (i64, ...)* @syscall(i64 261, i64 %.01, i8* %76, %struct.timeval* %times) #5, !dbg !1049
  %78 = trunc i64 %77 to i32, !dbg !1049
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !158), !dbg !1049
  %79 = icmp eq i32 %78, -1, !dbg !1075
  br i1 %79, label %80, label %83, !dbg !1075

; <label>:80                                      ; preds = %__concretize_string.exit
  %81 = tail call i32 @klee_get_errno() #5, !dbg !1077
  %82 = tail call i32* @__errno_location() #1, !dbg !1077
  store i32 %81, i32* %82, align 4, !dbg !1077, !tbaa !751
  br label %83, !dbg !1077

; <label>:83                                      ; preds = %__concretize_string.exit, %80, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %80 ], [ %78, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1078
}

; Function Attrs: nounwind uwtable
define i32 @close(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !163), !dbg !1079
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !165), !dbg !1080
  %1 = load i32* @close.n_calls, align 4, !dbg !1081, !tbaa !751
  %2 = add nsw i32 %1, 1, !dbg !1081
  store i32 %2, i32* @close.n_calls, align 4, !dbg !1081, !tbaa !751
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1082), !dbg !1084
  %3 = icmp ult i32 %fd, 32, !dbg !1085
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1085

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !1086
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1087
  %7 = load i32* %6, align 4, !dbg !1087, !tbaa !764
  %8 = and i32 %7, 1, !dbg !1087
  %9 = icmp eq i32 %8, 0, !dbg !1087
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1087

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1086
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !164), !dbg !1083
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1088
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1088

__get_file.exit.thread:                           ; preds = %0, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1090
  store i32 9, i32* %12, align 4, !dbg !1090, !tbaa !751
  br label %25, !dbg !1092

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1093, !tbaa !1095
  %15 = icmp eq i32 %14, 0, !dbg !1093
  br i1 %15, label %23, label %16, !dbg !1093

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !1093, !tbaa !1096
  %18 = load i32* %17, align 4, !dbg !1093, !tbaa !751
  %19 = icmp eq i32 %18, %2, !dbg !1093
  br i1 %19, label %20, label %23, !dbg !1093

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1097
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1097, !tbaa !1095
  %22 = tail call i32* @__errno_location() #1, !dbg !1099
  store i32 5, i32* %22, align 4, !dbg !1099, !tbaa !751
  br label %25, !dbg !1100

; <label>:23                                      ; preds = %13, %16
  %24 = bitcast %struct.exe_file_t* %10 to i8*, !dbg !1101
  tail call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 24, i32 8, i1 false), !dbg !1101
  br label %25, !dbg !1102

; <label>:25                                      ; preds = %23, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ 0, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !1103
}

; Function Attrs: nounwind uwtable
define i64 @read(i32 %fd, i8* %buf, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !174), !dbg !1104
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !175), !dbg !1104
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !176), !dbg !1104
  %1 = load i32* @read.n_calls, align 4, !dbg !1105, !tbaa !751
  %2 = add nsw i32 %1, 1, !dbg !1105
  store i32 %2, i32* @read.n_calls, align 4, !dbg !1105, !tbaa !751
  %3 = icmp eq i64 %count, 0, !dbg !1106
  br i1 %3, label %._crit_edge, label %4, !dbg !1106

; <label>:4                                       ; preds = %0
  %5 = icmp eq i8* %buf, null, !dbg !1108
  br i1 %5, label %6, label %8, !dbg !1108

; <label>:6                                       ; preds = %4
  %7 = tail call i32* @__errno_location() #1, !dbg !1110
  store i32 14, i32* %7, align 4, !dbg !1110, !tbaa !751
  br label %._crit_edge, !dbg !1112

; <label>:8                                       ; preds = %4
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1113), !dbg !1115
  %9 = icmp ult i32 %fd, 32, !dbg !1116
  br i1 %9, label %10, label %__get_file.exit.thread, !dbg !1116

; <label>:10                                      ; preds = %8
  %11 = sext i32 %fd to i64, !dbg !1117
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 1, !dbg !1118
  %13 = load i32* %12, align 4, !dbg !1118, !tbaa !764
  %14 = and i32 %13, 1, !dbg !1118
  %15 = icmp eq i32 %14, 0, !dbg !1118
  br i1 %15, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1118

__get_file.exit:                                  ; preds = %10
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, !dbg !1117
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %16}, i64 0, metadata !177), !dbg !1114
  %17 = icmp eq %struct.exe_file_t* %16, null, !dbg !1119
  br i1 %17, label %__get_file.exit.thread, label %19, !dbg !1119

__get_file.exit.thread:                           ; preds = %8, %10, %__get_file.exit
  %18 = tail call i32* @__errno_location() #1, !dbg !1121
  store i32 9, i32* %18, align 4, !dbg !1121, !tbaa !751
  br label %._crit_edge, !dbg !1123

; <label>:19                                      ; preds = %__get_file.exit
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1124, !tbaa !1095
  %21 = icmp eq i32 %20, 0, !dbg !1124
  br i1 %21, label %29, label %22, !dbg !1124

; <label>:22                                      ; preds = %19
  %23 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !1124, !tbaa !1126
  %24 = load i32* %23, align 4, !dbg !1124, !tbaa !751
  %25 = icmp eq i32 %24, %2, !dbg !1124
  br i1 %25, label %26, label %29, !dbg !1124

; <label>:26                                      ; preds = %22
  %27 = add i32 %20, -1, !dbg !1127
  store i32 %27, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1127, !tbaa !1095
  %28 = tail call i32* @__errno_location() #1, !dbg !1129
  store i32 5, i32* %28, align 4, !dbg !1129, !tbaa !751
  br label %._crit_edge, !dbg !1130

; <label>:29                                      ; preds = %19, %22
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 3, !dbg !1131
  %31 = load %struct.exe_disk_file_t** %30, align 8, !dbg !1131, !tbaa !787
  %32 = icmp eq %struct.exe_disk_file_t* %31, null, !dbg !1131
  br i1 %32, label %33, label %63, !dbg !1131

; <label>:33                                      ; preds = %29
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1132) #5, !dbg !1134
  %34 = ptrtoint i8* %buf to i64, !dbg !1135
  %35 = tail call i64 @klee_get_valuel(i64 %34) #5, !dbg !1135
  %36 = inttoptr i64 %35 to i8*, !dbg !1135
  tail call void @llvm.dbg.value(metadata !{i8* %36}, i64 0, metadata !1136) #5, !dbg !1135
  %37 = icmp eq i8* %36, %buf, !dbg !1137
  %38 = zext i1 %37 to i64, !dbg !1137
  tail call void @klee_assume(i64 %38) #5, !dbg !1137
  tail call void @llvm.dbg.value(metadata !{i8* %36}, i64 0, metadata !175), !dbg !1133
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1138) #5, !dbg !1140
  %39 = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1141
  tail call void @llvm.dbg.value(metadata !{i64 %39}, i64 0, metadata !1142) #5, !dbg !1141
  %40 = icmp eq i64 %39, %count, !dbg !1143
  %41 = zext i1 %40 to i64, !dbg !1143
  tail call void @klee_assume(i64 %41) #5, !dbg !1143
  tail call void @llvm.dbg.value(metadata !{i64 %39}, i64 0, metadata !176), !dbg !1139
  tail call void @klee_check_memory_access(i8* %36, i64 %39) #5, !dbg !1144
  %42 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !1145
  %43 = load i32* %42, align 8, !dbg !1145, !tbaa !854
  %44 = icmp eq i32 %43, 0, !dbg !1145
  br i1 %44, label %45, label %47, !dbg !1145

; <label>:45                                      ; preds = %33
  %46 = tail call i64 (i64, ...)* @syscall(i64 0, i32 0, i8* %36, i64 %39) #5, !dbg !1147
  br label %51, !dbg !1147

; <label>:47                                      ; preds = %33
  %48 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1148
  %49 = load i64* %48, align 8, !dbg !1148, !tbaa !1149
  %50 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %43, i8* %36, i64 %39, i64 %49) #5, !dbg !1148
  br label %51

; <label>:51                                      ; preds = %47, %45
  %r.0.in = phi i64 [ %46, %45 ], [ %50, %47 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1147
  %52 = icmp eq i32 %r.0, -1, !dbg !1150
  br i1 %52, label %53, label %56, !dbg !1150

; <label>:53                                      ; preds = %51
  %54 = tail call i32 @klee_get_errno() #5, !dbg !1152
  %55 = tail call i32* @__errno_location() #1, !dbg !1152
  store i32 %54, i32* %55, align 4, !dbg !1152, !tbaa !751
  br label %._crit_edge, !dbg !1154

; <label>:56                                      ; preds = %51
  %57 = load i32* %42, align 8, !dbg !1155, !tbaa !854
  %58 = icmp eq i32 %57, 0, !dbg !1155
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1157
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !1157
  br i1 %58, label %._crit_edge, label %59, !dbg !1155

; <label>:59                                      ; preds = %56
  %60 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1158
  %61 = load i64* %60, align 8, !dbg !1158, !tbaa !1149
  %62 = add nsw i64 %61, %.pre, !dbg !1158
  store i64 %62, i64* %60, align 8, !dbg !1158, !tbaa !1149
  br label %._crit_edge, !dbg !1158

; <label>:63                                      ; preds = %29
  %64 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1159
  %65 = load i64* %64, align 8, !dbg !1159, !tbaa !1149
  %66 = icmp sgt i64 %65, -1, !dbg !1159
  br i1 %66, label %68, label %67, !dbg !1159

; <label>:67                                      ; preds = %63
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8]* @.str4, i64 0, i64 0), i32 386, i8* getelementptr inbounds ([34 x i8]* @__PRETTY_FUNCTION__.read, i64 0, i64 0)) #8, !dbg !1159
  unreachable, !dbg !1159

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 0, !dbg !1161
  %70 = load i32* %69, align 4, !dbg !1161, !tbaa !1163
  %71 = zext i32 %70 to i64, !dbg !1161
  %72 = icmp slt i64 %71, %65, !dbg !1161
  br i1 %72, label %._crit_edge, label %73, !dbg !1161

; <label>:73                                      ; preds = %68
  %74 = add i64 %65, %count, !dbg !1164
  %75 = icmp ugt i64 %74, %71, !dbg !1164
  %76 = sub nsw i64 %71, %65, !dbg !1166
  tail call void @llvm.dbg.value(metadata !{i64 %76}, i64 0, metadata !176), !dbg !1166
  %.count = select i1 %75, i64 %76, i64 %count, !dbg !1164
  %77 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 1, !dbg !1168
  %78 = load i8** %77, align 8, !dbg !1168, !tbaa !1169
  %79 = getelementptr inbounds i8* %78, i64 %65, !dbg !1168
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %79, i64 %.count, i32 1, i1 false), !dbg !1168
  %80 = load i64* %64, align 8, !dbg !1170, !tbaa !1149
  %81 = add i64 %80, %.count, !dbg !1170
  store i64 %81, i64* %64, align 8, !dbg !1170, !tbaa !1149
  br label %._crit_edge, !dbg !1171

._crit_edge:                                      ; preds = %56, %59, %68, %0, %73, %53, %26, %__get_file.exit.thread, %6
  %.0 = phi i64 [ -1, %6 ], [ -1, %26 ], [ %.count, %73 ], [ -1, %53 ], [ -1, %__get_file.exit.thread ], [ 0, %0 ], [ 0, %68 ], [ %.pre, %59 ], [ %.pre, %56 ]
  ret i64 %.0, !dbg !1172
}

declare void @klee_check_memory_access(i8*, i64) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define i64 @write(i32 %fd, i8* %buf, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !187), !dbg !1173
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !188), !dbg !1173
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !189), !dbg !1173
  %1 = load i32* @write.n_calls, align 4, !dbg !1174, !tbaa !751
  %2 = add nsw i32 %1, 1, !dbg !1174
  store i32 %2, i32* @write.n_calls, align 4, !dbg !1174, !tbaa !751
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1175), !dbg !1177
  %3 = icmp ult i32 %fd, 32, !dbg !1178
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1178

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !1179
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1180
  %7 = load i32* %6, align 4, !dbg !1180, !tbaa !764
  %8 = and i32 %7, 1, !dbg !1180
  %9 = icmp eq i32 %8, 0, !dbg !1180
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1180

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1179
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !190), !dbg !1176
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1181
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1181

__get_file.exit.thread:                           ; preds = %0, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1183
  store i32 9, i32* %12, align 4, !dbg !1183, !tbaa !751
  br label %._crit_edge, !dbg !1185

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1186, !tbaa !1095
  %15 = icmp eq i32 %14, 0, !dbg !1186
  br i1 %15, label %23, label %16, !dbg !1186

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !1186, !tbaa !1188
  %18 = load i32* %17, align 4, !dbg !1186, !tbaa !751
  %19 = icmp eq i32 %18, %2, !dbg !1186
  br i1 %19, label %20, label %23, !dbg !1186

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1189
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1189, !tbaa !1095
  %22 = tail call i32* @__errno_location() #1, !dbg !1191
  store i32 5, i32* %22, align 4, !dbg !1191, !tbaa !751
  br label %._crit_edge, !dbg !1192

; <label>:23                                      ; preds = %13, %16
  %24 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1193
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1193, !tbaa !787
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !1193
  br i1 %26, label %27, label %58, !dbg !1193

; <label>:27                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1194) #5, !dbg !1196
  %28 = ptrtoint i8* %buf to i64, !dbg !1197
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1197
  %30 = inttoptr i64 %29 to i8*, !dbg !1197
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1198) #5, !dbg !1197
  %31 = icmp eq i8* %30, %buf, !dbg !1199
  %32 = zext i1 %31 to i64, !dbg !1199
  tail call void @klee_assume(i64 %32) #5, !dbg !1199
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !188), !dbg !1195
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1200) #5, !dbg !1202
  %33 = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1203
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !1204) #5, !dbg !1203
  %34 = icmp eq i64 %33, %count, !dbg !1205
  %35 = zext i1 %34 to i64, !dbg !1205
  tail call void @klee_assume(i64 %35) #5, !dbg !1205
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !189), !dbg !1201
  tail call void @klee_check_memory_access(i8* %30, i64 %33) #5, !dbg !1206
  %36 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1207
  %37 = load i32* %36, align 8, !dbg !1207, !tbaa !854
  %.off = add i32 %37, -1, !dbg !1207
  %switch = icmp ult i32 %.off, 2, !dbg !1207
  br i1 %switch, label %38, label %40, !dbg !1207

; <label>:38                                      ; preds = %27
  %39 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %37, i8* %30, i64 %33) #5, !dbg !1209
  br label %44, !dbg !1209

; <label>:40                                      ; preds = %27
  %41 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1210
  %42 = load i64* %41, align 8, !dbg !1210, !tbaa !1149
  %43 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %37, i8* %30, i64 %33, i64 %42) #5, !dbg !1210
  br label %44

; <label>:44                                      ; preds = %40, %38
  %r.0.in = phi i64 [ %39, %38 ], [ %43, %40 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1209
  %45 = icmp eq i32 %r.0, -1, !dbg !1211
  br i1 %45, label %46, label %49, !dbg !1211

; <label>:46                                      ; preds = %44
  %47 = tail call i32 @klee_get_errno() #5, !dbg !1213
  %48 = tail call i32* @__errno_location() #1, !dbg !1213
  store i32 %47, i32* %48, align 4, !dbg !1213, !tbaa !751
  br label %._crit_edge, !dbg !1215

; <label>:49                                      ; preds = %44
  %50 = icmp sgt i32 %r.0, -1, !dbg !1216
  br i1 %50, label %52, label %51, !dbg !1216

; <label>:51                                      ; preds = %49
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8]* @.str4, i64 0, i64 0), i32 440, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1216
  unreachable, !dbg !1216

; <label>:52                                      ; preds = %49
  %53 = load i32* %36, align 8, !dbg !1217, !tbaa !854
  %.off2 = add i32 %53, -1, !dbg !1217
  %switch3 = icmp ult i32 %.off2, 2, !dbg !1217
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1219
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !1219
  br i1 %switch3, label %._crit_edge, label %54, !dbg !1217

; <label>:54                                      ; preds = %52
  %55 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1220
  %56 = load i64* %55, align 8, !dbg !1220, !tbaa !1149
  %57 = add nsw i64 %56, %.pre, !dbg !1220
  store i64 %57, i64* %55, align 8, !dbg !1220, !tbaa !1149
  br label %._crit_edge, !dbg !1220

; <label>:58                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !1221, i64 0, metadata !194), !dbg !1222
  %59 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1223
  %60 = load i64* %59, align 8, !dbg !1223, !tbaa !1149
  %61 = add i64 %60, %count, !dbg !1223
  %62 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 0, !dbg !1223
  %63 = load i32* %62, align 4, !dbg !1223, !tbaa !1163
  %64 = zext i32 %63 to i64, !dbg !1223
  %65 = icmp ugt i64 %61, %64, !dbg !1223
  br i1 %65, label %66, label %select.unfold, !dbg !1223

; <label>:66                                      ; preds = %58
  %67 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !1225, !tbaa !1228
  %68 = icmp eq i32 %67, 0, !dbg !1225
  br i1 %68, label %70, label %69, !dbg !1225

; <label>:69                                      ; preds = %66
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8]* @.str4, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1229
  unreachable, !dbg !1229

; <label>:70                                      ; preds = %66
  %71 = icmp sgt i64 %64, %60, !dbg !1230
  %72 = sub nsw i64 %64, %60, !dbg !1233
  tail call void @llvm.dbg.value(metadata !{i64 %72}, i64 0, metadata !194), !dbg !1233
  br i1 %71, label %select.unfold, label %.thread

select.unfold:                                    ; preds = %70, %58
  %actual_count.0 = phi i64 [ %count, %58 ], [ %72, %70 ]
  %73 = icmp eq i64 %actual_count.0, 0, !dbg !1234
  br i1 %73, label %.thread, label %74, !dbg !1234

; <label>:74                                      ; preds = %select.unfold
  %75 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 1, !dbg !1236
  %76 = load i8** %75, align 8, !dbg !1236, !tbaa !1169
  %77 = getelementptr inbounds i8* %76, i64 %60, !dbg !1236
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %77, i8* %buf, i64 %actual_count.0, i32 1, i1 false), !dbg !1236
  br label %.thread, !dbg !1236

.thread:                                          ; preds = %70, %select.unfold, %74
  %actual_count.04 = phi i64 [ 0, %select.unfold ], [ %actual_count.0, %74 ], [ 0, %70 ]
  %78 = icmp eq i64 %actual_count.04, %count, !dbg !1237
  br i1 %78, label %80, label %79, !dbg !1237

; <label>:79                                      ; preds = %.thread
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str7, i64 0, i64 0)) #5, !dbg !1239
  br label %80, !dbg !1239

; <label>:80                                      ; preds = %.thread, %79
  %81 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1240, !tbaa !787
  %82 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !1240, !tbaa !1242
  %83 = icmp eq %struct.exe_disk_file_t* %81, %82, !dbg !1240
  br i1 %83, label %84, label %89, !dbg !1240

; <label>:84                                      ; preds = %80
  %85 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1243, !tbaa !1244
  %86 = zext i32 %85 to i64, !dbg !1243
  %87 = add i64 %86, %actual_count.04, !dbg !1243
  %88 = trunc i64 %87 to i32, !dbg !1243
  store i32 %88, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1243, !tbaa !1244
  br label %89, !dbg !1243

; <label>:89                                      ; preds = %84, %80
  %90 = load i64* %59, align 8, !dbg !1245, !tbaa !1149
  %91 = add i64 %90, %count, !dbg !1245
  store i64 %91, i64* %59, align 8, !dbg !1245, !tbaa !1149
  br label %._crit_edge, !dbg !1246

._crit_edge:                                      ; preds = %52, %54, %89, %46, %20, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %20 ], [ %count, %89 ], [ -1, %46 ], [ -1, %__get_file.exit.thread ], [ %.pre, %54 ], [ %.pre, %52 ]
  ret i64 %.0, !dbg !1247
}

; Function Attrs: nounwind uwtable
define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !200), !dbg !1248
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !201), !dbg !1248
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !202), !dbg !1248
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1249), !dbg !1251
  %1 = icmp ult i32 %fd, 32, !dbg !1252
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1252

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1253
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1254
  %5 = load i32* %4, align 4, !dbg !1254, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1254
  %7 = icmp eq i32 %6, 0, !dbg !1254
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1254

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1253
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !204), !dbg !1250
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1255
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1255

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1257
  store i32 9, i32* %10, align 4, !dbg !1257, !tbaa !751
  br label %57, !dbg !1259

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1260
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1260, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1260
  br i1 %14, label %15, label %39, !dbg !1260

; <label>:15                                      ; preds = %11
  %16 = icmp eq i32 %whence, 0, !dbg !1262
  %17 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1265
  %18 = load i32* %17, align 8, !dbg !1265, !tbaa !854
  br i1 %16, label %19, label %21, !dbg !1262

; <label>:19                                      ; preds = %15
  %20 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %offset, i32 0) #5, !dbg !1265
  tail call void @llvm.dbg.value(metadata !{i64 %20}, i64 0, metadata !203), !dbg !1265
  br label %33, !dbg !1267

; <label>:21                                      ; preds = %15
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1268
  %23 = load i64* %22, align 8, !dbg !1268, !tbaa !1149
  %24 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %23, i32 0) #5, !dbg !1268
  tail call void @llvm.dbg.value(metadata !{i64 %24}, i64 0, metadata !203), !dbg !1268
  %25 = icmp eq i64 %24, -1, !dbg !1270
  br i1 %25, label %.thread, label %26, !dbg !1270

; <label>:26                                      ; preds = %21
  %27 = load i64* %22, align 8, !dbg !1272, !tbaa !1149
  %28 = icmp eq i64 %24, %27, !dbg !1272
  br i1 %28, label %30, label %29, !dbg !1272

; <label>:29                                      ; preds = %26
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8]* @.str4, i64 0, i64 0), i32 499, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__.__fd_lseek, i64 0, i64 0)) #8, !dbg !1272
  unreachable, !dbg !1272

; <label>:30                                      ; preds = %26
  %31 = load i32* %17, align 8, !dbg !1274, !tbaa !854
  %32 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %31, i64 %offset, i32 %whence) #5, !dbg !1274
  tail call void @llvm.dbg.value(metadata !{i64 %32}, i64 0, metadata !203), !dbg !1274
  br label %33, !dbg !1275

; <label>:33                                      ; preds = %30, %19
  %new_off.0 = phi i64 [ %20, %19 ], [ %32, %30 ]
  %34 = icmp eq i64 %new_off.0, -1, !dbg !1276
  br i1 %34, label %.thread, label %37, !dbg !1276

.thread:                                          ; preds = %21, %33
  %35 = tail call i32 @klee_get_errno() #5, !dbg !1278
  %36 = tail call i32* @__errno_location() #1, !dbg !1278
  store i32 %35, i32* %36, align 4, !dbg !1278, !tbaa !751
  br label %57, !dbg !1280

; <label>:37                                      ; preds = %33
  %38 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1281
  store i64 %new_off.0, i64* %38, align 8, !dbg !1281, !tbaa !1149
  br label %57, !dbg !1282

; <label>:39                                      ; preds = %11
  switch i32 %whence, label %49 [
    i32 0, label %51
    i32 1, label %40
    i32 2, label %44
  ], !dbg !1283

; <label>:40                                      ; preds = %39
  %41 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1284
  %42 = load i64* %41, align 8, !dbg !1284, !tbaa !1149
  %43 = add nsw i64 %42, %offset, !dbg !1284
  tail call void @llvm.dbg.value(metadata !{i64 %43}, i64 0, metadata !203), !dbg !1284
  br label %51, !dbg !1284

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 0, !dbg !1286
  %46 = load i32* %45, align 4, !dbg !1286, !tbaa !1163
  %47 = zext i32 %46 to i64, !dbg !1286
  %48 = add nsw i64 %47, %offset, !dbg !1286
  tail call void @llvm.dbg.value(metadata !{i64 %48}, i64 0, metadata !203), !dbg !1286
  br label %51, !dbg !1286

; <label>:49                                      ; preds = %39
  %50 = tail call i32* @__errno_location() #1, !dbg !1287
  store i32 22, i32* %50, align 4, !dbg !1287, !tbaa !751
  br label %57, !dbg !1289

; <label>:51                                      ; preds = %39, %44, %40
  %new_off.1 = phi i64 [ %48, %44 ], [ %43, %40 ], [ %offset, %39 ]
  %52 = icmp slt i64 %new_off.1, 0, !dbg !1290
  br i1 %52, label %53, label %55, !dbg !1290

; <label>:53                                      ; preds = %51
  %54 = tail call i32* @__errno_location() #1, !dbg !1292
  store i32 22, i32* %54, align 4, !dbg !1292, !tbaa !751
  br label %57, !dbg !1294

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1295
  store i64 %new_off.1, i64* %56, align 8, !dbg !1295, !tbaa !1149
  br label %57, !dbg !1296

; <label>:57                                      ; preds = %55, %53, %49, %37, %.thread, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %49 ], [ -1, %53 ], [ %new_off.1, %55 ], [ -1, %.thread ], [ %new_off.0, %37 ], [ -1, %__get_file.exit.thread ]
  ret i64 %.0, !dbg !1297
}

; Function Attrs: nounwind uwtable
define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !209), !dbg !1298
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !210), !dbg !1298
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1299), !dbg !1301
  %1 = load i8* %path, align 1, !dbg !1302, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1303), !dbg !1302
  %2 = sext i8 %1 to i32, !dbg !1304
  %3 = icmp eq i8 %1, 0, !dbg !1304
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1304

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1304
  %6 = load i8* %5, align 1, !dbg !1304, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1304
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1304

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1305, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1305
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1305

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1305
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1305

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1306
  %12 = ashr exact i32 %sext.i, 24, !dbg !1306
  %13 = add nsw i32 %12, 65, !dbg !1306
  %14 = icmp eq i32 %2, %13, !dbg !1306
  %15 = add i32 %i.02.i, 1, !dbg !1305
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1307), !dbg !1305
  br i1 %14, label %16, label %10, !dbg !1306

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1308
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1308, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1309
  %20 = load %struct.stat64** %19, align 8, !dbg !1309, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1309
  %22 = load i64* %21, align 8, !dbg !1309, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1309
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1308
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1310
  %or.cond = or i1 %23, %25, !dbg !1309
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1309

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !1312
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !1312
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 144, i32 8, i1 false), !dbg !1312
  br label %59, !dbg !1314

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1315) #5, !dbg !1317
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1318) #5, !dbg !1320
  %29 = ptrtoint i8* %path to i64, !dbg !1321
  %30 = tail call i64 @klee_get_valuel(i64 %29) #5, !dbg !1321
  %31 = inttoptr i64 %30 to i8*, !dbg !1321
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1322) #5, !dbg !1321
  %32 = icmp eq i8* %31, %path, !dbg !1323
  %33 = zext i1 %32 to i64, !dbg !1323
  tail call void @klee_assume(i64 %33) #5, !dbg !1323
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1324) #5, !dbg !1319
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1325) #5, !dbg !1326
  br label %34, !dbg !1326

; <label>:34                                      ; preds = %51, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %52, %51 ]
  %sc.0.i = phi i8* [ %31, %__get_sym_file.exit.thread ], [ %sc.1.i, %51 ]
  %35 = load i8* %sc.0.i, align 1, !dbg !1327, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %35}, i64 0, metadata !1328) #5, !dbg !1327
  %36 = add i32 %i.0.i, -1, !dbg !1329
  %37 = and i32 %36, %i.0.i, !dbg !1329
  %38 = icmp eq i32 %37, 0, !dbg !1329
  br i1 %38, label %39, label %43, !dbg !1329

; <label>:39                                      ; preds = %34
  switch i8 %35, label %51 [
    i8 0, label %40
    i8 47, label %41
  ], !dbg !1330

; <label>:40                                      ; preds = %39
  store i8 0, i8* %sc.0.i, align 1, !dbg !1331, !tbaa !693
  br label %__concretize_string.exit, !dbg !1332

; <label>:41                                      ; preds = %39
  %42 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1333
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !1324) #5, !dbg !1333
  store i8 47, i8* %sc.0.i, align 1, !dbg !1333, !tbaa !693
  br label %51, !dbg !1334

; <label>:43                                      ; preds = %34
  %44 = sext i8 %35 to i64, !dbg !1335
  %45 = tail call i64 @klee_get_valuel(i64 %44) #5, !dbg !1335
  %46 = trunc i64 %45 to i8, !dbg !1335
  tail call void @llvm.dbg.value(metadata !{i8 %46}, i64 0, metadata !1336) #5, !dbg !1335
  %47 = icmp eq i8 %46, %35, !dbg !1337
  %48 = zext i1 %47 to i64, !dbg !1337
  tail call void @klee_assume(i64 %48) #5, !dbg !1337
  %49 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1338
  tail call void @llvm.dbg.value(metadata !{i8* %49}, i64 0, metadata !1324) #5, !dbg !1338
  store i8 %46, i8* %sc.0.i, align 1, !dbg !1338, !tbaa !693
  %50 = icmp eq i8 %46, 0, !dbg !1339
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1339

; <label>:51                                      ; preds = %43, %41, %39
  %sc.1.i = phi i8* [ %49, %43 ], [ %42, %41 ], [ %sc.0.i, %39 ]
  %52 = add i32 %i.0.i, 1, !dbg !1326
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1325) #5, !dbg !1326
  br label %34, !dbg !1326

__concretize_string.exit:                         ; preds = %43, %40
  %53 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat64* %buf) #5, !dbg !1316
  %54 = trunc i64 %53 to i32, !dbg !1316
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !212), !dbg !1316
  %55 = icmp eq i32 %54, -1, !dbg !1340
  br i1 %55, label %56, label %59, !dbg !1340

; <label>:56                                      ; preds = %__concretize_string.exit
  %57 = tail call i32 @klee_get_errno() #5, !dbg !1342
  %58 = tail call i32* @__errno_location() #1, !dbg !1342
  store i32 %57, i32* %58, align 4, !dbg !1342, !tbaa !751
  br label %59, !dbg !1342

; <label>:59                                      ; preds = %__concretize_string.exit, %56, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %56 ], [ %54, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1343
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstatat(i32 %fd, i8* %path, %struct.stat* %buf, i32 %flags) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !238), !dbg !1344
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !239), !dbg !1344
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !240), !dbg !1344
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !241), !dbg !1344
  %1 = icmp eq i32 %fd, -100, !dbg !1345
  br i1 %1, label %22, label %2, !dbg !1345

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1346), !dbg !1348
  %3 = icmp ult i32 %fd, 32, !dbg !1349
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1349

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !1350
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1351
  %7 = load i32* %6, align 4, !dbg !1351, !tbaa !764
  %8 = and i32 %7, 1, !dbg !1351
  %9 = icmp eq i32 %8, 0, !dbg !1351
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1351

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1350
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !242), !dbg !1347
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1352
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1352

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1354
  store i32 9, i32* %12, align 4, !dbg !1354, !tbaa !751
  br label %85, !dbg !1356

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1357
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !1357, !tbaa !787
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !1357
  br i1 %16, label %19, label %17, !dbg !1357

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1359
  %18 = tail call i32* @__errno_location() #1, !dbg !1361
  store i32 2, i32* %18, align 4, !dbg !1361, !tbaa !751
  br label %85, !dbg !1362

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1363
  %21 = load i32* %20, align 8, !dbg !1363, !tbaa !854
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !238), !dbg !1363
  %phitmp = sext i32 %21 to i64, !dbg !1364
  br label %22, !dbg !1364

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1365), !dbg !1367
  %23 = load i8* %path, align 1, !dbg !1368, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !1369), !dbg !1368
  %24 = sext i8 %23 to i32, !dbg !1370
  %25 = icmp eq i8 %23, 0, !dbg !1370
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !1370

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !1370
  %28 = load i8* %27, align 1, !dbg !1370, !tbaa !693
  %29 = icmp eq i8 %28, 0, !dbg !1370
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1370

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1371, !tbaa !700
  %31 = icmp eq i32 %30, 0, !dbg !1371
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1371

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !1371
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1371

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1372
  %34 = ashr exact i32 %sext.i, 24, !dbg !1372
  %35 = add nsw i32 %34, 65, !dbg !1372
  %36 = icmp eq i32 %24, %35, !dbg !1372
  %37 = add i32 %i.02.i, 1, !dbg !1371
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !1373), !dbg !1371
  br i1 %36, label %38, label %32, !dbg !1372

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !1374
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1374, !tbaa !707
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !1375
  %42 = load %struct.stat64** %41, align 8, !dbg !1375, !tbaa !710
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !1375
  %44 = load i64* %43, align 8, !dbg !1375, !tbaa !712
  %45 = icmp eq i64 %44, 0, !dbg !1375
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !1374
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !1376
  %or.cond = or i1 %45, %47, !dbg !1375
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !1375

; <label>:48                                      ; preds = %38
  %49 = bitcast %struct.stat* %buf to i8*, !dbg !1378
  %50 = bitcast %struct.stat64* %42 to i8*, !dbg !1378
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 144, i32 8, i1 false), !dbg !1378
  br label %85, !dbg !1380

__get_sym_file.exit.thread:                       ; preds = %32, %.preheader.i, %38, %22, %26
  %51 = icmp eq i8* %path, null, !dbg !1381
  br i1 %51, label %__concretize_string.exit, label %52, !dbg !1381

; <label>:52                                      ; preds = %__get_sym_file.exit.thread
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1382) #5, !dbg !1384
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1385) #5, !dbg !1387
  %53 = ptrtoint i8* %path to i64, !dbg !1388
  %54 = tail call i64 @klee_get_valuel(i64 %53) #5, !dbg !1388
  %55 = inttoptr i64 %54 to i8*, !dbg !1388
  tail call void @llvm.dbg.value(metadata !{i8* %55}, i64 0, metadata !1389) #5, !dbg !1388
  %56 = icmp eq i8* %55, %path, !dbg !1390
  %57 = zext i1 %56 to i64, !dbg !1390
  tail call void @klee_assume(i64 %57) #5, !dbg !1390
  tail call void @llvm.dbg.value(metadata !{i8* %55}, i64 0, metadata !1391) #5, !dbg !1386
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1392) #5, !dbg !1393
  br label %58, !dbg !1393

; <label>:58                                      ; preds = %75, %52
  %i.0.i = phi i32 [ 0, %52 ], [ %76, %75 ]
  %sc.0.i = phi i8* [ %55, %52 ], [ %sc.1.i, %75 ]
  %59 = load i8* %sc.0.i, align 1, !dbg !1394, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %59}, i64 0, metadata !1395) #5, !dbg !1394
  %60 = add i32 %i.0.i, -1, !dbg !1396
  %61 = and i32 %60, %i.0.i, !dbg !1396
  %62 = icmp eq i32 %61, 0, !dbg !1396
  br i1 %62, label %63, label %67, !dbg !1396

; <label>:63                                      ; preds = %58
  switch i8 %59, label %75 [
    i8 0, label %64
    i8 47, label %65
  ], !dbg !1397

; <label>:64                                      ; preds = %63
  store i8 0, i8* %sc.0.i, align 1, !dbg !1398, !tbaa !693
  br label %__concretize_string.exit, !dbg !1399

; <label>:65                                      ; preds = %63
  %66 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1400
  tail call void @llvm.dbg.value(metadata !{i8* %66}, i64 0, metadata !1391) #5, !dbg !1400
  store i8 47, i8* %sc.0.i, align 1, !dbg !1400, !tbaa !693
  br label %75, !dbg !1401

; <label>:67                                      ; preds = %58
  %68 = sext i8 %59 to i64, !dbg !1402
  %69 = tail call i64 @klee_get_valuel(i64 %68) #5, !dbg !1402
  %70 = trunc i64 %69 to i8, !dbg !1402
  tail call void @llvm.dbg.value(metadata !{i8 %70}, i64 0, metadata !1403) #5, !dbg !1402
  %71 = icmp eq i8 %70, %59, !dbg !1404
  %72 = zext i1 %71 to i64, !dbg !1404
  tail call void @klee_assume(i64 %72) #5, !dbg !1404
  %73 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1405
  tail call void @llvm.dbg.value(metadata !{i8* %73}, i64 0, metadata !1391) #5, !dbg !1405
  store i8 %70, i8* %sc.0.i, align 1, !dbg !1405, !tbaa !693
  %74 = icmp eq i8 %70, 0, !dbg !1406
  br i1 %74, label %__concretize_string.exit, label %75, !dbg !1406

; <label>:75                                      ; preds = %67, %65, %63
  %sc.1.i = phi i8* [ %73, %67 ], [ %66, %65 ], [ %sc.0.i, %63 ]
  %76 = add i32 %i.0.i, 1, !dbg !1393
  tail call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !1392) #5, !dbg !1393
  br label %58, !dbg !1393

__concretize_string.exit:                         ; preds = %67, %64, %__get_sym_file.exit.thread
  %77 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %64 ], [ %path, %67 ], !dbg !1383
  %78 = sext i32 %flags to i64, !dbg !1381
  %79 = tail call i64 (i64, ...)* @syscall(i64 262, i64 %.01, i8* %77, %struct.stat* %buf, i64 %78) #5, !dbg !1381
  %80 = trunc i64 %79 to i32, !dbg !1381
  tail call void @llvm.dbg.value(metadata !{i32 %80}, i64 0, metadata !246), !dbg !1381
  %81 = icmp eq i32 %80, -1, !dbg !1407
  br i1 %81, label %82, label %85, !dbg !1407

; <label>:82                                      ; preds = %__concretize_string.exit
  %83 = tail call i32 @klee_get_errno() #5, !dbg !1409
  %84 = tail call i32* @__errno_location() #1, !dbg !1409
  store i32 %83, i32* %84, align 4, !dbg !1409, !tbaa !751
  br label %85, !dbg !1409

; <label>:85                                      ; preds = %__concretize_string.exit, %82, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ 0, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %82 ], [ %80, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1410
}

; Function Attrs: nounwind uwtable
define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !249), !dbg !1411
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !250), !dbg !1411
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1412), !dbg !1414
  %1 = load i8* %path, align 1, !dbg !1415, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1416), !dbg !1415
  %2 = sext i8 %1 to i32, !dbg !1417
  %3 = icmp eq i8 %1, 0, !dbg !1417
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1417

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1417
  %6 = load i8* %5, align 1, !dbg !1417, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1417
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1417

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1418, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1418
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1418

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1418
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1418

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1419
  %12 = ashr exact i32 %sext.i, 24, !dbg !1419
  %13 = add nsw i32 %12, 65, !dbg !1419
  %14 = icmp eq i32 %2, %13, !dbg !1419
  %15 = add i32 %i.02.i, 1, !dbg !1418
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1420), !dbg !1418
  br i1 %14, label %16, label %10, !dbg !1419

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1421
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1421, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1422
  %20 = load %struct.stat64** %19, align 8, !dbg !1422, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1422
  %22 = load i64* %21, align 8, !dbg !1422, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1422
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1421
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1423
  %or.cond = or i1 %23, %25, !dbg !1422
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1422

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !1425
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !1425
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 144, i32 8, i1 false), !dbg !1425
  br label %59, !dbg !1427

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1428) #5, !dbg !1430
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1431) #5, !dbg !1433
  %29 = ptrtoint i8* %path to i64, !dbg !1434
  %30 = tail call i64 @klee_get_valuel(i64 %29) #5, !dbg !1434
  %31 = inttoptr i64 %30 to i8*, !dbg !1434
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1435) #5, !dbg !1434
  %32 = icmp eq i8* %31, %path, !dbg !1436
  %33 = zext i1 %32 to i64, !dbg !1436
  tail call void @klee_assume(i64 %33) #5, !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1437) #5, !dbg !1432
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1438) #5, !dbg !1439
  br label %34, !dbg !1439

; <label>:34                                      ; preds = %51, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %52, %51 ]
  %sc.0.i = phi i8* [ %31, %__get_sym_file.exit.thread ], [ %sc.1.i, %51 ]
  %35 = load i8* %sc.0.i, align 1, !dbg !1440, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %35}, i64 0, metadata !1441) #5, !dbg !1440
  %36 = add i32 %i.0.i, -1, !dbg !1442
  %37 = and i32 %36, %i.0.i, !dbg !1442
  %38 = icmp eq i32 %37, 0, !dbg !1442
  br i1 %38, label %39, label %43, !dbg !1442

; <label>:39                                      ; preds = %34
  switch i8 %35, label %51 [
    i8 0, label %40
    i8 47, label %41
  ], !dbg !1443

; <label>:40                                      ; preds = %39
  store i8 0, i8* %sc.0.i, align 1, !dbg !1444, !tbaa !693
  br label %__concretize_string.exit, !dbg !1445

; <label>:41                                      ; preds = %39
  %42 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1446
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !1437) #5, !dbg !1446
  store i8 47, i8* %sc.0.i, align 1, !dbg !1446, !tbaa !693
  br label %51, !dbg !1447

; <label>:43                                      ; preds = %34
  %44 = sext i8 %35 to i64, !dbg !1448
  %45 = tail call i64 @klee_get_valuel(i64 %44) #5, !dbg !1448
  %46 = trunc i64 %45 to i8, !dbg !1448
  tail call void @llvm.dbg.value(metadata !{i8 %46}, i64 0, metadata !1449) #5, !dbg !1448
  %47 = icmp eq i8 %46, %35, !dbg !1450
  %48 = zext i1 %47 to i64, !dbg !1450
  tail call void @klee_assume(i64 %48) #5, !dbg !1450
  %49 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1451
  tail call void @llvm.dbg.value(metadata !{i8* %49}, i64 0, metadata !1437) #5, !dbg !1451
  store i8 %46, i8* %sc.0.i, align 1, !dbg !1451, !tbaa !693
  %50 = icmp eq i8 %46, 0, !dbg !1452
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1452

; <label>:51                                      ; preds = %43, %41, %39
  %sc.1.i = phi i8* [ %49, %43 ], [ %42, %41 ], [ %sc.0.i, %39 ]
  %52 = add i32 %i.0.i, 1, !dbg !1439
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1438) #5, !dbg !1439
  br label %34, !dbg !1439

__concretize_string.exit:                         ; preds = %43, %40
  %53 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat64* %buf) #5, !dbg !1429
  %54 = trunc i64 %53 to i32, !dbg !1429
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !252), !dbg !1429
  %55 = icmp eq i32 %54, -1, !dbg !1453
  br i1 %55, label %56, label %59, !dbg !1453

; <label>:56                                      ; preds = %__concretize_string.exit
  %57 = tail call i32 @klee_get_errno() #5, !dbg !1455
  %58 = tail call i32* @__errno_location() #1, !dbg !1455
  store i32 %57, i32* %58, align 4, !dbg !1455, !tbaa !751
  br label %59, !dbg !1455

; <label>:59                                      ; preds = %__concretize_string.exit, %56, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %56 ], [ %54, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1456
}

; Function Attrs: nounwind uwtable
define i32 @chdir(i8* %path) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !258), !dbg !1457
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1458), !dbg !1460
  %1 = load i8* %path, align 1, !dbg !1461, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1462), !dbg !1461
  %2 = sext i8 %1 to i32, !dbg !1463
  %3 = icmp eq i8 %1, 0, !dbg !1463
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1463

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1463
  %6 = load i8* %5, align 1, !dbg !1463, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1463
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1463

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1464, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1464
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1464

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1464
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1464

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1465
  %12 = ashr exact i32 %sext.i, 24, !dbg !1465
  %13 = add nsw i32 %12, 65, !dbg !1465
  %14 = icmp eq i32 %2, %13, !dbg !1465
  %15 = add i32 %i.02.i, 1, !dbg !1464
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1466), !dbg !1464
  br i1 %14, label %16, label %10, !dbg !1465

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1467
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1467, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1468
  %20 = load %struct.stat64** %19, align 8, !dbg !1468, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1468
  %22 = load i64* %21, align 8, !dbg !1468, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1468
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1467
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1469
  %or.cond = or i1 %23, %25, !dbg !1468
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1468

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1471
  %27 = tail call i32* @__errno_location() #1, !dbg !1473
  store i32 2, i32* %27, align 4, !dbg !1473, !tbaa !751
  br label %58, !dbg !1474

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1475) #5, !dbg !1477
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1478) #5, !dbg !1480
  %28 = ptrtoint i8* %path to i64, !dbg !1481
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1481
  %30 = inttoptr i64 %29 to i8*, !dbg !1481
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1482) #5, !dbg !1481
  %31 = icmp eq i8* %30, %path, !dbg !1483
  %32 = zext i1 %31 to i64, !dbg !1483
  tail call void @klee_assume(i64 %32) #5, !dbg !1483
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1484) #5, !dbg !1479
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1485) #5, !dbg !1486
  br label %33, !dbg !1486

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1487, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1488) #5, !dbg !1487
  %35 = add i32 %i.0.i, -1, !dbg !1489
  %36 = and i32 %35, %i.0.i, !dbg !1489
  %37 = icmp eq i32 %36, 0, !dbg !1489
  br i1 %37, label %38, label %42, !dbg !1489

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1490

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1491, !tbaa !693
  br label %__concretize_string.exit, !dbg !1492

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1493
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1484) #5, !dbg !1493
  store i8 47, i8* %sc.0.i, align 1, !dbg !1493, !tbaa !693
  br label %50, !dbg !1494

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1495
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1495
  %45 = trunc i64 %44 to i8, !dbg !1495
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1496) #5, !dbg !1495
  %46 = icmp eq i8 %45, %34, !dbg !1497
  %47 = zext i1 %46 to i64, !dbg !1497
  tail call void @klee_assume(i64 %47) #5, !dbg !1497
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1498
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1484) #5, !dbg !1498
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1498, !tbaa !693
  %49 = icmp eq i8 %45, 0, !dbg !1499
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1499

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1486
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1485) #5, !dbg !1486
  br label %33, !dbg !1486

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) #5, !dbg !1476
  %53 = trunc i64 %52 to i32, !dbg !1476
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !260), !dbg !1476
  %54 = icmp eq i32 %53, -1, !dbg !1500
  br i1 %54, label %55, label %58, !dbg !1500

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1502
  %57 = tail call i32* @__errno_location() #1, !dbg !1502
  store i32 %56, i32* %57, align 4, !dbg !1502, !tbaa !751
  br label %58, !dbg !1502

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1503
}

; Function Attrs: nounwind uwtable
define i32 @fchdir(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !264), !dbg !1504
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1505), !dbg !1507
  %1 = icmp ult i32 %fd, 32, !dbg !1508
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1508

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1509
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1510
  %5 = load i32* %4, align 4, !dbg !1510, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1510
  %7 = icmp eq i32 %6, 0, !dbg !1510
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1510

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1509
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !265), !dbg !1506
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1511
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1511

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1513
  store i32 9, i32* %10, align 4, !dbg !1513, !tbaa !751
  br label %26, !dbg !1515

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1516
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1516, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1516
  br i1 %14, label %17, label %15, !dbg !1516

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1517
  %16 = tail call i32* @__errno_location() #1, !dbg !1519
  store i32 2, i32* %16, align 4, !dbg !1519, !tbaa !751
  br label %26, !dbg !1520

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1521
  %19 = load i32* %18, align 8, !dbg !1521, !tbaa !854
  %20 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %19) #5, !dbg !1521
  %21 = trunc i64 %20 to i32, !dbg !1521
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !266), !dbg !1521
  %22 = icmp eq i32 %21, -1, !dbg !1522
  br i1 %22, label %23, label %26, !dbg !1522

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #5, !dbg !1524
  %25 = tail call i32* @__errno_location() #1, !dbg !1524
  store i32 %24, i32* %25, align 4, !dbg !1524, !tbaa !751
  br label %26, !dbg !1524

; <label>:26                                      ; preds = %17, %23, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !1525
}

; Function Attrs: nounwind uwtable
define i32 @chmod(i8* %path, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !273), !dbg !1526
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !274), !dbg !1526
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1527), !dbg !1529
  %1 = load i8* %path, align 1, !dbg !1530, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1531), !dbg !1530
  %2 = sext i8 %1 to i32, !dbg !1532
  %3 = icmp eq i8 %1, 0, !dbg !1532
  br i1 %3, label %__get_sym_file.exit, label %4, !dbg !1532

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1532
  %6 = load i8* %5, align 1, !dbg !1532, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1532
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit, !dbg !1532

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1533, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1533
  br i1 %9, label %__get_sym_file.exit, label %.lr.ph.i, !dbg !1533

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1533
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit, !dbg !1533

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1534
  %12 = ashr exact i32 %sext.i, 24, !dbg !1534
  %13 = add nsw i32 %12, 65, !dbg !1534
  %14 = icmp eq i32 %2, %13, !dbg !1534
  %15 = add i32 %i.02.i, 1, !dbg !1533
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1535), !dbg !1533
  br i1 %14, label %16, label %10, !dbg !1534

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1536
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1536, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1537
  %20 = load %struct.stat64** %19, align 8, !dbg !1537, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1537
  %22 = load i64* %21, align 8, !dbg !1537, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1537
  br i1 %23, label %__get_sym_file.exit, label %24, !dbg !1537

; <label>:24                                      ; preds = %16
  %25 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1536
  br label %__get_sym_file.exit, !dbg !1538

__get_sym_file.exit:                              ; preds = %10, %0, %4, %.preheader.i, %16, %24
  %.0.i = phi %struct.exe_disk_file_t* [ %25, %24 ], [ null, %4 ], [ null, %0 ], [ null, %16 ], [ null, %.preheader.i ], [ null, %10 ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !275), !dbg !1528
  %26 = load i32* @chmod.n_calls, align 4, !dbg !1539, !tbaa !751
  %27 = add nsw i32 %26, 1, !dbg !1539
  store i32 %27, i32* @chmod.n_calls, align 4, !dbg !1539, !tbaa !751
  %28 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1540, !tbaa !1095
  %29 = icmp eq i32 %28, 0, !dbg !1540
  br i1 %29, label %37, label %30, !dbg !1540

; <label>:30                                      ; preds = %__get_sym_file.exit
  %31 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !1540, !tbaa !1542
  %32 = load i32* %31, align 4, !dbg !1540, !tbaa !751
  %33 = icmp eq i32 %32, %27, !dbg !1540
  br i1 %33, label %34, label %37, !dbg !1540

; <label>:34                                      ; preds = %30
  %35 = add i32 %28, -1, !dbg !1543
  store i32 %35, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1543, !tbaa !1095
  %36 = tail call i32* @__errno_location() #1, !dbg !1545
  store i32 5, i32* %36, align 4, !dbg !1545, !tbaa !751
  br label %__df_chmod.exit, !dbg !1546

; <label>:37                                      ; preds = %__get_sym_file.exit, %30
  %38 = icmp eq %struct.exe_disk_file_t* %.0.i, null, !dbg !1547
  br i1 %38, label %60, label %39, !dbg !1547

; <label>:39                                      ; preds = %37
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !1548) #5, !dbg !1551
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1552) #5, !dbg !1551
  %40 = tail call i32 @geteuid() #5, !dbg !1553
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %.0.i, i64 0, i32 2, !dbg !1553
  %42 = load %struct.stat64** %41, align 8, !dbg !1553, !tbaa !710
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 4, !dbg !1553
  %44 = load i32* %43, align 4, !dbg !1553, !tbaa !1555
  %45 = icmp eq i32 %40, %44, !dbg !1553
  br i1 %45, label %46, label %58, !dbg !1553

; <label>:46                                      ; preds = %39
  %47 = tail call i32 @getgid() #5, !dbg !1556
  %48 = load %struct.stat64** %41, align 8, !dbg !1556, !tbaa !710
  %49 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 5, !dbg !1556
  %50 = load i32* %49, align 4, !dbg !1556, !tbaa !1559
  %51 = icmp eq i32 %47, %50, !dbg !1556
  %52 = and i32 %mode, 3071, !dbg !1560
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1552) #5, !dbg !1560
  %mode..i = select i1 %51, i32 %mode, i32 %52, !dbg !1556
  %53 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 3, !dbg !1561
  %54 = load i32* %53, align 4, !dbg !1561, !tbaa !804
  %55 = and i32 %54, -4096, !dbg !1561
  %56 = and i32 %mode..i, 4095, !dbg !1561
  %57 = or i32 %56, %55, !dbg !1561
  store i32 %57, i32* %53, align 4, !dbg !1561, !tbaa !804
  br label %__df_chmod.exit, !dbg !1562

; <label>:58                                      ; preds = %39
  %59 = tail call i32* @__errno_location() #1, !dbg !1563
  store i32 1, i32* %59, align 4, !dbg !1563, !tbaa !751
  br label %__df_chmod.exit, !dbg !1565

; <label>:60                                      ; preds = %37
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1566) #5, !dbg !1568
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1569) #5, !dbg !1571
  %61 = ptrtoint i8* %path to i64, !dbg !1572
  %62 = tail call i64 @klee_get_valuel(i64 %61) #5, !dbg !1572
  %63 = inttoptr i64 %62 to i8*, !dbg !1572
  tail call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !1573) #5, !dbg !1572
  %64 = icmp eq i8* %63, %path, !dbg !1574
  %65 = zext i1 %64 to i64, !dbg !1574
  tail call void @klee_assume(i64 %65) #5, !dbg !1574
  tail call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !1575) #5, !dbg !1570
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1576) #5, !dbg !1577
  br label %66, !dbg !1577

; <label>:66                                      ; preds = %83, %60
  %i.0.i = phi i32 [ 0, %60 ], [ %84, %83 ]
  %sc.0.i = phi i8* [ %63, %60 ], [ %sc.1.i, %83 ]
  %67 = load i8* %sc.0.i, align 1, !dbg !1578, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %67}, i64 0, metadata !1579) #5, !dbg !1578
  %68 = add i32 %i.0.i, -1, !dbg !1580
  %69 = and i32 %68, %i.0.i, !dbg !1580
  %70 = icmp eq i32 %69, 0, !dbg !1580
  br i1 %70, label %71, label %75, !dbg !1580

; <label>:71                                      ; preds = %66
  switch i8 %67, label %83 [
    i8 0, label %72
    i8 47, label %73
  ], !dbg !1581

; <label>:72                                      ; preds = %71
  store i8 0, i8* %sc.0.i, align 1, !dbg !1582, !tbaa !693
  br label %__concretize_string.exit, !dbg !1583

; <label>:73                                      ; preds = %71
  %74 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1584
  tail call void @llvm.dbg.value(metadata !{i8* %74}, i64 0, metadata !1575) #5, !dbg !1584
  store i8 47, i8* %sc.0.i, align 1, !dbg !1584, !tbaa !693
  br label %83, !dbg !1585

; <label>:75                                      ; preds = %66
  %76 = sext i8 %67 to i64, !dbg !1586
  %77 = tail call i64 @klee_get_valuel(i64 %76) #5, !dbg !1586
  %78 = trunc i64 %77 to i8, !dbg !1586
  tail call void @llvm.dbg.value(metadata !{i8 %78}, i64 0, metadata !1587) #5, !dbg !1586
  %79 = icmp eq i8 %78, %67, !dbg !1588
  %80 = zext i1 %79 to i64, !dbg !1588
  tail call void @klee_assume(i64 %80) #5, !dbg !1588
  %81 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1589
  tail call void @llvm.dbg.value(metadata !{i8* %81}, i64 0, metadata !1575) #5, !dbg !1589
  store i8 %78, i8* %sc.0.i, align 1, !dbg !1589, !tbaa !693
  %82 = icmp eq i8 %78, 0, !dbg !1590
  br i1 %82, label %__concretize_string.exit, label %83, !dbg !1590

; <label>:83                                      ; preds = %75, %73, %71
  %sc.1.i = phi i8* [ %81, %75 ], [ %74, %73 ], [ %sc.0.i, %71 ]
  %84 = add i32 %i.0.i, 1, !dbg !1577
  tail call void @llvm.dbg.value(metadata !{i32 %84}, i64 0, metadata !1576) #5, !dbg !1577
  br label %66, !dbg !1577

__concretize_string.exit:                         ; preds = %75, %72
  %85 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) #5, !dbg !1567
  %86 = trunc i64 %85 to i32, !dbg !1567
  tail call void @llvm.dbg.value(metadata !{i32 %86}, i64 0, metadata !276), !dbg !1567
  %87 = icmp eq i32 %86, -1, !dbg !1591
  br i1 %87, label %88, label %__df_chmod.exit, !dbg !1591

; <label>:88                                      ; preds = %__concretize_string.exit
  %89 = tail call i32 @klee_get_errno() #5, !dbg !1593
  %90 = tail call i32* @__errno_location() #1, !dbg !1593
  store i32 %89, i32* %90, align 4, !dbg !1593, !tbaa !751
  br label %__df_chmod.exit, !dbg !1593

__df_chmod.exit:                                  ; preds = %58, %46, %__concretize_string.exit, %88, %34
  %.0 = phi i32 [ -1, %34 ], [ -1, %88 ], [ %86, %__concretize_string.exit ], [ 0, %46 ], [ -1, %58 ]
  ret i32 %.0, !dbg !1594
}

; Function Attrs: nounwind uwtable
define i32 @fchmod(i32 %fd, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !283), !dbg !1595
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !284), !dbg !1595
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1596), !dbg !1598
  %1 = icmp ult i32 %fd, 32, !dbg !1599
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1599

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1600
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1601
  %5 = load i32* %4, align 4, !dbg !1601, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1601
  %7 = icmp eq i32 %6, 0, !dbg !1601
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1601

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1600
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !285), !dbg !1597
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1602
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1602

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1604
  store i32 9, i32* %10, align 4, !dbg !1604, !tbaa !751
  br label %__df_chmod.exit, !dbg !1606

; <label>:11                                      ; preds = %__get_file.exit
  %12 = load i32* @fchmod.n_calls, align 4, !dbg !1607, !tbaa !751
  %13 = add nsw i32 %12, 1, !dbg !1607
  store i32 %13, i32* @fchmod.n_calls, align 4, !dbg !1607, !tbaa !751
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1608, !tbaa !1095
  %15 = icmp eq i32 %14, 0, !dbg !1608
  br i1 %15, label %23, label %16, !dbg !1608

; <label>:16                                      ; preds = %11
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !1608, !tbaa !1610
  %18 = load i32* %17, align 4, !dbg !1608, !tbaa !751
  %19 = icmp eq i32 %18, %13, !dbg !1608
  br i1 %19, label %20, label %23, !dbg !1608

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1611
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1611, !tbaa !1095
  %22 = tail call i32* @__errno_location() #1, !dbg !1613
  store i32 5, i32* %22, align 4, !dbg !1613, !tbaa !751
  br label %__df_chmod.exit, !dbg !1614

; <label>:23                                      ; preds = %11, %16
  %24 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1615
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1615, !tbaa !787
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !1615
  br i1 %26, label %48, label %27, !dbg !1615

; <label>:27                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %25}, i64 0, metadata !1616) #5, !dbg !1619
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1620) #5, !dbg !1619
  %28 = tail call i32 @geteuid() #5, !dbg !1621
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 2, !dbg !1621
  %30 = load %struct.stat64** %29, align 8, !dbg !1621, !tbaa !710
  %31 = getelementptr inbounds %struct.stat64* %30, i64 0, i32 4, !dbg !1621
  %32 = load i32* %31, align 4, !dbg !1621, !tbaa !1555
  %33 = icmp eq i32 %28, %32, !dbg !1621
  br i1 %33, label %34, label %46, !dbg !1621

; <label>:34                                      ; preds = %27
  %35 = tail call i32 @getgid() #5, !dbg !1622
  %36 = load %struct.stat64** %29, align 8, !dbg !1622, !tbaa !710
  %37 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 5, !dbg !1622
  %38 = load i32* %37, align 4, !dbg !1622, !tbaa !1559
  %39 = icmp eq i32 %35, %38, !dbg !1622
  %40 = and i32 %mode, 3071, !dbg !1623
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !1620) #5, !dbg !1623
  %mode..i = select i1 %39, i32 %mode, i32 %40, !dbg !1622
  %41 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 3, !dbg !1624
  %42 = load i32* %41, align 4, !dbg !1624, !tbaa !804
  %43 = and i32 %42, -4096, !dbg !1624
  %44 = and i32 %mode..i, 4095, !dbg !1624
  %45 = or i32 %44, %43, !dbg !1624
  store i32 %45, i32* %41, align 4, !dbg !1624, !tbaa !804
  br label %__df_chmod.exit, !dbg !1625

; <label>:46                                      ; preds = %27
  %47 = tail call i32* @__errno_location() #1, !dbg !1626
  store i32 1, i32* %47, align 4, !dbg !1626, !tbaa !751
  br label %__df_chmod.exit, !dbg !1627

; <label>:48                                      ; preds = %23
  %49 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1628
  %50 = load i32* %49, align 8, !dbg !1628, !tbaa !854
  %51 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %50, i32 %mode) #5, !dbg !1628
  %52 = trunc i64 %51 to i32, !dbg !1628
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !286), !dbg !1628
  %53 = icmp eq i32 %52, -1, !dbg !1629
  br i1 %53, label %54, label %__df_chmod.exit, !dbg !1629

; <label>:54                                      ; preds = %48
  %55 = tail call i32 @klee_get_errno() #5, !dbg !1631
  %56 = tail call i32* @__errno_location() #1, !dbg !1631
  store i32 %55, i32* %56, align 4, !dbg !1631, !tbaa !751
  br label %__df_chmod.exit, !dbg !1631

__df_chmod.exit:                                  ; preds = %46, %34, %48, %54, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ -1, %__get_file.exit.thread ], [ -1, %54 ], [ %52, %48 ], [ 0, %34 ], [ -1, %46 ]
  ret i32 %.0, !dbg !1632
}

; Function Attrs: nounwind uwtable
define i32 @chown(i8* %path, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !295), !dbg !1633
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !296), !dbg !1633
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !297), !dbg !1633
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1634), !dbg !1636
  %1 = load i8* %path, align 1, !dbg !1637, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1638), !dbg !1637
  %2 = sext i8 %1 to i32, !dbg !1639
  %3 = icmp eq i8 %1, 0, !dbg !1639
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1639

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1639
  %6 = load i8* %5, align 1, !dbg !1639, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1639
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1639

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1640, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1640
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1640

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1640
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1640

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1641
  %12 = ashr exact i32 %sext.i, 24, !dbg !1641
  %13 = add nsw i32 %12, 65, !dbg !1641
  %14 = icmp eq i32 %2, %13, !dbg !1641
  %15 = add i32 %i.02.i, 1, !dbg !1640
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1642), !dbg !1640
  br i1 %14, label %16, label %10, !dbg !1641

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1643
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1643, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1644
  %20 = load %struct.stat64** %19, align 8, !dbg !1644, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1644
  %22 = load i64* %21, align 8, !dbg !1644, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1644
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1643
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1645
  %or.cond = or i1 %23, %25, !dbg !1644
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1644

; <label>:26                                      ; preds = %16
  tail call void @llvm.dbg.value(metadata !1646, i64 0, metadata !1647) #5, !dbg !1650
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1651) #5, !dbg !1650
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1652) #5, !dbg !1650
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1653
  %27 = tail call i32* @__errno_location() #1, !dbg !1654
  store i32 1, i32* %27, align 4, !dbg !1654, !tbaa !751
  br label %58, !dbg !1648

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1655) #5, !dbg !1657
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1658) #5, !dbg !1660
  %28 = ptrtoint i8* %path to i64, !dbg !1661
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1661
  %30 = inttoptr i64 %29 to i8*, !dbg !1661
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1662) #5, !dbg !1661
  %31 = icmp eq i8* %30, %path, !dbg !1663
  %32 = zext i1 %31 to i64, !dbg !1663
  tail call void @klee_assume(i64 %32) #5, !dbg !1663
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1664) #5, !dbg !1659
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1665) #5, !dbg !1666
  br label %33, !dbg !1666

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1667, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1668) #5, !dbg !1667
  %35 = add i32 %i.0.i, -1, !dbg !1669
  %36 = and i32 %35, %i.0.i, !dbg !1669
  %37 = icmp eq i32 %36, 0, !dbg !1669
  br i1 %37, label %38, label %42, !dbg !1669

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1670

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1671, !tbaa !693
  br label %__concretize_string.exit, !dbg !1672

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1673
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1664) #5, !dbg !1673
  store i8 47, i8* %sc.0.i, align 1, !dbg !1673, !tbaa !693
  br label %50, !dbg !1674

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1675
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1675
  %45 = trunc i64 %44 to i8, !dbg !1675
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1676) #5, !dbg !1675
  %46 = icmp eq i8 %45, %34, !dbg !1677
  %47 = zext i1 %46 to i64, !dbg !1677
  tail call void @klee_assume(i64 %47) #5, !dbg !1677
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1678
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1664) #5, !dbg !1678
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1678, !tbaa !693
  %49 = icmp eq i8 %45, 0, !dbg !1679
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1679

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1666
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1665) #5, !dbg !1666
  br label %33, !dbg !1666

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1656
  %53 = trunc i64 %52 to i32, !dbg !1656
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !299), !dbg !1656
  %54 = icmp eq i32 %53, -1, !dbg !1680
  br i1 %54, label %55, label %58, !dbg !1680

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1682
  %57 = tail call i32* @__errno_location() #1, !dbg !1682
  store i32 %56, i32* %57, align 4, !dbg !1682, !tbaa !751
  br label %58, !dbg !1682

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1683
}

; Function Attrs: nounwind uwtable
define i32 @fchown(i32 %fd, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !306), !dbg !1684
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !307), !dbg !1684
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !308), !dbg !1684
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1685), !dbg !1687
  %1 = icmp ult i32 %fd, 32, !dbg !1688
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1688

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1689
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1690
  %5 = load i32* %4, align 4, !dbg !1690, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1690
  %7 = icmp eq i32 %6, 0, !dbg !1690
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1689
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1691
  %or.cond = or i1 %7, %9, !dbg !1690
  br i1 %or.cond, label %__get_file.exit.thread, label %11, !dbg !1690

__get_file.exit.thread:                           ; preds = %0, %2
  %10 = tail call i32* @__errno_location() #1, !dbg !1693
  store i32 9, i32* %10, align 4, !dbg !1693, !tbaa !751
  br label %24, !dbg !1695

; <label>:11                                      ; preds = %2
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1696
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1696, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1696
  br i1 %14, label %17, label %15, !dbg !1696

; <label>:15                                      ; preds = %11
  tail call void @llvm.dbg.value(metadata !1646, i64 0, metadata !1697) #5, !dbg !1700
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1701) #5, !dbg !1700
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1702) #5, !dbg !1700
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1703
  %16 = tail call i32* @__errno_location() #1, !dbg !1704
  store i32 1, i32* %16, align 4, !dbg !1704, !tbaa !751
  br label %24, !dbg !1698

; <label>:17                                      ; preds = %11
  %18 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) #5, !dbg !1705
  %19 = trunc i64 %18 to i32, !dbg !1705
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !310), !dbg !1705
  %20 = icmp eq i32 %19, -1, !dbg !1706
  br i1 %20, label %21, label %24, !dbg !1706

; <label>:21                                      ; preds = %17
  %22 = tail call i32 @klee_get_errno() #5, !dbg !1708
  %23 = tail call i32* @__errno_location() #1, !dbg !1708
  store i32 %22, i32* %23, align 4, !dbg !1708, !tbaa !751
  br label %24, !dbg !1708

; <label>:24                                      ; preds = %17, %21, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %17 ]
  ret i32 %.0, !dbg !1709
}

; Function Attrs: nounwind uwtable
define i32 @lchown(i8* %path, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !315), !dbg !1710
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !316), !dbg !1710
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !317), !dbg !1710
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1711), !dbg !1713
  %1 = load i8* %path, align 1, !dbg !1714, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1715), !dbg !1714
  %2 = sext i8 %1 to i32, !dbg !1716
  %3 = icmp eq i8 %1, 0, !dbg !1716
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1716

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1716
  %6 = load i8* %5, align 1, !dbg !1716, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !1716
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1716

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1717, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !1717
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1717

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1717
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1717

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1718
  %12 = ashr exact i32 %sext.i, 24, !dbg !1718
  %13 = add nsw i32 %12, 65, !dbg !1718
  %14 = icmp eq i32 %2, %13, !dbg !1718
  %15 = add i32 %i.02.i, 1, !dbg !1717
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1719), !dbg !1717
  br i1 %14, label %16, label %10, !dbg !1718

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1720
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1720, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1721
  %20 = load %struct.stat64** %19, align 8, !dbg !1721, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1721
  %22 = load i64* %21, align 8, !dbg !1721, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !1721
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1720
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1722
  %or.cond = or i1 %23, %25, !dbg !1721
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1721

; <label>:26                                      ; preds = %16
  tail call void @llvm.dbg.value(metadata !1646, i64 0, metadata !1723) #5, !dbg !1726
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1727) #5, !dbg !1726
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1728) #5, !dbg !1726
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1729
  %27 = tail call i32* @__errno_location() #1, !dbg !1730
  store i32 1, i32* %27, align 4, !dbg !1730, !tbaa !751
  br label %58, !dbg !1724

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1731) #5, !dbg !1733
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1734) #5, !dbg !1736
  %28 = ptrtoint i8* %path to i64, !dbg !1737
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1737
  %30 = inttoptr i64 %29 to i8*, !dbg !1737
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1738) #5, !dbg !1737
  %31 = icmp eq i8* %30, %path, !dbg !1739
  %32 = zext i1 %31 to i64, !dbg !1739
  tail call void @klee_assume(i64 %32) #5, !dbg !1739
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1740) #5, !dbg !1735
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1741) #5, !dbg !1742
  br label %33, !dbg !1742

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1743, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1744) #5, !dbg !1743
  %35 = add i32 %i.0.i, -1, !dbg !1745
  %36 = and i32 %35, %i.0.i, !dbg !1745
  %37 = icmp eq i32 %36, 0, !dbg !1745
  br i1 %37, label %38, label %42, !dbg !1745

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1746

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1747, !tbaa !693
  br label %__concretize_string.exit, !dbg !1748

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1749
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1740) #5, !dbg !1749
  store i8 47, i8* %sc.0.i, align 1, !dbg !1749, !tbaa !693
  br label %50, !dbg !1750

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1751
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1751
  %45 = trunc i64 %44 to i8, !dbg !1751
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1752) #5, !dbg !1751
  %46 = icmp eq i8 %45, %34, !dbg !1753
  %47 = zext i1 %46 to i64, !dbg !1753
  tail call void @klee_assume(i64 %47) #5, !dbg !1753
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1754
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1740) #5, !dbg !1754
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1754, !tbaa !693
  %49 = icmp eq i8 %45, 0, !dbg !1755
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1755

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1742
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1741) #5, !dbg !1742
  br label %33, !dbg !1742

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1732
  %53 = trunc i64 %52 to i32, !dbg !1732
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !319), !dbg !1732
  %54 = icmp eq i32 %53, -1, !dbg !1756
  br i1 %54, label %55, label %58, !dbg !1756

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1758
  %57 = tail call i32* @__errno_location() #1, !dbg !1758
  store i32 %56, i32* %57, align 4, !dbg !1758, !tbaa !751
  br label %58, !dbg !1758

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1759
}

; Function Attrs: nounwind uwtable
define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !326), !dbg !1760
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !327), !dbg !1760
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1761), !dbg !1763
  %1 = icmp ult i32 %fd, 32, !dbg !1764
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1764

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1765
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1766
  %5 = load i32* %4, align 4, !dbg !1766, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1766
  %7 = icmp eq i32 %6, 0, !dbg !1766
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1766

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1765
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !328), !dbg !1762
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1767
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1767

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1769
  store i32 9, i32* %10, align 4, !dbg !1769, !tbaa !751
  br label %29, !dbg !1771

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1772
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1772, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1772
  br i1 %14, label %15, label %24, !dbg !1772

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1773
  %17 = load i32* %16, align 8, !dbg !1773, !tbaa !854
  %18 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %17, %struct.stat64* %buf) #5, !dbg !1773
  %19 = trunc i64 %18 to i32, !dbg !1773
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !329), !dbg !1773
  %20 = icmp eq i32 %19, -1, !dbg !1774
  br i1 %20, label %21, label %29, !dbg !1774

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #5, !dbg !1776
  %23 = tail call i32* @__errno_location() #1, !dbg !1776
  store i32 %22, i32* %23, align 4, !dbg !1776, !tbaa !751
  br label %29, !dbg !1776

; <label>:24                                      ; preds = %11
  %25 = bitcast %struct.stat64* %buf to i8*, !dbg !1777
  %26 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 2, !dbg !1777
  %27 = load %struct.stat64** %26, align 8, !dbg !1777, !tbaa !710
  %28 = bitcast %struct.stat64* %27 to i8*, !dbg !1777
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %28, i64 144, i32 8, i1 false), !dbg !1777
  br label %29, !dbg !1778

; <label>:29                                      ; preds = %15, %21, %24, %__get_file.exit.thread
  %.0 = phi i32 [ 0, %24 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !1779
}

; Function Attrs: nounwind uwtable
define i32 @__fd_ftruncate(i32 %fd, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !336), !dbg !1780
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !337), !dbg !1780
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1781), !dbg !1783
  %1 = icmp ult i32 %fd, 32, !dbg !1784
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1784

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1785
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1786
  %5 = load i32* %4, align 4, !dbg !1786, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1786
  %7 = icmp eq i32 %6, 0, !dbg !1786
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1786

__get_file.exit.thread:                           ; preds = %2, %0
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !338), !dbg !1782
  %8 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1787, !tbaa !751
  %9 = add nsw i32 %8, 1, !dbg !1787
  store i32 %9, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1787, !tbaa !751
  br label %14, !dbg !1788

__get_file.exit:                                  ; preds = %2
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1785
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !338), !dbg !1782
  %11 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1787, !tbaa !751
  %12 = add nsw i32 %11, 1, !dbg !1787
  store i32 %12, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1787, !tbaa !751
  %13 = icmp eq %struct.exe_file_t* %10, null, !dbg !1788
  br i1 %13, label %14, label %16, !dbg !1788

; <label>:14                                      ; preds = %__get_file.exit.thread, %__get_file.exit
  %15 = tail call i32* @__errno_location() #1, !dbg !1790
  store i32 9, i32* %15, align 4, !dbg !1790, !tbaa !751
  br label %41, !dbg !1792

; <label>:16                                      ; preds = %__get_file.exit
  %17 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1793, !tbaa !1095
  %18 = icmp eq i32 %17, 0, !dbg !1793
  br i1 %18, label %26, label %19, !dbg !1793

; <label>:19                                      ; preds = %16
  %20 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !1793, !tbaa !1795
  %21 = load i32* %20, align 4, !dbg !1793, !tbaa !751
  %22 = icmp eq i32 %21, %12, !dbg !1793
  br i1 %22, label %23, label %26, !dbg !1793

; <label>:23                                      ; preds = %19
  %24 = add i32 %17, -1, !dbg !1796
  store i32 %24, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1796, !tbaa !1095
  %25 = tail call i32* @__errno_location() #1, !dbg !1798
  store i32 5, i32* %25, align 4, !dbg !1798, !tbaa !751
  br label %41, !dbg !1799

; <label>:26                                      ; preds = %16, %19
  %27 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1800
  %28 = load %struct.exe_disk_file_t** %27, align 8, !dbg !1800, !tbaa !787
  %29 = icmp eq %struct.exe_disk_file_t* %28, null, !dbg !1800
  br i1 %29, label %32, label %30, !dbg !1800

; <label>:30                                      ; preds = %26
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0)) #5, !dbg !1801
  %31 = tail call i32* @__errno_location() #1, !dbg !1803
  store i32 5, i32* %31, align 4, !dbg !1803, !tbaa !751
  br label %41, !dbg !1804

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1805
  %34 = load i32* %33, align 8, !dbg !1805, !tbaa !854
  %35 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %34, i64 %length) #5, !dbg !1805
  %36 = trunc i64 %35 to i32, !dbg !1805
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !339), !dbg !1805
  %37 = icmp eq i32 %36, -1, !dbg !1806
  br i1 %37, label %38, label %41, !dbg !1806

; <label>:38                                      ; preds = %32
  %39 = tail call i32 @klee_get_errno() #5, !dbg !1808
  %40 = tail call i32* @__errno_location() #1, !dbg !1808
  store i32 %39, i32* %40, align 4, !dbg !1808, !tbaa !751
  br label %41, !dbg !1808

; <label>:41                                      ; preds = %32, %38, %30, %23, %14
  %.0 = phi i32 [ -1, %23 ], [ -1, %30 ], [ -1, %14 ], [ -1, %38 ], [ %36, %32 ]
  ret i32 %.0, !dbg !1809
}

; Function Attrs: nounwind uwtable
define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !360), !dbg !1810
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !361), !dbg !1810
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !362), !dbg !1810
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1811), !dbg !1813
  %1 = icmp ult i32 %fd, 32, !dbg !1814
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1814

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1815
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1816
  %5 = load i32* %4, align 4, !dbg !1816, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1816
  %7 = icmp eq i32 %6, 0, !dbg !1816
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1816

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1815
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !363), !dbg !1812
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1817
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1817

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1819
  store i32 9, i32* %10, align 4, !dbg !1819, !tbaa !751
  br label %.loopexit, !dbg !1821

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1822
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1822, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1822
  br i1 %14, label %17, label %15, !dbg !1822

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1823
  %16 = tail call i32* @__errno_location() #1, !dbg !1825
  store i32 22, i32* %16, align 4, !dbg !1825, !tbaa !751
  br label %.loopexit, !dbg !1826

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1827
  %19 = load i64* %18, align 8, !dbg !1827, !tbaa !1149
  %20 = icmp ult i64 %19, 4096, !dbg !1827
  br i1 %20, label %21, label %69, !dbg !1827

; <label>:21                                      ; preds = %17
  tail call void @llvm.dbg.value(metadata !1221, i64 0, metadata !370), !dbg !1828
  %22 = udiv i64 %19, 280, !dbg !1829
  tail call void @llvm.dbg.value(metadata !{i64 %22}, i64 0, metadata !364), !dbg !1829
  %23 = mul i64 %22, 280, !dbg !1830
  %24 = icmp eq i64 %23, %19, !dbg !1830
  br i1 %24, label %25, label %30, !dbg !1830

; <label>:25                                      ; preds = %21
  %26 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1830, !tbaa !700
  %27 = zext i32 %26 to i64, !dbg !1830
  %28 = icmp ugt i64 %22, %27, !dbg !1830
  br i1 %28, label %30, label %.preheader, !dbg !1830

.preheader:                                       ; preds = %25
  %29 = icmp ult i64 %22, %27, !dbg !1832
  br i1 %29, label %.lr.ph, label %._crit_edge, !dbg !1832

; <label>:30                                      ; preds = %21, %25
  %31 = tail call i32* @__errno_location() #1, !dbg !1833
  store i32 22, i32* %31, align 4, !dbg !1833, !tbaa !751
  br label %.loopexit, !dbg !1835

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %.015 = phi %struct.dirent64* [ %52, %.lr.ph ], [ %dirp, %.preheader ]
  %i.04 = phi i64 [ %48, %.lr.ph ], [ %22, %.preheader ]
  %bytes.03 = phi i64 [ %51, %.lr.ph ], [ 0, %.preheader ]
  %32 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1836, !tbaa !707
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %32, i64 %i.04, i32 2, !dbg !1837
  %34 = load %struct.stat64** %33, align 8, !dbg !1837, !tbaa !710
  %35 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 1, !dbg !1837
  %36 = load i64* %35, align 8, !dbg !1837, !tbaa !712
  %37 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 0, !dbg !1837
  store i64 %36, i64* %37, align 8, !dbg !1837, !tbaa !1838
  %38 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 2, !dbg !1841
  store i16 280, i16* %38, align 2, !dbg !1841, !tbaa !1842
  %39 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1843
  %40 = load i32* %39, align 4, !dbg !1843, !tbaa !804
  %41 = lshr i32 %40, 12, !dbg !1843
  %.tr = trunc i32 %41 to i8, !dbg !1843
  %42 = and i8 %.tr, 15, !dbg !1843
  %43 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 3, !dbg !1843
  store i8 %42, i8* %43, align 1, !dbg !1843, !tbaa !1844
  %44 = add nsw i64 %i.04, 65, !dbg !1845
  %45 = trunc i64 %44 to i8, !dbg !1845
  %46 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 0, !dbg !1845
  store i8 %45, i8* %46, align 1, !dbg !1845, !tbaa !693
  %47 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 1, !dbg !1846
  store i8 0, i8* %47, align 1, !dbg !1846, !tbaa !693
  %48 = add nsw i64 %i.04, 1, !dbg !1847
  %49 = mul i64 %48, 280, !dbg !1847
  %50 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 1, !dbg !1847
  store i64 %49, i64* %50, align 8, !dbg !1847, !tbaa !1848
  %51 = add nsw i64 %bytes.03, 280, !dbg !1849
  tail call void @llvm.dbg.value(metadata !{i64 %51}, i64 0, metadata !370), !dbg !1849
  %52 = getelementptr inbounds %struct.dirent64* %.015, i64 1, !dbg !1850
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %52}, i64 0, metadata !361), !dbg !1850
  tail call void @llvm.dbg.value(metadata !{i64 %48}, i64 0, metadata !364), !dbg !1832
  %53 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1832, !tbaa !700
  %54 = zext i32 %53 to i64, !dbg !1832
  %55 = icmp slt i64 %48, %54, !dbg !1832
  br i1 %55, label %.lr.ph, label %._crit_edge, !dbg !1832

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %.01.lcssa = phi %struct.dirent64* [ %dirp, %.preheader ], [ %52, %.lr.ph ]
  %bytes.0.lcssa = phi i64 [ 0, %.preheader ], [ %51, %.lr.ph ]
  %56 = icmp ult i32 %count, 4096, !dbg !1851
  %57 = zext i32 %count to i64, !dbg !1851
  %58 = select i1 %56, i64 %57, i64 4096, !dbg !1851
  tail call void @llvm.dbg.value(metadata !{i64 %58}, i64 0, metadata !369), !dbg !1851
  %59 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 0, !dbg !1852
  store i64 0, i64* %59, align 8, !dbg !1852, !tbaa !1838
  %60 = sub nsw i64 %58, %bytes.0.lcssa, !dbg !1853
  %61 = trunc i64 %60 to i16, !dbg !1853
  %62 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 2, !dbg !1853
  store i16 %61, i16* %62, align 2, !dbg !1853, !tbaa !1842
  %63 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 3, !dbg !1854
  store i8 0, i8* %63, align 1, !dbg !1854, !tbaa !1844
  %64 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 4, i64 0, !dbg !1855
  store i8 0, i8* %64, align 1, !dbg !1855, !tbaa !693
  %65 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 1, !dbg !1856
  store i64 4096, i64* %65, align 8, !dbg !1856, !tbaa !1848
  %66 = and i64 %60, 65535, !dbg !1857
  %67 = add nsw i64 %66, %bytes.0.lcssa, !dbg !1857
  tail call void @llvm.dbg.value(metadata !{i64 %67}, i64 0, metadata !370), !dbg !1857
  store i64 %58, i64* %18, align 8, !dbg !1858, !tbaa !1149
  %68 = trunc i64 %67 to i32, !dbg !1859
  br label %.loopexit, !dbg !1859

; <label>:69                                      ; preds = %17
  %70 = add nsw i64 %19, -4096, !dbg !1860
  tail call void @llvm.dbg.value(metadata !{i64 %70}, i64 0, metadata !374), !dbg !1860
  tail call void @llvm.dbg.value(metadata !1221, i64 0, metadata !377), !dbg !1861
  %71 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1862
  %72 = zext i32 %count to i64, !dbg !1862
  tail call void @llvm.memset.p0i8.i64(i8* %71, i8 0, i64 %72, i32 8, i1 false), !dbg !1862
  %73 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1863
  %74 = load i32* %73, align 8, !dbg !1863, !tbaa !854
  %75 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %74, i64 %70, i32 0) #5, !dbg !1863
  tail call void @llvm.dbg.value(metadata !{i64 %75}, i64 0, metadata !377), !dbg !1863
  %76 = icmp eq i64 %75, -1, !dbg !1864
  br i1 %76, label %77, label %78, !dbg !1864

; <label>:77                                      ; preds = %69
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8]* @.str4, i64 0, i64 0), i32 875, i8* getelementptr inbounds ([65 x i8]* @__PRETTY_FUNCTION__.__fd_getdents, i64 0, i64 0)) #8, !dbg !1864
  unreachable, !dbg !1864

; <label>:78                                      ; preds = %69
  %79 = load i32* %73, align 8, !dbg !1865, !tbaa !854
  %80 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %79, %struct.dirent64* %dirp, i32 %count) #5, !dbg !1865
  %81 = trunc i64 %80 to i32, !dbg !1865
  tail call void @llvm.dbg.value(metadata !{i32 %81}, i64 0, metadata !376), !dbg !1865
  %82 = icmp eq i32 %81, -1, !dbg !1866
  br i1 %82, label %83, label %86, !dbg !1866

; <label>:83                                      ; preds = %78
  %84 = tail call i32 @klee_get_errno() #5, !dbg !1867
  %85 = tail call i32* @__errno_location() #1, !dbg !1867
  store i32 %84, i32* %85, align 4, !dbg !1867, !tbaa !751
  br label %.loopexit, !dbg !1869

; <label>:86                                      ; preds = %78
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !378), !dbg !1870
  %87 = load i32* %73, align 8, !dbg !1871, !tbaa !854
  %88 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %87, i32 0, i32 1) #5, !dbg !1871
  %89 = add nsw i64 %88, 4096, !dbg !1871
  store i64 %89, i64* %18, align 8, !dbg !1871, !tbaa !1149
  %90 = icmp sgt i32 %81, 0, !dbg !1872
  br i1 %90, label %.lr.ph9, label %.loopexit, !dbg !1872

.lr.ph9:                                          ; preds = %86, %.lr.ph9
  %pos.07 = phi i32 [ %100, %.lr.ph9 ], [ 0, %86 ]
  %91 = sext i32 %pos.07 to i64, !dbg !1873
  %.sum = add i64 %91, 8, !dbg !1874
  %92 = getelementptr inbounds i8* %71, i64 %.sum, !dbg !1874
  %93 = bitcast i8* %92 to i64*, !dbg !1874
  %94 = load i64* %93, align 8, !dbg !1874, !tbaa !1848
  %95 = add nsw i64 %94, 4096, !dbg !1874
  store i64 %95, i64* %93, align 8, !dbg !1874, !tbaa !1848
  %.sum2 = add i64 %91, 16, !dbg !1875
  %96 = getelementptr inbounds i8* %71, i64 %.sum2, !dbg !1875
  %97 = bitcast i8* %96 to i16*, !dbg !1875
  %98 = load i16* %97, align 2, !dbg !1875, !tbaa !1842
  %99 = zext i16 %98 to i32, !dbg !1875
  %100 = add nsw i32 %99, %pos.07, !dbg !1875
  tail call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !378), !dbg !1875
  %101 = icmp slt i32 %100, %81, !dbg !1872
  br i1 %101, label %.lr.ph9, label %.loopexit, !dbg !1872

.loopexit:                                        ; preds = %.lr.ph9, %86, %83, %._crit_edge, %30, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %30 ], [ %68, %._crit_edge ], [ -1, %__get_file.exit.thread ], [ -1, %83 ], [ %81, %86 ], [ %81, %.lr.ph9 ]
  ret i32 %.0, !dbg !1876
}

; Function Attrs: nounwind uwtable
define i32 @ioctl(i32 %fd, i64 %request, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !387), !dbg !1877
  call void @llvm.dbg.value(metadata !{i64 %request}, i64 0, metadata !388), !dbg !1877
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1878), !dbg !1880
  %1 = icmp ult i32 %fd, 32, !dbg !1881
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1881

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1882
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1883
  %5 = load i32* %4, align 4, !dbg !1883, !tbaa !764
  %6 = and i32 %5, 1, !dbg !1883
  %7 = icmp eq i32 %6, 0, !dbg !1883
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1883

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1882
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !389), !dbg !1879
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !390), !dbg !1884
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1885
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1885

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = call i32* @__errno_location() #1, !dbg !1887
  store i32 9, i32* %10, align 4, !dbg !1887, !tbaa !751
  br label %139, !dbg !1889

; <label>:11                                      ; preds = %__get_file.exit
  %12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1890
  call void @llvm.va_start(i8* %12), !dbg !1890
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !1891
  %14 = load i32* %13, align 16, !dbg !1891
  %15 = icmp ult i32 %14, 41, !dbg !1891
  br i1 %15, label %16, label %22, !dbg !1891

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !1891
  %18 = load i8** %17, align 16, !dbg !1891
  %19 = sext i32 %14 to i64, !dbg !1891
  %20 = getelementptr i8* %18, i64 %19, !dbg !1891
  %21 = add i32 %14, 8, !dbg !1891
  store i32 %21, i32* %13, align 16, !dbg !1891
  br label %26, !dbg !1891

; <label>:22                                      ; preds = %11
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !1891
  %24 = load i8** %23, align 8, !dbg !1891
  %25 = getelementptr i8* %24, i64 8, !dbg !1891
  store i8* %25, i8** %23, align 8, !dbg !1891
  br label %26, !dbg !1891

; <label>:26                                      ; preds = %22, %16
  %.in = phi i8* [ %20, %16 ], [ %24, %22 ]
  %27 = bitcast i8* %.in to i8**, !dbg !1891
  %28 = load i8** %27, align 8, !dbg !1891
  call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !404), !dbg !1891
  call void @llvm.va_end(i8* %12), !dbg !1892
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1893
  %30 = load %struct.exe_disk_file_t** %29, align 8, !dbg !1893, !tbaa !787
  %31 = icmp eq %struct.exe_disk_file_t* %30, null, !dbg !1893
  br i1 %31, label %130, label %32, !dbg !1893

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %30, i64 0, i32 2, !dbg !1894
  %34 = load %struct.stat64** %33, align 8, !dbg !1894, !tbaa !710
  switch i64 %request, label %128 [
    i64 21505, label %35
    i64 21506, label %70
    i64 21507, label %77
    i64 21508, label %81
    i64 21523, label %88
    i64 21524, label %98
    i64 21531, label %106
    i64 2150657282, label %126
  ], !dbg !1895

; <label>:35                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !1896
  %36 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1897
  %37 = load i32* %36, align 4, !dbg !1897, !tbaa !1899
  %38 = and i32 %37, 61440, !dbg !1897
  %39 = icmp eq i32 %38, 8192, !dbg !1897
  br i1 %39, label %40, label %68, !dbg !1897

; <label>:40                                      ; preds = %35
  %41 = bitcast i8* %28 to i32*, !dbg !1901
  store i32 27906, i32* %41, align 4, !dbg !1901, !tbaa !1903
  %42 = getelementptr inbounds i8* %28, i64 4, !dbg !1905
  %43 = bitcast i8* %42 to i32*, !dbg !1905
  store i32 5, i32* %43, align 4, !dbg !1905, !tbaa !1906
  %44 = getelementptr inbounds i8* %28, i64 8, !dbg !1907
  %45 = bitcast i8* %44 to i32*, !dbg !1907
  store i32 1215, i32* %45, align 4, !dbg !1907, !tbaa !1908
  %46 = getelementptr inbounds i8* %28, i64 12, !dbg !1909
  %47 = bitcast i8* %46 to i32*, !dbg !1909
  store i32 35287, i32* %47, align 4, !dbg !1909, !tbaa !1910
  %48 = getelementptr inbounds i8* %28, i64 16, !dbg !1911
  store i8 0, i8* %48, align 1, !dbg !1911, !tbaa !1912
  %49 = getelementptr inbounds i8* %28, i64 17, !dbg !1913
  store i8 3, i8* %49, align 1, !dbg !1913, !tbaa !693
  %50 = getelementptr inbounds i8* %28, i64 18, !dbg !1914
  store i8 28, i8* %50, align 1, !dbg !1914, !tbaa !693
  %51 = getelementptr inbounds i8* %28, i64 19, !dbg !1915
  store i8 127, i8* %51, align 1, !dbg !1915, !tbaa !693
  %52 = getelementptr inbounds i8* %28, i64 20, !dbg !1916
  store i8 21, i8* %52, align 1, !dbg !1916, !tbaa !693
  %53 = getelementptr inbounds i8* %28, i64 21, !dbg !1917
  store i8 4, i8* %53, align 1, !dbg !1917, !tbaa !693
  %54 = getelementptr inbounds i8* %28, i64 22, !dbg !1918
  store i8 0, i8* %54, align 1, !dbg !1918, !tbaa !693
  %55 = getelementptr inbounds i8* %28, i64 23, !dbg !1919
  store i8 1, i8* %55, align 1, !dbg !1919, !tbaa !693
  %56 = getelementptr inbounds i8* %28, i64 24, !dbg !1920
  store i8 -1, i8* %56, align 1, !dbg !1920, !tbaa !693
  %57 = getelementptr inbounds i8* %28, i64 25, !dbg !1921
  store i8 17, i8* %57, align 1, !dbg !1921, !tbaa !693
  %58 = getelementptr inbounds i8* %28, i64 26, !dbg !1922
  store i8 19, i8* %58, align 1, !dbg !1922, !tbaa !693
  %59 = getelementptr inbounds i8* %28, i64 27, !dbg !1923
  store i8 26, i8* %59, align 1, !dbg !1923, !tbaa !693
  %60 = getelementptr inbounds i8* %28, i64 28, !dbg !1924
  store i8 -1, i8* %60, align 1, !dbg !1924, !tbaa !693
  %61 = getelementptr inbounds i8* %28, i64 29, !dbg !1925
  store i8 18, i8* %61, align 1, !dbg !1925, !tbaa !693
  %62 = getelementptr inbounds i8* %28, i64 30, !dbg !1926
  store i8 15, i8* %62, align 1, !dbg !1926, !tbaa !693
  %63 = getelementptr inbounds i8* %28, i64 31, !dbg !1927
  store i8 23, i8* %63, align 1, !dbg !1927, !tbaa !693
  %64 = getelementptr inbounds i8* %28, i64 32, !dbg !1928
  store i8 22, i8* %64, align 1, !dbg !1928, !tbaa !693
  %65 = getelementptr inbounds i8* %28, i64 33, !dbg !1929
  store i8 -1, i8* %65, align 1, !dbg !1929, !tbaa !693
  %66 = getelementptr inbounds i8* %28, i64 34, !dbg !1930
  store i8 0, i8* %66, align 1, !dbg !1930, !tbaa !693
  %67 = getelementptr inbounds i8* %28, i64 35, !dbg !1931
  store i8 0, i8* %67, align 1, !dbg !1931, !tbaa !693
  br label %139, !dbg !1932

; <label>:68                                      ; preds = %35
  %69 = call i32* @__errno_location() #1, !dbg !1933
  store i32 25, i32* %69, align 4, !dbg !1933, !tbaa !751
  br label %139, !dbg !1935

; <label>:70                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !1936
  %71 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1938
  %72 = load i32* %71, align 4, !dbg !1938, !tbaa !1899
  %73 = and i32 %72, 61440, !dbg !1938
  %74 = icmp eq i32 %73, 8192, !dbg !1938
  br i1 %74, label %139, label %75, !dbg !1938

; <label>:75                                      ; preds = %70
  %76 = call i32* @__errno_location() #1, !dbg !1940
  store i32 25, i32* %76, align 4, !dbg !1940, !tbaa !751
  br label %139, !dbg !1942

; <label>:77                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str15, i64 0, i64 0)) #5, !dbg !1943
  %78 = icmp eq i32 %fd, 0, !dbg !1945
  br i1 %78, label %139, label %79, !dbg !1945

; <label>:79                                      ; preds = %77
  %80 = call i32* @__errno_location() #1, !dbg !1947
  store i32 25, i32* %80, align 4, !dbg !1947, !tbaa !751
  br label %139, !dbg !1949

; <label>:81                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str16, i64 0, i64 0)) #5, !dbg !1950
  %82 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1952
  %83 = load i32* %82, align 4, !dbg !1952, !tbaa !1899
  %84 = and i32 %83, 61440, !dbg !1952
  %85 = icmp eq i32 %84, 8192, !dbg !1952
  br i1 %85, label %139, label %86, !dbg !1952

; <label>:86                                      ; preds = %81
  %87 = call i32* @__errno_location() #1, !dbg !1954
  store i32 25, i32* %87, align 4, !dbg !1954, !tbaa !751
  br label %139, !dbg !1956

; <label>:88                                      ; preds = %32
  %89 = bitcast i8* %28 to i16*, !dbg !1957
  store i16 24, i16* %89, align 2, !dbg !1957, !tbaa !1958
  %90 = getelementptr inbounds i8* %28, i64 2, !dbg !1960
  %91 = bitcast i8* %90 to i16*, !dbg !1960
  store i16 80, i16* %91, align 2, !dbg !1960, !tbaa !1961
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str17, i64 0, i64 0)) #5, !dbg !1962
  %92 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1963
  %93 = load i32* %92, align 4, !dbg !1963, !tbaa !1899
  %94 = and i32 %93, 61440, !dbg !1963
  %95 = icmp eq i32 %94, 8192, !dbg !1963
  br i1 %95, label %139, label %96, !dbg !1963

; <label>:96                                      ; preds = %88
  %97 = call i32* @__errno_location() #1, !dbg !1965
  store i32 25, i32* %97, align 4, !dbg !1965, !tbaa !751
  br label %139, !dbg !1967

; <label>:98                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str18, i64 0, i64 0)) #5, !dbg !1968
  %99 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1970
  %100 = load i32* %99, align 4, !dbg !1970, !tbaa !1899
  %101 = and i32 %100, 61440, !dbg !1970
  %102 = icmp eq i32 %101, 8192, !dbg !1970
  %103 = call i32* @__errno_location() #1, !dbg !1972
  br i1 %102, label %104, label %105, !dbg !1970

; <label>:104                                     ; preds = %98
  store i32 22, i32* %103, align 4, !dbg !1972, !tbaa !751
  br label %139, !dbg !1974

; <label>:105                                     ; preds = %98
  store i32 25, i32* %103, align 4, !dbg !1975, !tbaa !751
  br label %139, !dbg !1977

; <label>:106                                     ; preds = %32
  %107 = bitcast i8* %28 to i32*, !dbg !1978
  call void @llvm.dbg.value(metadata !{i32* %107}, i64 0, metadata !439), !dbg !1978
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str19, i64 0, i64 0)) #5, !dbg !1979
  %108 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1980
  %109 = load i32* %108, align 4, !dbg !1980, !tbaa !1899
  %110 = and i32 %109, 61440, !dbg !1980
  %111 = icmp eq i32 %110, 8192, !dbg !1980
  br i1 %111, label %112, label %124, !dbg !1980

; <label>:112                                     ; preds = %106
  %113 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1982
  %114 = load i64* %113, align 8, !dbg !1982, !tbaa !1149
  %115 = load %struct.exe_disk_file_t** %29, align 8, !dbg !1982, !tbaa !787
  %116 = getelementptr inbounds %struct.exe_disk_file_t* %115, i64 0, i32 0, !dbg !1982
  %117 = load i32* %116, align 4, !dbg !1982, !tbaa !1163
  %118 = zext i32 %117 to i64, !dbg !1982
  %119 = icmp sgt i64 %118, %114, !dbg !1982
  br i1 %119, label %120, label %123, !dbg !1982

; <label>:120                                     ; preds = %112
  %121 = sub nsw i64 %118, %114, !dbg !1985
  %122 = trunc i64 %121 to i32, !dbg !1985
  br label %123, !dbg !1987

; <label>:123                                     ; preds = %112, %120
  %storemerge = phi i32 [ %122, %120 ], [ 0, %112 ]
  store i32 %storemerge, i32* %107, align 4, !dbg !1985, !tbaa !751
  br label %139, !dbg !1988

; <label>:124                                     ; preds = %106
  %125 = call i32* @__errno_location() #1, !dbg !1989
  store i32 25, i32* %125, align 4, !dbg !1989, !tbaa !751
  br label %139, !dbg !1991

; <label>:126                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str20, i64 0, i64 0)) #5, !dbg !1992
  %127 = call i32* @__errno_location() #1, !dbg !1994
  store i32 22, i32* %127, align 4, !dbg !1994, !tbaa !751
  br label %139, !dbg !1995

; <label>:128                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1996
  %129 = call i32* @__errno_location() #1, !dbg !1997
  store i32 22, i32* %129, align 4, !dbg !1997, !tbaa !751
  br label %139, !dbg !1998

; <label>:130                                     ; preds = %26
  %131 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1999
  %132 = load i32* %131, align 8, !dbg !1999, !tbaa !854
  %133 = call i64 (i64, ...)* @syscall(i64 16, i32 %132, i64 %request, i8* %28) #5, !dbg !1999
  %134 = trunc i64 %133 to i32, !dbg !1999
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !442), !dbg !1999
  %135 = icmp eq i32 %134, -1, !dbg !2000
  br i1 %135, label %136, label %139, !dbg !2000

; <label>:136                                     ; preds = %130
  %137 = call i32 @klee_get_errno() #5, !dbg !2002
  %138 = call i32* @__errno_location() #1, !dbg !2002
  store i32 %137, i32* %138, align 4, !dbg !2002, !tbaa !751
  br label %139, !dbg !2002

; <label>:139                                     ; preds = %130, %136, %88, %81, %77, %70, %128, %126, %124, %123, %105, %104, %96, %86, %79, %75, %68, %40, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %128 ], [ -1, %126 ], [ 0, %123 ], [ -1, %124 ], [ -1, %104 ], [ -1, %105 ], [ -1, %96 ], [ -1, %86 ], [ -1, %79 ], [ -1, %75 ], [ 0, %40 ], [ -1, %68 ], [ -1, %__get_file.exit.thread ], [ 0, %70 ], [ 0, %77 ], [ 0, %81 ], [ 0, %88 ], [ -1, %136 ], [ %134, %130 ]
  ret i32 %.0, !dbg !2003
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #5

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #5

declare void @klee_warning_once(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @fcntl(i32 %fd, i32 %cmd, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !448), !dbg !2004
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !449), !dbg !2004
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2005), !dbg !2007
  %1 = icmp ult i32 %fd, 32, !dbg !2008
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2008

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2009
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2010
  %5 = load i32* %4, align 4, !dbg !2010, !tbaa !764
  %6 = and i32 %5, 1, !dbg !2010
  %7 = icmp eq i32 %6, 0, !dbg !2010
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2010

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2009
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !450), !dbg !2006
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !451), !dbg !2011
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2012
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2012

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = call i32* @__errno_location() #1, !dbg !2014
  store i32 9, i32* %10, align 4, !dbg !2014, !tbaa !751
  br label %55, !dbg !2016

; <label>:11                                      ; preds = %__get_file.exit
  switch i32 %cmd, label %12 [
    i32 1026, label %30
    i32 1025, label %30
    i32 11, label %30
    i32 9, label %30
    i32 3, label %30
    i32 1, label %30
  ], !dbg !2017

; <label>:12                                      ; preds = %11
  %13 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !2019
  call void @llvm.va_start(i8* %13), !dbg !2019
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !2021
  %15 = load i32* %14, align 16, !dbg !2021
  %16 = icmp ult i32 %15, 41, !dbg !2021
  br i1 %16, label %17, label %23, !dbg !2021

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !2021
  %19 = load i8** %18, align 16, !dbg !2021
  %20 = sext i32 %15 to i64, !dbg !2021
  %21 = getelementptr i8* %19, i64 %20, !dbg !2021
  %22 = add i32 %15, 8, !dbg !2021
  store i32 %22, i32* %14, align 16, !dbg !2021
  br label %27, !dbg !2021

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !2021
  %25 = load i8** %24, align 8, !dbg !2021
  %26 = getelementptr i8* %25, i64 8, !dbg !2021
  store i8* %26, i8** %24, align 8, !dbg !2021
  br label %27, !dbg !2021

; <label>:27                                      ; preds = %23, %17
  %.in = phi i8* [ %21, %17 ], [ %25, %23 ]
  %28 = bitcast i8* %.in to i32*, !dbg !2021
  %29 = load i32* %28, align 4, !dbg !2021
  call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !452), !dbg !2021
  call void @llvm.va_end(i8* %13), !dbg !2022
  br label %30

; <label>:30                                      ; preds = %11, %11, %11, %11, %11, %11, %27
  %arg.0 = phi i32 [ %29, %27 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ]
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2023
  %32 = load %struct.exe_disk_file_t** %31, align 8, !dbg !2023, !tbaa !787
  %33 = icmp eq %struct.exe_disk_file_t* %32, null, !dbg !2023
  br i1 %33, label %46, label %34, !dbg !2023

; <label>:34                                      ; preds = %30
  switch i32 %cmd, label %44 [
    i32 1, label %35
    i32 2, label %38
    i32 3, label %55
  ], !dbg !2024

; <label>:35                                      ; preds = %34
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !453), !dbg !2025
  %36 = load i32* %4, align 4, !dbg !2026, !tbaa !764
  call void @llvm.dbg.value(metadata !2028, i64 0, metadata !453), !dbg !2029
  %37 = lshr i32 %36, 1, !dbg !2026
  %.lobit = and i32 %37, 1, !dbg !2026
  br label %55, !dbg !2030

; <label>:38                                      ; preds = %34
  %39 = load i32* %4, align 4, !dbg !2031, !tbaa !764
  %40 = and i32 %39, -3, !dbg !2031
  %41 = and i32 %arg.0, 1, !dbg !2033
  %42 = icmp eq i32 %41, 0, !dbg !2033
  %43 = or i32 %39, 2, !dbg !2035
  %.10 = select i1 %42, i32 %40, i32 %43, !dbg !2033
  store i32 %.10, i32* %4, align 4, !dbg !2031, !tbaa !764
  br label %55, !dbg !2036

; <label>:44                                      ; preds = %34
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !2037
  %45 = call i32* @__errno_location() #1, !dbg !2038
  store i32 22, i32* %45, align 4, !dbg !2038, !tbaa !751
  br label %55, !dbg !2039

; <label>:46                                      ; preds = %30
  %47 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2040
  %48 = load i32* %47, align 8, !dbg !2040, !tbaa !854
  %49 = call i64 (i64, ...)* @syscall(i64 72, i32 %48, i32 %cmd, i32 %arg.0) #5, !dbg !2040
  %50 = trunc i64 %49 to i32, !dbg !2040
  call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !458), !dbg !2040
  %51 = icmp eq i32 %50, -1, !dbg !2041
  br i1 %51, label %52, label %55, !dbg !2041

; <label>:52                                      ; preds = %46
  %53 = call i32 @klee_get_errno() #5, !dbg !2043
  %54 = call i32* @__errno_location() #1, !dbg !2043
  store i32 %53, i32* %54, align 4, !dbg !2043, !tbaa !751
  br label %55, !dbg !2043

; <label>:55                                      ; preds = %46, %52, %34, %44, %38, %35, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %44 ], [ 0, %38 ], [ %.lobit, %35 ], [ -1, %__get_file.exit.thread ], [ 0, %34 ], [ -1, %52 ], [ %50, %46 ]
  ret i32 %.0, !dbg !2044
}

; Function Attrs: nounwind uwtable
define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !494), !dbg !2045
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !495), !dbg !2045
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2046), !dbg !2048
  %1 = load i8* %path, align 1, !dbg !2049, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2050), !dbg !2049
  %2 = sext i8 %1 to i32, !dbg !2051
  %3 = icmp eq i8 %1, 0, !dbg !2051
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2051

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2051
  %6 = load i8* %5, align 1, !dbg !2051, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2051
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2051

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2052, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !2052
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2052

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2052
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2052

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2053
  %12 = ashr exact i32 %sext.i, 24, !dbg !2053
  %13 = add nsw i32 %12, 65, !dbg !2053
  %14 = icmp eq i32 %2, %13, !dbg !2053
  %15 = add i32 %i.02.i, 1, !dbg !2052
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2054), !dbg !2052
  br i1 %14, label %16, label %10, !dbg !2053

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2055
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2055, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2056
  %20 = load %struct.stat64** %19, align 8, !dbg !2056, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2056
  %22 = load i64* %21, align 8, !dbg !2056, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !2056
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2055
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2057
  %or.cond = or i1 %23, %25, !dbg !2056
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2056

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !2059
  %27 = tail call i32* @__errno_location() #1, !dbg !2061
  store i32 2, i32* %27, align 4, !dbg !2061, !tbaa !751
  br label %58, !dbg !2062

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2063) #5, !dbg !2065
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2066) #5, !dbg !2068
  %28 = ptrtoint i8* %path to i64, !dbg !2069
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !2069
  %30 = inttoptr i64 %29 to i8*, !dbg !2069
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !2070) #5, !dbg !2069
  %31 = icmp eq i8* %30, %path, !dbg !2071
  %32 = zext i1 %31 to i64, !dbg !2071
  tail call void @klee_assume(i64 %32) #5, !dbg !2071
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !2072) #5, !dbg !2067
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2073) #5, !dbg !2074
  br label %33, !dbg !2074

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !2075, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !2076) #5, !dbg !2075
  %35 = add i32 %i.0.i, -1, !dbg !2077
  %36 = and i32 %35, %i.0.i, !dbg !2077
  %37 = icmp eq i32 %36, 0, !dbg !2077
  br i1 %37, label %38, label %42, !dbg !2077

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !2078

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !2079, !tbaa !693
  br label %__concretize_string.exit, !dbg !2080

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2081
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !2072) #5, !dbg !2081
  store i8 47, i8* %sc.0.i, align 1, !dbg !2081, !tbaa !693
  br label %50, !dbg !2082

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !2083
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !2083
  %45 = trunc i64 %44 to i8, !dbg !2083
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !2084) #5, !dbg !2083
  %46 = icmp eq i8 %45, %34, !dbg !2085
  %47 = zext i1 %46 to i64, !dbg !2085
  tail call void @klee_assume(i64 %47) #5, !dbg !2085
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2086
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !2072) #5, !dbg !2086
  store i8 %45, i8* %sc.0.i, align 1, !dbg !2086, !tbaa !693
  %49 = icmp eq i8 %45, 0, !dbg !2087
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !2087

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !2074
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !2073) #5, !dbg !2074
  br label %33, !dbg !2074

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) #5, !dbg !2064
  %53 = trunc i64 %52 to i32, !dbg !2064
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !497), !dbg !2064
  %54 = icmp eq i32 %53, -1, !dbg !2088
  br i1 %54, label %55, label %58, !dbg !2088

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !2090
  %57 = tail call i32* @__errno_location() #1, !dbg !2090
  store i32 %56, i32* %57, align 4, !dbg !2090, !tbaa !751
  br label %58, !dbg !2090

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2091
}

; Function Attrs: nounwind uwtable
define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !503), !dbg !2092
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !504), !dbg !2092
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2093), !dbg !2095
  %1 = icmp ult i32 %fd, 32, !dbg !2096
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2096

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2097
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2098
  %5 = load i32* %4, align 4, !dbg !2098, !tbaa !764
  %6 = and i32 %5, 1, !dbg !2098
  %7 = icmp eq i32 %6, 0, !dbg !2098
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2098

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2097
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !505), !dbg !2094
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2099
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2099

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !2101
  store i32 9, i32* %10, align 4, !dbg !2101, !tbaa !751
  br label %26, !dbg !2103

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2104
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2104, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2104
  br i1 %14, label %17, label %15, !dbg !2104

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str21, i64 0, i64 0)) #5, !dbg !2105
  %16 = tail call i32* @__errno_location() #1, !dbg !2107
  store i32 9, i32* %16, align 4, !dbg !2107, !tbaa !751
  br label %26, !dbg !2108

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2109
  %19 = load i32* %18, align 8, !dbg !2109, !tbaa !854
  %20 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %19, %struct.statfs* %buf) #5, !dbg !2109
  %21 = trunc i64 %20 to i32, !dbg !2109
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !506), !dbg !2109
  %22 = icmp eq i32 %21, -1, !dbg !2110
  br i1 %22, label %23, label %26, !dbg !2110

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #5, !dbg !2112
  %25 = tail call i32* @__errno_location() #1, !dbg !2112
  store i32 %24, i32* %25, align 4, !dbg !2112, !tbaa !751
  br label %26, !dbg !2112

; <label>:26                                      ; preds = %17, %23, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !2113
}

; Function Attrs: nounwind uwtable
define i32 @fsync(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !511), !dbg !2114
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2115), !dbg !2117
  %1 = icmp ult i32 %fd, 32, !dbg !2118
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2118

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2119
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2120
  %5 = load i32* %4, align 4, !dbg !2120, !tbaa !764
  %6 = and i32 %5, 1, !dbg !2120
  %7 = icmp eq i32 %6, 0, !dbg !2120
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2120

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2119
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !512), !dbg !2116
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2121
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2121

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !2122
  store i32 9, i32* %10, align 4, !dbg !2122, !tbaa !751
  br label %24, !dbg !2124

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2125
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2125, !tbaa !787
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2125
  br i1 %14, label %15, label %24, !dbg !2125

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2126
  %17 = load i32* %16, align 8, !dbg !2126, !tbaa !854
  %18 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %17) #5, !dbg !2126
  %19 = trunc i64 %18 to i32, !dbg !2126
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !513), !dbg !2126
  %20 = icmp eq i32 %19, -1, !dbg !2127
  br i1 %20, label %21, label %24, !dbg !2127

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #5, !dbg !2129
  %23 = tail call i32* @__errno_location() #1, !dbg !2129
  store i32 %22, i32* %23, align 4, !dbg !2129, !tbaa !751
  br label %24, !dbg !2129

; <label>:24                                      ; preds = %15, %21, %11, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ 0, %11 ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !2130
}

; Function Attrs: nounwind uwtable
define i32 @dup2(i32 %oldfd, i32 %newfd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !519), !dbg !2131
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !520), !dbg !2131
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2132), !dbg !2134
  %1 = icmp ult i32 %oldfd, 32, !dbg !2135
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2135

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !2136
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2137
  %5 = load i32* %4, align 4, !dbg !2137, !tbaa !764
  %6 = and i32 %5, 1, !dbg !2137
  %7 = icmp eq i32 %6, 0, !dbg !2137
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2137

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2136
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !521), !dbg !2133
  %9 = icmp ne %struct.exe_file_t* %8, null, !dbg !2138
  %10 = icmp sgt i32 %newfd, -1, !dbg !2138
  %or.cond = and i1 %9, %10, !dbg !2138
  %11 = icmp slt i32 %newfd, 32, !dbg !2138
  %or.cond3 = and i1 %or.cond, %11, !dbg !2138
  br i1 %or.cond3, label %13, label %__get_file.exit.thread, !dbg !2138

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !2139
  store i32 9, i32* %12, align 4, !dbg !2139, !tbaa !751
  br label %42, !dbg !2141

; <label>:13                                      ; preds = %__get_file.exit
  %14 = sext i32 %newfd to i64, !dbg !2142
  %15 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %14, !dbg !2142
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %15}, i64 0, metadata !522), !dbg !2142
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %14, i32 1, !dbg !2143
  %17 = load i32* %16, align 4, !dbg !2143, !tbaa !764
  %18 = and i32 %17, 1, !dbg !2143
  %19 = icmp eq i32 %18, 0, !dbg !2143
  br i1 %19, label %close.exit, label %20, !dbg !2143

; <label>:20                                      ; preds = %13
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2145) #5, !dbg !2146
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2147) #5, !dbg !2148
  %21 = load i32* @close.n_calls, align 4, !dbg !2149, !tbaa !751
  %22 = add nsw i32 %21, 1, !dbg !2149
  store i32 %22, i32* @close.n_calls, align 4, !dbg !2149, !tbaa !751
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2150) #5, !dbg !2152
  %23 = icmp ugt i32 %newfd, 31, !dbg !2153
  %24 = icmp eq %struct.exe_file_t* %15, null, !dbg !2154
  %or.cond8 = or i1 %23, %24, !dbg !2153
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %15}, i64 0, metadata !2155) #5, !dbg !2151
  br i1 %or.cond8, label %__get_file.exit.thread.i, label %26, !dbg !2153

__get_file.exit.thread.i:                         ; preds = %20
  %25 = tail call i32* @__errno_location() #1, !dbg !2156
  store i32 9, i32* %25, align 4, !dbg !2156, !tbaa !751
  br label %close.exit, !dbg !2157

; <label>:26                                      ; preds = %20
  %27 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2158, !tbaa !1095
  %28 = icmp eq i32 %27, 0, !dbg !2158
  br i1 %28, label %36, label %29, !dbg !2158

; <label>:29                                      ; preds = %26
  %30 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !2158, !tbaa !1096
  %31 = load i32* %30, align 4, !dbg !2158, !tbaa !751
  %32 = icmp eq i32 %31, %22, !dbg !2158
  br i1 %32, label %33, label %36, !dbg !2158

; <label>:33                                      ; preds = %29
  %34 = add i32 %27, -1, !dbg !2159
  store i32 %34, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2159, !tbaa !1095
  %35 = tail call i32* @__errno_location() #1, !dbg !2160
  store i32 5, i32* %35, align 4, !dbg !2160, !tbaa !751
  br label %close.exit, !dbg !2161

; <label>:36                                      ; preds = %29, %26
  %37 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !2162
  tail call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 24, i32 8, i1 false) #5, !dbg !2162
  br label %close.exit, !dbg !2163

close.exit:                                       ; preds = %36, %33, %__get_file.exit.thread.i, %13
  %38 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !2164
  %39 = bitcast %struct.exe_file_t* %8 to i8*, !dbg !2164
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 24, i32 8, i1 false), !dbg !2164, !tbaa.struct !2165
  %40 = load i32* %16, align 4, !dbg !2168, !tbaa !764
  %41 = and i32 %40, -3, !dbg !2168
  store i32 %41, i32* %16, align 4, !dbg !2168, !tbaa !764
  br label %42, !dbg !2169

; <label>:42                                      ; preds = %close.exit, %__get_file.exit.thread
  %.0 = phi i32 [ %newfd, %close.exit ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !2170
}

; Function Attrs: nounwind uwtable
define i32 @dup(i32 %oldfd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !527), !dbg !2171
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2172), !dbg !2174
  %1 = icmp ult i32 %oldfd, 32, !dbg !2175
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2175

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !2176
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2177
  %5 = load i32* %4, align 4, !dbg !2177, !tbaa !764
  %6 = and i32 %5, 1, !dbg !2177
  %7 = icmp eq i32 %6, 0, !dbg !2177
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2176
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2178
  %or.cond = or i1 %7, %9, !dbg !2177
  br i1 %or.cond, label %__get_file.exit.thread, label %.preheader, !dbg !2177

__get_file.exit.thread:                           ; preds = %0, %2
  %10 = tail call i32* @__errno_location() #1, !dbg !2179
  store i32 9, i32* %10, align 4, !dbg !2179, !tbaa !751
  br label %25, !dbg !2181

; <label>:11                                      ; preds = %.preheader
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !2182
  %13 = icmp slt i32 %12, 32, !dbg !2182
  br i1 %13, label %.preheader, label %19, !dbg !2182

.preheader:                                       ; preds = %2, %11
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %2 ]
  %fd.02 = phi i32 [ %18, %11 ], [ 0, %2 ]
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2184
  %15 = load i32* %14, align 4, !dbg !2184, !tbaa !764
  %16 = and i32 %15, 1, !dbg !2184
  %17 = icmp eq i32 %16, 0, !dbg !2184
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2182
  %18 = add nsw i32 %fd.02, 1, !dbg !2182
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !529), !dbg !2182
  br i1 %17, label %19, label %11, !dbg !2184

; <label>:19                                      ; preds = %.preheader, %11
  %fd.0.lcssa = phi i32 [ %fd.02, %.preheader ], [ %18, %11 ]
  %20 = icmp eq i32 %fd.0.lcssa, 32, !dbg !2186
  br i1 %20, label %21, label %23, !dbg !2186

; <label>:21                                      ; preds = %19
  %22 = tail call i32* @__errno_location() #1, !dbg !2188
  store i32 24, i32* %22, align 4, !dbg !2188, !tbaa !751
  br label %25, !dbg !2190

; <label>:23                                      ; preds = %19
  %24 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0.lcssa) #5, !dbg !2191
  br label %25, !dbg !2191

; <label>:25                                      ; preds = %23, %21, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %21 ], [ %24, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !2193
}

; Function Attrs: nounwind uwtable
define i32 @rmdir(i8* nocapture readonly %pathname) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !534), !dbg !2194
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2195), !dbg !2197
  %1 = load i8* %pathname, align 1, !dbg !2198, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2199), !dbg !2198
  %2 = sext i8 %1 to i32, !dbg !2200
  %3 = icmp eq i8 %1, 0, !dbg !2200
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2200

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2200
  %6 = load i8* %5, align 1, !dbg !2200, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2200
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2200

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2201, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !2201
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2201

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2201
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2201

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2202
  %12 = ashr exact i32 %sext.i, 24, !dbg !2202
  %13 = add nsw i32 %12, 65, !dbg !2202
  %14 = icmp eq i32 %2, %13, !dbg !2202
  %15 = add i32 %i.02.i, 1, !dbg !2201
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2203), !dbg !2201
  br i1 %14, label %16, label %10, !dbg !2202

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2204
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2204, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2205
  %20 = load %struct.stat64** %19, align 8, !dbg !2205, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2205
  %22 = load i64* %21, align 8, !dbg !2205, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !2205
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2204
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2206
  %or.cond = or i1 %23, %25, !dbg !2205
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2205

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2208
  %28 = load i32* %27, align 4, !dbg !2208, !tbaa !804
  %29 = and i32 %28, 61440, !dbg !2208
  %30 = icmp eq i32 %29, 16384, !dbg !2208
  br i1 %30, label %31, label %32, !dbg !2208

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2211, !tbaa !712
  br label %35, !dbg !2213

; <label>:32                                      ; preds = %26
  %33 = tail call i32* @__errno_location() #1, !dbg !2214
  store i32 20, i32* %33, align 4, !dbg !2214, !tbaa !751
  br label %35, !dbg !2216

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2217
  %34 = tail call i32* @__errno_location() #1, !dbg !2218
  store i32 1, i32* %34, align 4, !dbg !2218, !tbaa !751
  br label %35, !dbg !2219

; <label>:35                                      ; preds = %__get_sym_file.exit.thread, %32, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %32 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2220
}

; Function Attrs: nounwind uwtable
define i32 @unlink(i8* nocapture readonly %pathname) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !538), !dbg !2221
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2222), !dbg !2224
  %1 = load i8* %pathname, align 1, !dbg !2225, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2226), !dbg !2225
  %2 = sext i8 %1 to i32, !dbg !2227
  %3 = icmp eq i8 %1, 0, !dbg !2227
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2227

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2227
  %6 = load i8* %5, align 1, !dbg !2227, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2227
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2227

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2228, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !2228
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2228

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2228
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2228

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2229
  %12 = ashr exact i32 %sext.i, 24, !dbg !2229
  %13 = add nsw i32 %12, 65, !dbg !2229
  %14 = icmp eq i32 %2, %13, !dbg !2229
  %15 = add i32 %i.02.i, 1, !dbg !2228
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2230), !dbg !2228
  br i1 %14, label %16, label %10, !dbg !2229

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2231
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2231, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2232
  %20 = load %struct.stat64** %19, align 8, !dbg !2232, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2232
  %22 = load i64* %21, align 8, !dbg !2232, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !2232
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2231
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2233
  %or.cond = or i1 %23, %25, !dbg !2232
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2232

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2235
  %28 = load i32* %27, align 4, !dbg !2235, !tbaa !804
  %29 = and i32 %28, 61440, !dbg !2235
  %30 = icmp eq i32 %29, 32768, !dbg !2235
  br i1 %30, label %31, label %32, !dbg !2235

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2238, !tbaa !712
  br label %38, !dbg !2240

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !2241
  %34 = tail call i32* @__errno_location() #1, !dbg !2243
  br i1 %33, label %35, label %36, !dbg !2241

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !2243, !tbaa !751
  br label %38, !dbg !2245

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !2246, !tbaa !751
  br label %38, !dbg !2248

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2249
  %37 = tail call i32* @__errno_location() #1, !dbg !2250
  store i32 1, i32* %37, align 4, !dbg !2250, !tbaa !751
  br label %38, !dbg !2251

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2252
}

; Function Attrs: nounwind uwtable
define i32 @unlinkat(i32 %dirfd, i8* nocapture readonly %pathname, i32 %flags) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %dirfd}, i64 0, metadata !544), !dbg !2253
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !545), !dbg !2253
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !546), !dbg !2253
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2254), !dbg !2256
  %1 = load i8* %pathname, align 1, !dbg !2257, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2258), !dbg !2257
  %2 = sext i8 %1 to i32, !dbg !2259
  %3 = icmp eq i8 %1, 0, !dbg !2259
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2259

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2259
  %6 = load i8* %5, align 1, !dbg !2259, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2259
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2259

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2260, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !2260
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2260

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2260
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2260

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2261
  %12 = ashr exact i32 %sext.i, 24, !dbg !2261
  %13 = add nsw i32 %12, 65, !dbg !2261
  %14 = icmp eq i32 %2, %13, !dbg !2261
  %15 = add i32 %i.02.i, 1, !dbg !2260
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2262), !dbg !2260
  br i1 %14, label %16, label %10, !dbg !2261

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2263
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2263, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2264
  %20 = load %struct.stat64** %19, align 8, !dbg !2264, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2264
  %22 = load i64* %21, align 8, !dbg !2264, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !2264
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2263
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2265
  %or.cond = or i1 %23, %25, !dbg !2264
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2264

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2267
  %28 = load i32* %27, align 4, !dbg !2267, !tbaa !804
  %29 = and i32 %28, 61440, !dbg !2267
  %30 = icmp eq i32 %29, 32768, !dbg !2267
  br i1 %30, label %31, label %32, !dbg !2267

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2270, !tbaa !712
  br label %38, !dbg !2272

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !2273
  %34 = tail call i32* @__errno_location() #1, !dbg !2275
  br i1 %33, label %35, label %36, !dbg !2273

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !2275, !tbaa !751
  br label %38, !dbg !2277

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !2278, !tbaa !751
  br label %38, !dbg !2280

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2281
  %37 = tail call i32* @__errno_location() #1, !dbg !2282
  store i32 1, i32* %37, align 4, !dbg !2282, !tbaa !751
  br label %38, !dbg !2283

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2284
}

; Function Attrs: nounwind uwtable
define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !552), !dbg !2285
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !553), !dbg !2285
  tail call void @llvm.dbg.value(metadata !{i64 %bufsize}, i64 0, metadata !554), !dbg !2285
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2286), !dbg !2288
  %1 = load i8* %path, align 1, !dbg !2289, !tbaa !693
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2290), !dbg !2289
  %2 = sext i8 %1 to i32, !dbg !2291
  %3 = icmp eq i8 %1, 0, !dbg !2291
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2291

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2291
  %6 = load i8* %5, align 1, !dbg !2291, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2291
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2291

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2292, !tbaa !700
  %9 = icmp eq i32 %8, 0, !dbg !2292
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2292

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2292
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2292

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2293
  %12 = ashr exact i32 %sext.i, 24, !dbg !2293
  %13 = add nsw i32 %12, 65, !dbg !2293
  %14 = icmp eq i32 %2, %13, !dbg !2293
  %15 = add i32 %i.02.i, 1, !dbg !2292
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2294), !dbg !2292
  br i1 %14, label %16, label %10, !dbg !2293

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2295
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2295, !tbaa !707
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2296
  %20 = load %struct.stat64** %19, align 8, !dbg !2296, !tbaa !710
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2296
  %22 = load i64* %21, align 8, !dbg !2296, !tbaa !712
  %23 = icmp eq i64 %22, 0, !dbg !2296
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2295
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2297
  %or.cond = or i1 %23, %25, !dbg !2296
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2296

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2298
  %28 = load i32* %27, align 4, !dbg !2298, !tbaa !804
  %29 = and i32 %28, 61440, !dbg !2298
  %30 = icmp eq i32 %29, 40960, !dbg !2298
  br i1 %30, label %31, label %45, !dbg !2298

; <label>:31                                      ; preds = %26
  store i8 %1, i8* %buf, align 1, !dbg !2301, !tbaa !693
  %32 = icmp ugt i64 %bufsize, 1, !dbg !2303
  br i1 %32, label %33, label %.thread2, !dbg !2303

; <label>:33                                      ; preds = %31
  %34 = getelementptr inbounds i8* %buf, i64 1, !dbg !2303
  store i8 46, i8* %34, align 1, !dbg !2303, !tbaa !693
  %35 = icmp ugt i64 %bufsize, 2, !dbg !2305
  br i1 %35, label %36, label %.thread2, !dbg !2305

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds i8* %buf, i64 2, !dbg !2305
  store i8 108, i8* %37, align 1, !dbg !2305, !tbaa !693
  %38 = icmp ugt i64 %bufsize, 3, !dbg !2307
  br i1 %38, label %.thread1, label %.thread2, !dbg !2307

.thread1:                                         ; preds = %36
  %39 = getelementptr inbounds i8* %buf, i64 3, !dbg !2307
  store i8 110, i8* %39, align 1, !dbg !2307, !tbaa !693
  %40 = icmp ugt i64 %bufsize, 4, !dbg !2309
  br i1 %40, label %41, label %.thread2, !dbg !2309

; <label>:41                                      ; preds = %.thread1
  %42 = getelementptr inbounds i8* %buf, i64 4, !dbg !2309
  store i8 107, i8* %42, align 1, !dbg !2309, !tbaa !693
  br label %.thread2, !dbg !2309

.thread2:                                         ; preds = %33, %31, %36, %41, %.thread1
  %43 = icmp ugt i64 %bufsize, 5, !dbg !2311
  %44 = select i1 %43, i64 5, i64 %bufsize, !dbg !2311
  br label %55, !dbg !2311

; <label>:45                                      ; preds = %26
  %46 = tail call i32* @__errno_location() #1, !dbg !2312
  store i32 22, i32* %46, align 4, !dbg !2312, !tbaa !751
  br label %55, !dbg !2314

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  %47 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) #5, !dbg !2315
  %48 = trunc i64 %47 to i32, !dbg !2315
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !556), !dbg !2315
  %49 = icmp eq i32 %48, -1, !dbg !2316
  br i1 %49, label %50, label %53, !dbg !2316

; <label>:50                                      ; preds = %__get_sym_file.exit.thread
  %51 = tail call i32 @klee_get_errno() #5, !dbg !2318
  %52 = tail call i32* @__errno_location() #1, !dbg !2318
  store i32 %51, i32* %52, align 4, !dbg !2318, !tbaa !751
  br label %53, !dbg !2318

; <label>:53                                      ; preds = %50, %__get_sym_file.exit.thread
  %sext = shl i64 %47, 32, !dbg !2319
  %54 = ashr exact i64 %sext, 32, !dbg !2319
  br label %55, !dbg !2319

; <label>:55                                      ; preds = %53, %45, %.thread2
  %.0 = phi i64 [ %44, %.thread2 ], [ -1, %45 ], [ %54, %53 ]
  ret i64 %.0, !dbg !2320
}

; Function Attrs: nounwind uwtable
define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timeval* nocapture readnone %timeout) #0 {
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !574), !dbg !2321
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !575), !dbg !2321
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !576), !dbg !2321
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !577), !dbg !2322
  call void @llvm.dbg.value(metadata !{%struct.timeval* %timeout}, i64 0, metadata !578), !dbg !2322
  %1 = bitcast %struct.fd_set* %in_read to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %1) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !579), !dbg !2323
  %2 = bitcast %struct.fd_set* %in_write to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %2) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !580), !dbg !2323
  %3 = bitcast %struct.fd_set* %in_except to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %3) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !581), !dbg !2323
  %4 = bitcast %struct.fd_set* %os_read to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %4) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !582), !dbg !2323
  %5 = bitcast %struct.fd_set* %os_write to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %5) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !583), !dbg !2323
  %6 = bitcast %struct.fd_set* %os_except to i8*, !dbg !2323
  call void @llvm.lifetime.start(i64 128, i8* %6) #5, !dbg !2323
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !584), !dbg !2323
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !586), !dbg !2324
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !587), !dbg !2324
  %7 = icmp ne %struct.fd_set* %read, null, !dbg !2325
  br i1 %7, label %8, label %10, !dbg !2325

; <label>:8                                       ; preds = %0
  %9 = bitcast %struct.fd_set* %read to i8*, !dbg !2327
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %9, i64 128, i32 8, i1 false), !dbg !2327, !tbaa.struct !2329
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 128, i32 1, i1 false), !dbg !2330
  br label %11, !dbg !2331

; <label>:10                                      ; preds = %0
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 128, i32 8, i1 false), !dbg !2332
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = icmp ne %struct.fd_set* %write, null, !dbg !2334
  br i1 %12, label %13, label %15, !dbg !2334

; <label>:13                                      ; preds = %11
  %14 = bitcast %struct.fd_set* %write to i8*, !dbg !2336
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %14, i64 128, i32 8, i1 false), !dbg !2336, !tbaa.struct !2329
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 128, i32 1, i1 false), !dbg !2338
  br label %16, !dbg !2339

; <label>:15                                      ; preds = %11
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 128, i32 8, i1 false), !dbg !2340
  br label %16

; <label>:16                                      ; preds = %15, %13
  %17 = icmp ne %struct.fd_set* %except, null, !dbg !2342
  br i1 %17, label %18, label %20, !dbg !2342

; <label>:18                                      ; preds = %16
  %19 = bitcast %struct.fd_set* %except to i8*, !dbg !2344
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %19, i64 128, i32 8, i1 false), !dbg !2344, !tbaa.struct !2329
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 128, i32 1, i1 false), !dbg !2346
  br label %21, !dbg !2347

; <label>:20                                      ; preds = %16
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !2348
  br label %21

; <label>:21                                      ; preds = %20, %18
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 128, i32 8, i1 false), !dbg !2350
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 128, i32 8, i1 false), !dbg !2351
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 128, i32 8, i1 false), !dbg !2352
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !585), !dbg !2353
  %22 = icmp sgt i32 %nfds, 0, !dbg !2353
  br i1 %22, label %.lr.ph12, label %.loopexit, !dbg !2353

.lr.ph12:                                         ; preds = %21, %127
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %127 ], [ 0, %21 ]
  %count.09 = phi i32 [ %count.1, %127 ], [ 0, %21 ]
  %os_nfds.08 = phi i32 [ %os_nfds.1, %127 ], [ 0, %21 ]
  %23 = trunc i64 %indvars.iv14 to i32, !dbg !2354
  %24 = sdiv i32 %23, 64, !dbg !2354
  %25 = sext i32 %24 to i64, !dbg !2354
  %26 = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %25, !dbg !2354
  %27 = load i64* %26, align 8, !dbg !2354, !tbaa !2166
  %28 = and i32 %23, 63, !dbg !2354
  %29 = shl i32 1, %28, !dbg !2354
  %30 = sext i32 %29 to i64, !dbg !2354
  %31 = and i64 %27, %30, !dbg !2354
  %32 = icmp eq i64 %31, 0, !dbg !2354
  br i1 %32, label %33, label %43, !dbg !2354

; <label>:33                                      ; preds = %.lr.ph12
  %34 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2354
  %35 = load i64* %34, align 8, !dbg !2354, !tbaa !2166
  %36 = and i64 %35, %30, !dbg !2354
  %37 = icmp eq i64 %36, 0, !dbg !2354
  br i1 %37, label %38, label %43, !dbg !2354

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2354
  %40 = load i64* %39, align 8, !dbg !2354, !tbaa !2166
  %41 = and i64 %40, %30, !dbg !2354
  %42 = icmp eq i64 %41, 0, !dbg !2354
  br i1 %42, label %127, label %43, !dbg !2354

; <label>:43                                      ; preds = %38, %33, %.lr.ph12
  tail call void @llvm.dbg.value(metadata !2355, i64 0, metadata !2356), !dbg !2358
  %44 = icmp ult i32 %23, 32, !dbg !2359
  br i1 %44, label %45, label %__get_file.exit.thread, !dbg !2359

; <label>:45                                      ; preds = %43
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, i32 1, !dbg !2360
  %47 = load i32* %46, align 4, !dbg !2360, !tbaa !764
  %48 = and i32 %47, 1, !dbg !2360
  %49 = icmp eq i32 %48, 0, !dbg !2360
  br i1 %49, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2360

__get_file.exit:                                  ; preds = %45
  %50 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, !dbg !2361
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %50}, i64 0, metadata !588), !dbg !2357
  %51 = icmp eq %struct.exe_file_t* %50, null, !dbg !2362
  br i1 %51, label %__get_file.exit.thread, label %53, !dbg !2362

__get_file.exit.thread:                           ; preds = %43, %45, %__get_file.exit
  %52 = call i32* @__errno_location() #1, !dbg !2364
  store i32 9, i32* %52, align 4, !dbg !2364, !tbaa !751
  br label %.loopexit, !dbg !2366

; <label>:53                                      ; preds = %__get_file.exit
  %54 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, i32 3, !dbg !2367
  %55 = load %struct.exe_disk_file_t** %54, align 8, !dbg !2367, !tbaa !787
  %56 = icmp eq %struct.exe_disk_file_t* %55, null, !dbg !2367
  %57 = icmp ne i64 %31, 0, !dbg !2369
  br i1 %56, label %83, label %58, !dbg !2367

; <label>:58                                      ; preds = %53
  br i1 %57, label %59, label %63, !dbg !2369

; <label>:59                                      ; preds = %58
  %60 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %25, !dbg !2369
  %61 = load i64* %60, align 8, !dbg !2369, !tbaa !2166
  %62 = or i64 %61, %30, !dbg !2369
  store i64 %62, i64* %60, align 8, !dbg !2369, !tbaa !2166
  br label %63, !dbg !2369

; <label>:63                                      ; preds = %59, %58
  %64 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2372
  %65 = load i64* %64, align 8, !dbg !2372, !tbaa !2166
  %66 = and i64 %65, %30, !dbg !2372
  %67 = icmp eq i64 %66, 0, !dbg !2372
  br i1 %67, label %72, label %68, !dbg !2372

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %25, !dbg !2372
  %70 = load i64* %69, align 8, !dbg !2372, !tbaa !2166
  %71 = or i64 %70, %30, !dbg !2372
  store i64 %71, i64* %69, align 8, !dbg !2372, !tbaa !2166
  br label %72, !dbg !2372

; <label>:72                                      ; preds = %63, %68
  %73 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2374
  %74 = load i64* %73, align 8, !dbg !2374, !tbaa !2166
  %75 = and i64 %74, %30, !dbg !2374
  %76 = icmp eq i64 %75, 0, !dbg !2374
  br i1 %76, label %81, label %77, !dbg !2374

; <label>:77                                      ; preds = %72
  %78 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %25, !dbg !2374
  %79 = load i64* %78, align 8, !dbg !2374, !tbaa !2166
  %80 = or i64 %79, %30, !dbg !2374
  store i64 %80, i64* %78, align 8, !dbg !2374, !tbaa !2166
  br label %81, !dbg !2374

; <label>:81                                      ; preds = %72, %77
  %82 = add nsw i32 %count.09, 1, !dbg !2376
  call void @llvm.dbg.value(metadata !{i32 %82}, i64 0, metadata !586), !dbg !2376
  br label %127, !dbg !2377

; <label>:83                                      ; preds = %53
  br i1 %57, label %84, label %95, !dbg !2378

; <label>:84                                      ; preds = %83
  %85 = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0, !dbg !2378
  %86 = load i32* %85, align 8, !dbg !2378, !tbaa !854
  %87 = and i32 %86, 63, !dbg !2378
  %88 = shl i32 1, %87, !dbg !2378
  %89 = sext i32 %88 to i64, !dbg !2378
  %90 = sdiv i32 %86, 64, !dbg !2378
  %91 = sext i32 %90 to i64, !dbg !2378
  %92 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %91, !dbg !2378
  %93 = load i64* %92, align 8, !dbg !2378, !tbaa !2166
  %94 = or i64 %89, %93, !dbg !2378
  store i64 %94, i64* %92, align 8, !dbg !2378, !tbaa !2166
  br label %95, !dbg !2378

; <label>:95                                      ; preds = %84, %83
  %96 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2381
  %97 = load i64* %96, align 8, !dbg !2381, !tbaa !2166
  %98 = and i64 %97, %30, !dbg !2381
  %99 = icmp eq i64 %98, 0, !dbg !2381
  br i1 %99, label %111, label %100, !dbg !2381

; <label>:100                                     ; preds = %95
  %101 = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0, !dbg !2381
  %102 = load i32* %101, align 8, !dbg !2381, !tbaa !854
  %103 = and i32 %102, 63, !dbg !2381
  %104 = shl i32 1, %103, !dbg !2381
  %105 = sext i32 %104 to i64, !dbg !2381
  %106 = sdiv i32 %102, 64, !dbg !2381
  %107 = sext i32 %106 to i64, !dbg !2381
  %108 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %107, !dbg !2381
  %109 = load i64* %108, align 8, !dbg !2381, !tbaa !2166
  %110 = or i64 %105, %109, !dbg !2381
  store i64 %110, i64* %108, align 8, !dbg !2381, !tbaa !2166
  br label %111, !dbg !2381

; <label>:111                                     ; preds = %95, %100
  %112 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2383
  %113 = load i64* %112, align 8, !dbg !2383, !tbaa !2166
  %114 = and i64 %113, %30, !dbg !2383
  %115 = icmp eq i64 %114, 0, !dbg !2383
  %.phi.trans.insert = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 8, !dbg !2385, !tbaa !854
  br i1 %115, label %._crit_edge16, label %116, !dbg !2383

; <label>:116                                     ; preds = %111
  %117 = and i32 %.pre, 63, !dbg !2383
  %118 = shl i32 1, %117, !dbg !2383
  %119 = sext i32 %118 to i64, !dbg !2383
  %120 = sdiv i32 %.pre, 64, !dbg !2383
  %121 = sext i32 %120 to i64, !dbg !2383
  %122 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %121, !dbg !2383
  %123 = load i64* %122, align 8, !dbg !2383, !tbaa !2166
  %124 = or i64 %119, %123, !dbg !2383
  store i64 %124, i64* %122, align 8, !dbg !2383, !tbaa !2166
  br label %._crit_edge16, !dbg !2383

._crit_edge16:                                    ; preds = %111, %116
  %125 = icmp slt i32 %.pre, %os_nfds.08, !dbg !2385
  %126 = add nsw i32 %.pre, 1, !dbg !2385
  call void @llvm.dbg.value(metadata !{i32 %126}, i64 0, metadata !587), !dbg !2385
  %os_nfds.0. = select i1 %125, i32 %os_nfds.08, i32 %126, !dbg !2385
  br label %127, !dbg !2385

; <label>:127                                     ; preds = %._crit_edge16, %38, %81
  %os_nfds.1 = phi i32 [ %os_nfds.08, %81 ], [ %os_nfds.08, %38 ], [ %os_nfds.0., %._crit_edge16 ]
  %count.1 = phi i32 [ %82, %81 ], [ %count.09, %38 ], [ %count.09, %._crit_edge16 ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !2353
  %128 = trunc i64 %indvars.iv.next15 to i32, !dbg !2353
  %129 = icmp slt i32 %128, %nfds, !dbg !2353
  br i1 %129, label %.lr.ph12, label %._crit_edge, !dbg !2353

._crit_edge:                                      ; preds = %127
  %130 = icmp sgt i32 %os_nfds.1, 0, !dbg !2387
  br i1 %130, label %131, label %.loopexit, !dbg !2387

; <label>:131                                     ; preds = %._crit_edge
  call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !593), !dbg !2388
  %132 = bitcast %struct.timeval* %tv to i8*, !dbg !2388
  call void @llvm.memset.p0i8.i64(i8* %132, i8 0, i64 16, i32 8, i1 false), !dbg !2388
  %133 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timeval* %tv) #5, !dbg !2389
  %134 = trunc i64 %133 to i32, !dbg !2389
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !596), !dbg !2389
  %135 = icmp eq i32 %134, -1, !dbg !2390
  br i1 %135, label %136, label %141, !dbg !2390

; <label>:136                                     ; preds = %131
  %137 = icmp eq i32 %count.1, 0, !dbg !2391
  br i1 %137, label %138, label %.loopexit, !dbg !2391

; <label>:138                                     ; preds = %136
  %139 = call i32 @klee_get_errno() #5, !dbg !2394
  %140 = call i32* @__errno_location() #1, !dbg !2394
  store i32 %139, i32* %140, align 4, !dbg !2394, !tbaa !751
  br label %.loopexit, !dbg !2396

; <label>:141                                     ; preds = %131
  %142 = add nsw i32 %134, %count.1, !dbg !2397
  call void @llvm.dbg.value(metadata !{i32 %142}, i64 0, metadata !586), !dbg !2397
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !585), !dbg !2398
  br i1 %22, label %.lr.ph, label %.loopexit, !dbg !2398

.lr.ph:                                           ; preds = %141, %__get_file.exit3.thread
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_file.exit3.thread ], [ 0, %141 ]
  tail call void @llvm.dbg.value(metadata !2355, i64 0, metadata !2399), !dbg !2401
  %143 = trunc i64 %indvars.iv to i32, !dbg !2402
  %144 = icmp ult i32 %143, 32, !dbg !2402
  br i1 %144, label %145, label %__get_file.exit3.thread, !dbg !2402

; <label>:145                                     ; preds = %.lr.ph
  %146 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2403
  %147 = load i32* %146, align 4, !dbg !2403, !tbaa !764
  %148 = and i32 %147, 1, !dbg !2403
  %149 = icmp eq i32 %148, 0, !dbg !2403
  br i1 %149, label %__get_file.exit3.thread, label %__get_file.exit3, !dbg !2403

__get_file.exit3:                                 ; preds = %145
  %150 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, !dbg !2404
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %150}, i64 0, metadata !597), !dbg !2400
  %151 = icmp eq %struct.exe_file_t* %150, null, !dbg !2405
  br i1 %151, label %__get_file.exit3.thread, label %152, !dbg !2405

; <label>:152                                     ; preds = %__get_file.exit3
  %153 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 3, !dbg !2405
  %154 = load %struct.exe_disk_file_t** %153, align 8, !dbg !2405, !tbaa !787
  %155 = icmp eq %struct.exe_disk_file_t* %154, null, !dbg !2405
  br i1 %155, label %156, label %__get_file.exit3.thread, !dbg !2405

; <label>:156                                     ; preds = %152
  br i1 %7, label %157, label %178, !dbg !2407

; <label>:157                                     ; preds = %156
  %158 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2407
  %159 = load i32* %158, align 8, !dbg !2407, !tbaa !854
  %160 = sdiv i32 %159, 64, !dbg !2407
  %161 = sext i32 %160 to i64, !dbg !2407
  %162 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %161, !dbg !2407
  %163 = load i64* %162, align 8, !dbg !2407, !tbaa !2166
  %164 = and i32 %159, 63, !dbg !2407
  %165 = shl i32 1, %164, !dbg !2407
  %166 = sext i32 %165 to i64, !dbg !2407
  %167 = and i64 %166, %163, !dbg !2407
  %168 = icmp eq i64 %167, 0, !dbg !2407
  br i1 %168, label %178, label %169, !dbg !2407

; <label>:169                                     ; preds = %157
  %170 = and i32 %143, 63, !dbg !2407
  %171 = shl i32 1, %170, !dbg !2407
  %172 = sext i32 %171 to i64, !dbg !2407
  %173 = sdiv i32 %143, 64, !dbg !2407
  %174 = sext i32 %173 to i64, !dbg !2407
  %175 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %174, !dbg !2407
  %176 = load i64* %175, align 8, !dbg !2407, !tbaa !2166
  %177 = or i64 %176, %172, !dbg !2407
  store i64 %177, i64* %175, align 8, !dbg !2407, !tbaa !2166
  br label %178, !dbg !2407

; <label>:178                                     ; preds = %157, %169, %156
  br i1 %12, label %179, label %200, !dbg !2410

; <label>:179                                     ; preds = %178
  %180 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2410
  %181 = load i32* %180, align 8, !dbg !2410, !tbaa !854
  %182 = sdiv i32 %181, 64, !dbg !2410
  %183 = sext i32 %182 to i64, !dbg !2410
  %184 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %183, !dbg !2410
  %185 = load i64* %184, align 8, !dbg !2410, !tbaa !2166
  %186 = and i32 %181, 63, !dbg !2410
  %187 = shl i32 1, %186, !dbg !2410
  %188 = sext i32 %187 to i64, !dbg !2410
  %189 = and i64 %188, %185, !dbg !2410
  %190 = icmp eq i64 %189, 0, !dbg !2410
  br i1 %190, label %200, label %191, !dbg !2410

; <label>:191                                     ; preds = %179
  %192 = and i32 %143, 63, !dbg !2410
  %193 = shl i32 1, %192, !dbg !2410
  %194 = sext i32 %193 to i64, !dbg !2410
  %195 = sdiv i32 %143, 64, !dbg !2410
  %196 = sext i32 %195 to i64, !dbg !2410
  %197 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %196, !dbg !2410
  %198 = load i64* %197, align 8, !dbg !2410, !tbaa !2166
  %199 = or i64 %198, %194, !dbg !2410
  store i64 %199, i64* %197, align 8, !dbg !2410, !tbaa !2166
  br label %200, !dbg !2410

; <label>:200                                     ; preds = %179, %191, %178
  br i1 %17, label %201, label %__get_file.exit3.thread, !dbg !2412

; <label>:201                                     ; preds = %200
  %202 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2412
  %203 = load i32* %202, align 8, !dbg !2412, !tbaa !854
  %204 = sdiv i32 %203, 64, !dbg !2412
  %205 = sext i32 %204 to i64, !dbg !2412
  %206 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %205, !dbg !2412
  %207 = load i64* %206, align 8, !dbg !2412, !tbaa !2166
  %208 = and i32 %203, 63, !dbg !2412
  %209 = shl i32 1, %208, !dbg !2412
  %210 = sext i32 %209 to i64, !dbg !2412
  %211 = and i64 %210, %207, !dbg !2412
  %212 = icmp eq i64 %211, 0, !dbg !2412
  br i1 %212, label %__get_file.exit3.thread, label %213, !dbg !2412

; <label>:213                                     ; preds = %201
  %214 = and i32 %143, 63, !dbg !2412
  %215 = shl i32 1, %214, !dbg !2412
  %216 = sext i32 %215 to i64, !dbg !2412
  %217 = sdiv i32 %143, 64, !dbg !2412
  %218 = sext i32 %217 to i64, !dbg !2412
  %219 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %218, !dbg !2412
  %220 = load i64* %219, align 8, !dbg !2412, !tbaa !2166
  %221 = or i64 %220, %216, !dbg !2412
  store i64 %221, i64* %219, align 8, !dbg !2412, !tbaa !2166
  br label %__get_file.exit3.thread, !dbg !2412

__get_file.exit3.thread:                          ; preds = %.lr.ph, %145, %201, %152, %__get_file.exit3, %213, %200
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2398
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !2398
  %exitcond = icmp eq i32 %lftr.wideiv, %nfds, !dbg !2398
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !2398

.loopexit:                                        ; preds = %__get_file.exit3.thread, %21, %141, %._crit_edge, %136, %138, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ -1, %138 ], [ %count.1, %136 ], [ %count.1, %._crit_edge ], [ %142, %141 ], [ 0, %21 ], [ %142, %__get_file.exit3.thread ]
  call void @llvm.lifetime.end(i64 128, i8* %6) #5, !dbg !2414
  call void @llvm.lifetime.end(i64 128, i8* %5) #5, !dbg !2414
  call void @llvm.lifetime.end(i64 128, i8* %4) #5, !dbg !2414
  call void @llvm.lifetime.end(i64 128, i8* %3) #5, !dbg !2414
  call void @llvm.lifetime.end(i64 128, i8* %2) #5, !dbg !2414
  call void @llvm.lifetime.end(i64 128, i8* %1) #5, !dbg !2414
  ret i32 %.0, !dbg !2414
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

; Function Attrs: nounwind uwtable
define i8* @getcwd(i8* %buf, i64 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !606), !dbg !2415
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !607), !dbg !2415
  %1 = load i32* @getcwd.n_calls, align 4, !dbg !2416, !tbaa !751
  %2 = add nsw i32 %1, 1, !dbg !2416
  store i32 %2, i32* @getcwd.n_calls, align 4, !dbg !2416, !tbaa !751
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2417, !tbaa !1095
  %4 = icmp eq i32 %3, 0, !dbg !2417
  br i1 %4, label %12, label %5, !dbg !2417

; <label>:5                                       ; preds = %0
  %6 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !2417, !tbaa !2419
  %7 = load i32* %6, align 4, !dbg !2417, !tbaa !751
  %8 = icmp eq i32 %7, %2, !dbg !2417
  br i1 %8, label %9, label %12, !dbg !2417

; <label>:9                                       ; preds = %5
  %10 = add i32 %3, -1, !dbg !2420
  store i32 %10, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2420, !tbaa !1095
  %11 = tail call i32* @__errno_location() #1, !dbg !2422
  store i32 34, i32* %11, align 4, !dbg !2422, !tbaa !751
  br label %32, !dbg !2423

; <label>:12                                      ; preds = %0, %5
  %13 = icmp eq i8* %buf, null, !dbg !2424
  br i1 %13, label %14, label %17, !dbg !2424

; <label>:14                                      ; preds = %12
  %15 = icmp eq i64 %size, 0, !dbg !2426
  tail call void @llvm.dbg.value(metadata !2429, i64 0, metadata !607), !dbg !2430
  %.size = select i1 %15, i64 1024, i64 %size, !dbg !2426
  %16 = tail call noalias i8* @malloc(i64 %.size) #5, !dbg !2431
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !606), !dbg !2431
  br label %17, !dbg !2432

; <label>:17                                      ; preds = %12, %14
  %.02 = phi i8* [ %buf, %12 ], [ %16, %14 ]
  %.1 = phi i64 [ %size, %12 ], [ %.size, %14 ]
  tail call void @llvm.dbg.value(metadata !{i8* %.02}, i64 0, metadata !2433) #5, !dbg !2435
  %18 = ptrtoint i8* %.02 to i64, !dbg !2436
  %19 = tail call i64 @klee_get_valuel(i64 %18) #5, !dbg !2436
  %20 = inttoptr i64 %19 to i8*, !dbg !2436
  tail call void @llvm.dbg.value(metadata !{i8* %20}, i64 0, metadata !2437) #5, !dbg !2436
  %21 = icmp eq i8* %20, %.02, !dbg !2438
  %22 = zext i1 %21 to i64, !dbg !2438
  tail call void @klee_assume(i64 %22) #5, !dbg !2438
  tail call void @llvm.dbg.value(metadata !{i8* %20}, i64 0, metadata !606), !dbg !2434
  tail call void @llvm.dbg.value(metadata !{i64 %.1}, i64 0, metadata !2439) #5, !dbg !2441
  %23 = tail call i64 @klee_get_valuel(i64 %.1) #5, !dbg !2442
  tail call void @llvm.dbg.value(metadata !{i64 %23}, i64 0, metadata !2443) #5, !dbg !2442
  %24 = icmp eq i64 %23, %.1, !dbg !2444
  %25 = zext i1 %24 to i64, !dbg !2444
  tail call void @klee_assume(i64 %25) #5, !dbg !2444
  tail call void @llvm.dbg.value(metadata !{i64 %23}, i64 0, metadata !607), !dbg !2440
  tail call void @klee_check_memory_access(i8* %20, i64 %23) #5, !dbg !2445
  %26 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %20, i64 %23) #5, !dbg !2446
  %27 = trunc i64 %26 to i32, !dbg !2446
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !608), !dbg !2446
  %28 = icmp eq i32 %27, -1, !dbg !2447
  br i1 %28, label %29, label %32, !dbg !2447

; <label>:29                                      ; preds = %17
  %30 = tail call i32 @klee_get_errno() #5, !dbg !2449
  %31 = tail call i32* @__errno_location() #1, !dbg !2449
  store i32 %30, i32* %31, align 4, !dbg !2449, !tbaa !751
  br label %32, !dbg !2451

; <label>:32                                      ; preds = %17, %29, %9
  %.0 = phi i8* [ null, %9 ], [ null, %29 ], [ %20, %17 ]
  ret i8* %.0, !dbg !2452
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @chroot(i8* nocapture readonly %path) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !611), !dbg !2453
  %1 = load i8* %path, align 1, !dbg !2454, !tbaa !693
  switch i8 %1, label %8 [
    i8 0, label %2
    i8 47, label %4
  ], !dbg !2454

; <label>:2                                       ; preds = %0
  %3 = tail call i32* @__errno_location() #1, !dbg !2456
  store i32 2, i32* %3, align 4, !dbg !2456, !tbaa !751
  br label %10, !dbg !2458

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2459
  %6 = load i8* %5, align 1, !dbg !2459, !tbaa !693
  %7 = icmp eq i8 %6, 0, !dbg !2459
  br i1 %7, label %10, label %8, !dbg !2459

; <label>:8                                       ; preds = %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str23, i64 0, i64 0)) #5, !dbg !2461
  %9 = tail call i32* @__errno_location() #1, !dbg !2462
  store i32 2, i32* %9, align 4, !dbg !2462, !tbaa !751
  br label %10, !dbg !2463

; <label>:10                                      ; preds = %4, %8, %2
  %.0 = phi i32 [ -1, %2 ], [ -1, %8 ], [ 0, %4 ]
  ret i32 %.0, !dbg !2464
}

declare i64 @klee_get_valuel(i64) #3

declare void @klee_assume(i64) #3

; Function Attrs: nounwind
declare i32 @geteuid() #2

; Function Attrs: nounwind
declare i32 @getgid() #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!685, !686}
!llvm.ident = !{!687}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !22, metadata !23, metadata !677, metadata !22, metadata !""} ; [ DW_TAG_compile_unit ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!2 = metadata !{metadata !3, metadata !10}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 26, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 26, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9}
!6 = metadata !{i32 786472, metadata !"eOpen", i64 1} ; [ DW_TAG_enumerator ] [eOpen :: 1]
!7 = metadata !{i32 786472, metadata !"eCloseOnExec", i64 2} ; [ DW_TAG_enumerator ] [eCloseOnExec :: 2]
!8 = metadata !{i32 786472, metadata !"eReadable", i64 4} ; [ DW_TAG_enumerator ] [eReadable :: 4]
!9 = metadata !{i32 786472, metadata !"eWriteable", i64 8} ; [ DW_TAG_enumerator ] [eWriteable :: 8]
!10 = metadata !{i32 786436, metadata !11, null, metadata !"", i32 97, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 97, size 32, align 32, offset 0] [def] [from ]
!11 = metadata !{metadata !"/usr/include/dirent.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21}
!13 = metadata !{i32 786472, metadata !"DT_UNKNOWN", i64 0} ; [ DW_TAG_enumerator ] [DT_UNKNOWN :: 0]
!14 = metadata !{i32 786472, metadata !"DT_FIFO", i64 1} ; [ DW_TAG_enumerator ] [DT_FIFO :: 1]
!15 = metadata !{i32 786472, metadata !"DT_CHR", i64 2} ; [ DW_TAG_enumerator ] [DT_CHR :: 2]
!16 = metadata !{i32 786472, metadata !"DT_DIR", i64 4} ; [ DW_TAG_enumerator ] [DT_DIR :: 4]
!17 = metadata !{i32 786472, metadata !"DT_BLK", i64 6} ; [ DW_TAG_enumerator ] [DT_BLK :: 6]
!18 = metadata !{i32 786472, metadata !"DT_REG", i64 8} ; [ DW_TAG_enumerator ] [DT_REG :: 8]
!19 = metadata !{i32 786472, metadata !"DT_LNK", i64 10} ; [ DW_TAG_enumerator ] [DT_LNK :: 10]
!20 = metadata !{i32 786472, metadata !"DT_SOCK", i64 12} ; [ DW_TAG_enumerator ] [DT_SOCK :: 12]
!21 = metadata !{i32 786472, metadata !"DT_WHT", i64 14} ; [ DW_TAG_enumerator ] [DT_WHT :: 14]
!22 = metadata !{i32 0}
!23 = metadata !{metadata !24, metadata !88, metadata !95, metadata !118, metadata !132, metadata !148, metadata !159, metadata !166, metadata !181, metadata !196, metadata !205, metadata !214, metadata !247, metadata !254, metadata !262, metadata !269, metadata !279, metadata !289, metadata !302, metadata !313, metadata !322, metadata !332, metadata !342, metadata !383, metadata !444, metadata !460, metadata !499, metadata !509, metadata !517, metadata !525, metadata !532, metadata !536, metadata !540, metadata !548, metadata !559, metadata !602, metadata !609, metadata !612, metadata !625, metadata !631, metadata !637, metadata !644, metadata !650, metadata !658, metadata !665}
!24 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"access", metadata !"access", metadata !"", i32 73, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access, null, null, metadata !32, i32 73} ; [ DW_TAG_subprogram ] [line 73] [def] [access]
!25 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !28, metadata !29, metadata !28}
!28 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !85}
!33 = metadata !{i32 786689, metadata !24, metadata !"pathname", metadata !25, i32 16777289, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 73]
!34 = metadata !{i32 786689, metadata !24, metadata !"mode", metadata !25, i32 33554505, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 73]
!35 = metadata !{i32 786688, metadata !24, metadata !"dfile", metadata !25, i32 74, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 74]
!36 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!37 = metadata !{i32 786454, metadata !1, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!38 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!39 = metadata !{metadata !40, metadata !42, metadata !44}
!40 = metadata !{i32 786445, metadata !4, metadata !38, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!41 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!42 = metadata !{i32 786445, metadata !4, metadata !38, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !43} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!43 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!44 = metadata !{i32 786445, metadata !4, metadata !38, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!46 = metadata !{i32 786451, metadata !47, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!47 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!48 = metadata !{metadata !49, metadata !52, metadata !54, metadata !56, metadata !58, metadata !60, metadata !62, metadata !63, metadata !64, metadata !67, metadata !69, metadata !71, metadata !79, metadata !80, metadata !81}
!49 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!50 = metadata !{i32 786454, metadata !47, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!51 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!52 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!53 = metadata !{i32 786454, metadata !47, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!54 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !55} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!55 = metadata !{i32 786454, metadata !47, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!56 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !57} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!57 = metadata !{i32 786454, metadata !47, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!58 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !59} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!59 = metadata !{i32 786454, metadata !47, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!60 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !61} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!61 = metadata !{i32 786454, metadata !47, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!62 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !28} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!63 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !50} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!64 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !65} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!65 = metadata !{i32 786454, metadata !47, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!66 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!67 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !68} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!68 = metadata !{i32 786454, metadata !47, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!69 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!70 = metadata !{i32 786454, metadata !47, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!71 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !72} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!72 = metadata !{i32 786451, metadata !73, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!73 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!74 = metadata !{metadata !75, metadata !77}
!75 = metadata !{i32 786445, metadata !73, metadata !72, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!76 = metadata !{i32 786454, metadata !73, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!77 = metadata !{i32 786445, metadata !73, metadata !72, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!78 = metadata !{i32 786454, metadata !73, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!79 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !72} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!80 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !72} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!81 = metadata !{i32 786445, metadata !47, metadata !46, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !82} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !78, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!85 = metadata !{i32 786688, metadata !86, metadata !"r", metadata !25, i32 81, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 81]
!86 = metadata !{i32 786443, metadata !1, metadata !87, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!87 = metadata !{i32 786443, metadata !1, metadata !24, i32 76, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!88 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"umask", metadata !"umask", metadata !"", i32 88, metadata !89, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask, null, null, metadata !92, i32 88} ; [ DW_TAG_subprogram ] [line 88] [def] [umask]
!89 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !90, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = metadata !{metadata !57, metadata !91}
!91 = metadata !{i32 786454, metadata !1, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!92 = metadata !{metadata !93, metadata !94}
!93 = metadata !{i32 786689, metadata !88, metadata !"mask", metadata !25, i32 16777304, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mask] [line 88]
!94 = metadata !{i32 786688, metadata !88, metadata !"r", metadata !25, i32 89, metadata !91, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 89]
!95 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_open", metadata !"__fd_open", metadata !"", i32 128, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open, null, null, metadata !98, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [__fd_open]
!96 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{metadata !28, metadata !29, metadata !28, metadata !91}
!98 = metadata !{metadata !99, metadata !100, metadata !101, metadata !102, metadata !103, metadata !114, metadata !115}
!99 = metadata !{i32 786689, metadata !95, metadata !"pathname", metadata !25, i32 16777344, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 128]
!100 = metadata !{i32 786689, metadata !95, metadata !"flags", metadata !25, i32 33554560, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 128]
!101 = metadata !{i32 786689, metadata !95, metadata !"mode", metadata !25, i32 50331776, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 128]
!102 = metadata !{i32 786688, metadata !95, metadata !"df", metadata !25, i32 129, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 129]
!103 = metadata !{i32 786688, metadata !95, metadata !"f", metadata !25, i32 130, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 130]
!104 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_file_t]
!105 = metadata !{i32 786454, metadata !1, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !106} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!106 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !107, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!107 = metadata !{metadata !108, metadata !109, metadata !110, metadata !113}
!108 = metadata !{i32 786445, metadata !4, metadata !106, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !28} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!109 = metadata !{i32 786445, metadata !4, metadata !106, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!110 = metadata !{i32 786445, metadata !4, metadata !106, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !111} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!111 = metadata !{i32 786454, metadata !4, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!112 = metadata !{i32 786454, metadata !4, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!113 = metadata !{i32 786445, metadata !4, metadata !106, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !36} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!114 = metadata !{i32 786688, metadata !95, metadata !"fd", metadata !25, i32 131, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 131]
!115 = metadata !{i32 786688, metadata !116, metadata !"os_fd", metadata !25, i32 181, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 181]
!116 = metadata !{i32 786443, metadata !1, metadata !117, i32 180, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!117 = metadata !{i32 786443, metadata !1, metadata !95, i32 147, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!118 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_openat", metadata !"__fd_openat", metadata !"", i32 201, metadata !119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, i32)* @__fd_openat, null, null, metadata !121, i32 201} ; [ DW_TAG_subprogram ] [line 201] [def] [__fd_openat]
!119 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !120, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!120 = metadata !{metadata !28, metadata !28, metadata !29, metadata !28, metadata !91}
!121 = metadata !{metadata !122, metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !131}
!122 = metadata !{i32 786689, metadata !118, metadata !"basefd", metadata !25, i32 16777417, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [basefd] [line 201]
!123 = metadata !{i32 786689, metadata !118, metadata !"pathname", metadata !25, i32 33554633, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 201]
!124 = metadata !{i32 786689, metadata !118, metadata !"flags", metadata !25, i32 50331849, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 201]
!125 = metadata !{i32 786689, metadata !118, metadata !"mode", metadata !25, i32 67109065, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 201]
!126 = metadata !{i32 786688, metadata !118, metadata !"f", metadata !25, i32 202, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 202]
!127 = metadata !{i32 786688, metadata !118, metadata !"fd", metadata !25, i32 203, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 203]
!128 = metadata !{i32 786688, metadata !129, metadata !"bf", metadata !25, i32 205, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bf] [line 205]
!129 = metadata !{i32 786443, metadata !1, metadata !130, i32 204, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!130 = metadata !{i32 786443, metadata !1, metadata !118, i32 204, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!131 = metadata !{i32 786688, metadata !118, metadata !"os_fd", metadata !25, i32 236, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 236]
!132 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"utimes", metadata !"utimes", metadata !"", i32 256, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.timeval*)* @utimes, null, null, metadata !143, i32 256} ; [ DW_TAG_subprogram ] [line 256] [def] [utimes]
!133 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = metadata !{metadata !28, metadata !29, metadata !135}
!135 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !136} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!136 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timeval]
!137 = metadata !{i32 786451, metadata !138, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !139, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!138 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!139 = metadata !{metadata !140, metadata !141}
!140 = metadata !{i32 786445, metadata !138, metadata !137, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!141 = metadata !{i32 786445, metadata !138, metadata !137, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !142} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!142 = metadata !{i32 786454, metadata !138, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!143 = metadata !{metadata !144, metadata !145, metadata !146, metadata !147}
!144 = metadata !{i32 786689, metadata !132, metadata !"path", metadata !25, i32 16777472, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 256]
!145 = metadata !{i32 786689, metadata !132, metadata !"times", metadata !25, i32 33554688, metadata !135, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 256]
!146 = metadata !{i32 786688, metadata !132, metadata !"dfile", metadata !25, i32 257, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 257]
!147 = metadata !{i32 786688, metadata !132, metadata !"r", metadata !25, i32 269, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!148 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"futimesat", metadata !"futimesat", metadata !"", i32 277, metadata !149, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.timeval*)* @futimesat, null, null, metadata !151, i32 277} ; [ DW_TAG_subprogram ] [line 277] [def] [futimesat]
!149 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !150, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!150 = metadata !{metadata !28, metadata !28, metadata !29, metadata !135}
!151 = metadata !{metadata !152, metadata !153, metadata !154, metadata !155, metadata !158}
!152 = metadata !{i32 786689, metadata !148, metadata !"fd", metadata !25, i32 16777493, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 277]
!153 = metadata !{i32 786689, metadata !148, metadata !"path", metadata !25, i32 33554709, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 277]
!154 = metadata !{i32 786689, metadata !148, metadata !"times", metadata !25, i32 50331925, metadata !135, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 277]
!155 = metadata !{i32 786688, metadata !156, metadata !"f", metadata !25, i32 279, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 279]
!156 = metadata !{i32 786443, metadata !1, metadata !157, i32 278, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!157 = metadata !{i32 786443, metadata !1, metadata !148, i32 278, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!158 = metadata !{i32 786688, metadata !148, metadata !"r", metadata !25, i32 295, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 295]
!159 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"close", metadata !"close", metadata !"", i32 303, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close, null, null, metadata !162, i32 303} ; [ DW_TAG_subprogram ] [line 303] [def] [close]
!160 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !161, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!161 = metadata !{metadata !28, metadata !28}
!162 = metadata !{metadata !163, metadata !164, metadata !165}
!163 = metadata !{i32 786689, metadata !159, metadata !"fd", metadata !25, i32 16777519, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!164 = metadata !{i32 786688, metadata !159, metadata !"f", metadata !25, i32 305, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 305]
!165 = metadata !{i32 786688, metadata !159, metadata !"r", metadata !25, i32 306, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 306]
!166 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"read", metadata !"read", metadata !"", i32 335, metadata !167, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @read, null, null, metadata !173, i32 335} ; [ DW_TAG_subprogram ] [line 335] [def] [read]
!167 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !168, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!168 = metadata !{metadata !169, metadata !28, metadata !171, metadata !172}
!169 = metadata !{i32 786454, metadata !1, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !170} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!170 = metadata !{i32 786454, metadata !1, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!171 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!172 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!173 = metadata !{metadata !174, metadata !175, metadata !176, metadata !177, metadata !178}
!174 = metadata !{i32 786689, metadata !166, metadata !"fd", metadata !25, i32 16777551, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 335]
!175 = metadata !{i32 786689, metadata !166, metadata !"buf", metadata !25, i32 33554767, metadata !171, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 335]
!176 = metadata !{i32 786689, metadata !166, metadata !"count", metadata !25, i32 50331983, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 335]
!177 = metadata !{i32 786688, metadata !166, metadata !"f", metadata !25, i32 337, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 337]
!178 = metadata !{i32 786688, metadata !179, metadata !"r", metadata !25, i32 364, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 364]
!179 = metadata !{i32 786443, metadata !1, metadata !180, i32 362, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!180 = metadata !{i32 786443, metadata !1, metadata !166, i32 362, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!181 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"write", metadata !"write", metadata !"", i32 403, metadata !182, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @write, null, null, metadata !186, i32 403} ; [ DW_TAG_subprogram ] [line 403] [def] [write]
!182 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !183, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!183 = metadata !{metadata !169, metadata !28, metadata !184, metadata !172}
!184 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !185} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!185 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!186 = metadata !{metadata !187, metadata !188, metadata !189, metadata !190, metadata !191, metadata !194}
!187 = metadata !{i32 786689, metadata !181, metadata !"fd", metadata !25, i32 16777619, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 403]
!188 = metadata !{i32 786689, metadata !181, metadata !"buf", metadata !25, i32 33554835, metadata !184, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 403]
!189 = metadata !{i32 786689, metadata !181, metadata !"count", metadata !25, i32 50332051, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 403]
!190 = metadata !{i32 786688, metadata !181, metadata !"f", metadata !25, i32 405, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 405]
!191 = metadata !{i32 786688, metadata !192, metadata !"r", metadata !25, i32 423, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 423]
!192 = metadata !{i32 786443, metadata !1, metadata !193, i32 422, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!193 = metadata !{i32 786443, metadata !1, metadata !181, i32 422, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!194 = metadata !{i32 786688, metadata !195, metadata !"actual_count", metadata !25, i32 448, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_count] [line 448]
!195 = metadata !{i32 786443, metadata !1, metadata !193, i32 446, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!196 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"", i32 475, metadata !197, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek, null, null, metadata !199, i32 475} ; [ DW_TAG_subprogram ] [line 475] [def] [__fd_lseek]
!197 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !198, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!198 = metadata !{metadata !111, metadata !28, metadata !111, metadata !28}
!199 = metadata !{metadata !200, metadata !201, metadata !202, metadata !203, metadata !204}
!200 = metadata !{i32 786689, metadata !196, metadata !"fd", metadata !25, i32 16777691, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 475]
!201 = metadata !{i32 786689, metadata !196, metadata !"offset", metadata !25, i32 33554907, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 475]
!202 = metadata !{i32 786689, metadata !196, metadata !"whence", metadata !25, i32 50332123, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 475]
!203 = metadata !{i32 786688, metadata !196, metadata !"new_off", metadata !25, i32 476, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_off] [line 476]
!204 = metadata !{i32 786688, metadata !196, metadata !"f", metadata !25, i32 477, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 477]
!205 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"", i32 532, metadata !206, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_stat, null, null, metadata !208, i32 532} ; [ DW_TAG_subprogram ] [line 532] [def] [__fd_stat]
!206 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !207, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!207 = metadata !{metadata !28, metadata !29, metadata !45}
!208 = metadata !{metadata !209, metadata !210, metadata !211, metadata !212}
!209 = metadata !{i32 786689, metadata !205, metadata !"path", metadata !25, i32 16777748, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 532]
!210 = metadata !{i32 786689, metadata !205, metadata !"buf", metadata !25, i32 33554964, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 532]
!211 = metadata !{i32 786688, metadata !205, metadata !"dfile", metadata !25, i32 533, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 533]
!212 = metadata !{i32 786688, metadata !213, metadata !"r", metadata !25, i32 541, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 541]
!213 = metadata !{i32 786443, metadata !1, metadata !205, i32 539, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!214 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fstatat", metadata !"fstatat", metadata !"", i32 551, metadata !215, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*, i32)* @fstatat, null, null, metadata !237, i32 551} ; [ DW_TAG_subprogram ] [line 551] [def] [fstatat]
!215 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !216, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!216 = metadata !{metadata !28, metadata !28, metadata !29, metadata !217, metadata !28}
!217 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !218} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!218 = metadata !{i32 786451, metadata !47, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !219, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!219 = metadata !{metadata !220, metadata !221, metadata !223, metadata !224, metadata !225, metadata !226, metadata !227, metadata !228, metadata !229, metadata !230, metadata !231, metadata !233, metadata !234, metadata !235, metadata !236}
!220 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!221 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !222} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!222 = metadata !{i32 786454, metadata !47, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!223 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !55} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!224 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !57} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!225 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !59} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!226 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !61} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!227 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !28} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!228 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !50} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!229 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !65} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!230 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !68} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!231 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !232} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!232 = metadata !{i32 786454, metadata !47, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!233 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !72} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!234 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !72} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!235 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !72} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!236 = metadata !{i32 786445, metadata !47, metadata !218, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !82} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!237 = metadata !{metadata !238, metadata !239, metadata !240, metadata !241, metadata !242, metadata !245, metadata !246}
!238 = metadata !{i32 786689, metadata !214, metadata !"fd", metadata !25, i32 16777767, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 551]
!239 = metadata !{i32 786689, metadata !214, metadata !"path", metadata !25, i32 33554983, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 551]
!240 = metadata !{i32 786689, metadata !214, metadata !"buf", metadata !25, i32 50332199, metadata !217, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 551]
!241 = metadata !{i32 786689, metadata !214, metadata !"flags", metadata !25, i32 67109415, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 551]
!242 = metadata !{i32 786688, metadata !243, metadata !"f", metadata !25, i32 553, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 553]
!243 = metadata !{i32 786443, metadata !1, metadata !244, i32 552, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!244 = metadata !{i32 786443, metadata !1, metadata !214, i32 552, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!245 = metadata !{i32 786688, metadata !214, metadata !"dfile", metadata !25, i32 565, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 565]
!246 = metadata !{i32 786688, metadata !214, metadata !"r", metadata !25, i32 572, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 572]
!247 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"", i32 587, metadata !206, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_lstat, null, null, metadata !248, i32 587} ; [ DW_TAG_subprogram ] [line 587] [def] [__fd_lstat]
!248 = metadata !{metadata !249, metadata !250, metadata !251, metadata !252}
!249 = metadata !{i32 786689, metadata !247, metadata !"path", metadata !25, i32 16777803, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 587]
!250 = metadata !{i32 786689, metadata !247, metadata !"buf", metadata !25, i32 33555019, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 587]
!251 = metadata !{i32 786688, metadata !247, metadata !"dfile", metadata !25, i32 588, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 588]
!252 = metadata !{i32 786688, metadata !253, metadata !"r", metadata !25, i32 596, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 596]
!253 = metadata !{i32 786443, metadata !1, metadata !247, i32 594, i32 0, i32 127} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!254 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"chdir", metadata !"chdir", metadata !"", i32 606, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir, null, null, metadata !257, i32 606} ; [ DW_TAG_subprogram ] [line 606] [def] [chdir]
!255 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !256, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!256 = metadata !{metadata !28, metadata !29}
!257 = metadata !{metadata !258, metadata !259, metadata !260}
!258 = metadata !{i32 786689, metadata !254, metadata !"path", metadata !25, i32 16777822, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 606]
!259 = metadata !{i32 786688, metadata !254, metadata !"dfile", metadata !25, i32 607, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 607]
!260 = metadata !{i32 786688, metadata !261, metadata !"r", metadata !25, i32 617, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 617]
!261 = metadata !{i32 786443, metadata !1, metadata !254, i32 616, i32 0, i32 131} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!262 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fchdir", metadata !"fchdir", metadata !"", i32 624, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir, null, null, metadata !263, i32 624} ; [ DW_TAG_subprogram ] [line 624] [def] [fchdir]
!263 = metadata !{metadata !264, metadata !265, metadata !266}
!264 = metadata !{i32 786689, metadata !262, metadata !"fd", metadata !25, i32 16777840, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 624]
!265 = metadata !{i32 786688, metadata !262, metadata !"f", metadata !25, i32 625, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 625]
!266 = metadata !{i32 786688, metadata !267, metadata !"r", metadata !25, i32 637, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 637]
!267 = metadata !{i32 786443, metadata !1, metadata !268, i32 636, i32 0, i32 137} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!268 = metadata !{i32 786443, metadata !1, metadata !262, i32 632, i32 0, i32 135} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!269 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"chmod", metadata !"chmod", metadata !"", i32 658, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod, null, null, metadata !272, i32 658} ; [ DW_TAG_subprogram ] [line 658] [def] [chmod]
!270 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !271, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!271 = metadata !{metadata !28, metadata !29, metadata !91}
!272 = metadata !{metadata !273, metadata !274, metadata !275, metadata !276}
!273 = metadata !{i32 786689, metadata !269, metadata !"path", metadata !25, i32 16777874, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 658]
!274 = metadata !{i32 786689, metadata !269, metadata !"mode", metadata !25, i32 33555090, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 658]
!275 = metadata !{i32 786688, metadata !269, metadata !"dfile", metadata !25, i32 661, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 661]
!276 = metadata !{i32 786688, metadata !277, metadata !"r", metadata !25, i32 673, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 673]
!277 = metadata !{i32 786443, metadata !1, metadata !278, i32 672, i32 0, i32 143} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!278 = metadata !{i32 786443, metadata !1, metadata !269, i32 670, i32 0, i32 141} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!279 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fchmod", metadata !"fchmod", metadata !"", i32 680, metadata !280, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod, null, null, metadata !282, i32 680} ; [ DW_TAG_subprogram ] [line 680] [def] [fchmod]
!280 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !281, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!281 = metadata !{metadata !28, metadata !28, metadata !91}
!282 = metadata !{metadata !283, metadata !284, metadata !285, metadata !286}
!283 = metadata !{i32 786689, metadata !279, metadata !"fd", metadata !25, i32 16777896, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 680]
!284 = metadata !{i32 786689, metadata !279, metadata !"mode", metadata !25, i32 33555112, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 680]
!285 = metadata !{i32 786688, metadata !279, metadata !"f", metadata !25, i32 683, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 683]
!286 = metadata !{i32 786688, metadata !287, metadata !"r", metadata !25, i32 700, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 700]
!287 = metadata !{i32 786443, metadata !1, metadata !288, i32 699, i32 0, i32 151} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!288 = metadata !{i32 786443, metadata !1, metadata !279, i32 697, i32 0, i32 149} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!289 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"chown", metadata !"chown", metadata !"", i32 713, metadata !290, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown, null, null, metadata !294, i32 713} ; [ DW_TAG_subprogram ] [line 713] [def] [chown]
!290 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !291, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!291 = metadata !{metadata !28, metadata !29, metadata !292, metadata !293}
!292 = metadata !{i32 786454, metadata !1, null, metadata !"uid_t", i32 80, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_typedef ] [uid_t] [line 80, size 0, align 0, offset 0] [from __uid_t]
!293 = metadata !{i32 786454, metadata !1, null, metadata !"gid_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_typedef ] [gid_t] [line 65, size 0, align 0, offset 0] [from __gid_t]
!294 = metadata !{metadata !295, metadata !296, metadata !297, metadata !298, metadata !299}
!295 = metadata !{i32 786689, metadata !289, metadata !"path", metadata !25, i32 16777929, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 713]
!296 = metadata !{i32 786689, metadata !289, metadata !"owner", metadata !25, i32 33555145, metadata !292, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 713]
!297 = metadata !{i32 786689, metadata !289, metadata !"group", metadata !25, i32 50332361, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 713]
!298 = metadata !{i32 786688, metadata !289, metadata !"df", metadata !25, i32 714, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 714]
!299 = metadata !{i32 786688, metadata !300, metadata !"r", metadata !25, i32 719, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 719]
!300 = metadata !{i32 786443, metadata !1, metadata !301, i32 718, i32 0, i32 155} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!301 = metadata !{i32 786443, metadata !1, metadata !289, i32 716, i32 0, i32 153} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!302 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fchown", metadata !"fchown", metadata !"", i32 726, metadata !303, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown, null, null, metadata !305, i32 726} ; [ DW_TAG_subprogram ] [line 726] [def] [fchown]
!303 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !304, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!304 = metadata !{metadata !28, metadata !28, metadata !292, metadata !293}
!305 = metadata !{metadata !306, metadata !307, metadata !308, metadata !309, metadata !310}
!306 = metadata !{i32 786689, metadata !302, metadata !"fd", metadata !25, i32 16777942, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 726]
!307 = metadata !{i32 786689, metadata !302, metadata !"owner", metadata !25, i32 33555158, metadata !292, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 726]
!308 = metadata !{i32 786689, metadata !302, metadata !"group", metadata !25, i32 50332374, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 726]
!309 = metadata !{i32 786688, metadata !302, metadata !"f", metadata !25, i32 727, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 727]
!310 = metadata !{i32 786688, metadata !311, metadata !"r", metadata !25, i32 737, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 737]
!311 = metadata !{i32 786443, metadata !1, metadata !312, i32 736, i32 0, i32 161} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!312 = metadata !{i32 786443, metadata !1, metadata !302, i32 734, i32 0, i32 159} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!313 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"lchown", metadata !"lchown", metadata !"", i32 744, metadata !290, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown, null, null, metadata !314, i32 744} ; [ DW_TAG_subprogram ] [line 744] [def] [lchown]
!314 = metadata !{metadata !315, metadata !316, metadata !317, metadata !318, metadata !319}
!315 = metadata !{i32 786689, metadata !313, metadata !"path", metadata !25, i32 16777960, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 744]
!316 = metadata !{i32 786689, metadata !313, metadata !"owner", metadata !25, i32 33555176, metadata !292, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 744]
!317 = metadata !{i32 786689, metadata !313, metadata !"group", metadata !25, i32 50332392, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 744]
!318 = metadata !{i32 786688, metadata !313, metadata !"df", metadata !25, i32 746, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 746]
!319 = metadata !{i32 786688, metadata !320, metadata !"r", metadata !25, i32 751, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 751]
!320 = metadata !{i32 786443, metadata !1, metadata !321, i32 750, i32 0, i32 165} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!321 = metadata !{i32 786443, metadata !1, metadata !313, i32 748, i32 0, i32 163} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!322 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"", i32 758, metadata !323, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @__fd_fstat, null, null, metadata !325, i32 758} ; [ DW_TAG_subprogram ] [line 758] [def] [__fd_fstat]
!323 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !324, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!324 = metadata !{metadata !28, metadata !28, metadata !45}
!325 = metadata !{metadata !326, metadata !327, metadata !328, metadata !329}
!326 = metadata !{i32 786689, metadata !322, metadata !"fd", metadata !25, i32 16777974, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 758]
!327 = metadata !{i32 786689, metadata !322, metadata !"buf", metadata !25, i32 33555190, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 758]
!328 = metadata !{i32 786688, metadata !322, metadata !"f", metadata !25, i32 759, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 759]
!329 = metadata !{i32 786688, metadata !330, metadata !"r", metadata !25, i32 768, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 768]
!330 = metadata !{i32 786443, metadata !1, metadata !331, i32 766, i32 0, i32 170} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!331 = metadata !{i32 786443, metadata !1, metadata !322, i32 766, i32 0, i32 169} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!332 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"", i32 781, metadata !333, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate, null, null, metadata !335, i32 781} ; [ DW_TAG_subprogram ] [line 781] [def] [__fd_ftruncate]
!333 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !334, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!334 = metadata !{metadata !28, metadata !28, metadata !111}
!335 = metadata !{metadata !336, metadata !337, metadata !338, metadata !339}
!336 = metadata !{i32 786689, metadata !332, metadata !"fd", metadata !25, i32 16777997, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 781]
!337 = metadata !{i32 786689, metadata !332, metadata !"length", metadata !25, i32 33555213, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 781]
!338 = metadata !{i32 786688, metadata !332, metadata !"f", metadata !25, i32 783, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 783]
!339 = metadata !{i32 786688, metadata !340, metadata !"r", metadata !25, i32 804, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 804]
!340 = metadata !{i32 786443, metadata !1, metadata !341, i32 802, i32 0, i32 178} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!341 = metadata !{i32 786443, metadata !1, metadata !332, i32 798, i32 0, i32 176} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!342 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"", i32 814, metadata !343, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents, null, null, metadata !359, i32 814} ; [ DW_TAG_subprogram ] [line 814] [def] [__fd_getdents]
!343 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !344, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!344 = metadata !{metadata !28, metadata !41, metadata !345, metadata !41}
!345 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !346} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!346 = metadata !{i32 786451, metadata !347, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !348, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!347 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!348 = metadata !{metadata !349, metadata !350, metadata !351, metadata !353, metadata !355}
!349 = metadata !{i32 786445, metadata !347, metadata !346, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!350 = metadata !{i32 786445, metadata !347, metadata !346, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !112} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!351 = metadata !{i32 786445, metadata !347, metadata !346, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !352} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!352 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!353 = metadata !{i32 786445, metadata !347, metadata !346, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !354} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!354 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!355 = metadata !{i32 786445, metadata !347, metadata !346, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !356} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!356 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !31, metadata !357, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!357 = metadata !{metadata !358}
!358 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!359 = metadata !{metadata !360, metadata !361, metadata !362, metadata !363, metadata !364, metadata !369, metadata !370, metadata !371, metadata !374, metadata !376, metadata !377, metadata !378, metadata !381}
!360 = metadata !{i32 786689, metadata !342, metadata !"fd", metadata !25, i32 16778030, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 814]
!361 = metadata !{i32 786689, metadata !342, metadata !"dirp", metadata !25, i32 33555246, metadata !345, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 814]
!362 = metadata !{i32 786689, metadata !342, metadata !"count", metadata !25, i32 50332462, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 814]
!363 = metadata !{i32 786688, metadata !342, metadata !"f", metadata !25, i32 815, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 815]
!364 = metadata !{i32 786688, metadata !365, metadata !"i", metadata !25, i32 829, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 829]
!365 = metadata !{i32 786443, metadata !1, metadata !366, i32 827, i32 0, i32 186} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!366 = metadata !{i32 786443, metadata !1, metadata !367, i32 827, i32 0, i32 185} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!367 = metadata !{i32 786443, metadata !1, metadata !368, i32 826, i32 0, i32 184} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!368 = metadata !{i32 786443, metadata !1, metadata !342, i32 822, i32 0, i32 182} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!369 = metadata !{i32 786688, metadata !365, metadata !"pad", metadata !25, i32 829, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pad] [line 829]
!370 = metadata !{i32 786688, metadata !365, metadata !"bytes", metadata !25, i32 829, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bytes] [line 829]
!371 = metadata !{i32 786688, metadata !372, metadata !"df", metadata !25, i32 839, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 839]
!372 = metadata !{i32 786443, metadata !1, metadata !373, i32 838, i32 0, i32 190} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!373 = metadata !{i32 786443, metadata !1, metadata !365, i32 838, i32 0, i32 189} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!374 = metadata !{i32 786688, metadata !375, metadata !"os_pos", metadata !25, i32 862, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_pos] [line 862]
!375 = metadata !{i32 786443, metadata !1, metadata !366, i32 861, i32 0, i32 191} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!376 = metadata !{i32 786688, metadata !375, metadata !"res", metadata !25, i32 863, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 863]
!377 = metadata !{i32 786688, metadata !375, metadata !"s", metadata !25, i32 864, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 864]
!378 = metadata !{i32 786688, metadata !379, metadata !"pos", metadata !25, i32 880, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 880]
!379 = metadata !{i32 786443, metadata !1, metadata !380, i32 879, i32 0, i32 194} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!380 = metadata !{i32 786443, metadata !1, metadata !375, i32 877, i32 0, i32 192} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!381 = metadata !{i32 786688, metadata !382, metadata !"dp", metadata !25, i32 886, metadata !345, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 886]
!382 = metadata !{i32 786443, metadata !1, metadata !379, i32 885, i32 0, i32 195} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!383 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"ioctl", metadata !"ioctl", metadata !"", i32 898, metadata !384, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64, ...)* @ioctl, null, null, metadata !386, i32 898} ; [ DW_TAG_subprogram ] [line 898] [def] [ioctl]
!384 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !385, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!385 = metadata !{metadata !28, metadata !28, metadata !51}
!386 = metadata !{metadata !387, metadata !388, metadata !389, metadata !390, metadata !404, metadata !405, metadata !408, metadata !429, metadata !439, metadata !442}
!387 = metadata !{i32 786689, metadata !383, metadata !"fd", metadata !25, i32 16778114, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 898]
!388 = metadata !{i32 786689, metadata !383, metadata !"request", metadata !25, i32 33555330, metadata !51, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [request] [line 898]
!389 = metadata !{i32 786688, metadata !383, metadata !"f", metadata !25, i32 902, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 902]
!390 = metadata !{i32 786688, metadata !383, metadata !"ap", metadata !25, i32 903, metadata !391, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 903]
!391 = metadata !{i32 786454, metadata !1, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !392} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!392 = metadata !{i32 786454, metadata !1, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !393} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!393 = metadata !{i32 786454, metadata !1, null, metadata !"__builtin_va_list", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 903, size 0, align 0, offset 0] [from ]
!394 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !395, metadata !402, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!395 = metadata !{i32 786454, metadata !1, null, metadata !"__va_list_tag", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !396} ; [ DW_TAG_typedef ] [__va_list_tag] [line 903, size 0, align 0, offset 0] [from __va_list_tag]
!396 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 903, i64 192, i64 64, i32 0, i32 0, null, metadata !397, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 903, size 192, align 64, offset 0] [def] [from ]
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401}
!398 = metadata !{i32 786445, metadata !1, metadata !396, metadata !"gp_offset", i32 903, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [gp_offset] [line 903, size 32, align 32, offset 0] [from unsigned int]
!399 = metadata !{i32 786445, metadata !1, metadata !396, metadata !"fp_offset", i32 903, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [fp_offset] [line 903, size 32, align 32, offset 32] [from unsigned int]
!400 = metadata !{i32 786445, metadata !1, metadata !396, metadata !"overflow_arg_area", i32 903, i64 64, i64 64, i64 64, i32 0, metadata !171} ; [ DW_TAG_member ] [overflow_arg_area] [line 903, size 64, align 64, offset 64] [from ]
!401 = metadata !{i32 786445, metadata !1, metadata !396, metadata !"reg_save_area", i32 903, i64 64, i64 64, i64 128, i32 0, metadata !171} ; [ DW_TAG_member ] [reg_save_area] [line 903, size 64, align 64, offset 128] [from ]
!402 = metadata !{metadata !403}
!403 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!404 = metadata !{i32 786688, metadata !383, metadata !"buf", metadata !25, i32 904, metadata !171, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 904]
!405 = metadata !{i32 786688, metadata !406, metadata !"stat", metadata !25, i32 920, metadata !217, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stat] [line 920]
!406 = metadata !{i32 786443, metadata !1, metadata !407, i32 919, i32 0, i32 199} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!407 = metadata !{i32 786443, metadata !1, metadata !383, i32 919, i32 0, i32 198} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!408 = metadata !{i32 786688, metadata !409, metadata !"ts", metadata !25, i32 924, metadata !411, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ts] [line 924]
!409 = metadata !{i32 786443, metadata !1, metadata !410, i32 923, i32 0, i32 201} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!410 = metadata !{i32 786443, metadata !1, metadata !406, i32 922, i32 0, i32 200} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!411 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !412} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from termios]
!412 = metadata !{i32 786451, metadata !413, null, metadata !"termios", i32 28, i64 480, i64 32, i32 0, i32 0, null, metadata !414, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [termios] [line 28, size 480, align 32, offset 0] [def] [from ]
!413 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/termios.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!414 = metadata !{metadata !415, metadata !417, metadata !418, metadata !419, metadata !420, metadata !422, metadata !426, metadata !428}
!415 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_iflag", i32 30, i64 32, i64 32, i64 0, i32 0, metadata !416} ; [ DW_TAG_member ] [c_iflag] [line 30, size 32, align 32, offset 0] [from tcflag_t]
!416 = metadata !{i32 786454, metadata !413, null, metadata !"tcflag_t", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [tcflag_t] [line 25, size 0, align 0, offset 0] [from unsigned int]
!417 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_oflag", i32 31, i64 32, i64 32, i64 32, i32 0, metadata !416} ; [ DW_TAG_member ] [c_oflag] [line 31, size 32, align 32, offset 32] [from tcflag_t]
!418 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_cflag", i32 32, i64 32, i64 32, i64 64, i32 0, metadata !416} ; [ DW_TAG_member ] [c_cflag] [line 32, size 32, align 32, offset 64] [from tcflag_t]
!419 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_lflag", i32 33, i64 32, i64 32, i64 96, i32 0, metadata !416} ; [ DW_TAG_member ] [c_lflag] [line 33, size 32, align 32, offset 96] [from tcflag_t]
!420 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_line", i32 34, i64 8, i64 8, i64 128, i32 0, metadata !421} ; [ DW_TAG_member ] [c_line] [line 34, size 8, align 8, offset 128] [from cc_t]
!421 = metadata !{i32 786454, metadata !413, null, metadata !"cc_t", i32 23, i64 0, i64 0, i64 0, i32 0, metadata !354} ; [ DW_TAG_typedef ] [cc_t] [line 23, size 0, align 0, offset 0] [from unsigned char]
!422 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_cc", i32 35, i64 256, i64 8, i64 136, i32 0, metadata !423} ; [ DW_TAG_member ] [c_cc] [line 35, size 256, align 8, offset 136] [from ]
!423 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !421, metadata !424, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from cc_t]
!424 = metadata !{metadata !425}
!425 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!426 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_ispeed", i32 36, i64 32, i64 32, i64 416, i32 0, metadata !427} ; [ DW_TAG_member ] [c_ispeed] [line 36, size 32, align 32, offset 416] [from speed_t]
!427 = metadata !{i32 786454, metadata !413, null, metadata !"speed_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ] [speed_t] [line 24, size 0, align 0, offset 0] [from unsigned int]
!428 = metadata !{i32 786445, metadata !413, metadata !412, metadata !"c_ospeed", i32 37, i64 32, i64 32, i64 448, i32 0, metadata !427} ; [ DW_TAG_member ] [c_ospeed] [line 37, size 32, align 32, offset 448] [from speed_t]
!429 = metadata !{i32 786688, metadata !430, metadata !"ws", metadata !25, i32 993, metadata !431, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ws] [line 993]
!430 = metadata !{i32 786443, metadata !1, metadata !410, i32 992, i32 0, i32 217} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!431 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !432} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from winsize]
!432 = metadata !{i32 786451, metadata !433, null, metadata !"winsize", i32 27, i64 64, i64 16, i32 0, i32 0, null, metadata !434, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [winsize] [line 27, size 64, align 16, offset 0] [def] [from ]
!433 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!434 = metadata !{metadata !435, metadata !436, metadata !437, metadata !438}
!435 = metadata !{i32 786445, metadata !433, metadata !432, metadata !"ws_row", i32 29, i64 16, i64 16, i64 0, i32 0, metadata !352} ; [ DW_TAG_member ] [ws_row] [line 29, size 16, align 16, offset 0] [from unsigned short]
!436 = metadata !{i32 786445, metadata !433, metadata !432, metadata !"ws_col", i32 30, i64 16, i64 16, i64 16, i32 0, metadata !352} ; [ DW_TAG_member ] [ws_col] [line 30, size 16, align 16, offset 16] [from unsigned short]
!437 = metadata !{i32 786445, metadata !433, metadata !432, metadata !"ws_xpixel", i32 31, i64 16, i64 16, i64 32, i32 0, metadata !352} ; [ DW_TAG_member ] [ws_xpixel] [line 31, size 16, align 16, offset 32] [from unsigned short]
!438 = metadata !{i32 786445, metadata !433, metadata !432, metadata !"ws_ypixel", i32 32, i64 16, i64 16, i64 48, i32 0, metadata !352} ; [ DW_TAG_member ] [ws_ypixel] [line 32, size 16, align 16, offset 48] [from unsigned short]
!439 = metadata !{i32 786688, metadata !440, metadata !"res", metadata !25, i32 1016, metadata !441, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 1016]
!440 = metadata !{i32 786443, metadata !1, metadata !410, i32 1015, i32 0, i32 225} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!441 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!442 = metadata !{i32 786688, metadata !443, metadata !"r", metadata !25, i32 1041, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1041]
!443 = metadata !{i32 786443, metadata !1, metadata !407, i32 1040, i32 0, i32 233} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!444 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fcntl", metadata !"fcntl", metadata !"", i32 1048, metadata !445, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl, null, null, metadata !447, i32 1048} ; [ DW_TAG_subprogram ] [line 1048] [def] [fcntl]
!445 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !446, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!446 = metadata !{metadata !28, metadata !28, metadata !28}
!447 = metadata !{metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !458}
!448 = metadata !{i32 786689, metadata !444, metadata !"fd", metadata !25, i32 16778264, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1048]
!449 = metadata !{i32 786689, metadata !444, metadata !"cmd", metadata !25, i32 33555480, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cmd] [line 1048]
!450 = metadata !{i32 786688, metadata !444, metadata !"f", metadata !25, i32 1049, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1049]
!451 = metadata !{i32 786688, metadata !444, metadata !"ap", metadata !25, i32 1050, metadata !391, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 1050]
!452 = metadata !{i32 786688, metadata !444, metadata !"arg", metadata !25, i32 1051, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg] [line 1051]
!453 = metadata !{i32 786688, metadata !454, metadata !"flags", metadata !25, i32 1070, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flags] [line 1070]
!454 = metadata !{i32 786443, metadata !1, metadata !455, i32 1069, i32 0, i32 243} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!455 = metadata !{i32 786443, metadata !1, metadata !456, i32 1068, i32 0, i32 242} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!456 = metadata !{i32 786443, metadata !1, metadata !457, i32 1067, i32 0, i32 241} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!457 = metadata !{i32 786443, metadata !1, metadata !444, i32 1067, i32 0, i32 240} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!458 = metadata !{i32 786688, metadata !459, metadata !"r", metadata !25, i32 1096, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1096]
!459 = metadata !{i32 786443, metadata !1, metadata !457, i32 1095, i32 0, i32 248} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!460 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"", i32 1103, metadata !461, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs, null, null, metadata !493, i32 1103} ; [ DW_TAG_subprogram ] [line 1103] [def] [__fd_statfs]
!461 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !462, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!462 = metadata !{metadata !28, metadata !29, metadata !463}
!463 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !464} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!464 = metadata !{i32 786451, metadata !465, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !466, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!465 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!466 = metadata !{metadata !467, metadata !469, metadata !470, metadata !472, metadata !473, metadata !474, metadata !476, metadata !477, metadata !486, metadata !487, metadata !488, metadata !489}
!467 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !468} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!468 = metadata !{i32 786454, metadata !465, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!469 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !468} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!470 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !471} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!471 = metadata !{i32 786454, metadata !465, null, metadata !"__fsblkcnt_t", i32 162, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__fsblkcnt_t] [line 162, size 0, align 0, offset 0] [from long unsigned int]
!472 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !471} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!473 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !471} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!474 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !475} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!475 = metadata !{i32 786454, metadata !465, null, metadata !"__fsfilcnt_t", i32 166, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [__fsfilcnt_t] [line 166, size 0, align 0, offset 0] [from long unsigned int]
!476 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !475} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!477 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !478} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!478 = metadata !{i32 786454, metadata !465, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !479} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!479 = metadata !{i32 786451, metadata !480, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !481, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!480 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!481 = metadata !{metadata !482}
!482 = metadata !{i32 786445, metadata !480, metadata !479, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !483} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!483 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !28, metadata !484, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!484 = metadata !{metadata !485}
!485 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!486 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !468} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!487 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !468} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!488 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !468} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!489 = metadata !{i32 786445, metadata !465, metadata !464, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !490} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!490 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !468, metadata !491, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!491 = metadata !{metadata !492}
!492 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!493 = metadata !{metadata !494, metadata !495, metadata !496, metadata !497}
!494 = metadata !{i32 786689, metadata !460, metadata !"path", metadata !25, i32 16778319, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1103]
!495 = metadata !{i32 786689, metadata !460, metadata !"buf", metadata !25, i32 33555535, metadata !463, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1103]
!496 = metadata !{i32 786688, metadata !460, metadata !"dfile", metadata !25, i32 1104, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1104]
!497 = metadata !{i32 786688, metadata !498, metadata !"r", metadata !25, i32 1113, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1113]
!498 = metadata !{i32 786443, metadata !1, metadata !460, i32 1112, i32 0, i32 252} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!499 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fstatfs", metadata !"fstatfs", metadata !"", i32 1120, metadata !500, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs, null, null, metadata !502, i32 1120} ; [ DW_TAG_subprogram ] [line 1120] [def] [fstatfs]
!500 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !501, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!501 = metadata !{metadata !28, metadata !28, metadata !463}
!502 = metadata !{metadata !503, metadata !504, metadata !505, metadata !506}
!503 = metadata !{i32 786689, metadata !499, metadata !"fd", metadata !25, i32 16778336, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1120]
!504 = metadata !{i32 786689, metadata !499, metadata !"buf", metadata !25, i32 33555552, metadata !463, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1120]
!505 = metadata !{i32 786688, metadata !499, metadata !"f", metadata !25, i32 1121, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1121]
!506 = metadata !{i32 786688, metadata !507, metadata !"r", metadata !25, i32 1133, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1133]
!507 = metadata !{i32 786443, metadata !1, metadata !508, i32 1132, i32 0, i32 258} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!508 = metadata !{i32 786443, metadata !1, metadata !499, i32 1128, i32 0, i32 256} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!509 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"fsync", metadata !"fsync", metadata !"", i32 1140, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync, null, null, metadata !510, i32 1140} ; [ DW_TAG_subprogram ] [line 1140] [def] [fsync]
!510 = metadata !{metadata !511, metadata !512, metadata !513}
!511 = metadata !{i32 786689, metadata !509, metadata !"fd", metadata !25, i32 16778356, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1140]
!512 = metadata !{i32 786688, metadata !509, metadata !"f", metadata !25, i32 1141, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1141]
!513 = metadata !{i32 786688, metadata !514, metadata !"r", metadata !25, i32 1149, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1149]
!514 = metadata !{i32 786443, metadata !1, metadata !515, i32 1148, i32 0, i32 264} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!515 = metadata !{i32 786443, metadata !1, metadata !516, i32 1146, i32 0, i32 262} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!516 = metadata !{i32 786443, metadata !1, metadata !509, i32 1143, i32 0, i32 260} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!517 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"dup2", metadata !"dup2", metadata !"", i32 1156, metadata !445, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2, null, null, metadata !518, i32 1156} ; [ DW_TAG_subprogram ] [line 1156] [def] [dup2]
!518 = metadata !{metadata !519, metadata !520, metadata !521, metadata !522}
!519 = metadata !{i32 786689, metadata !517, metadata !"oldfd", metadata !25, i32 16778372, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1156]
!520 = metadata !{i32 786689, metadata !517, metadata !"newfd", metadata !25, i32 33555588, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newfd] [line 1156]
!521 = metadata !{i32 786688, metadata !517, metadata !"f", metadata !25, i32 1157, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1157]
!522 = metadata !{i32 786688, metadata !523, metadata !"f2", metadata !25, i32 1163, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f2] [line 1163]
!523 = metadata !{i32 786443, metadata !1, metadata !524, i32 1162, i32 0, i32 268} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!524 = metadata !{i32 786443, metadata !1, metadata !517, i32 1159, i32 0, i32 266} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!525 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"dup", metadata !"dup", metadata !"", i32 1181, metadata !160, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup, null, null, metadata !526, i32 1181} ; [ DW_TAG_subprogram ] [line 1181] [def] [dup]
!526 = metadata !{metadata !527, metadata !528, metadata !529}
!527 = metadata !{i32 786689, metadata !525, metadata !"oldfd", metadata !25, i32 16778397, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1181]
!528 = metadata !{i32 786688, metadata !525, metadata !"f", metadata !25, i32 1182, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1182]
!529 = metadata !{i32 786688, metadata !530, metadata !"fd", metadata !25, i32 1187, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 1187]
!530 = metadata !{i32 786443, metadata !1, metadata !531, i32 1186, i32 0, i32 272} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!531 = metadata !{i32 786443, metadata !1, metadata !525, i32 1183, i32 0, i32 270} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!532 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"rmdir", metadata !"rmdir", metadata !"", i32 1200, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir, null, null, metadata !533, i32 1200} ; [ DW_TAG_subprogram ] [line 1200] [def] [rmdir]
!533 = metadata !{metadata !534, metadata !535}
!534 = metadata !{i32 786689, metadata !532, metadata !"pathname", metadata !25, i32 16778416, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1200]
!535 = metadata !{i32 786688, metadata !532, metadata !"dfile", metadata !25, i32 1201, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1201]
!536 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"unlink", metadata !"unlink", metadata !"", i32 1218, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink, null, null, metadata !537, i32 1218} ; [ DW_TAG_subprogram ] [line 1218] [def] [unlink]
!537 = metadata !{metadata !538, metadata !539}
!538 = metadata !{i32 786689, metadata !536, metadata !"pathname", metadata !25, i32 16778434, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1218]
!539 = metadata !{i32 786688, metadata !536, metadata !"dfile", metadata !25, i32 1219, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1219]
!540 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"unlinkat", metadata !"unlinkat", metadata !"", i32 1239, metadata !541, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @unlinkat, null, null, metadata !543, i32 1239} ; [ DW_TAG_subprogram ] [line 1239] [def] [unlinkat]
!541 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !542, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!542 = metadata !{metadata !28, metadata !28, metadata !29, metadata !28}
!543 = metadata !{metadata !544, metadata !545, metadata !546, metadata !547}
!544 = metadata !{i32 786689, metadata !540, metadata !"dirfd", metadata !25, i32 16778455, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirfd] [line 1239]
!545 = metadata !{i32 786689, metadata !540, metadata !"pathname", metadata !25, i32 33555671, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1239]
!546 = metadata !{i32 786689, metadata !540, metadata !"flags", metadata !25, i32 50332887, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 1239]
!547 = metadata !{i32 786688, metadata !540, metadata !"dfile", metadata !25, i32 1242, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1242]
!548 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"readlink", metadata !"readlink", metadata !"", i32 1262, metadata !549, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8*, i64)* @readlink, null, null, metadata !551, i32 1262} ; [ DW_TAG_subprogram ] [line 1262] [def] [readlink]
!549 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !550, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!550 = metadata !{metadata !169, metadata !29, metadata !43, metadata !172}
!551 = metadata !{metadata !552, metadata !553, metadata !554, metadata !555, metadata !556}
!552 = metadata !{i32 786689, metadata !548, metadata !"path", metadata !25, i32 16778478, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1262]
!553 = metadata !{i32 786689, metadata !548, metadata !"buf", metadata !25, i32 33555694, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1262]
!554 = metadata !{i32 786689, metadata !548, metadata !"bufsize", metadata !25, i32 50332910, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bufsize] [line 1262]
!555 = metadata !{i32 786688, metadata !548, metadata !"dfile", metadata !25, i32 1263, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1263]
!556 = metadata !{i32 786688, metadata !557, metadata !"r", metadata !25, i32 1279, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1279]
!557 = metadata !{i32 786443, metadata !1, metadata !558, i32 1278, i32 0, i32 306} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!558 = metadata !{i32 786443, metadata !1, metadata !548, i32 1264, i32 0, i32 297} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!559 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"select", metadata !"select", metadata !"", i32 1294, metadata !560, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*)* @select, null, null, metadata !573, i32 1295} ; [ DW_TAG_subprogram ] [line 1294] [def] [scope 1295] [select]
!560 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !561, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = metadata !{metadata !28, metadata !28, metadata !562, metadata !562, metadata !562, metadata !572}
!562 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !563} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from fd_set]
!563 = metadata !{i32 786454, metadata !1, null, metadata !"fd_set", i32 75, i64 0, i64 0, i64 0, i32 0, metadata !564} ; [ DW_TAG_typedef ] [fd_set] [line 75, size 0, align 0, offset 0] [from ]
!564 = metadata !{i32 786451, metadata !565, null, metadata !"", i32 64, i64 1024, i64 64, i32 0, i32 0, null, metadata !566, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 64, size 1024, align 64, offset 0] [def] [from ]
!565 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/select.h", metadata !"/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX"}
!566 = metadata !{metadata !567}
!567 = metadata !{i32 786445, metadata !565, metadata !564, metadata !"fds_bits", i32 69, i64 1024, i64 64, i64 0, i32 0, metadata !568} ; [ DW_TAG_member ] [fds_bits] [line 69, size 1024, align 64, offset 0] [from ]
!568 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !569, metadata !570, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from __fd_mask]
!569 = metadata !{i32 786454, metadata !565, null, metadata !"__fd_mask", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__fd_mask] [line 54, size 0, align 0, offset 0] [from long int]
!570 = metadata !{metadata !571}
!571 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!572 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from timeval]
!573 = metadata !{metadata !574, metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581, metadata !582, metadata !583, metadata !584, metadata !585, metadata !586, metadata !587, metadata !588, metadata !593, metadata !596, metadata !597}
!574 = metadata !{i32 786689, metadata !559, metadata !"nfds", metadata !25, i32 16778510, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nfds] [line 1294]
!575 = metadata !{i32 786689, metadata !559, metadata !"read", metadata !25, i32 33555726, metadata !562, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [read] [line 1294]
!576 = metadata !{i32 786689, metadata !559, metadata !"write", metadata !25, i32 50332942, metadata !562, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [write] [line 1294]
!577 = metadata !{i32 786689, metadata !559, metadata !"except", metadata !25, i32 67110159, metadata !562, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [except] [line 1295]
!578 = metadata !{i32 786689, metadata !559, metadata !"timeout", metadata !25, i32 83887375, metadata !572, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timeout] [line 1295]
!579 = metadata !{i32 786688, metadata !559, metadata !"in_read", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_read] [line 1296]
!580 = metadata !{i32 786688, metadata !559, metadata !"in_write", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_write] [line 1296]
!581 = metadata !{i32 786688, metadata !559, metadata !"in_except", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_except] [line 1296]
!582 = metadata !{i32 786688, metadata !559, metadata !"os_read", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_read] [line 1296]
!583 = metadata !{i32 786688, metadata !559, metadata !"os_write", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_write] [line 1296]
!584 = metadata !{i32 786688, metadata !559, metadata !"os_except", metadata !25, i32 1296, metadata !563, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_except] [line 1296]
!585 = metadata !{i32 786688, metadata !559, metadata !"i", metadata !25, i32 1297, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1297]
!586 = metadata !{i32 786688, metadata !559, metadata !"count", metadata !25, i32 1297, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 1297]
!587 = metadata !{i32 786688, metadata !559, metadata !"os_nfds", metadata !25, i32 1297, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_nfds] [line 1297]
!588 = metadata !{i32 786688, metadata !589, metadata !"f", metadata !25, i32 1327, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1327]
!589 = metadata !{i32 786443, metadata !1, metadata !590, i32 1326, i32 0, i32 320} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!590 = metadata !{i32 786443, metadata !1, metadata !591, i32 1326, i32 0, i32 319} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!591 = metadata !{i32 786443, metadata !1, metadata !592, i32 1325, i32 0, i32 318} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!592 = metadata !{i32 786443, metadata !1, metadata !559, i32 1325, i32 0, i32 317} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!593 = metadata !{i32 786688, metadata !594, metadata !"tv", metadata !25, i32 1349, metadata !137, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 1349]
!594 = metadata !{i32 786443, metadata !1, metadata !595, i32 1346, i32 0, i32 334} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!595 = metadata !{i32 786443, metadata !1, metadata !559, i32 1346, i32 0, i32 333} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!596 = metadata !{i32 786688, metadata !594, metadata !"r", metadata !25, i32 1350, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1350]
!597 = metadata !{i32 786688, metadata !598, metadata !"f", metadata !25, i32 1365, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1365]
!598 = metadata !{i32 786443, metadata !1, metadata !599, i32 1364, i32 0, i32 341} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!599 = metadata !{i32 786443, metadata !1, metadata !600, i32 1364, i32 0, i32 340} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!600 = metadata !{i32 786443, metadata !1, metadata !601, i32 1360, i32 0, i32 339} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!601 = metadata !{i32 786443, metadata !1, metadata !594, i32 1353, i32 0, i32 335} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!602 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"getcwd", metadata !"getcwd", metadata !"", i32 1380, metadata !603, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @getcwd, null, null, metadata !605, i32 1380} ; [ DW_TAG_subprogram ] [line 1380] [def] [getcwd]
!603 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !604, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!604 = metadata !{metadata !43, metadata !43, metadata !172}
!605 = metadata !{metadata !606, metadata !607, metadata !608}
!606 = metadata !{i32 786689, metadata !602, metadata !"buf", metadata !25, i32 16778596, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1380]
!607 = metadata !{i32 786689, metadata !602, metadata !"size", metadata !25, i32 33555812, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 1380]
!608 = metadata !{i32 786688, metadata !602, metadata !"r", metadata !25, i32 1382, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1382]
!609 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"chroot", metadata !"chroot", metadata !"", i32 1457, metadata !255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot, null, null, metadata !610, i32 1457} ; [ DW_TAG_subprogram ] [line 1457] [def] [chroot]
!610 = metadata !{metadata !611}
!611 = metadata !{i32 786689, metadata !609, metadata !"path", metadata !25, i32 16778673, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1457]
!612 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", i32 1428, metadata !613, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !615, i32 1428} ; [ DW_TAG_subprogram ] [line 1428] [local] [def] [__concretize_string]
!613 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !614, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!614 = metadata !{metadata !29, metadata !29}
!615 = metadata !{metadata !616, metadata !617, metadata !618, metadata !619, metadata !622}
!616 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!617 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!618 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!619 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!620 = metadata !{i32 786443, metadata !1, metadata !621, i32 1432, i32 0, i32 359} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!621 = metadata !{i32 786443, metadata !1, metadata !612, i32 1432, i32 0, i32 358} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!622 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!623 = metadata !{i32 786443, metadata !1, metadata !624, i32 1441, i32 0, i32 366} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!624 = metadata !{i32 786443, metadata !1, metadata !620, i32 1434, i32 0, i32 360} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!625 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", i32 1422, metadata !626, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !628, i32 1422} ; [ DW_TAG_subprogram ] [line 1422] [local] [def] [__concretize_size]
!626 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!627 = metadata !{metadata !172, metadata !172}
!628 = metadata !{metadata !629, metadata !630}
!629 = metadata !{i32 786689, metadata !625, metadata !"s", metadata !25, i32 16778638, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!630 = metadata !{i32 786688, metadata !625, metadata !"sc", metadata !25, i32 1423, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!631 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", i32 1415, metadata !632, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !634, i32 1415} ; [ DW_TAG_subprogram ] [line 1415] [local] [def] [__concretize_ptr]
!632 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !633, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!633 = metadata !{metadata !171, metadata !184}
!634 = metadata !{metadata !635, metadata !636}
!635 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!636 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!637 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__df_chown", metadata !"__df_chown", metadata !"", i32 707, metadata !638, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !640, i32 707} ; [ DW_TAG_subprogram ] [line 707] [local] [def] [__df_chown]
!638 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !639, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!639 = metadata !{metadata !28, metadata !36, metadata !292, metadata !293}
!640 = metadata !{metadata !641, metadata !642, metadata !643}
!641 = metadata !{i32 786689, metadata !637, metadata !"df", metadata !25, i32 16777923, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 707]
!642 = metadata !{i32 786689, metadata !637, metadata !"owner", metadata !25, i32 33555139, metadata !292, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!643 = metadata !{i32 786689, metadata !637, metadata !"group", metadata !25, i32 50332355, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 707]
!644 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", i32 645, metadata !645, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !647, i32 645} ; [ DW_TAG_subprogram ] [line 645] [local] [def] [__df_chmod]
!645 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !646, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!646 = metadata !{metadata !28, metadata !36, metadata !91}
!647 = metadata !{metadata !648, metadata !649}
!648 = metadata !{i32 786689, metadata !644, metadata !"df", metadata !25, i32 16777861, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 645]
!649 = metadata !{i32 786689, metadata !644, metadata !"mode", metadata !25, i32 33555077, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!650 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__get_file", metadata !"__get_file", metadata !"", i32 63, metadata !651, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !653, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_file]
!651 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !652, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!652 = metadata !{metadata !104, metadata !28}
!653 = metadata !{metadata !654, metadata !655}
!654 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!655 = metadata !{i32 786688, metadata !656, metadata !"f", metadata !25, i32 65, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 65]
!656 = metadata !{i32 786443, metadata !1, metadata !657, i32 64, i32 0, i32 373} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!657 = metadata !{i32 786443, metadata !1, metadata !650, i32 64, i32 0, i32 372} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!658 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"has_permission", metadata !"has_permission", metadata !"", i32 97, metadata !323, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !659, i32 97} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [has_permission]
!659 = metadata !{metadata !660, metadata !661, metadata !662, metadata !663, metadata !664}
!660 = metadata !{i32 786689, metadata !658, metadata !"flags", metadata !25, i32 16777313, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!661 = metadata !{i32 786689, metadata !658, metadata !"s", metadata !25, i32 33554529, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 97]
!662 = metadata !{i32 786688, metadata !658, metadata !"write_access", metadata !25, i32 98, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!663 = metadata !{i32 786688, metadata !658, metadata !"read_access", metadata !25, i32 98, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!664 = metadata !{i32 786688, metadata !658, metadata !"mode", metadata !25, i32 99, metadata !91, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!665 = metadata !{i32 786478, metadata !1, metadata !25, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", i32 39, metadata !666, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !668, i32 39} ; [ DW_TAG_subprogram ] [line 39] [local] [def] [__get_sym_file]
!666 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !667, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!667 = metadata !{metadata !36, metadata !29}
!668 = metadata !{metadata !669, metadata !670, metadata !671, metadata !672}
!669 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!670 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 40]
!671 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 41]
!672 = metadata !{i32 786688, metadata !673, metadata !"df", metadata !25, i32 48, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 48]
!673 = metadata !{i32 786443, metadata !1, metadata !674, i32 47, i32 0, i32 383} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!674 = metadata !{i32 786443, metadata !1, metadata !675, i32 47, i32 0, i32 382} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!675 = metadata !{i32 786443, metadata !1, metadata !676, i32 46, i32 0, i32 381} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!676 = metadata !{i32 786443, metadata !1, metadata !665, i32 46, i32 0, i32 380} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!677 = metadata !{metadata !678, metadata !679, metadata !680, metadata !681, metadata !682, metadata !683, metadata !684}
!678 = metadata !{i32 786484, i32 0, metadata !159, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 304, metadata !28, i32 1, i32 1, i32* @close.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 304] [local] [def]
!679 = metadata !{i32 786484, i32 0, metadata !166, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 336, metadata !28, i32 1, i32 1, i32* @read.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 336] [local] [def]
!680 = metadata !{i32 786484, i32 0, metadata !181, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 404, metadata !28, i32 1, i32 1, i32* @write.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 404] [local] [def]
!681 = metadata !{i32 786484, i32 0, metadata !269, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 659, metadata !28, i32 1, i32 1, i32* @chmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 659] [local] [def]
!682 = metadata !{i32 786484, i32 0, metadata !279, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 681, metadata !28, i32 1, i32 1, i32* @fchmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 681] [local] [def]
!683 = metadata !{i32 786484, i32 0, metadata !332, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 782, metadata !28, i32 1, i32 1, i32* @__fd_ftruncate.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 782] [local] [def]
!684 = metadata !{i32 786484, i32 0, metadata !602, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !25, i32 1381, metadata !28, i32 1, i32 1, i32* @getcwd.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 1381] [local] [def]
!685 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!686 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!687 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!688 = metadata !{i32 73, i32 0, metadata !24, null}
!689 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !690} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!690 = metadata !{i32 74, i32 0, metadata !24, null}
!691 = metadata !{i32 39, i32 0, metadata !665, metadata !690}
!692 = metadata !{i32 40, i32 0, metadata !665, metadata !690}
!693 = metadata !{metadata !694, metadata !694, i64 0}
!694 = metadata !{metadata !"omnipotent char", metadata !695, i64 0}
!695 = metadata !{metadata !"Simple C/C++ TBAA"}
!696 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !690} ; [ DW_TAG_auto_variable ] [c] [line 40]
!697 = metadata !{i32 43, i32 0, metadata !698, metadata !690}
!698 = metadata !{i32 786443, metadata !1, metadata !665, i32 43, i32 0, i32 379} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!699 = metadata !{i32 46, i32 0, metadata !676, metadata !690}
!700 = metadata !{metadata !701, metadata !702, i64 0}
!701 = metadata !{metadata !"", metadata !702, i64 0, metadata !703, i64 8, metadata !703, i64 16, metadata !702, i64 24, metadata !703, i64 32, metadata !702, i64 40, metadata !703, i64 48, metadata !703, i64 56, metadata !703, i64 64, metadata !703, i64 72, metadata !703, i64 80, metadata !703, i64 88, metadata !703, i64 96}
!702 = metadata !{metadata !"int", metadata !694, i64 0}
!703 = metadata !{metadata !"any pointer", metadata !694, i64 0}
!704 = metadata !{i32 47, i32 0, metadata !674, metadata !690}
!705 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !690} ; [ DW_TAG_auto_variable ] [i] [line 41]
!706 = metadata !{i32 48, i32 0, metadata !673, metadata !690}
!707 = metadata !{metadata !701, metadata !703, i64 32}
!708 = metadata !{i32 49, i32 0, metadata !709, metadata !690}
!709 = metadata !{i32 786443, metadata !1, metadata !673, i32 49, i32 0, i32 384} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!710 = metadata !{metadata !711, metadata !703, i64 16}
!711 = metadata !{metadata !"", metadata !702, i64 0, metadata !703, i64 8, metadata !703, i64 16}
!712 = metadata !{metadata !713, metadata !714, i64 8}
!713 = metadata !{metadata !"stat64", metadata !714, i64 0, metadata !714, i64 8, metadata !714, i64 16, metadata !702, i64 24, metadata !702, i64 28, metadata !702, i64 32, metadata !702, i64 36, metadata !714, i64 40, metadata !714, i64 48, metadata !714, i64 56, metadata !714, i64 64, metadata !715, i64 72, metadata !715, i64 88, metadata !715, i64 104, metadata !694, i64 120}
!714 = metadata !{metadata !"long", metadata !694, i64 0}
!715 = metadata !{metadata !"timespec", metadata !714, i64 0, metadata !714, i64 8}
!716 = metadata !{i32 76, i32 0, metadata !87, null}
!717 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !718} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!718 = metadata !{i32 81, i32 0, metadata !86, null}
!719 = metadata !{i32 1428, i32 0, metadata !612, metadata !718}
!720 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !721} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!721 = metadata !{i32 1429, i32 0, metadata !612, metadata !718}
!722 = metadata !{i32 1415, i32 0, metadata !631, metadata !721}
!723 = metadata !{i32 1417, i32 0, metadata !631, metadata !721}
!724 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !721} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!725 = metadata !{i32 1418, i32 0, metadata !631, metadata !721}
!726 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !718} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!727 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !718} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!728 = metadata !{i32 1432, i32 0, metadata !621, metadata !718}
!729 = metadata !{i32 1433, i32 0, metadata !620, metadata !718}
!730 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !718} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!731 = metadata !{i32 1434, i32 0, metadata !624, metadata !718}
!732 = metadata !{i32 1435, i32 0, metadata !733, metadata !718}
!733 = metadata !{i32 786443, metadata !1, metadata !734, i32 1435, i32 0, i32 362} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!734 = metadata !{i32 786443, metadata !1, metadata !624, i32 1434, i32 0, i32 361} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!735 = metadata !{i32 1436, i32 0, metadata !736, metadata !718}
!736 = metadata !{i32 786443, metadata !1, metadata !733, i32 1435, i32 0, i32 363} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!737 = metadata !{i32 1437, i32 0, metadata !736, metadata !718}
!738 = metadata !{i32 1439, i32 0, metadata !739, metadata !718}
!739 = metadata !{i32 786443, metadata !1, metadata !740, i32 1438, i32 0, i32 365} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!740 = metadata !{i32 786443, metadata !1, metadata !733, i32 1438, i32 0, i32 364} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!741 = metadata !{i32 1440, i32 0, metadata !739, metadata !718}
!742 = metadata !{i32 1442, i32 0, metadata !623, metadata !718}
!743 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !718} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!744 = metadata !{i32 1443, i32 0, metadata !623, metadata !718}
!745 = metadata !{i32 1444, i32 0, metadata !623, metadata !718}
!746 = metadata !{i32 1445, i32 0, metadata !747, metadata !718}
!747 = metadata !{i32 786443, metadata !1, metadata !623, i32 1445, i32 0, i32 367} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!748 = metadata !{i32 82, i32 0, metadata !749, null}
!749 = metadata !{i32 786443, metadata !1, metadata !86, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!750 = metadata !{i32 83, i32 0, metadata !749, null}
!751 = metadata !{metadata !702, metadata !702, i64 0}
!752 = metadata !{i32 86, i32 0, metadata !24, null}
!753 = metadata !{i32 88, i32 0, metadata !88, null}
!754 = metadata !{i32 89, i32 0, metadata !88, null}
!755 = metadata !{metadata !756, metadata !702, i64 768}
!756 = metadata !{metadata !"", metadata !694, i64 0, metadata !702, i64 768, metadata !702, i64 772, metadata !702, i64 776}
!757 = metadata !{i32 90, i32 0, metadata !88, null}
!758 = metadata !{i32 91, i32 0, metadata !88, null}
!759 = metadata !{i32 128, i32 0, metadata !95, null}
!760 = metadata !{i32 133, i32 0, metadata !761, null}
!761 = metadata !{i32 786443, metadata !1, metadata !95, i32 133, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!762 = metadata !{i32 134, i32 0, metadata !763, null}
!763 = metadata !{i32 786443, metadata !1, metadata !761, i32 134, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!764 = metadata !{metadata !765, metadata !702, i64 4}
!765 = metadata !{metadata !"", metadata !702, i64 0, metadata !702, i64 4, metadata !714, i64 8, metadata !703, i64 16}
!766 = metadata !{i32 136, i32 0, metadata !767, null}
!767 = metadata !{i32 786443, metadata !1, metadata !95, i32 136, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!768 = metadata !{i32 137, i32 0, metadata !769, null}
!769 = metadata !{i32 786443, metadata !1, metadata !767, i32 136, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!770 = metadata !{i32 138, i32 0, metadata !769, null}
!771 = metadata !{i32 141, i32 0, metadata !95, null}
!772 = metadata !{i32 144, i32 0, metadata !95, null}
!773 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !774} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!774 = metadata !{i32 146, i32 0, metadata !95, null}
!775 = metadata !{i32 39, i32 0, metadata !665, metadata !774}
!776 = metadata !{i32 40, i32 0, metadata !665, metadata !774}
!777 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !774} ; [ DW_TAG_auto_variable ] [c] [line 40]
!778 = metadata !{i32 43, i32 0, metadata !698, metadata !774}
!779 = metadata !{i32 46, i32 0, metadata !676, metadata !774}
!780 = metadata !{i32 47, i32 0, metadata !674, metadata !774}
!781 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !774} ; [ DW_TAG_auto_variable ] [i] [line 41]
!782 = metadata !{i32 48, i32 0, metadata !673, metadata !774}
!783 = metadata !{i32 49, i32 0, metadata !709, metadata !774}
!784 = metadata !{i32 147, i32 0, metadata !117, null}
!785 = metadata !{i32 150, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !1, metadata !117, i32 147, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!787 = metadata !{metadata !765, metadata !703, i64 16}
!788 = metadata !{i32 152, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !1, metadata !786, i32 152, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!790 = metadata !{i32 153, i32 0, metadata !791, null}
!791 = metadata !{i32 786443, metadata !1, metadata !789, i32 152, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!792 = metadata !{i32 154, i32 0, metadata !791, null}
!793 = metadata !{i32 168, i32 0, metadata !794, null}
!794 = metadata !{i32 786443, metadata !1, metadata !795, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!795 = metadata !{i32 786443, metadata !1, metadata !786, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!796 = metadata !{i32 169, i32 0, metadata !794, null}
!797 = metadata !{i32 170, i32 0, metadata !794, null}
!798 = metadata !{i32 786689, metadata !658, metadata !"flags", metadata !25, i32 16777313, metadata !28, i32 0, metadata !799} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!799 = metadata !{i32 173, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !1, metadata !786, i32 173, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!801 = metadata !{i32 97, i32 0, metadata !658, metadata !799}
!802 = metadata !{i32 786689, metadata !658, metadata !"s", metadata !25, i32 33554529, metadata !45, i32 0, metadata !799} ; [ DW_TAG_arg_variable ] [s] [line 97]
!803 = metadata !{i32 99, i32 0, metadata !658, metadata !799}
!804 = metadata !{metadata !713, metadata !702, i64 24}
!805 = metadata !{i32 786688, metadata !658, metadata !"mode", metadata !25, i32 99, metadata !91, i32 0, metadata !799} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!806 = metadata !{i32 101, i32 0, metadata !807, metadata !799}
!807 = metadata !{i32 786443, metadata !1, metadata !658, i32 101, i32 0, i32 375} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!808 = metadata !{i32 786688, metadata !658, metadata !"read_access", metadata !25, i32 98, metadata !28, i32 0, metadata !799} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!809 = metadata !{i32 103, i32 0, metadata !807, metadata !799}
!810 = metadata !{i32 786688, metadata !658, metadata !"write_access", metadata !25, i32 98, metadata !28, i32 0, metadata !799} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!811 = metadata !{i32 107, i32 0, metadata !812, metadata !799}
!812 = metadata !{i32 786443, metadata !1, metadata !658, i32 105, i32 0, i32 376} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!813 = metadata !{i32 118, i32 0, metadata !814, metadata !799}
!814 = metadata !{i32 786443, metadata !1, metadata !658, i32 118, i32 0, i32 377} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!815 = metadata !{i32 105, i32 0, metadata !812, metadata !799}
!816 = metadata !{i32 121, i32 0, metadata !817, metadata !799}
!817 = metadata !{i32 786443, metadata !1, metadata !658, i32 121, i32 0, i32 378} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!818 = metadata !{i32 174, i32 0, metadata !819, null}
!819 = metadata !{i32 786443, metadata !1, metadata !800, i32 173, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!820 = metadata !{i32 175, i32 0, metadata !819, null}
!821 = metadata !{i32 178, i32 0, metadata !800, null}
!822 = metadata !{i32 180, i32 0, metadata !786, null}
!823 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !824} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!824 = metadata !{i32 181, i32 0, metadata !116, null}
!825 = metadata !{i32 1428, i32 0, metadata !612, metadata !824}
!826 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !827} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!827 = metadata !{i32 1429, i32 0, metadata !612, metadata !824}
!828 = metadata !{i32 1415, i32 0, metadata !631, metadata !827}
!829 = metadata !{i32 1417, i32 0, metadata !631, metadata !827}
!830 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !827} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!831 = metadata !{i32 1418, i32 0, metadata !631, metadata !827}
!832 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !824} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!833 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !824} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!834 = metadata !{i32 1432, i32 0, metadata !621, metadata !824}
!835 = metadata !{i32 1433, i32 0, metadata !620, metadata !824}
!836 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !824} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!837 = metadata !{i32 1434, i32 0, metadata !624, metadata !824}
!838 = metadata !{i32 1435, i32 0, metadata !733, metadata !824}
!839 = metadata !{i32 1436, i32 0, metadata !736, metadata !824}
!840 = metadata !{i32 1437, i32 0, metadata !736, metadata !824}
!841 = metadata !{i32 1439, i32 0, metadata !739, metadata !824}
!842 = metadata !{i32 1440, i32 0, metadata !739, metadata !824}
!843 = metadata !{i32 1442, i32 0, metadata !623, metadata !824}
!844 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !824} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!845 = metadata !{i32 1443, i32 0, metadata !623, metadata !824}
!846 = metadata !{i32 1444, i32 0, metadata !623, metadata !824}
!847 = metadata !{i32 1445, i32 0, metadata !747, metadata !824}
!848 = metadata !{i32 182, i32 0, metadata !849, null}
!849 = metadata !{i32 786443, metadata !1, metadata !116, i32 182, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!850 = metadata !{i32 183, i32 0, metadata !851, null}
!851 = metadata !{i32 786443, metadata !1, metadata !849, i32 182, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!852 = metadata !{i32 184, i32 0, metadata !851, null}
!853 = metadata !{i32 186, i32 0, metadata !116, null}
!854 = metadata !{metadata !765, metadata !702, i64 0}
!855 = metadata !{i32 190, i32 0, metadata !856, null}
!856 = metadata !{i32 786443, metadata !1, metadata !95, i32 190, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!857 = metadata !{i32 189, i32 0, metadata !95, null}
!858 = metadata !{i32 191, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !1, metadata !856, i32 190, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!860 = metadata !{i32 192, i32 0, metadata !859, null}
!861 = metadata !{i32 193, i32 0, metadata !862, null}
!862 = metadata !{i32 786443, metadata !1, metadata !863, i32 192, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!863 = metadata !{i32 786443, metadata !1, metadata !856, i32 192, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!864 = metadata !{i32 194, i32 0, metadata !862, null}
!865 = metadata !{i32 195, i32 0, metadata !866, null}
!866 = metadata !{i32 786443, metadata !1, metadata !863, i32 194, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!867 = metadata !{i32 199, i32 0, metadata !95, null}
!868 = metadata !{i32 201, i32 0, metadata !118, null}
!869 = metadata !{i32 204, i32 0, metadata !130, null}
!870 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !871} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!871 = metadata !{i32 205, i32 0, metadata !129, null}
!872 = metadata !{i32 63, i32 0, metadata !650, metadata !871}
!873 = metadata !{i32 64, i32 0, metadata !657, metadata !871}
!874 = metadata !{i32 65, i32 0, metadata !656, metadata !871}
!875 = metadata !{i32 66, i32 0, metadata !876, metadata !871}
!876 = metadata !{i32 786443, metadata !1, metadata !656, i32 66, i32 0, i32 374} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!877 = metadata !{i32 207, i32 0, metadata !878, null}
!878 = metadata !{i32 786443, metadata !1, metadata !129, i32 207, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!879 = metadata !{i32 208, i32 0, metadata !880, null}
!880 = metadata !{i32 786443, metadata !1, metadata !878, i32 207, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!881 = metadata !{i32 209, i32 0, metadata !880, null}
!882 = metadata !{i32 210, i32 0, metadata !883, null}
!883 = metadata !{i32 786443, metadata !1, metadata !878, i32 210, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!884 = metadata !{i32 211, i32 0, metadata !885, null}
!885 = metadata !{i32 786443, metadata !1, metadata !883, i32 210, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!886 = metadata !{i32 212, i32 0, metadata !885, null}
!887 = metadata !{i32 213, i32 0, metadata !885, null}
!888 = metadata !{i32 215, i32 0, metadata !129, null}
!889 = metadata !{i32 216, i32 0, metadata !129, null}
!890 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !891} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!891 = metadata !{i32 218, i32 0, metadata !892, null}
!892 = metadata !{i32 786443, metadata !1, metadata !118, i32 218, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!893 = metadata !{i32 39, i32 0, metadata !665, metadata !891}
!894 = metadata !{i32 40, i32 0, metadata !665, metadata !891}
!895 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !891} ; [ DW_TAG_auto_variable ] [c] [line 40]
!896 = metadata !{i32 43, i32 0, metadata !698, metadata !891}
!897 = metadata !{i32 46, i32 0, metadata !676, metadata !891}
!898 = metadata !{i32 47, i32 0, metadata !674, metadata !891}
!899 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !891} ; [ DW_TAG_auto_variable ] [i] [line 41]
!900 = metadata !{i32 48, i32 0, metadata !673, metadata !891}
!901 = metadata !{i32 49, i32 0, metadata !709, metadata !891}
!902 = metadata !{i32 220, i32 0, metadata !903, null}
!903 = metadata !{i32 786443, metadata !1, metadata !892, i32 218, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!904 = metadata !{i32 223, i32 0, metadata !905, null}
!905 = metadata !{i32 786443, metadata !1, metadata !118, i32 223, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!906 = metadata !{i32 224, i32 0, metadata !907, null}
!907 = metadata !{i32 786443, metadata !1, metadata !905, i32 224, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!908 = metadata !{i32 226, i32 0, metadata !909, null}
!909 = metadata !{i32 786443, metadata !1, metadata !118, i32 226, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!910 = metadata !{i32 227, i32 0, metadata !911, null}
!911 = metadata !{i32 786443, metadata !1, metadata !909, i32 226, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!912 = metadata !{i32 228, i32 0, metadata !911, null}
!913 = metadata !{i32 231, i32 0, metadata !118, null}
!914 = metadata !{i32 234, i32 0, metadata !118, null}
!915 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !916} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!916 = metadata !{i32 236, i32 0, metadata !118, null}
!917 = metadata !{i32 1428, i32 0, metadata !612, metadata !916}
!918 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !919} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!919 = metadata !{i32 1429, i32 0, metadata !612, metadata !916}
!920 = metadata !{i32 1415, i32 0, metadata !631, metadata !919}
!921 = metadata !{i32 1417, i32 0, metadata !631, metadata !919}
!922 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !919} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!923 = metadata !{i32 1418, i32 0, metadata !631, metadata !919}
!924 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !916} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!925 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !916} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!926 = metadata !{i32 1432, i32 0, metadata !621, metadata !916}
!927 = metadata !{i32 1433, i32 0, metadata !620, metadata !916}
!928 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !916} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!929 = metadata !{i32 1434, i32 0, metadata !624, metadata !916}
!930 = metadata !{i32 1435, i32 0, metadata !733, metadata !916}
!931 = metadata !{i32 1436, i32 0, metadata !736, metadata !916}
!932 = metadata !{i32 1437, i32 0, metadata !736, metadata !916}
!933 = metadata !{i32 1439, i32 0, metadata !739, metadata !916}
!934 = metadata !{i32 1440, i32 0, metadata !739, metadata !916}
!935 = metadata !{i32 1442, i32 0, metadata !623, metadata !916}
!936 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !916} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!937 = metadata !{i32 1443, i32 0, metadata !623, metadata !916}
!938 = metadata !{i32 1444, i32 0, metadata !623, metadata !916}
!939 = metadata !{i32 1445, i32 0, metadata !747, metadata !916}
!940 = metadata !{i32 237, i32 0, metadata !941, null}
!941 = metadata !{i32 786443, metadata !1, metadata !118, i32 237, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!942 = metadata !{i32 238, i32 0, metadata !943, null}
!943 = metadata !{i32 786443, metadata !1, metadata !941, i32 237, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!944 = metadata !{i32 239, i32 0, metadata !943, null}
!945 = metadata !{i32 242, i32 0, metadata !118, null}
!946 = metadata !{i32 243, i32 0, metadata !118, null}
!947 = metadata !{i32 244, i32 0, metadata !948, null}
!948 = metadata !{i32 786443, metadata !1, metadata !118, i32 244, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!949 = metadata !{i32 245, i32 0, metadata !950, null}
!950 = metadata !{i32 786443, metadata !1, metadata !948, i32 244, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!951 = metadata !{i32 246, i32 0, metadata !950, null}
!952 = metadata !{i32 247, i32 0, metadata !953, null}
!953 = metadata !{i32 786443, metadata !1, metadata !954, i32 246, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!954 = metadata !{i32 786443, metadata !1, metadata !948, i32 246, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!955 = metadata !{i32 248, i32 0, metadata !953, null}
!956 = metadata !{i32 249, i32 0, metadata !957, null}
!957 = metadata !{i32 786443, metadata !1, metadata !954, i32 248, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!958 = metadata !{i32 253, i32 0, metadata !118, null}
!959 = metadata !{i32 256, i32 0, metadata !132, null}
!960 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !961} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!961 = metadata !{i32 257, i32 0, metadata !132, null}
!962 = metadata !{i32 39, i32 0, metadata !665, metadata !961}
!963 = metadata !{i32 40, i32 0, metadata !665, metadata !961}
!964 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !961} ; [ DW_TAG_auto_variable ] [c] [line 40]
!965 = metadata !{i32 43, i32 0, metadata !698, metadata !961}
!966 = metadata !{i32 46, i32 0, metadata !676, metadata !961}
!967 = metadata !{i32 47, i32 0, metadata !674, metadata !961}
!968 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !961} ; [ DW_TAG_auto_variable ] [i] [line 41]
!969 = metadata !{i32 48, i32 0, metadata !673, metadata !961}
!970 = metadata !{i32 49, i32 0, metadata !709, metadata !961}
!971 = metadata !{i32 259, i32 0, metadata !972, null}
!972 = metadata !{i32 786443, metadata !1, metadata !132, i32 259, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!973 = metadata !{i32 261, i32 0, metadata !974, null}
!974 = metadata !{i32 786443, metadata !1, metadata !972, i32 259, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!975 = metadata !{metadata !976, metadata !714, i64 0}
!976 = metadata !{metadata !"timeval", metadata !714, i64 0, metadata !714, i64 8}
!977 = metadata !{metadata !713, metadata !714, i64 72}
!978 = metadata !{i32 262, i32 0, metadata !974, null}
!979 = metadata !{metadata !713, metadata !714, i64 88}
!980 = metadata !{i32 264, i32 0, metadata !974, null}
!981 = metadata !{metadata !713, metadata !714, i64 80}
!982 = metadata !{i32 265, i32 0, metadata !974, null}
!983 = metadata !{metadata !713, metadata !714, i64 96}
!984 = metadata !{i32 267, i32 0, metadata !974, null}
!985 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !986} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!986 = metadata !{i32 269, i32 0, metadata !132, null}
!987 = metadata !{i32 1428, i32 0, metadata !612, metadata !986}
!988 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !989} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!989 = metadata !{i32 1429, i32 0, metadata !612, metadata !986}
!990 = metadata !{i32 1415, i32 0, metadata !631, metadata !989}
!991 = metadata !{i32 1417, i32 0, metadata !631, metadata !989}
!992 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !989} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!993 = metadata !{i32 1418, i32 0, metadata !631, metadata !989}
!994 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !986} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!995 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !986} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!996 = metadata !{i32 1432, i32 0, metadata !621, metadata !986}
!997 = metadata !{i32 1433, i32 0, metadata !620, metadata !986}
!998 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !986} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!999 = metadata !{i32 1434, i32 0, metadata !624, metadata !986}
!1000 = metadata !{i32 1435, i32 0, metadata !733, metadata !986}
!1001 = metadata !{i32 1436, i32 0, metadata !736, metadata !986}
!1002 = metadata !{i32 1437, i32 0, metadata !736, metadata !986}
!1003 = metadata !{i32 1439, i32 0, metadata !739, metadata !986}
!1004 = metadata !{i32 1440, i32 0, metadata !739, metadata !986}
!1005 = metadata !{i32 1442, i32 0, metadata !623, metadata !986}
!1006 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !986} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1007 = metadata !{i32 1443, i32 0, metadata !623, metadata !986}
!1008 = metadata !{i32 1444, i32 0, metadata !623, metadata !986}
!1009 = metadata !{i32 1445, i32 0, metadata !747, metadata !986}
!1010 = metadata !{i32 270, i32 0, metadata !1011, null}
!1011 = metadata !{i32 786443, metadata !1, metadata !132, i32 270, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1012 = metadata !{i32 271, i32 0, metadata !1011, null}
!1013 = metadata !{i32 274, i32 0, metadata !132, null}
!1014 = metadata !{i32 277, i32 0, metadata !148, null}
!1015 = metadata !{i32 278, i32 0, metadata !157, null}
!1016 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1017} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1017 = metadata !{i32 279, i32 0, metadata !156, null}
!1018 = metadata !{i32 63, i32 0, metadata !650, metadata !1017}
!1019 = metadata !{i32 64, i32 0, metadata !657, metadata !1017}
!1020 = metadata !{i32 65, i32 0, metadata !656, metadata !1017}
!1021 = metadata !{i32 66, i32 0, metadata !876, metadata !1017}
!1022 = metadata !{i32 281, i32 0, metadata !1023, null}
!1023 = metadata !{i32 786443, metadata !1, metadata !156, i32 281, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1024 = metadata !{i32 282, i32 0, metadata !1025, null}
!1025 = metadata !{i32 786443, metadata !1, metadata !1023, i32 281, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1026 = metadata !{i32 283, i32 0, metadata !1025, null}
!1027 = metadata !{i32 284, i32 0, metadata !1028, null}
!1028 = metadata !{i32 786443, metadata !1, metadata !1023, i32 284, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1029 = metadata !{i32 285, i32 0, metadata !1030, null}
!1030 = metadata !{i32 786443, metadata !1, metadata !1028, i32 284, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1031 = metadata !{i32 286, i32 0, metadata !1030, null}
!1032 = metadata !{i32 287, i32 0, metadata !1030, null}
!1033 = metadata !{i32 289, i32 0, metadata !156, null}
!1034 = metadata !{i32 290, i32 0, metadata !156, null}
!1035 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1036} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1036 = metadata !{i32 291, i32 0, metadata !1037, null}
!1037 = metadata !{i32 786443, metadata !1, metadata !148, i32 291, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1038 = metadata !{i32 39, i32 0, metadata !665, metadata !1036}
!1039 = metadata !{i32 40, i32 0, metadata !665, metadata !1036}
!1040 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1036} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1041 = metadata !{i32 43, i32 0, metadata !698, metadata !1036}
!1042 = metadata !{i32 46, i32 0, metadata !676, metadata !1036}
!1043 = metadata !{i32 47, i32 0, metadata !674, metadata !1036}
!1044 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1036} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1045 = metadata !{i32 48, i32 0, metadata !673, metadata !1036}
!1046 = metadata !{i32 49, i32 0, metadata !709, metadata !1036}
!1047 = metadata !{i32 292, i32 0, metadata !1048, null}
!1048 = metadata !{i32 786443, metadata !1, metadata !1037, i32 291, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1049 = metadata !{i32 295, i32 0, metadata !148, null}
!1050 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1051} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1051 = metadata !{i32 296, i32 0, metadata !148, null}
!1052 = metadata !{i32 1428, i32 0, metadata !612, metadata !1051}
!1053 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1054} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1054 = metadata !{i32 1429, i32 0, metadata !612, metadata !1051}
!1055 = metadata !{i32 1415, i32 0, metadata !631, metadata !1054}
!1056 = metadata !{i32 1417, i32 0, metadata !631, metadata !1054}
!1057 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1054} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1058 = metadata !{i32 1418, i32 0, metadata !631, metadata !1054}
!1059 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1051} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1060 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1051} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1061 = metadata !{i32 1432, i32 0, metadata !621, metadata !1051}
!1062 = metadata !{i32 1433, i32 0, metadata !620, metadata !1051}
!1063 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1051} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1064 = metadata !{i32 1434, i32 0, metadata !624, metadata !1051}
!1065 = metadata !{i32 1435, i32 0, metadata !733, metadata !1051}
!1066 = metadata !{i32 1436, i32 0, metadata !736, metadata !1051}
!1067 = metadata !{i32 1437, i32 0, metadata !736, metadata !1051}
!1068 = metadata !{i32 1439, i32 0, metadata !739, metadata !1051}
!1069 = metadata !{i32 1440, i32 0, metadata !739, metadata !1051}
!1070 = metadata !{i32 1442, i32 0, metadata !623, metadata !1051}
!1071 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1051} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1072 = metadata !{i32 1443, i32 0, metadata !623, metadata !1051}
!1073 = metadata !{i32 1444, i32 0, metadata !623, metadata !1051}
!1074 = metadata !{i32 1445, i32 0, metadata !747, metadata !1051}
!1075 = metadata !{i32 298, i32 0, metadata !1076, null}
!1076 = metadata !{i32 786443, metadata !1, metadata !148, i32 298, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1077 = metadata !{i32 299, i32 0, metadata !1076, null}
!1078 = metadata !{i32 301, i32 0, metadata !148, null}
!1079 = metadata !{i32 303, i32 0, metadata !159, null}
!1080 = metadata !{i32 306, i32 0, metadata !159, null}
!1081 = metadata !{i32 308, i32 0, metadata !159, null}
!1082 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1083} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1083 = metadata !{i32 310, i32 0, metadata !159, null}
!1084 = metadata !{i32 63, i32 0, metadata !650, metadata !1083}
!1085 = metadata !{i32 64, i32 0, metadata !657, metadata !1083}
!1086 = metadata !{i32 65, i32 0, metadata !656, metadata !1083}
!1087 = metadata !{i32 66, i32 0, metadata !876, metadata !1083}
!1088 = metadata !{i32 311, i32 0, metadata !1089, null}
!1089 = metadata !{i32 786443, metadata !1, metadata !159, i32 311, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1090 = metadata !{i32 312, i32 0, metadata !1091, null}
!1091 = metadata !{i32 786443, metadata !1, metadata !1089, i32 311, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1092 = metadata !{i32 313, i32 0, metadata !1091, null}
!1093 = metadata !{i32 316, i32 0, metadata !1094, null}
!1094 = metadata !{i32 786443, metadata !1, metadata !159, i32 316, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1095 = metadata !{metadata !701, metadata !702, i64 40}
!1096 = metadata !{metadata !701, metadata !703, i64 64}
!1097 = metadata !{i32 317, i32 0, metadata !1098, null}
!1098 = metadata !{i32 786443, metadata !1, metadata !1094, i32 316, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1099 = metadata !{i32 318, i32 0, metadata !1098, null}
!1100 = metadata !{i32 319, i32 0, metadata !1098, null}
!1101 = metadata !{i32 330, i32 0, metadata !159, null}
!1102 = metadata !{i32 332, i32 0, metadata !159, null}
!1103 = metadata !{i32 333, i32 0, metadata !159, null}
!1104 = metadata !{i32 335, i32 0, metadata !166, null}
!1105 = metadata !{i32 339, i32 0, metadata !166, null}
!1106 = metadata !{i32 341, i32 0, metadata !1107, null}
!1107 = metadata !{i32 786443, metadata !1, metadata !166, i32 341, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1108 = metadata !{i32 344, i32 0, metadata !1109, null}
!1109 = metadata !{i32 786443, metadata !1, metadata !166, i32 344, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1110 = metadata !{i32 345, i32 0, metadata !1111, null}
!1111 = metadata !{i32 786443, metadata !1, metadata !1109, i32 344, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1112 = metadata !{i32 346, i32 0, metadata !1111, null}
!1113 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1114} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1114 = metadata !{i32 349, i32 0, metadata !166, null}
!1115 = metadata !{i32 63, i32 0, metadata !650, metadata !1114}
!1116 = metadata !{i32 64, i32 0, metadata !657, metadata !1114}
!1117 = metadata !{i32 65, i32 0, metadata !656, metadata !1114}
!1118 = metadata !{i32 66, i32 0, metadata !876, metadata !1114}
!1119 = metadata !{i32 351, i32 0, metadata !1120, null}
!1120 = metadata !{i32 786443, metadata !1, metadata !166, i32 351, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1121 = metadata !{i32 352, i32 0, metadata !1122, null}
!1122 = metadata !{i32 786443, metadata !1, metadata !1120, i32 351, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1123 = metadata !{i32 353, i32 0, metadata !1122, null}
!1124 = metadata !{i32 356, i32 0, metadata !1125, null}
!1125 = metadata !{i32 786443, metadata !1, metadata !166, i32 356, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1126 = metadata !{metadata !701, metadata !703, i64 48}
!1127 = metadata !{i32 357, i32 0, metadata !1128, null}
!1128 = metadata !{i32 786443, metadata !1, metadata !1125, i32 356, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1129 = metadata !{i32 358, i32 0, metadata !1128, null}
!1130 = metadata !{i32 359, i32 0, metadata !1128, null}
!1131 = metadata !{i32 362, i32 0, metadata !180, null}
!1132 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1133} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1133 = metadata !{i32 365, i32 0, metadata !179, null}
!1134 = metadata !{i32 1415, i32 0, metadata !631, metadata !1133}
!1135 = metadata !{i32 1417, i32 0, metadata !631, metadata !1133}
!1136 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1133} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1137 = metadata !{i32 1418, i32 0, metadata !631, metadata !1133}
!1138 = metadata !{i32 786689, metadata !625, metadata !"s", metadata !25, i32 16778638, metadata !172, i32 0, metadata !1139} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1139 = metadata !{i32 366, i32 0, metadata !179, null}
!1140 = metadata !{i32 1422, i32 0, metadata !625, metadata !1139}
!1141 = metadata !{i32 1423, i32 0, metadata !625, metadata !1139}
!1142 = metadata !{i32 786688, metadata !625, metadata !"sc", metadata !25, i32 1423, metadata !172, i32 0, metadata !1139} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1143 = metadata !{i32 1424, i32 0, metadata !625, metadata !1139}
!1144 = metadata !{i32 370, i32 0, metadata !179, null}
!1145 = metadata !{i32 371, i32 0, metadata !1146, null}
!1146 = metadata !{i32 786443, metadata !1, metadata !179, i32 371, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1147 = metadata !{i32 372, i32 0, metadata !1146, null}
!1148 = metadata !{i32 374, i32 0, metadata !1146, null}
!1149 = metadata !{metadata !765, metadata !714, i64 8}
!1150 = metadata !{i32 376, i32 0, metadata !1151, null}
!1151 = metadata !{i32 786443, metadata !1, metadata !179, i32 376, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1152 = metadata !{i32 377, i32 0, metadata !1153, null}
!1153 = metadata !{i32 786443, metadata !1, metadata !1151, i32 376, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1154 = metadata !{i32 378, i32 0, metadata !1153, null}
!1155 = metadata !{i32 381, i32 0, metadata !1156, null}
!1156 = metadata !{i32 786443, metadata !1, metadata !179, i32 381, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1157 = metadata !{i32 383, i32 0, metadata !179, null}
!1158 = metadata !{i32 382, i32 0, metadata !1156, null}
!1159 = metadata !{i32 386, i32 0, metadata !1160, null}
!1160 = metadata !{i32 786443, metadata !1, metadata !180, i32 385, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1161 = metadata !{i32 387, i32 0, metadata !1162, null}
!1162 = metadata !{i32 786443, metadata !1, metadata !1160, i32 387, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1163 = metadata !{metadata !711, metadata !702, i64 0}
!1164 = metadata !{i32 391, i32 0, metadata !1165, null}
!1165 = metadata !{i32 786443, metadata !1, metadata !1160, i32 391, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1166 = metadata !{i32 392, i32 0, metadata !1167, null}
!1167 = metadata !{i32 786443, metadata !1, metadata !1165, i32 391, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1168 = metadata !{i32 395, i32 0, metadata !1160, null}
!1169 = metadata !{metadata !711, metadata !703, i64 8}
!1170 = metadata !{i32 396, i32 0, metadata !1160, null}
!1171 = metadata !{i32 398, i32 0, metadata !1160, null}
!1172 = metadata !{i32 400, i32 0, metadata !166, null}
!1173 = metadata !{i32 403, i32 0, metadata !181, null}
!1174 = metadata !{i32 407, i32 0, metadata !181, null}
!1175 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1176} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1176 = metadata !{i32 409, i32 0, metadata !181, null}
!1177 = metadata !{i32 63, i32 0, metadata !650, metadata !1176}
!1178 = metadata !{i32 64, i32 0, metadata !657, metadata !1176}
!1179 = metadata !{i32 65, i32 0, metadata !656, metadata !1176}
!1180 = metadata !{i32 66, i32 0, metadata !876, metadata !1176}
!1181 = metadata !{i32 411, i32 0, metadata !1182, null}
!1182 = metadata !{i32 786443, metadata !1, metadata !181, i32 411, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1183 = metadata !{i32 412, i32 0, metadata !1184, null}
!1184 = metadata !{i32 786443, metadata !1, metadata !1182, i32 411, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1185 = metadata !{i32 413, i32 0, metadata !1184, null}
!1186 = metadata !{i32 416, i32 0, metadata !1187, null}
!1187 = metadata !{i32 786443, metadata !1, metadata !181, i32 416, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1188 = metadata !{metadata !701, metadata !703, i64 56}
!1189 = metadata !{i32 417, i32 0, metadata !1190, null}
!1190 = metadata !{i32 786443, metadata !1, metadata !1187, i32 416, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1191 = metadata !{i32 418, i32 0, metadata !1190, null}
!1192 = metadata !{i32 419, i32 0, metadata !1190, null}
!1193 = metadata !{i32 422, i32 0, metadata !193, null}
!1194 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1195} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1195 = metadata !{i32 425, i32 0, metadata !192, null}
!1196 = metadata !{i32 1415, i32 0, metadata !631, metadata !1195}
!1197 = metadata !{i32 1417, i32 0, metadata !631, metadata !1195}
!1198 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1195} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1199 = metadata !{i32 1418, i32 0, metadata !631, metadata !1195}
!1200 = metadata !{i32 786689, metadata !625, metadata !"s", metadata !25, i32 16778638, metadata !172, i32 0, metadata !1201} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1201 = metadata !{i32 426, i32 0, metadata !192, null}
!1202 = metadata !{i32 1422, i32 0, metadata !625, metadata !1201}
!1203 = metadata !{i32 1423, i32 0, metadata !625, metadata !1201}
!1204 = metadata !{i32 786688, metadata !625, metadata !"sc", metadata !25, i32 1423, metadata !172, i32 0, metadata !1201} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1205 = metadata !{i32 1424, i32 0, metadata !625, metadata !1201}
!1206 = metadata !{i32 430, i32 0, metadata !192, null}
!1207 = metadata !{i32 431, i32 0, metadata !1208, null}
!1208 = metadata !{i32 786443, metadata !1, metadata !192, i32 431, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1209 = metadata !{i32 432, i32 0, metadata !1208, null}
!1210 = metadata !{i32 433, i32 0, metadata !1208, null}
!1211 = metadata !{i32 435, i32 0, metadata !1212, null}
!1212 = metadata !{i32 786443, metadata !1, metadata !192, i32 435, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1213 = metadata !{i32 436, i32 0, metadata !1214, null}
!1214 = metadata !{i32 786443, metadata !1, metadata !1212, i32 435, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1215 = metadata !{i32 437, i32 0, metadata !1214, null}
!1216 = metadata !{i32 440, i32 0, metadata !192, null}
!1217 = metadata !{i32 441, i32 0, metadata !1218, null}
!1218 = metadata !{i32 786443, metadata !1, metadata !192, i32 441, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1219 = metadata !{i32 444, i32 0, metadata !192, null}
!1220 = metadata !{i32 442, i32 0, metadata !1218, null}
!1221 = metadata !{i64 0}
!1222 = metadata !{i32 448, i32 0, metadata !195, null}
!1223 = metadata !{i32 449, i32 0, metadata !1224, null}
!1224 = metadata !{i32 786443, metadata !1, metadata !195, i32 449, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1225 = metadata !{i32 452, i32 0, metadata !1226, null}
!1226 = metadata !{i32 786443, metadata !1, metadata !1227, i32 452, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1227 = metadata !{i32 786443, metadata !1, metadata !1224, i32 451, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1228 = metadata !{metadata !756, metadata !702, i64 776}
!1229 = metadata !{i32 453, i32 0, metadata !1226, null}
!1230 = metadata !{i32 455, i32 0, metadata !1231, null}
!1231 = metadata !{i32 786443, metadata !1, metadata !1232, i32 455, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1232 = metadata !{i32 786443, metadata !1, metadata !1226, i32 454, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1233 = metadata !{i32 456, i32 0, metadata !1231, null}
!1234 = metadata !{i32 460, i32 0, metadata !1235, null}
!1235 = metadata !{i32 786443, metadata !1, metadata !195, i32 460, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1236 = metadata !{i32 461, i32 0, metadata !1235, null}
!1237 = metadata !{i32 463, i32 0, metadata !1238, null}
!1238 = metadata !{i32 786443, metadata !1, metadata !195, i32 463, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1239 = metadata !{i32 464, i32 0, metadata !1238, null}
!1240 = metadata !{i32 466, i32 0, metadata !1241, null}
!1241 = metadata !{i32 786443, metadata !1, metadata !195, i32 466, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1242 = metadata !{metadata !701, metadata !703, i64 16}
!1243 = metadata !{i32 467, i32 0, metadata !1241, null}
!1244 = metadata !{metadata !701, metadata !702, i64 24}
!1245 = metadata !{i32 469, i32 0, metadata !195, null}
!1246 = metadata !{i32 470, i32 0, metadata !195, null}
!1247 = metadata !{i32 472, i32 0, metadata !181, null}
!1248 = metadata !{i32 475, i32 0, metadata !196, null}
!1249 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1250} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1250 = metadata !{i32 477, i32 0, metadata !196, null}
!1251 = metadata !{i32 63, i32 0, metadata !650, metadata !1250}
!1252 = metadata !{i32 64, i32 0, metadata !657, metadata !1250}
!1253 = metadata !{i32 65, i32 0, metadata !656, metadata !1250}
!1254 = metadata !{i32 66, i32 0, metadata !876, metadata !1250}
!1255 = metadata !{i32 479, i32 0, metadata !1256, null}
!1256 = metadata !{i32 786443, metadata !1, metadata !196, i32 479, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1257 = metadata !{i32 480, i32 0, metadata !1258, null}
!1258 = metadata !{i32 786443, metadata !1, metadata !1256, i32 479, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1259 = metadata !{i32 481, i32 0, metadata !1258, null}
!1260 = metadata !{i32 484, i32 0, metadata !1261, null}
!1261 = metadata !{i32 786443, metadata !1, metadata !196, i32 484, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1262 = metadata !{i32 491, i32 0, metadata !1263, null}
!1263 = metadata !{i32 786443, metadata !1, metadata !1264, i32 491, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1264 = metadata !{i32 786443, metadata !1, metadata !1261, i32 484, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1265 = metadata !{i32 492, i32 0, metadata !1266, null}
!1266 = metadata !{i32 786443, metadata !1, metadata !1263, i32 491, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1267 = metadata !{i32 493, i32 0, metadata !1266, null}
!1268 = metadata !{i32 494, i32 0, metadata !1269, null}
!1269 = metadata !{i32 786443, metadata !1, metadata !1263, i32 493, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1270 = metadata !{i32 498, i32 0, metadata !1271, null}
!1271 = metadata !{i32 786443, metadata !1, metadata !1269, i32 498, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1272 = metadata !{i32 499, i32 0, metadata !1273, null}
!1273 = metadata !{i32 786443, metadata !1, metadata !1271, i32 498, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1274 = metadata !{i32 500, i32 0, metadata !1273, null}
!1275 = metadata !{i32 501, i32 0, metadata !1273, null}
!1276 = metadata !{i32 504, i32 0, metadata !1277, null}
!1277 = metadata !{i32 786443, metadata !1, metadata !1264, i32 504, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1278 = metadata !{i32 505, i32 0, metadata !1279, null}
!1279 = metadata !{i32 786443, metadata !1, metadata !1277, i32 504, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1280 = metadata !{i32 506, i32 0, metadata !1279, null}
!1281 = metadata !{i32 509, i32 0, metadata !1264, null}
!1282 = metadata !{i32 510, i32 0, metadata !1264, null}
!1283 = metadata !{i32 513, i32 0, metadata !196, null}
!1284 = metadata !{i32 515, i32 0, metadata !1285, null}
!1285 = metadata !{i32 786443, metadata !1, metadata !196, i32 513, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1286 = metadata !{i32 516, i32 0, metadata !1285, null}
!1287 = metadata !{i32 518, i32 0, metadata !1288, null}
!1288 = metadata !{i32 786443, metadata !1, metadata !1285, i32 517, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1289 = metadata !{i32 519, i32 0, metadata !1288, null}
!1290 = metadata !{i32 523, i32 0, metadata !1291, null}
!1291 = metadata !{i32 786443, metadata !1, metadata !196, i32 523, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1292 = metadata !{i32 524, i32 0, metadata !1293, null}
!1293 = metadata !{i32 786443, metadata !1, metadata !1291, i32 523, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1294 = metadata !{i32 525, i32 0, metadata !1293, null}
!1295 = metadata !{i32 528, i32 0, metadata !196, null}
!1296 = metadata !{i32 529, i32 0, metadata !196, null}
!1297 = metadata !{i32 530, i32 0, metadata !196, null}
!1298 = metadata !{i32 532, i32 0, metadata !205, null}
!1299 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1300} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1300 = metadata !{i32 533, i32 0, metadata !205, null}
!1301 = metadata !{i32 39, i32 0, metadata !665, metadata !1300}
!1302 = metadata !{i32 40, i32 0, metadata !665, metadata !1300}
!1303 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1300} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1304 = metadata !{i32 43, i32 0, metadata !698, metadata !1300}
!1305 = metadata !{i32 46, i32 0, metadata !676, metadata !1300}
!1306 = metadata !{i32 47, i32 0, metadata !674, metadata !1300}
!1307 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1300} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1308 = metadata !{i32 48, i32 0, metadata !673, metadata !1300}
!1309 = metadata !{i32 49, i32 0, metadata !709, metadata !1300}
!1310 = metadata !{i32 534, i32 0, metadata !1311, null}
!1311 = metadata !{i32 786443, metadata !1, metadata !205, i32 534, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1312 = metadata !{i32 535, i32 0, metadata !1313, null}
!1313 = metadata !{i32 786443, metadata !1, metadata !1311, i32 534, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1314 = metadata !{i32 536, i32 0, metadata !1313, null}
!1315 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1316} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1316 = metadata !{i32 541, i32 0, metadata !213, null}
!1317 = metadata !{i32 1428, i32 0, metadata !612, metadata !1316}
!1318 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1319} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1319 = metadata !{i32 1429, i32 0, metadata !612, metadata !1316}
!1320 = metadata !{i32 1415, i32 0, metadata !631, metadata !1319}
!1321 = metadata !{i32 1417, i32 0, metadata !631, metadata !1319}
!1322 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1319} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1323 = metadata !{i32 1418, i32 0, metadata !631, metadata !1319}
!1324 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1316} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1325 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1316} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1326 = metadata !{i32 1432, i32 0, metadata !621, metadata !1316}
!1327 = metadata !{i32 1433, i32 0, metadata !620, metadata !1316}
!1328 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1316} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1329 = metadata !{i32 1434, i32 0, metadata !624, metadata !1316}
!1330 = metadata !{i32 1435, i32 0, metadata !733, metadata !1316}
!1331 = metadata !{i32 1436, i32 0, metadata !736, metadata !1316}
!1332 = metadata !{i32 1437, i32 0, metadata !736, metadata !1316}
!1333 = metadata !{i32 1439, i32 0, metadata !739, metadata !1316}
!1334 = metadata !{i32 1440, i32 0, metadata !739, metadata !1316}
!1335 = metadata !{i32 1442, i32 0, metadata !623, metadata !1316}
!1336 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1316} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1337 = metadata !{i32 1443, i32 0, metadata !623, metadata !1316}
!1338 = metadata !{i32 1444, i32 0, metadata !623, metadata !1316}
!1339 = metadata !{i32 1445, i32 0, metadata !747, metadata !1316}
!1340 = metadata !{i32 545, i32 0, metadata !1341, null}
!1341 = metadata !{i32 786443, metadata !1, metadata !213, i32 545, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1342 = metadata !{i32 546, i32 0, metadata !1341, null}
!1343 = metadata !{i32 549, i32 0, metadata !205, null}
!1344 = metadata !{i32 551, i32 0, metadata !214, null}
!1345 = metadata !{i32 552, i32 0, metadata !244, null}
!1346 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1347} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1347 = metadata !{i32 553, i32 0, metadata !243, null}
!1348 = metadata !{i32 63, i32 0, metadata !650, metadata !1347}
!1349 = metadata !{i32 64, i32 0, metadata !657, metadata !1347}
!1350 = metadata !{i32 65, i32 0, metadata !656, metadata !1347}
!1351 = metadata !{i32 66, i32 0, metadata !876, metadata !1347}
!1352 = metadata !{i32 555, i32 0, metadata !1353, null}
!1353 = metadata !{i32 786443, metadata !1, metadata !243, i32 555, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1354 = metadata !{i32 556, i32 0, metadata !1355, null}
!1355 = metadata !{i32 786443, metadata !1, metadata !1353, i32 555, i32 0, i32 119} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1356 = metadata !{i32 557, i32 0, metadata !1355, null}
!1357 = metadata !{i32 558, i32 0, metadata !1358, null}
!1358 = metadata !{i32 786443, metadata !1, metadata !1353, i32 558, i32 0, i32 120} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1359 = metadata !{i32 559, i32 0, metadata !1360, null}
!1360 = metadata !{i32 786443, metadata !1, metadata !1358, i32 558, i32 0, i32 121} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1361 = metadata !{i32 560, i32 0, metadata !1360, null}
!1362 = metadata !{i32 561, i32 0, metadata !1360, null}
!1363 = metadata !{i32 563, i32 0, metadata !243, null}
!1364 = metadata !{i32 564, i32 0, metadata !243, null}
!1365 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1366} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1366 = metadata !{i32 565, i32 0, metadata !214, null}
!1367 = metadata !{i32 39, i32 0, metadata !665, metadata !1366}
!1368 = metadata !{i32 40, i32 0, metadata !665, metadata !1366}
!1369 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1366} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1370 = metadata !{i32 43, i32 0, metadata !698, metadata !1366}
!1371 = metadata !{i32 46, i32 0, metadata !676, metadata !1366}
!1372 = metadata !{i32 47, i32 0, metadata !674, metadata !1366}
!1373 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1366} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1374 = metadata !{i32 48, i32 0, metadata !673, metadata !1366}
!1375 = metadata !{i32 49, i32 0, metadata !709, metadata !1366}
!1376 = metadata !{i32 566, i32 0, metadata !1377, null}
!1377 = metadata !{i32 786443, metadata !1, metadata !214, i32 566, i32 0, i32 122} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1378 = metadata !{i32 567, i32 0, metadata !1379, null}
!1379 = metadata !{i32 786443, metadata !1, metadata !1377, i32 566, i32 0, i32 123} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1380 = metadata !{i32 568, i32 0, metadata !1379, null}
!1381 = metadata !{i32 572, i32 0, metadata !214, null}
!1382 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1383} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1383 = metadata !{i32 573, i32 0, metadata !214, null}
!1384 = metadata !{i32 1428, i32 0, metadata !612, metadata !1383}
!1385 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1386} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1386 = metadata !{i32 1429, i32 0, metadata !612, metadata !1383}
!1387 = metadata !{i32 1415, i32 0, metadata !631, metadata !1386}
!1388 = metadata !{i32 1417, i32 0, metadata !631, metadata !1386}
!1389 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1386} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1390 = metadata !{i32 1418, i32 0, metadata !631, metadata !1386}
!1391 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1383} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1392 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1383} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1393 = metadata !{i32 1432, i32 0, metadata !621, metadata !1383}
!1394 = metadata !{i32 1433, i32 0, metadata !620, metadata !1383}
!1395 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1383} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1396 = metadata !{i32 1434, i32 0, metadata !624, metadata !1383}
!1397 = metadata !{i32 1435, i32 0, metadata !733, metadata !1383}
!1398 = metadata !{i32 1436, i32 0, metadata !736, metadata !1383}
!1399 = metadata !{i32 1437, i32 0, metadata !736, metadata !1383}
!1400 = metadata !{i32 1439, i32 0, metadata !739, metadata !1383}
!1401 = metadata !{i32 1440, i32 0, metadata !739, metadata !1383}
!1402 = metadata !{i32 1442, i32 0, metadata !623, metadata !1383}
!1403 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1383} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1404 = metadata !{i32 1443, i32 0, metadata !623, metadata !1383}
!1405 = metadata !{i32 1444, i32 0, metadata !623, metadata !1383}
!1406 = metadata !{i32 1445, i32 0, metadata !747, metadata !1383}
!1407 = metadata !{i32 581, i32 0, metadata !1408, null}
!1408 = metadata !{i32 786443, metadata !1, metadata !214, i32 581, i32 0, i32 124} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1409 = metadata !{i32 582, i32 0, metadata !1408, null}
!1410 = metadata !{i32 584, i32 0, metadata !214, null}
!1411 = metadata !{i32 587, i32 0, metadata !247, null}
!1412 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1413} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1413 = metadata !{i32 588, i32 0, metadata !247, null}
!1414 = metadata !{i32 39, i32 0, metadata !665, metadata !1413}
!1415 = metadata !{i32 40, i32 0, metadata !665, metadata !1413}
!1416 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1413} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1417 = metadata !{i32 43, i32 0, metadata !698, metadata !1413}
!1418 = metadata !{i32 46, i32 0, metadata !676, metadata !1413}
!1419 = metadata !{i32 47, i32 0, metadata !674, metadata !1413}
!1420 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1413} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1421 = metadata !{i32 48, i32 0, metadata !673, metadata !1413}
!1422 = metadata !{i32 49, i32 0, metadata !709, metadata !1413}
!1423 = metadata !{i32 589, i32 0, metadata !1424, null}
!1424 = metadata !{i32 786443, metadata !1, metadata !247, i32 589, i32 0, i32 125} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1425 = metadata !{i32 590, i32 0, metadata !1426, null}
!1426 = metadata !{i32 786443, metadata !1, metadata !1424, i32 589, i32 0, i32 126} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1427 = metadata !{i32 591, i32 0, metadata !1426, null}
!1428 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1429} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1429 = metadata !{i32 596, i32 0, metadata !253, null}
!1430 = metadata !{i32 1428, i32 0, metadata !612, metadata !1429}
!1431 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1432} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1432 = metadata !{i32 1429, i32 0, metadata !612, metadata !1429}
!1433 = metadata !{i32 1415, i32 0, metadata !631, metadata !1432}
!1434 = metadata !{i32 1417, i32 0, metadata !631, metadata !1432}
!1435 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1432} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1436 = metadata !{i32 1418, i32 0, metadata !631, metadata !1432}
!1437 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1429} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1438 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1429} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1439 = metadata !{i32 1432, i32 0, metadata !621, metadata !1429}
!1440 = metadata !{i32 1433, i32 0, metadata !620, metadata !1429}
!1441 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1429} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1442 = metadata !{i32 1434, i32 0, metadata !624, metadata !1429}
!1443 = metadata !{i32 1435, i32 0, metadata !733, metadata !1429}
!1444 = metadata !{i32 1436, i32 0, metadata !736, metadata !1429}
!1445 = metadata !{i32 1437, i32 0, metadata !736, metadata !1429}
!1446 = metadata !{i32 1439, i32 0, metadata !739, metadata !1429}
!1447 = metadata !{i32 1440, i32 0, metadata !739, metadata !1429}
!1448 = metadata !{i32 1442, i32 0, metadata !623, metadata !1429}
!1449 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1429} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1450 = metadata !{i32 1443, i32 0, metadata !623, metadata !1429}
!1451 = metadata !{i32 1444, i32 0, metadata !623, metadata !1429}
!1452 = metadata !{i32 1445, i32 0, metadata !747, metadata !1429}
!1453 = metadata !{i32 600, i32 0, metadata !1454, null}
!1454 = metadata !{i32 786443, metadata !1, metadata !253, i32 600, i32 0, i32 128} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1455 = metadata !{i32 601, i32 0, metadata !1454, null}
!1456 = metadata !{i32 604, i32 0, metadata !247, null}
!1457 = metadata !{i32 606, i32 0, metadata !254, null}
!1458 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1459} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1459 = metadata !{i32 607, i32 0, metadata !254, null}
!1460 = metadata !{i32 39, i32 0, metadata !665, metadata !1459}
!1461 = metadata !{i32 40, i32 0, metadata !665, metadata !1459}
!1462 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1459} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1463 = metadata !{i32 43, i32 0, metadata !698, metadata !1459}
!1464 = metadata !{i32 46, i32 0, metadata !676, metadata !1459}
!1465 = metadata !{i32 47, i32 0, metadata !674, metadata !1459}
!1466 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1459} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1467 = metadata !{i32 48, i32 0, metadata !673, metadata !1459}
!1468 = metadata !{i32 49, i32 0, metadata !709, metadata !1459}
!1469 = metadata !{i32 609, i32 0, metadata !1470, null}
!1470 = metadata !{i32 786443, metadata !1, metadata !254, i32 609, i32 0, i32 129} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1471 = metadata !{i32 611, i32 0, metadata !1472, null}
!1472 = metadata !{i32 786443, metadata !1, metadata !1470, i32 609, i32 0, i32 130} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1473 = metadata !{i32 612, i32 0, metadata !1472, null}
!1474 = metadata !{i32 613, i32 0, metadata !1472, null}
!1475 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1476} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1476 = metadata !{i32 617, i32 0, metadata !261, null}
!1477 = metadata !{i32 1428, i32 0, metadata !612, metadata !1476}
!1478 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1479} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1479 = metadata !{i32 1429, i32 0, metadata !612, metadata !1476}
!1480 = metadata !{i32 1415, i32 0, metadata !631, metadata !1479}
!1481 = metadata !{i32 1417, i32 0, metadata !631, metadata !1479}
!1482 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1479} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1483 = metadata !{i32 1418, i32 0, metadata !631, metadata !1479}
!1484 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1476} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1485 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1476} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1486 = metadata !{i32 1432, i32 0, metadata !621, metadata !1476}
!1487 = metadata !{i32 1433, i32 0, metadata !620, metadata !1476}
!1488 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1476} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1489 = metadata !{i32 1434, i32 0, metadata !624, metadata !1476}
!1490 = metadata !{i32 1435, i32 0, metadata !733, metadata !1476}
!1491 = metadata !{i32 1436, i32 0, metadata !736, metadata !1476}
!1492 = metadata !{i32 1437, i32 0, metadata !736, metadata !1476}
!1493 = metadata !{i32 1439, i32 0, metadata !739, metadata !1476}
!1494 = metadata !{i32 1440, i32 0, metadata !739, metadata !1476}
!1495 = metadata !{i32 1442, i32 0, metadata !623, metadata !1476}
!1496 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1476} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1497 = metadata !{i32 1443, i32 0, metadata !623, metadata !1476}
!1498 = metadata !{i32 1444, i32 0, metadata !623, metadata !1476}
!1499 = metadata !{i32 1445, i32 0, metadata !747, metadata !1476}
!1500 = metadata !{i32 618, i32 0, metadata !1501, null}
!1501 = metadata !{i32 786443, metadata !1, metadata !261, i32 618, i32 0, i32 132} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1502 = metadata !{i32 619, i32 0, metadata !1501, null}
!1503 = metadata !{i32 622, i32 0, metadata !254, null}
!1504 = metadata !{i32 624, i32 0, metadata !262, null}
!1505 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1506} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1506 = metadata !{i32 625, i32 0, metadata !262, null}
!1507 = metadata !{i32 63, i32 0, metadata !650, metadata !1506}
!1508 = metadata !{i32 64, i32 0, metadata !657, metadata !1506}
!1509 = metadata !{i32 65, i32 0, metadata !656, metadata !1506}
!1510 = metadata !{i32 66, i32 0, metadata !876, metadata !1506}
!1511 = metadata !{i32 627, i32 0, metadata !1512, null}
!1512 = metadata !{i32 786443, metadata !1, metadata !262, i32 627, i32 0, i32 133} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1513 = metadata !{i32 628, i32 0, metadata !1514, null}
!1514 = metadata !{i32 786443, metadata !1, metadata !1512, i32 627, i32 0, i32 134} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1515 = metadata !{i32 629, i32 0, metadata !1514, null}
!1516 = metadata !{i32 632, i32 0, metadata !268, null}
!1517 = metadata !{i32 633, i32 0, metadata !1518, null}
!1518 = metadata !{i32 786443, metadata !1, metadata !268, i32 632, i32 0, i32 136} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1519 = metadata !{i32 634, i32 0, metadata !1518, null}
!1520 = metadata !{i32 635, i32 0, metadata !1518, null}
!1521 = metadata !{i32 637, i32 0, metadata !267, null}
!1522 = metadata !{i32 638, i32 0, metadata !1523, null}
!1523 = metadata !{i32 786443, metadata !1, metadata !267, i32 638, i32 0, i32 138} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1524 = metadata !{i32 639, i32 0, metadata !1523, null}
!1525 = metadata !{i32 642, i32 0, metadata !262, null}
!1526 = metadata !{i32 658, i32 0, metadata !269, null}
!1527 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1528} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1528 = metadata !{i32 661, i32 0, metadata !269, null}
!1529 = metadata !{i32 39, i32 0, metadata !665, metadata !1528}
!1530 = metadata !{i32 40, i32 0, metadata !665, metadata !1528}
!1531 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1528} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1532 = metadata !{i32 43, i32 0, metadata !698, metadata !1528}
!1533 = metadata !{i32 46, i32 0, metadata !676, metadata !1528}
!1534 = metadata !{i32 47, i32 0, metadata !674, metadata !1528}
!1535 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1528} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1536 = metadata !{i32 48, i32 0, metadata !673, metadata !1528}
!1537 = metadata !{i32 49, i32 0, metadata !709, metadata !1528}
!1538 = metadata !{i32 51, i32 0, metadata !673, metadata !1528}
!1539 = metadata !{i32 663, i32 0, metadata !269, null}
!1540 = metadata !{i32 664, i32 0, metadata !1541, null}
!1541 = metadata !{i32 786443, metadata !1, metadata !269, i32 664, i32 0, i32 139} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1542 = metadata !{metadata !701, metadata !703, i64 88}
!1543 = metadata !{i32 665, i32 0, metadata !1544, null}
!1544 = metadata !{i32 786443, metadata !1, metadata !1541, i32 664, i32 0, i32 140} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1545 = metadata !{i32 666, i32 0, metadata !1544, null}
!1546 = metadata !{i32 667, i32 0, metadata !1544, null}
!1547 = metadata !{i32 670, i32 0, metadata !278, null}
!1548 = metadata !{i32 786689, metadata !644, metadata !"df", metadata !25, i32 16777861, metadata !36, i32 0, metadata !1549} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1549 = metadata !{i32 671, i32 0, metadata !1550, null}
!1550 = metadata !{i32 786443, metadata !1, metadata !278, i32 670, i32 0, i32 142} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1551 = metadata !{i32 645, i32 0, metadata !644, metadata !1549}
!1552 = metadata !{i32 786689, metadata !644, metadata !"mode", metadata !25, i32 33555077, metadata !91, i32 0, metadata !1549} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1553 = metadata !{i32 646, i32 0, metadata !1554, metadata !1549}
!1554 = metadata !{i32 786443, metadata !1, metadata !644, i32 646, i32 0, i32 368} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1555 = metadata !{metadata !713, metadata !702, i64 28}
!1556 = metadata !{i32 647, i32 0, metadata !1557, metadata !1549}
!1557 = metadata !{i32 786443, metadata !1, metadata !1558, i32 647, i32 0, i32 370} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1558 = metadata !{i32 786443, metadata !1, metadata !1554, i32 646, i32 0, i32 369} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1559 = metadata !{metadata !713, metadata !702, i64 32}
!1560 = metadata !{i32 648, i32 0, metadata !1557, metadata !1549}
!1561 = metadata !{i32 649, i32 0, metadata !1558, metadata !1549}
!1562 = metadata !{i32 651, i32 0, metadata !1558, metadata !1549}
!1563 = metadata !{i32 653, i32 0, metadata !1564, metadata !1549}
!1564 = metadata !{i32 786443, metadata !1, metadata !1554, i32 652, i32 0, i32 371} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1565 = metadata !{i32 654, i32 0, metadata !1564, metadata !1549}
!1566 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1567} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1567 = metadata !{i32 673, i32 0, metadata !277, null}
!1568 = metadata !{i32 1428, i32 0, metadata !612, metadata !1567}
!1569 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1570} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1570 = metadata !{i32 1429, i32 0, metadata !612, metadata !1567}
!1571 = metadata !{i32 1415, i32 0, metadata !631, metadata !1570}
!1572 = metadata !{i32 1417, i32 0, metadata !631, metadata !1570}
!1573 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1570} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1574 = metadata !{i32 1418, i32 0, metadata !631, metadata !1570}
!1575 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1567} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1576 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1567} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1577 = metadata !{i32 1432, i32 0, metadata !621, metadata !1567}
!1578 = metadata !{i32 1433, i32 0, metadata !620, metadata !1567}
!1579 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1567} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1580 = metadata !{i32 1434, i32 0, metadata !624, metadata !1567}
!1581 = metadata !{i32 1435, i32 0, metadata !733, metadata !1567}
!1582 = metadata !{i32 1436, i32 0, metadata !736, metadata !1567}
!1583 = metadata !{i32 1437, i32 0, metadata !736, metadata !1567}
!1584 = metadata !{i32 1439, i32 0, metadata !739, metadata !1567}
!1585 = metadata !{i32 1440, i32 0, metadata !739, metadata !1567}
!1586 = metadata !{i32 1442, i32 0, metadata !623, metadata !1567}
!1587 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1567} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1588 = metadata !{i32 1443, i32 0, metadata !623, metadata !1567}
!1589 = metadata !{i32 1444, i32 0, metadata !623, metadata !1567}
!1590 = metadata !{i32 1445, i32 0, metadata !747, metadata !1567}
!1591 = metadata !{i32 674, i32 0, metadata !1592, null}
!1592 = metadata !{i32 786443, metadata !1, metadata !277, i32 674, i32 0, i32 144} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1593 = metadata !{i32 675, i32 0, metadata !1592, null}
!1594 = metadata !{i32 678, i32 0, metadata !269, null}
!1595 = metadata !{i32 680, i32 0, metadata !279, null}
!1596 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1597} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1597 = metadata !{i32 683, i32 0, metadata !279, null}
!1598 = metadata !{i32 63, i32 0, metadata !650, metadata !1597}
!1599 = metadata !{i32 64, i32 0, metadata !657, metadata !1597}
!1600 = metadata !{i32 65, i32 0, metadata !656, metadata !1597}
!1601 = metadata !{i32 66, i32 0, metadata !876, metadata !1597}
!1602 = metadata !{i32 685, i32 0, metadata !1603, null}
!1603 = metadata !{i32 786443, metadata !1, metadata !279, i32 685, i32 0, i32 145} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1604 = metadata !{i32 686, i32 0, metadata !1605, null}
!1605 = metadata !{i32 786443, metadata !1, metadata !1603, i32 685, i32 0, i32 146} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1606 = metadata !{i32 687, i32 0, metadata !1605, null}
!1607 = metadata !{i32 690, i32 0, metadata !279, null}
!1608 = metadata !{i32 691, i32 0, metadata !1609, null}
!1609 = metadata !{i32 786443, metadata !1, metadata !279, i32 691, i32 0, i32 147} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1610 = metadata !{metadata !701, metadata !703, i64 96}
!1611 = metadata !{i32 692, i32 0, metadata !1612, null}
!1612 = metadata !{i32 786443, metadata !1, metadata !1609, i32 691, i32 0, i32 148} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1613 = metadata !{i32 693, i32 0, metadata !1612, null}
!1614 = metadata !{i32 694, i32 0, metadata !1612, null}
!1615 = metadata !{i32 697, i32 0, metadata !288, null}
!1616 = metadata !{i32 786689, metadata !644, metadata !"df", metadata !25, i32 16777861, metadata !36, i32 0, metadata !1617} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1617 = metadata !{i32 698, i32 0, metadata !1618, null}
!1618 = metadata !{i32 786443, metadata !1, metadata !288, i32 697, i32 0, i32 150} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1619 = metadata !{i32 645, i32 0, metadata !644, metadata !1617}
!1620 = metadata !{i32 786689, metadata !644, metadata !"mode", metadata !25, i32 33555077, metadata !91, i32 0, metadata !1617} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1621 = metadata !{i32 646, i32 0, metadata !1554, metadata !1617}
!1622 = metadata !{i32 647, i32 0, metadata !1557, metadata !1617}
!1623 = metadata !{i32 648, i32 0, metadata !1557, metadata !1617}
!1624 = metadata !{i32 649, i32 0, metadata !1558, metadata !1617}
!1625 = metadata !{i32 651, i32 0, metadata !1558, metadata !1617}
!1626 = metadata !{i32 653, i32 0, metadata !1564, metadata !1617}
!1627 = metadata !{i32 654, i32 0, metadata !1564, metadata !1617}
!1628 = metadata !{i32 700, i32 0, metadata !287, null}
!1629 = metadata !{i32 701, i32 0, metadata !1630, null}
!1630 = metadata !{i32 786443, metadata !1, metadata !287, i32 701, i32 0, i32 152} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1631 = metadata !{i32 702, i32 0, metadata !1630, null}
!1632 = metadata !{i32 705, i32 0, metadata !279, null}
!1633 = metadata !{i32 713, i32 0, metadata !289, null}
!1634 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1635} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1635 = metadata !{i32 714, i32 0, metadata !289, null}
!1636 = metadata !{i32 39, i32 0, metadata !665, metadata !1635}
!1637 = metadata !{i32 40, i32 0, metadata !665, metadata !1635}
!1638 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1635} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1639 = metadata !{i32 43, i32 0, metadata !698, metadata !1635}
!1640 = metadata !{i32 46, i32 0, metadata !676, metadata !1635}
!1641 = metadata !{i32 47, i32 0, metadata !674, metadata !1635}
!1642 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1635} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1643 = metadata !{i32 48, i32 0, metadata !673, metadata !1635}
!1644 = metadata !{i32 49, i32 0, metadata !709, metadata !1635}
!1645 = metadata !{i32 716, i32 0, metadata !301, null}
!1646 = metadata !{%struct.exe_disk_file_t* null}
!1647 = metadata !{i32 786689, metadata !637, metadata !"df", metadata !25, i32 16777923, metadata !36, i32 0, metadata !1648} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1648 = metadata !{i32 717, i32 0, metadata !1649, null}
!1649 = metadata !{i32 786443, metadata !1, metadata !301, i32 716, i32 0, i32 154} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1650 = metadata !{i32 707, i32 0, metadata !637, metadata !1648}
!1651 = metadata !{i32 786689, metadata !637, metadata !"owner", metadata !25, i32 33555139, metadata !292, i32 0, metadata !1648} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1652 = metadata !{i32 786689, metadata !637, metadata !"group", metadata !25, i32 50332355, metadata !293, i32 0, metadata !1648} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1653 = metadata !{i32 708, i32 0, metadata !637, metadata !1648}
!1654 = metadata !{i32 709, i32 0, metadata !637, metadata !1648}
!1655 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1656} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1656 = metadata !{i32 719, i32 0, metadata !300, null}
!1657 = metadata !{i32 1428, i32 0, metadata !612, metadata !1656}
!1658 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1659} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1659 = metadata !{i32 1429, i32 0, metadata !612, metadata !1656}
!1660 = metadata !{i32 1415, i32 0, metadata !631, metadata !1659}
!1661 = metadata !{i32 1417, i32 0, metadata !631, metadata !1659}
!1662 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1659} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1663 = metadata !{i32 1418, i32 0, metadata !631, metadata !1659}
!1664 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1656} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1665 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1656} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1666 = metadata !{i32 1432, i32 0, metadata !621, metadata !1656}
!1667 = metadata !{i32 1433, i32 0, metadata !620, metadata !1656}
!1668 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1656} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1669 = metadata !{i32 1434, i32 0, metadata !624, metadata !1656}
!1670 = metadata !{i32 1435, i32 0, metadata !733, metadata !1656}
!1671 = metadata !{i32 1436, i32 0, metadata !736, metadata !1656}
!1672 = metadata !{i32 1437, i32 0, metadata !736, metadata !1656}
!1673 = metadata !{i32 1439, i32 0, metadata !739, metadata !1656}
!1674 = metadata !{i32 1440, i32 0, metadata !739, metadata !1656}
!1675 = metadata !{i32 1442, i32 0, metadata !623, metadata !1656}
!1676 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1656} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1677 = metadata !{i32 1443, i32 0, metadata !623, metadata !1656}
!1678 = metadata !{i32 1444, i32 0, metadata !623, metadata !1656}
!1679 = metadata !{i32 1445, i32 0, metadata !747, metadata !1656}
!1680 = metadata !{i32 720, i32 0, metadata !1681, null}
!1681 = metadata !{i32 786443, metadata !1, metadata !300, i32 720, i32 0, i32 156} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1682 = metadata !{i32 721, i32 0, metadata !1681, null}
!1683 = metadata !{i32 724, i32 0, metadata !289, null}
!1684 = metadata !{i32 726, i32 0, metadata !302, null}
!1685 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1686} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1686 = metadata !{i32 727, i32 0, metadata !302, null}
!1687 = metadata !{i32 63, i32 0, metadata !650, metadata !1686}
!1688 = metadata !{i32 64, i32 0, metadata !657, metadata !1686}
!1689 = metadata !{i32 65, i32 0, metadata !656, metadata !1686}
!1690 = metadata !{i32 66, i32 0, metadata !876, metadata !1686}
!1691 = metadata !{i32 729, i32 0, metadata !1692, null}
!1692 = metadata !{i32 786443, metadata !1, metadata !302, i32 729, i32 0, i32 157} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1693 = metadata !{i32 730, i32 0, metadata !1694, null}
!1694 = metadata !{i32 786443, metadata !1, metadata !1692, i32 729, i32 0, i32 158} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1695 = metadata !{i32 731, i32 0, metadata !1694, null}
!1696 = metadata !{i32 734, i32 0, metadata !312, null}
!1697 = metadata !{i32 786689, metadata !637, metadata !"df", metadata !25, i32 16777923, metadata !36, i32 0, metadata !1698} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1698 = metadata !{i32 735, i32 0, metadata !1699, null}
!1699 = metadata !{i32 786443, metadata !1, metadata !312, i32 734, i32 0, i32 160} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1700 = metadata !{i32 707, i32 0, metadata !637, metadata !1698}
!1701 = metadata !{i32 786689, metadata !637, metadata !"owner", metadata !25, i32 33555139, metadata !292, i32 0, metadata !1698} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1702 = metadata !{i32 786689, metadata !637, metadata !"group", metadata !25, i32 50332355, metadata !293, i32 0, metadata !1698} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1703 = metadata !{i32 708, i32 0, metadata !637, metadata !1698}
!1704 = metadata !{i32 709, i32 0, metadata !637, metadata !1698}
!1705 = metadata !{i32 737, i32 0, metadata !311, null}
!1706 = metadata !{i32 738, i32 0, metadata !1707, null}
!1707 = metadata !{i32 786443, metadata !1, metadata !311, i32 738, i32 0, i32 162} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1708 = metadata !{i32 739, i32 0, metadata !1707, null}
!1709 = metadata !{i32 742, i32 0, metadata !302, null}
!1710 = metadata !{i32 744, i32 0, metadata !313, null}
!1711 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !1712} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1712 = metadata !{i32 746, i32 0, metadata !313, null}
!1713 = metadata !{i32 39, i32 0, metadata !665, metadata !1712}
!1714 = metadata !{i32 40, i32 0, metadata !665, metadata !1712}
!1715 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !1712} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1716 = metadata !{i32 43, i32 0, metadata !698, metadata !1712}
!1717 = metadata !{i32 46, i32 0, metadata !676, metadata !1712}
!1718 = metadata !{i32 47, i32 0, metadata !674, metadata !1712}
!1719 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !1712} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1720 = metadata !{i32 48, i32 0, metadata !673, metadata !1712}
!1721 = metadata !{i32 49, i32 0, metadata !709, metadata !1712}
!1722 = metadata !{i32 748, i32 0, metadata !321, null}
!1723 = metadata !{i32 786689, metadata !637, metadata !"df", metadata !25, i32 16777923, metadata !36, i32 0, metadata !1724} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1724 = metadata !{i32 749, i32 0, metadata !1725, null}
!1725 = metadata !{i32 786443, metadata !1, metadata !321, i32 748, i32 0, i32 164} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1726 = metadata !{i32 707, i32 0, metadata !637, metadata !1724}
!1727 = metadata !{i32 786689, metadata !637, metadata !"owner", metadata !25, i32 33555139, metadata !292, i32 0, metadata !1724} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1728 = metadata !{i32 786689, metadata !637, metadata !"group", metadata !25, i32 50332355, metadata !293, i32 0, metadata !1724} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1729 = metadata !{i32 708, i32 0, metadata !637, metadata !1724}
!1730 = metadata !{i32 709, i32 0, metadata !637, metadata !1724}
!1731 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !1732} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1732 = metadata !{i32 751, i32 0, metadata !320, null}
!1733 = metadata !{i32 1428, i32 0, metadata !612, metadata !1732}
!1734 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !1735} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1735 = metadata !{i32 1429, i32 0, metadata !612, metadata !1732}
!1736 = metadata !{i32 1415, i32 0, metadata !631, metadata !1735}
!1737 = metadata !{i32 1417, i32 0, metadata !631, metadata !1735}
!1738 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !1735} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1739 = metadata !{i32 1418, i32 0, metadata !631, metadata !1735}
!1740 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !1732} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1741 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !1732} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1742 = metadata !{i32 1432, i32 0, metadata !621, metadata !1732}
!1743 = metadata !{i32 1433, i32 0, metadata !620, metadata !1732}
!1744 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !1732} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1745 = metadata !{i32 1434, i32 0, metadata !624, metadata !1732}
!1746 = metadata !{i32 1435, i32 0, metadata !733, metadata !1732}
!1747 = metadata !{i32 1436, i32 0, metadata !736, metadata !1732}
!1748 = metadata !{i32 1437, i32 0, metadata !736, metadata !1732}
!1749 = metadata !{i32 1439, i32 0, metadata !739, metadata !1732}
!1750 = metadata !{i32 1440, i32 0, metadata !739, metadata !1732}
!1751 = metadata !{i32 1442, i32 0, metadata !623, metadata !1732}
!1752 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !1732} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1753 = metadata !{i32 1443, i32 0, metadata !623, metadata !1732}
!1754 = metadata !{i32 1444, i32 0, metadata !623, metadata !1732}
!1755 = metadata !{i32 1445, i32 0, metadata !747, metadata !1732}
!1756 = metadata !{i32 752, i32 0, metadata !1757, null}
!1757 = metadata !{i32 786443, metadata !1, metadata !320, i32 752, i32 0, i32 166} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1758 = metadata !{i32 753, i32 0, metadata !1757, null}
!1759 = metadata !{i32 756, i32 0, metadata !313, null}
!1760 = metadata !{i32 758, i32 0, metadata !322, null}
!1761 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1762} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1762 = metadata !{i32 759, i32 0, metadata !322, null}
!1763 = metadata !{i32 63, i32 0, metadata !650, metadata !1762}
!1764 = metadata !{i32 64, i32 0, metadata !657, metadata !1762}
!1765 = metadata !{i32 65, i32 0, metadata !656, metadata !1762}
!1766 = metadata !{i32 66, i32 0, metadata !876, metadata !1762}
!1767 = metadata !{i32 761, i32 0, metadata !1768, null}
!1768 = metadata !{i32 786443, metadata !1, metadata !322, i32 761, i32 0, i32 167} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1769 = metadata !{i32 762, i32 0, metadata !1770, null}
!1770 = metadata !{i32 786443, metadata !1, metadata !1768, i32 761, i32 0, i32 168} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1771 = metadata !{i32 763, i32 0, metadata !1770, null}
!1772 = metadata !{i32 766, i32 0, metadata !331, null}
!1773 = metadata !{i32 768, i32 0, metadata !330, null}
!1774 = metadata !{i32 772, i32 0, metadata !1775, null}
!1775 = metadata !{i32 786443, metadata !1, metadata !330, i32 772, i32 0, i32 171} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1776 = metadata !{i32 773, i32 0, metadata !1775, null}
!1777 = metadata !{i32 777, i32 0, metadata !322, null}
!1778 = metadata !{i32 778, i32 0, metadata !322, null}
!1779 = metadata !{i32 779, i32 0, metadata !322, null}
!1780 = metadata !{i32 781, i32 0, metadata !332, null}
!1781 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1782} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1782 = metadata !{i32 783, i32 0, metadata !332, null}
!1783 = metadata !{i32 63, i32 0, metadata !650, metadata !1782}
!1784 = metadata !{i32 64, i32 0, metadata !657, metadata !1782}
!1785 = metadata !{i32 65, i32 0, metadata !656, metadata !1782}
!1786 = metadata !{i32 66, i32 0, metadata !876, metadata !1782}
!1787 = metadata !{i32 785, i32 0, metadata !332, null}
!1788 = metadata !{i32 787, i32 0, metadata !1789, null}
!1789 = metadata !{i32 786443, metadata !1, metadata !332, i32 787, i32 0, i32 172} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1790 = metadata !{i32 788, i32 0, metadata !1791, null}
!1791 = metadata !{i32 786443, metadata !1, metadata !1789, i32 787, i32 0, i32 173} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1792 = metadata !{i32 789, i32 0, metadata !1791, null}
!1793 = metadata !{i32 792, i32 0, metadata !1794, null}
!1794 = metadata !{i32 786443, metadata !1, metadata !332, i32 792, i32 0, i32 174} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1795 = metadata !{metadata !701, metadata !703, i64 72}
!1796 = metadata !{i32 793, i32 0, metadata !1797, null}
!1797 = metadata !{i32 786443, metadata !1, metadata !1794, i32 792, i32 0, i32 175} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1798 = metadata !{i32 794, i32 0, metadata !1797, null}
!1799 = metadata !{i32 795, i32 0, metadata !1797, null}
!1800 = metadata !{i32 798, i32 0, metadata !341, null}
!1801 = metadata !{i32 799, i32 0, metadata !1802, null}
!1802 = metadata !{i32 786443, metadata !1, metadata !341, i32 798, i32 0, i32 177} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1803 = metadata !{i32 800, i32 0, metadata !1802, null}
!1804 = metadata !{i32 801, i32 0, metadata !1802, null}
!1805 = metadata !{i32 804, i32 0, metadata !340, null}
!1806 = metadata !{i32 808, i32 0, metadata !1807, null}
!1807 = metadata !{i32 786443, metadata !1, metadata !340, i32 808, i32 0, i32 179} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1808 = metadata !{i32 809, i32 0, metadata !1807, null}
!1809 = metadata !{i32 812, i32 0, metadata !332, null}
!1810 = metadata !{i32 814, i32 0, metadata !342, null}
!1811 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1812} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1812 = metadata !{i32 815, i32 0, metadata !342, null}
!1813 = metadata !{i32 63, i32 0, metadata !650, metadata !1812}
!1814 = metadata !{i32 64, i32 0, metadata !657, metadata !1812}
!1815 = metadata !{i32 65, i32 0, metadata !656, metadata !1812}
!1816 = metadata !{i32 66, i32 0, metadata !876, metadata !1812}
!1817 = metadata !{i32 817, i32 0, metadata !1818, null}
!1818 = metadata !{i32 786443, metadata !1, metadata !342, i32 817, i32 0, i32 180} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1819 = metadata !{i32 818, i32 0, metadata !1820, null}
!1820 = metadata !{i32 786443, metadata !1, metadata !1818, i32 817, i32 0, i32 181} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1821 = metadata !{i32 819, i32 0, metadata !1820, null}
!1822 = metadata !{i32 822, i32 0, metadata !368, null}
!1823 = metadata !{i32 823, i32 0, metadata !1824, null}
!1824 = metadata !{i32 786443, metadata !1, metadata !368, i32 822, i32 0, i32 183} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1825 = metadata !{i32 824, i32 0, metadata !1824, null}
!1826 = metadata !{i32 825, i32 0, metadata !1824, null}
!1827 = metadata !{i32 827, i32 0, metadata !366, null}
!1828 = metadata !{i32 829, i32 0, metadata !365, null}
!1829 = metadata !{i32 832, i32 0, metadata !365, null}
!1830 = metadata !{i32 833, i32 0, metadata !1831, null}
!1831 = metadata !{i32 786443, metadata !1, metadata !365, i32 833, i32 0, i32 187} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1832 = metadata !{i32 838, i32 0, metadata !373, null}
!1833 = metadata !{i32 835, i32 0, metadata !1834, null}
!1834 = metadata !{i32 786443, metadata !1, metadata !1831, i32 834, i32 0, i32 188} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1835 = metadata !{i32 836, i32 0, metadata !1834, null}
!1836 = metadata !{i32 839, i32 0, metadata !372, null}
!1837 = metadata !{i32 840, i32 0, metadata !372, null}
!1838 = metadata !{metadata !1839, metadata !714, i64 0}
!1839 = metadata !{metadata !"dirent64", metadata !714, i64 0, metadata !714, i64 8, metadata !1840, i64 16, metadata !694, i64 18, metadata !694, i64 19}
!1840 = metadata !{metadata !"short", metadata !694, i64 0}
!1841 = metadata !{i32 841, i32 0, metadata !372, null}
!1842 = metadata !{metadata !1839, metadata !1840, i64 16}
!1843 = metadata !{i32 842, i32 0, metadata !372, null}
!1844 = metadata !{metadata !1839, metadata !694, i64 18}
!1845 = metadata !{i32 843, i32 0, metadata !372, null}
!1846 = metadata !{i32 844, i32 0, metadata !372, null}
!1847 = metadata !{i32 845, i32 0, metadata !372, null}
!1848 = metadata !{metadata !1839, metadata !714, i64 8}
!1849 = metadata !{i32 846, i32 0, metadata !372, null}
!1850 = metadata !{i32 847, i32 0, metadata !372, null}
!1851 = metadata !{i32 851, i32 0, metadata !365, null}
!1852 = metadata !{i32 852, i32 0, metadata !365, null}
!1853 = metadata !{i32 853, i32 0, metadata !365, null}
!1854 = metadata !{i32 854, i32 0, metadata !365, null}
!1855 = metadata !{i32 855, i32 0, metadata !365, null}
!1856 = metadata !{i32 856, i32 0, metadata !365, null}
!1857 = metadata !{i32 857, i32 0, metadata !365, null}
!1858 = metadata !{i32 858, i32 0, metadata !365, null}
!1859 = metadata !{i32 860, i32 0, metadata !365, null}
!1860 = metadata !{i32 862, i32 0, metadata !375, null}
!1861 = metadata !{i32 864, i32 0, metadata !375, null}
!1862 = metadata !{i32 873, i32 0, metadata !375, null}
!1863 = metadata !{i32 874, i32 0, metadata !375, null}
!1864 = metadata !{i32 875, i32 0, metadata !375, null}
!1865 = metadata !{i32 876, i32 0, metadata !375, null}
!1866 = metadata !{i32 877, i32 0, metadata !380, null}
!1867 = metadata !{i32 878, i32 0, metadata !1868, null}
!1868 = metadata !{i32 786443, metadata !1, metadata !380, i32 877, i32 0, i32 193} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1869 = metadata !{i32 879, i32 0, metadata !1868, null}
!1870 = metadata !{i32 880, i32 0, metadata !379, null}
!1871 = metadata !{i32 881, i32 0, metadata !379, null}
!1872 = metadata !{i32 885, i32 0, metadata !379, null}
!1873 = metadata !{i32 886, i32 0, metadata !382, null}
!1874 = metadata !{i32 887, i32 0, metadata !382, null}
!1875 = metadata !{i32 888, i32 0, metadata !382, null}
!1876 = metadata !{i32 895, i32 0, metadata !342, null}
!1877 = metadata !{i32 898, i32 0, metadata !383, null}
!1878 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !1879} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1879 = metadata !{i32 902, i32 0, metadata !383, null}
!1880 = metadata !{i32 63, i32 0, metadata !650, metadata !1879}
!1881 = metadata !{i32 64, i32 0, metadata !657, metadata !1879}
!1882 = metadata !{i32 65, i32 0, metadata !656, metadata !1879}
!1883 = metadata !{i32 66, i32 0, metadata !876, metadata !1879}
!1884 = metadata !{i32 903, i32 0, metadata !383, null}
!1885 = metadata !{i32 910, i32 0, metadata !1886, null}
!1886 = metadata !{i32 786443, metadata !1, metadata !383, i32 910, i32 0, i32 196} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1887 = metadata !{i32 911, i32 0, metadata !1888, null}
!1888 = metadata !{i32 786443, metadata !1, metadata !1886, i32 910, i32 0, i32 197} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1889 = metadata !{i32 912, i32 0, metadata !1888, null}
!1890 = metadata !{i32 915, i32 0, metadata !383, null}
!1891 = metadata !{i32 916, i32 0, metadata !383, null}
!1892 = metadata !{i32 917, i32 0, metadata !383, null}
!1893 = metadata !{i32 919, i32 0, metadata !407, null}
!1894 = metadata !{i32 920, i32 0, metadata !406, null}
!1895 = metadata !{i32 922, i32 0, metadata !406, null}
!1896 = metadata !{i32 926, i32 0, metadata !409, null}
!1897 = metadata !{i32 929, i32 0, metadata !1898, null}
!1898 = metadata !{i32 786443, metadata !1, metadata !409, i32 929, i32 0, i32 202} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1899 = metadata !{metadata !1900, metadata !702, i64 24}
!1900 = metadata !{metadata !"stat", metadata !714, i64 0, metadata !714, i64 8, metadata !714, i64 16, metadata !702, i64 24, metadata !702, i64 28, metadata !702, i64 32, metadata !702, i64 36, metadata !714, i64 40, metadata !714, i64 48, metadata !714, i64 56, metadata !714, i64 64, metadata !715, i64 72, metadata !715, i64 88, metadata !715, i64 104, metadata !694, i64 120}
!1901 = metadata !{i32 932, i32 0, metadata !1902, null}
!1902 = metadata !{i32 786443, metadata !1, metadata !1898, i32 929, i32 0, i32 203} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1903 = metadata !{metadata !1904, metadata !702, i64 0}
!1904 = metadata !{metadata !"termios", metadata !702, i64 0, metadata !702, i64 4, metadata !702, i64 8, metadata !702, i64 12, metadata !694, i64 16, metadata !694, i64 17, metadata !702, i64 52, metadata !702, i64 56}
!1905 = metadata !{i32 933, i32 0, metadata !1902, null}
!1906 = metadata !{metadata !1904, metadata !702, i64 4}
!1907 = metadata !{i32 934, i32 0, metadata !1902, null}
!1908 = metadata !{metadata !1904, metadata !702, i64 8}
!1909 = metadata !{i32 935, i32 0, metadata !1902, null}
!1910 = metadata !{metadata !1904, metadata !702, i64 12}
!1911 = metadata !{i32 936, i32 0, metadata !1902, null}
!1912 = metadata !{metadata !1904, metadata !694, i64 16}
!1913 = metadata !{i32 937, i32 0, metadata !1902, null}
!1914 = metadata !{i32 938, i32 0, metadata !1902, null}
!1915 = metadata !{i32 939, i32 0, metadata !1902, null}
!1916 = metadata !{i32 940, i32 0, metadata !1902, null}
!1917 = metadata !{i32 941, i32 0, metadata !1902, null}
!1918 = metadata !{i32 942, i32 0, metadata !1902, null}
!1919 = metadata !{i32 943, i32 0, metadata !1902, null}
!1920 = metadata !{i32 944, i32 0, metadata !1902, null}
!1921 = metadata !{i32 945, i32 0, metadata !1902, null}
!1922 = metadata !{i32 946, i32 0, metadata !1902, null}
!1923 = metadata !{i32 947, i32 0, metadata !1902, null}
!1924 = metadata !{i32 948, i32 0, metadata !1902, null}
!1925 = metadata !{i32 949, i32 0, metadata !1902, null}
!1926 = metadata !{i32 950, i32 0, metadata !1902, null}
!1927 = metadata !{i32 951, i32 0, metadata !1902, null}
!1928 = metadata !{i32 952, i32 0, metadata !1902, null}
!1929 = metadata !{i32 953, i32 0, metadata !1902, null}
!1930 = metadata !{i32 954, i32 0, metadata !1902, null}
!1931 = metadata !{i32 955, i32 0, metadata !1902, null}
!1932 = metadata !{i32 956, i32 0, metadata !1902, null}
!1933 = metadata !{i32 958, i32 0, metadata !1934, null}
!1934 = metadata !{i32 786443, metadata !1, metadata !1898, i32 957, i32 0, i32 204} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1935 = metadata !{i32 959, i32 0, metadata !1934, null}
!1936 = metadata !{i32 964, i32 0, metadata !1937, null}
!1937 = metadata !{i32 786443, metadata !1, metadata !410, i32 962, i32 0, i32 205} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1938 = metadata !{i32 965, i32 0, metadata !1939, null}
!1939 = metadata !{i32 786443, metadata !1, metadata !1937, i32 965, i32 0, i32 206} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1940 = metadata !{i32 968, i32 0, metadata !1941, null}
!1941 = metadata !{i32 786443, metadata !1, metadata !1939, i32 967, i32 0, i32 208} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1942 = metadata !{i32 969, i32 0, metadata !1941, null}
!1943 = metadata !{i32 974, i32 0, metadata !1944, null}
!1944 = metadata !{i32 786443, metadata !1, metadata !410, i32 972, i32 0, i32 209} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1945 = metadata !{i32 975, i32 0, metadata !1946, null}
!1946 = metadata !{i32 786443, metadata !1, metadata !1944, i32 975, i32 0, i32 210} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1947 = metadata !{i32 978, i32 0, metadata !1948, null}
!1948 = metadata !{i32 786443, metadata !1, metadata !1946, i32 977, i32 0, i32 212} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1949 = metadata !{i32 979, i32 0, metadata !1948, null}
!1950 = metadata !{i32 984, i32 0, metadata !1951, null}
!1951 = metadata !{i32 786443, metadata !1, metadata !410, i32 982, i32 0, i32 213} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1952 = metadata !{i32 985, i32 0, metadata !1953, null}
!1953 = metadata !{i32 786443, metadata !1, metadata !1951, i32 985, i32 0, i32 214} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1954 = metadata !{i32 988, i32 0, metadata !1955, null}
!1955 = metadata !{i32 786443, metadata !1, metadata !1953, i32 987, i32 0, i32 216} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1956 = metadata !{i32 989, i32 0, metadata !1955, null}
!1957 = metadata !{i32 994, i32 0, metadata !430, null}
!1958 = metadata !{metadata !1959, metadata !1840, i64 0}
!1959 = metadata !{metadata !"winsize", metadata !1840, i64 0, metadata !1840, i64 2, metadata !1840, i64 4, metadata !1840, i64 6}
!1960 = metadata !{i32 995, i32 0, metadata !430, null}
!1961 = metadata !{metadata !1959, metadata !1840, i64 2}
!1962 = metadata !{i32 996, i32 0, metadata !430, null}
!1963 = metadata !{i32 997, i32 0, metadata !1964, null}
!1964 = metadata !{i32 786443, metadata !1, metadata !430, i32 997, i32 0, i32 218} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1965 = metadata !{i32 1000, i32 0, metadata !1966, null}
!1966 = metadata !{i32 786443, metadata !1, metadata !1964, i32 999, i32 0, i32 220} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1967 = metadata !{i32 1001, i32 0, metadata !1966, null}
!1968 = metadata !{i32 1006, i32 0, metadata !1969, null}
!1969 = metadata !{i32 786443, metadata !1, metadata !410, i32 1004, i32 0, i32 221} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1970 = metadata !{i32 1007, i32 0, metadata !1971, null}
!1971 = metadata !{i32 786443, metadata !1, metadata !1969, i32 1007, i32 0, i32 222} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1972 = metadata !{i32 1008, i32 0, metadata !1973, null}
!1973 = metadata !{i32 786443, metadata !1, metadata !1971, i32 1007, i32 0, i32 223} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1974 = metadata !{i32 1009, i32 0, metadata !1973, null}
!1975 = metadata !{i32 1011, i32 0, metadata !1976, null}
!1976 = metadata !{i32 786443, metadata !1, metadata !1971, i32 1010, i32 0, i32 224} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1977 = metadata !{i32 1012, i32 0, metadata !1976, null}
!1978 = metadata !{i32 1016, i32 0, metadata !440, null}
!1979 = metadata !{i32 1017, i32 0, metadata !440, null}
!1980 = metadata !{i32 1018, i32 0, metadata !1981, null}
!1981 = metadata !{i32 786443, metadata !1, metadata !440, i32 1018, i32 0, i32 226} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1982 = metadata !{i32 1019, i32 0, metadata !1983, null}
!1983 = metadata !{i32 786443, metadata !1, metadata !1984, i32 1019, i32 0, i32 228} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1984 = metadata !{i32 786443, metadata !1, metadata !1981, i32 1018, i32 0, i32 227} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1985 = metadata !{i32 1020, i32 0, metadata !1986, null}
!1986 = metadata !{i32 786443, metadata !1, metadata !1983, i32 1019, i32 0, i32 229} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1987 = metadata !{i32 1021, i32 0, metadata !1986, null}
!1988 = metadata !{i32 1024, i32 0, metadata !1984, null}
!1989 = metadata !{i32 1026, i32 0, metadata !1990, null}
!1990 = metadata !{i32 786443, metadata !1, metadata !1981, i32 1025, i32 0, i32 231} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1991 = metadata !{i32 1027, i32 0, metadata !1990, null}
!1992 = metadata !{i32 1031, i32 0, metadata !1993, null}
!1993 = metadata !{i32 786443, metadata !1, metadata !410, i32 1030, i32 0, i32 232} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!1994 = metadata !{i32 1032, i32 0, metadata !1993, null}
!1995 = metadata !{i32 1033, i32 0, metadata !1993, null}
!1996 = metadata !{i32 1036, i32 0, metadata !410, null}
!1997 = metadata !{i32 1037, i32 0, metadata !410, null}
!1998 = metadata !{i32 1038, i32 0, metadata !410, null}
!1999 = metadata !{i32 1041, i32 0, metadata !443, null}
!2000 = metadata !{i32 1042, i32 0, metadata !2001, null}
!2001 = metadata !{i32 786443, metadata !1, metadata !443, i32 1042, i32 0, i32 234} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2002 = metadata !{i32 1043, i32 0, metadata !2001, null}
!2003 = metadata !{i32 1046, i32 0, metadata !383, null}
!2004 = metadata !{i32 1048, i32 0, metadata !444, null}
!2005 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2006} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2006 = metadata !{i32 1049, i32 0, metadata !444, null}
!2007 = metadata !{i32 63, i32 0, metadata !650, metadata !2006}
!2008 = metadata !{i32 64, i32 0, metadata !657, metadata !2006}
!2009 = metadata !{i32 65, i32 0, metadata !656, metadata !2006}
!2010 = metadata !{i32 66, i32 0, metadata !876, metadata !2006}
!2011 = metadata !{i32 1050, i32 0, metadata !444, null}
!2012 = metadata !{i32 1053, i32 0, metadata !2013, null}
!2013 = metadata !{i32 786443, metadata !1, metadata !444, i32 1053, i32 0, i32 235} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2014 = metadata !{i32 1054, i32 0, metadata !2015, null}
!2015 = metadata !{i32 786443, metadata !1, metadata !2013, i32 1053, i32 0, i32 236} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2016 = metadata !{i32 1055, i32 0, metadata !2015, null}
!2017 = metadata !{i32 1058, i32 0, metadata !2018, null}
!2018 = metadata !{i32 786443, metadata !1, metadata !444, i32 1058, i32 0, i32 237} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2019 = metadata !{i32 1062, i32 0, metadata !2020, null}
!2020 = metadata !{i32 786443, metadata !1, metadata !2018, i32 1061, i32 0, i32 239} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2021 = metadata !{i32 1063, i32 0, metadata !2020, null}
!2022 = metadata !{i32 1064, i32 0, metadata !2020, null}
!2023 = metadata !{i32 1067, i32 0, metadata !457, null}
!2024 = metadata !{i32 1068, i32 0, metadata !456, null}
!2025 = metadata !{i32 1070, i32 0, metadata !454, null}
!2026 = metadata !{i32 1071, i32 0, metadata !2027, null}
!2027 = metadata !{i32 786443, metadata !1, metadata !454, i32 1071, i32 0, i32 244} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2028 = metadata !{i32 1}
!2029 = metadata !{i32 1072, i32 0, metadata !2027, null}
!2030 = metadata !{i32 1073, i32 0, metadata !454, null}
!2031 = metadata !{i32 1076, i32 0, metadata !2032, null}
!2032 = metadata !{i32 786443, metadata !1, metadata !455, i32 1075, i32 0, i32 245} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2033 = metadata !{i32 1077, i32 0, metadata !2034, null}
!2034 = metadata !{i32 786443, metadata !1, metadata !2032, i32 1077, i32 0, i32 246} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2035 = metadata !{i32 1078, i32 0, metadata !2034, null}
!2036 = metadata !{i32 1079, i32 0, metadata !2032, null}
!2037 = metadata !{i32 1091, i32 0, metadata !455, null}
!2038 = metadata !{i32 1092, i32 0, metadata !455, null}
!2039 = metadata !{i32 1093, i32 0, metadata !455, null}
!2040 = metadata !{i32 1096, i32 0, metadata !459, null}
!2041 = metadata !{i32 1097, i32 0, metadata !2042, null}
!2042 = metadata !{i32 786443, metadata !1, metadata !459, i32 1097, i32 0, i32 249} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2043 = metadata !{i32 1098, i32 0, metadata !2042, null}
!2044 = metadata !{i32 1101, i32 0, metadata !444, null}
!2045 = metadata !{i32 1103, i32 0, metadata !460, null}
!2046 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !2047} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2047 = metadata !{i32 1104, i32 0, metadata !460, null}
!2048 = metadata !{i32 39, i32 0, metadata !665, metadata !2047}
!2049 = metadata !{i32 40, i32 0, metadata !665, metadata !2047}
!2050 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !2047} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2051 = metadata !{i32 43, i32 0, metadata !698, metadata !2047}
!2052 = metadata !{i32 46, i32 0, metadata !676, metadata !2047}
!2053 = metadata !{i32 47, i32 0, metadata !674, metadata !2047}
!2054 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !2047} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2055 = metadata !{i32 48, i32 0, metadata !673, metadata !2047}
!2056 = metadata !{i32 49, i32 0, metadata !709, metadata !2047}
!2057 = metadata !{i32 1105, i32 0, metadata !2058, null}
!2058 = metadata !{i32 786443, metadata !1, metadata !460, i32 1105, i32 0, i32 250} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2059 = metadata !{i32 1107, i32 0, metadata !2060, null}
!2060 = metadata !{i32 786443, metadata !1, metadata !2058, i32 1105, i32 0, i32 251} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2061 = metadata !{i32 1108, i32 0, metadata !2060, null}
!2062 = metadata !{i32 1109, i32 0, metadata !2060, null}
!2063 = metadata !{i32 786689, metadata !612, metadata !"s", metadata !25, i32 16778644, metadata !29, i32 0, metadata !2064} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!2064 = metadata !{i32 1113, i32 0, metadata !498, null}
!2065 = metadata !{i32 1428, i32 0, metadata !612, metadata !2064}
!2066 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !2067} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2067 = metadata !{i32 1429, i32 0, metadata !612, metadata !2064}
!2068 = metadata !{i32 1415, i32 0, metadata !631, metadata !2067}
!2069 = metadata !{i32 1417, i32 0, metadata !631, metadata !2067}
!2070 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !2067} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2071 = metadata !{i32 1418, i32 0, metadata !631, metadata !2067}
!2072 = metadata !{i32 786688, metadata !612, metadata !"sc", metadata !25, i32 1429, metadata !43, i32 0, metadata !2064} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!2073 = metadata !{i32 786688, metadata !612, metadata !"i", metadata !25, i32 1430, metadata !41, i32 0, metadata !2064} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!2074 = metadata !{i32 1432, i32 0, metadata !621, metadata !2064}
!2075 = metadata !{i32 1433, i32 0, metadata !620, metadata !2064}
!2076 = metadata !{i32 786688, metadata !620, metadata !"c", metadata !25, i32 1433, metadata !31, i32 0, metadata !2064} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!2077 = metadata !{i32 1434, i32 0, metadata !624, metadata !2064}
!2078 = metadata !{i32 1435, i32 0, metadata !733, metadata !2064}
!2079 = metadata !{i32 1436, i32 0, metadata !736, metadata !2064}
!2080 = metadata !{i32 1437, i32 0, metadata !736, metadata !2064}
!2081 = metadata !{i32 1439, i32 0, metadata !739, metadata !2064}
!2082 = metadata !{i32 1440, i32 0, metadata !739, metadata !2064}
!2083 = metadata !{i32 1442, i32 0, metadata !623, metadata !2064}
!2084 = metadata !{i32 786688, metadata !623, metadata !"cc", metadata !25, i32 1442, metadata !31, i32 0, metadata !2064} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!2085 = metadata !{i32 1443, i32 0, metadata !623, metadata !2064}
!2086 = metadata !{i32 1444, i32 0, metadata !623, metadata !2064}
!2087 = metadata !{i32 1445, i32 0, metadata !747, metadata !2064}
!2088 = metadata !{i32 1114, i32 0, metadata !2089, null}
!2089 = metadata !{i32 786443, metadata !1, metadata !498, i32 1114, i32 0, i32 253} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2090 = metadata !{i32 1115, i32 0, metadata !2089, null}
!2091 = metadata !{i32 1118, i32 0, metadata !460, null}
!2092 = metadata !{i32 1120, i32 0, metadata !499, null}
!2093 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2094} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2094 = metadata !{i32 1121, i32 0, metadata !499, null}
!2095 = metadata !{i32 63, i32 0, metadata !650, metadata !2094}
!2096 = metadata !{i32 64, i32 0, metadata !657, metadata !2094}
!2097 = metadata !{i32 65, i32 0, metadata !656, metadata !2094}
!2098 = metadata !{i32 66, i32 0, metadata !876, metadata !2094}
!2099 = metadata !{i32 1123, i32 0, metadata !2100, null}
!2100 = metadata !{i32 786443, metadata !1, metadata !499, i32 1123, i32 0, i32 254} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2101 = metadata !{i32 1124, i32 0, metadata !2102, null}
!2102 = metadata !{i32 786443, metadata !1, metadata !2100, i32 1123, i32 0, i32 255} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2103 = metadata !{i32 1125, i32 0, metadata !2102, null}
!2104 = metadata !{i32 1128, i32 0, metadata !508, null}
!2105 = metadata !{i32 1129, i32 0, metadata !2106, null}
!2106 = metadata !{i32 786443, metadata !1, metadata !508, i32 1128, i32 0, i32 257} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2107 = metadata !{i32 1130, i32 0, metadata !2106, null}
!2108 = metadata !{i32 1131, i32 0, metadata !2106, null}
!2109 = metadata !{i32 1133, i32 0, metadata !507, null}
!2110 = metadata !{i32 1134, i32 0, metadata !2111, null}
!2111 = metadata !{i32 786443, metadata !1, metadata !507, i32 1134, i32 0, i32 259} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2112 = metadata !{i32 1135, i32 0, metadata !2111, null}
!2113 = metadata !{i32 1138, i32 0, metadata !499, null}
!2114 = metadata !{i32 1140, i32 0, metadata !509, null}
!2115 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2116} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2116 = metadata !{i32 1141, i32 0, metadata !509, null}
!2117 = metadata !{i32 63, i32 0, metadata !650, metadata !2116}
!2118 = metadata !{i32 64, i32 0, metadata !657, metadata !2116}
!2119 = metadata !{i32 65, i32 0, metadata !656, metadata !2116}
!2120 = metadata !{i32 66, i32 0, metadata !876, metadata !2116}
!2121 = metadata !{i32 1143, i32 0, metadata !516, null}
!2122 = metadata !{i32 1144, i32 0, metadata !2123, null}
!2123 = metadata !{i32 786443, metadata !1, metadata !516, i32 1143, i32 0, i32 261} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2124 = metadata !{i32 1145, i32 0, metadata !2123, null}
!2125 = metadata !{i32 1146, i32 0, metadata !515, null}
!2126 = metadata !{i32 1149, i32 0, metadata !514, null}
!2127 = metadata !{i32 1150, i32 0, metadata !2128, null}
!2128 = metadata !{i32 786443, metadata !1, metadata !514, i32 1150, i32 0, i32 265} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2129 = metadata !{i32 1151, i32 0, metadata !2128, null}
!2130 = metadata !{i32 1154, i32 0, metadata !509, null}
!2131 = metadata !{i32 1156, i32 0, metadata !517, null}
!2132 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2133} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2133 = metadata !{i32 1157, i32 0, metadata !517, null}
!2134 = metadata !{i32 63, i32 0, metadata !650, metadata !2133}
!2135 = metadata !{i32 64, i32 0, metadata !657, metadata !2133}
!2136 = metadata !{i32 65, i32 0, metadata !656, metadata !2133}
!2137 = metadata !{i32 66, i32 0, metadata !876, metadata !2133}
!2138 = metadata !{i32 1159, i32 0, metadata !524, null}
!2139 = metadata !{i32 1160, i32 0, metadata !2140, null}
!2140 = metadata !{i32 786443, metadata !1, metadata !524, i32 1159, i32 0, i32 267} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2141 = metadata !{i32 1161, i32 0, metadata !2140, null}
!2142 = metadata !{i32 1163, i32 0, metadata !523, null}
!2143 = metadata !{i32 1164, i32 0, metadata !2144, null}
!2144 = metadata !{i32 786443, metadata !1, metadata !523, i32 1164, i32 0, i32 269} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2145 = metadata !{i32 786689, metadata !159, metadata !"fd", metadata !25, i32 16777519, metadata !28, i32 0, metadata !2143} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!2146 = metadata !{i32 303, i32 0, metadata !159, metadata !2143}
!2147 = metadata !{i32 786688, metadata !159, metadata !"r", metadata !25, i32 306, metadata !28, i32 0, metadata !2143} ; [ DW_TAG_auto_variable ] [r] [line 306]
!2148 = metadata !{i32 306, i32 0, metadata !159, metadata !2143}
!2149 = metadata !{i32 308, i32 0, metadata !159, metadata !2143}
!2150 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2151} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2151 = metadata !{i32 310, i32 0, metadata !159, metadata !2143}
!2152 = metadata !{i32 63, i32 0, metadata !650, metadata !2151}
!2153 = metadata !{i32 64, i32 0, metadata !657, metadata !2151}
!2154 = metadata !{i32 311, i32 0, metadata !1089, metadata !2143}
!2155 = metadata !{i32 786688, metadata !159, metadata !"f", metadata !25, i32 305, metadata !104, i32 0, metadata !2143} ; [ DW_TAG_auto_variable ] [f] [line 305]
!2156 = metadata !{i32 312, i32 0, metadata !1091, metadata !2143}
!2157 = metadata !{i32 313, i32 0, metadata !1091, metadata !2143}
!2158 = metadata !{i32 316, i32 0, metadata !1094, metadata !2143}
!2159 = metadata !{i32 317, i32 0, metadata !1098, metadata !2143}
!2160 = metadata !{i32 318, i32 0, metadata !1098, metadata !2143}
!2161 = metadata !{i32 319, i32 0, metadata !1098, metadata !2143}
!2162 = metadata !{i32 330, i32 0, metadata !159, metadata !2143}
!2163 = metadata !{i32 332, i32 0, metadata !159, metadata !2143}
!2164 = metadata !{i32 1168, i32 0, metadata !523, null}
!2165 = metadata !{i64 0, i64 4, metadata !751, i64 4, i64 4, metadata !751, i64 8, i64 8, metadata !2166, i64 16, i64 8, metadata !2167}
!2166 = metadata !{metadata !714, metadata !714, i64 0}
!2167 = metadata !{metadata !703, metadata !703, i64 0}
!2168 = metadata !{i32 1170, i32 0, metadata !523, null}
!2169 = metadata !{i32 1177, i32 0, metadata !523, null}
!2170 = metadata !{i32 1179, i32 0, metadata !517, null}
!2171 = metadata !{i32 1181, i32 0, metadata !525, null}
!2172 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2173} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2173 = metadata !{i32 1182, i32 0, metadata !525, null}
!2174 = metadata !{i32 63, i32 0, metadata !650, metadata !2173}
!2175 = metadata !{i32 64, i32 0, metadata !657, metadata !2173}
!2176 = metadata !{i32 65, i32 0, metadata !656, metadata !2173}
!2177 = metadata !{i32 66, i32 0, metadata !876, metadata !2173}
!2178 = metadata !{i32 1183, i32 0, metadata !531, null}
!2179 = metadata !{i32 1184, i32 0, metadata !2180, null}
!2180 = metadata !{i32 786443, metadata !1, metadata !531, i32 1183, i32 0, i32 271} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2181 = metadata !{i32 1185, i32 0, metadata !2180, null}
!2182 = metadata !{i32 1188, i32 0, metadata !2183, null}
!2183 = metadata !{i32 786443, metadata !1, metadata !530, i32 1188, i32 0, i32 273} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2184 = metadata !{i32 1189, i32 0, metadata !2185, null}
!2185 = metadata !{i32 786443, metadata !1, metadata !2183, i32 1189, i32 0, i32 274} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2186 = metadata !{i32 1191, i32 0, metadata !2187, null}
!2187 = metadata !{i32 786443, metadata !1, metadata !530, i32 1191, i32 0, i32 275} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2188 = metadata !{i32 1192, i32 0, metadata !2189, null}
!2189 = metadata !{i32 786443, metadata !1, metadata !2187, i32 1191, i32 0, i32 276} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2190 = metadata !{i32 1193, i32 0, metadata !2189, null}
!2191 = metadata !{i32 1195, i32 0, metadata !2192, null}
!2192 = metadata !{i32 786443, metadata !1, metadata !2187, i32 1194, i32 0, i32 277} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2193 = metadata !{i32 1198, i32 0, metadata !525, null}
!2194 = metadata !{i32 1200, i32 0, metadata !532, null}
!2195 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !2196} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2196 = metadata !{i32 1201, i32 0, metadata !532, null}
!2197 = metadata !{i32 39, i32 0, metadata !665, metadata !2196}
!2198 = metadata !{i32 40, i32 0, metadata !665, metadata !2196}
!2199 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !2196} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2200 = metadata !{i32 43, i32 0, metadata !698, metadata !2196}
!2201 = metadata !{i32 46, i32 0, metadata !676, metadata !2196}
!2202 = metadata !{i32 47, i32 0, metadata !674, metadata !2196}
!2203 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !2196} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2204 = metadata !{i32 48, i32 0, metadata !673, metadata !2196}
!2205 = metadata !{i32 49, i32 0, metadata !709, metadata !2196}
!2206 = metadata !{i32 1202, i32 0, metadata !2207, null}
!2207 = metadata !{i32 786443, metadata !1, metadata !532, i32 1202, i32 0, i32 278} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2208 = metadata !{i32 1204, i32 0, metadata !2209, null}
!2209 = metadata !{i32 786443, metadata !1, metadata !2210, i32 1204, i32 0, i32 280} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2210 = metadata !{i32 786443, metadata !1, metadata !2207, i32 1202, i32 0, i32 279} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2211 = metadata !{i32 1205, i32 0, metadata !2212, null}
!2212 = metadata !{i32 786443, metadata !1, metadata !2209, i32 1204, i32 0, i32 281} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2213 = metadata !{i32 1206, i32 0, metadata !2212, null}
!2214 = metadata !{i32 1208, i32 0, metadata !2215, null}
!2215 = metadata !{i32 786443, metadata !1, metadata !2209, i32 1207, i32 0, i32 282} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2216 = metadata !{i32 1209, i32 0, metadata !2215, null}
!2217 = metadata !{i32 1213, i32 0, metadata !532, null}
!2218 = metadata !{i32 1214, i32 0, metadata !532, null}
!2219 = metadata !{i32 1215, i32 0, metadata !532, null}
!2220 = metadata !{i32 1216, i32 0, metadata !532, null}
!2221 = metadata !{i32 1218, i32 0, metadata !536, null}
!2222 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !2223} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2223 = metadata !{i32 1219, i32 0, metadata !536, null}
!2224 = metadata !{i32 39, i32 0, metadata !665, metadata !2223}
!2225 = metadata !{i32 40, i32 0, metadata !665, metadata !2223}
!2226 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !2223} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2227 = metadata !{i32 43, i32 0, metadata !698, metadata !2223}
!2228 = metadata !{i32 46, i32 0, metadata !676, metadata !2223}
!2229 = metadata !{i32 47, i32 0, metadata !674, metadata !2223}
!2230 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !2223} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2231 = metadata !{i32 48, i32 0, metadata !673, metadata !2223}
!2232 = metadata !{i32 49, i32 0, metadata !709, metadata !2223}
!2233 = metadata !{i32 1220, i32 0, metadata !2234, null}
!2234 = metadata !{i32 786443, metadata !1, metadata !536, i32 1220, i32 0, i32 283} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2235 = metadata !{i32 1222, i32 0, metadata !2236, null}
!2236 = metadata !{i32 786443, metadata !1, metadata !2237, i32 1222, i32 0, i32 285} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2237 = metadata !{i32 786443, metadata !1, metadata !2234, i32 1220, i32 0, i32 284} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2238 = metadata !{i32 1223, i32 0, metadata !2239, null}
!2239 = metadata !{i32 786443, metadata !1, metadata !2236, i32 1222, i32 0, i32 286} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2240 = metadata !{i32 1224, i32 0, metadata !2239, null}
!2241 = metadata !{i32 1225, i32 0, metadata !2242, null}
!2242 = metadata !{i32 786443, metadata !1, metadata !2236, i32 1225, i32 0, i32 287} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2243 = metadata !{i32 1226, i32 0, metadata !2244, null}
!2244 = metadata !{i32 786443, metadata !1, metadata !2242, i32 1225, i32 0, i32 288} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2245 = metadata !{i32 1227, i32 0, metadata !2244, null}
!2246 = metadata !{i32 1229, i32 0, metadata !2247, null}
!2247 = metadata !{i32 786443, metadata !1, metadata !2242, i32 1228, i32 0, i32 289} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2248 = metadata !{i32 1230, i32 0, metadata !2247, null}
!2249 = metadata !{i32 1234, i32 0, metadata !536, null}
!2250 = metadata !{i32 1235, i32 0, metadata !536, null}
!2251 = metadata !{i32 1236, i32 0, metadata !536, null}
!2252 = metadata !{i32 1237, i32 0, metadata !536, null}
!2253 = metadata !{i32 1239, i32 0, metadata !540, null}
!2254 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !2255} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2255 = metadata !{i32 1242, i32 0, metadata !540, null}
!2256 = metadata !{i32 39, i32 0, metadata !665, metadata !2255}
!2257 = metadata !{i32 40, i32 0, metadata !665, metadata !2255}
!2258 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !2255} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2259 = metadata !{i32 43, i32 0, metadata !698, metadata !2255}
!2260 = metadata !{i32 46, i32 0, metadata !676, metadata !2255}
!2261 = metadata !{i32 47, i32 0, metadata !674, metadata !2255}
!2262 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !2255} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2263 = metadata !{i32 48, i32 0, metadata !673, metadata !2255}
!2264 = metadata !{i32 49, i32 0, metadata !709, metadata !2255}
!2265 = metadata !{i32 1243, i32 0, metadata !2266, null}
!2266 = metadata !{i32 786443, metadata !1, metadata !540, i32 1243, i32 0, i32 290} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2267 = metadata !{i32 1245, i32 0, metadata !2268, null}
!2268 = metadata !{i32 786443, metadata !1, metadata !2269, i32 1245, i32 0, i32 292} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2269 = metadata !{i32 786443, metadata !1, metadata !2266, i32 1243, i32 0, i32 291} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2270 = metadata !{i32 1246, i32 0, metadata !2271, null}
!2271 = metadata !{i32 786443, metadata !1, metadata !2268, i32 1245, i32 0, i32 293} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2272 = metadata !{i32 1247, i32 0, metadata !2271, null}
!2273 = metadata !{i32 1248, i32 0, metadata !2274, null}
!2274 = metadata !{i32 786443, metadata !1, metadata !2268, i32 1248, i32 0, i32 294} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2275 = metadata !{i32 1249, i32 0, metadata !2276, null}
!2276 = metadata !{i32 786443, metadata !1, metadata !2274, i32 1248, i32 0, i32 295} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2277 = metadata !{i32 1250, i32 0, metadata !2276, null}
!2278 = metadata !{i32 1252, i32 0, metadata !2279, null}
!2279 = metadata !{i32 786443, metadata !1, metadata !2274, i32 1251, i32 0, i32 296} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2280 = metadata !{i32 1253, i32 0, metadata !2279, null}
!2281 = metadata !{i32 1257, i32 0, metadata !540, null}
!2282 = metadata !{i32 1258, i32 0, metadata !540, null}
!2283 = metadata !{i32 1259, i32 0, metadata !540, null}
!2284 = metadata !{i32 1260, i32 0, metadata !540, null}
!2285 = metadata !{i32 1262, i32 0, metadata !548, null}
!2286 = metadata !{i32 786689, metadata !665, metadata !"pathname", metadata !25, i32 16777255, metadata !29, i32 0, metadata !2287} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2287 = metadata !{i32 1263, i32 0, metadata !548, null}
!2288 = metadata !{i32 39, i32 0, metadata !665, metadata !2287}
!2289 = metadata !{i32 40, i32 0, metadata !665, metadata !2287}
!2290 = metadata !{i32 786688, metadata !665, metadata !"c", metadata !25, i32 40, metadata !31, i32 0, metadata !2287} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2291 = metadata !{i32 43, i32 0, metadata !698, metadata !2287}
!2292 = metadata !{i32 46, i32 0, metadata !676, metadata !2287}
!2293 = metadata !{i32 47, i32 0, metadata !674, metadata !2287}
!2294 = metadata !{i32 786688, metadata !665, metadata !"i", metadata !25, i32 41, metadata !41, i32 0, metadata !2287} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2295 = metadata !{i32 48, i32 0, metadata !673, metadata !2287}
!2296 = metadata !{i32 49, i32 0, metadata !709, metadata !2287}
!2297 = metadata !{i32 1264, i32 0, metadata !558, null}
!2298 = metadata !{i32 1267, i32 0, metadata !2299, null}
!2299 = metadata !{i32 786443, metadata !1, metadata !2300, i32 1267, i32 0, i32 299} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2300 = metadata !{i32 786443, metadata !1, metadata !558, i32 1264, i32 0, i32 298} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2301 = metadata !{i32 1268, i32 0, metadata !2302, null}
!2302 = metadata !{i32 786443, metadata !1, metadata !2299, i32 1267, i32 0, i32 300} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2303 = metadata !{i32 1269, i32 0, metadata !2304, null}
!2304 = metadata !{i32 786443, metadata !1, metadata !2302, i32 1269, i32 0, i32 301} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2305 = metadata !{i32 1270, i32 0, metadata !2306, null}
!2306 = metadata !{i32 786443, metadata !1, metadata !2302, i32 1270, i32 0, i32 302} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2307 = metadata !{i32 1271, i32 0, metadata !2308, null}
!2308 = metadata !{i32 786443, metadata !1, metadata !2302, i32 1271, i32 0, i32 303} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2309 = metadata !{i32 1272, i32 0, metadata !2310, null}
!2310 = metadata !{i32 786443, metadata !1, metadata !2302, i32 1272, i32 0, i32 304} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2311 = metadata !{i32 1273, i32 0, metadata !2302, null}
!2312 = metadata !{i32 1275, i32 0, metadata !2313, null}
!2313 = metadata !{i32 786443, metadata !1, metadata !2299, i32 1274, i32 0, i32 305} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2314 = metadata !{i32 1276, i32 0, metadata !2313, null}
!2315 = metadata !{i32 1279, i32 0, metadata !557, null}
!2316 = metadata !{i32 1280, i32 0, metadata !2317, null}
!2317 = metadata !{i32 786443, metadata !1, metadata !557, i32 1280, i32 0, i32 307} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2318 = metadata !{i32 1281, i32 0, metadata !2317, null}
!2319 = metadata !{i32 1282, i32 0, metadata !557, null}
!2320 = metadata !{i32 1284, i32 0, metadata !548, null}
!2321 = metadata !{i32 1294, i32 0, metadata !559, null}
!2322 = metadata !{i32 1295, i32 0, metadata !559, null}
!2323 = metadata !{i32 1296, i32 0, metadata !559, null}
!2324 = metadata !{i32 1297, i32 0, metadata !559, null}
!2325 = metadata !{i32 1299, i32 0, metadata !2326, null}
!2326 = metadata !{i32 786443, metadata !1, metadata !559, i32 1299, i32 0, i32 308} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2327 = metadata !{i32 1300, i32 0, metadata !2328, null}
!2328 = metadata !{i32 786443, metadata !1, metadata !2326, i32 1299, i32 0, i32 309} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2329 = metadata !{i64 0, i64 128, metadata !693}
!2330 = metadata !{i32 1301, i32 0, metadata !2328, null}
!2331 = metadata !{i32 1302, i32 0, metadata !2328, null}
!2332 = metadata !{i32 1303, i32 0, metadata !2333, null}
!2333 = metadata !{i32 786443, metadata !1, metadata !2326, i32 1302, i32 0, i32 310} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2334 = metadata !{i32 1306, i32 0, metadata !2335, null}
!2335 = metadata !{i32 786443, metadata !1, metadata !559, i32 1306, i32 0, i32 311} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2336 = metadata !{i32 1307, i32 0, metadata !2337, null}
!2337 = metadata !{i32 786443, metadata !1, metadata !2335, i32 1306, i32 0, i32 312} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2338 = metadata !{i32 1308, i32 0, metadata !2337, null}
!2339 = metadata !{i32 1309, i32 0, metadata !2337, null}
!2340 = metadata !{i32 1310, i32 0, metadata !2341, null}
!2341 = metadata !{i32 786443, metadata !1, metadata !2335, i32 1309, i32 0, i32 313} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2342 = metadata !{i32 1313, i32 0, metadata !2343, null}
!2343 = metadata !{i32 786443, metadata !1, metadata !559, i32 1313, i32 0, i32 314} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2344 = metadata !{i32 1314, i32 0, metadata !2345, null}
!2345 = metadata !{i32 786443, metadata !1, metadata !2343, i32 1313, i32 0, i32 315} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2346 = metadata !{i32 1315, i32 0, metadata !2345, null}
!2347 = metadata !{i32 1316, i32 0, metadata !2345, null}
!2348 = metadata !{i32 1317, i32 0, metadata !2349, null}
!2349 = metadata !{i32 786443, metadata !1, metadata !2343, i32 1316, i32 0, i32 316} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2350 = metadata !{i32 1320, i32 0, metadata !559, null}
!2351 = metadata !{i32 1321, i32 0, metadata !559, null}
!2352 = metadata !{i32 1322, i32 0, metadata !559, null}
!2353 = metadata !{i32 1325, i32 0, metadata !592, null}
!2354 = metadata !{i32 1326, i32 0, metadata !590, null}
!2355 = metadata !{i32 undef}
!2356 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2357} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2357 = metadata !{i32 1327, i32 0, metadata !589, null}
!2358 = metadata !{i32 63, i32 0, metadata !650, metadata !2357}
!2359 = metadata !{i32 64, i32 0, metadata !657, metadata !2357}
!2360 = metadata !{i32 66, i32 0, metadata !876, metadata !2357}
!2361 = metadata !{i32 65, i32 0, metadata !656, metadata !2357}
!2362 = metadata !{i32 1328, i32 0, metadata !2363, null}
!2363 = metadata !{i32 786443, metadata !1, metadata !589, i32 1328, i32 0, i32 321} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2364 = metadata !{i32 1329, i32 0, metadata !2365, null}
!2365 = metadata !{i32 786443, metadata !1, metadata !2363, i32 1328, i32 0, i32 322} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2366 = metadata !{i32 1330, i32 0, metadata !2365, null}
!2367 = metadata !{i32 1331, i32 0, metadata !2368, null}
!2368 = metadata !{i32 786443, metadata !1, metadata !2363, i32 1331, i32 0, i32 323} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2369 = metadata !{i32 1333, i32 0, metadata !2370, null}
!2370 = metadata !{i32 786443, metadata !1, metadata !2371, i32 1333, i32 0, i32 325} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2371 = metadata !{i32 786443, metadata !1, metadata !2368, i32 1331, i32 0, i32 324} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2372 = metadata !{i32 1334, i32 0, metadata !2373, null}
!2373 = metadata !{i32 786443, metadata !1, metadata !2371, i32 1334, i32 0, i32 326} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2374 = metadata !{i32 1335, i32 0, metadata !2375, null}
!2375 = metadata !{i32 786443, metadata !1, metadata !2371, i32 1335, i32 0, i32 327} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2376 = metadata !{i32 1336, i32 0, metadata !2371, null}
!2377 = metadata !{i32 1337, i32 0, metadata !2371, null}
!2378 = metadata !{i32 1338, i32 0, metadata !2379, null}
!2379 = metadata !{i32 786443, metadata !1, metadata !2380, i32 1338, i32 0, i32 329} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2380 = metadata !{i32 786443, metadata !1, metadata !2368, i32 1337, i32 0, i32 328} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2381 = metadata !{i32 1339, i32 0, metadata !2382, null}
!2382 = metadata !{i32 786443, metadata !1, metadata !2380, i32 1339, i32 0, i32 330} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2383 = metadata !{i32 1340, i32 0, metadata !2384, null}
!2384 = metadata !{i32 786443, metadata !1, metadata !2380, i32 1340, i32 0, i32 331} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2385 = metadata !{i32 1341, i32 0, metadata !2386, null}
!2386 = metadata !{i32 786443, metadata !1, metadata !2380, i32 1341, i32 0, i32 332} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2387 = metadata !{i32 1346, i32 0, metadata !595, null}
!2388 = metadata !{i32 1349, i32 0, metadata !594, null}
!2389 = metadata !{i32 1350, i32 0, metadata !594, null}
!2390 = metadata !{i32 1353, i32 0, metadata !601, null}
!2391 = metadata !{i32 1356, i32 0, metadata !2392, null}
!2392 = metadata !{i32 786443, metadata !1, metadata !2393, i32 1356, i32 0, i32 337} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2393 = metadata !{i32 786443, metadata !1, metadata !601, i32 1353, i32 0, i32 336} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2394 = metadata !{i32 1357, i32 0, metadata !2395, null}
!2395 = metadata !{i32 786443, metadata !1, metadata !2392, i32 1356, i32 0, i32 338} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2396 = metadata !{i32 1358, i32 0, metadata !2395, null}
!2397 = metadata !{i32 1361, i32 0, metadata !600, null}
!2398 = metadata !{i32 1364, i32 0, metadata !599, null}
!2399 = metadata !{i32 786689, metadata !650, metadata !"fd", metadata !25, i32 16777279, metadata !28, i32 0, metadata !2400} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2400 = metadata !{i32 1365, i32 0, metadata !598, null}
!2401 = metadata !{i32 63, i32 0, metadata !650, metadata !2400}
!2402 = metadata !{i32 64, i32 0, metadata !657, metadata !2400}
!2403 = metadata !{i32 66, i32 0, metadata !876, metadata !2400}
!2404 = metadata !{i32 65, i32 0, metadata !656, metadata !2400}
!2405 = metadata !{i32 1366, i32 0, metadata !2406, null}
!2406 = metadata !{i32 786443, metadata !1, metadata !598, i32 1366, i32 0, i32 342} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2407 = metadata !{i32 1367, i32 0, metadata !2408, null}
!2408 = metadata !{i32 786443, metadata !1, metadata !2409, i32 1367, i32 0, i32 344} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2409 = metadata !{i32 786443, metadata !1, metadata !2406, i32 1366, i32 0, i32 343} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2410 = metadata !{i32 1368, i32 0, metadata !2411, null}
!2411 = metadata !{i32 786443, metadata !1, metadata !2409, i32 1368, i32 0, i32 345} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2412 = metadata !{i32 1369, i32 0, metadata !2413, null}
!2413 = metadata !{i32 786443, metadata !1, metadata !2409, i32 1369, i32 0, i32 346} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2414 = metadata !{i32 1376, i32 0, metadata !559, null}
!2415 = metadata !{i32 1380, i32 0, metadata !602, null}
!2416 = metadata !{i32 1384, i32 0, metadata !602, null}
!2417 = metadata !{i32 1386, i32 0, metadata !2418, null}
!2418 = metadata !{i32 786443, metadata !1, metadata !602, i32 1386, i32 0, i32 347} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2419 = metadata !{metadata !701, metadata !703, i64 80}
!2420 = metadata !{i32 1387, i32 0, metadata !2421, null}
!2421 = metadata !{i32 786443, metadata !1, metadata !2418, i32 1386, i32 0, i32 348} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2422 = metadata !{i32 1388, i32 0, metadata !2421, null}
!2423 = metadata !{i32 1389, i32 0, metadata !2421, null}
!2424 = metadata !{i32 1392, i32 0, metadata !2425, null}
!2425 = metadata !{i32 786443, metadata !1, metadata !602, i32 1392, i32 0, i32 349} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2426 = metadata !{i32 1393, i32 0, metadata !2427, null}
!2427 = metadata !{i32 786443, metadata !1, metadata !2428, i32 1393, i32 0, i32 351} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2428 = metadata !{i32 786443, metadata !1, metadata !2425, i32 1392, i32 0, i32 350} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2429 = metadata !{i64 1024}
!2430 = metadata !{i32 1394, i32 0, metadata !2427, null}
!2431 = metadata !{i32 1395, i32 0, metadata !2428, null}
!2432 = metadata !{i32 1396, i32 0, metadata !2428, null}
!2433 = metadata !{i32 786689, metadata !631, metadata !"p", metadata !25, i32 16778631, metadata !184, i32 0, metadata !2434} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2434 = metadata !{i32 1398, i32 0, metadata !602, null}
!2435 = metadata !{i32 1415, i32 0, metadata !631, metadata !2434}
!2436 = metadata !{i32 1417, i32 0, metadata !631, metadata !2434}
!2437 = metadata !{i32 786688, metadata !631, metadata !"pc", metadata !25, i32 1417, metadata !43, i32 0, metadata !2434} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2438 = metadata !{i32 1418, i32 0, metadata !631, metadata !2434}
!2439 = metadata !{i32 786689, metadata !625, metadata !"s", metadata !25, i32 16778638, metadata !172, i32 0, metadata !2440} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!2440 = metadata !{i32 1399, i32 0, metadata !602, null}
!2441 = metadata !{i32 1422, i32 0, metadata !625, metadata !2440}
!2442 = metadata !{i32 1423, i32 0, metadata !625, metadata !2440}
!2443 = metadata !{i32 786688, metadata !625, metadata !"sc", metadata !25, i32 1423, metadata !172, i32 0, metadata !2440} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!2444 = metadata !{i32 1424, i32 0, metadata !625, metadata !2440}
!2445 = metadata !{i32 1403, i32 0, metadata !602, null}
!2446 = metadata !{i32 1404, i32 0, metadata !602, null}
!2447 = metadata !{i32 1405, i32 0, metadata !2448, null}
!2448 = metadata !{i32 786443, metadata !1, metadata !602, i32 1405, i32 0, i32 352} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2449 = metadata !{i32 1406, i32 0, metadata !2450, null}
!2450 = metadata !{i32 786443, metadata !1, metadata !2448, i32 1405, i32 0, i32 353} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2451 = metadata !{i32 1407, i32 0, metadata !2450, null}
!2452 = metadata !{i32 1411, i32 0, metadata !602, null}
!2453 = metadata !{i32 1457, i32 0, metadata !609, null}
!2454 = metadata !{i32 1458, i32 0, metadata !2455, null}
!2455 = metadata !{i32 786443, metadata !1, metadata !609, i32 1458, i32 0, i32 354} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2456 = metadata !{i32 1459, i32 0, metadata !2457, null}
!2457 = metadata !{i32 786443, metadata !1, metadata !2455, i32 1458, i32 0, i32 355} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2458 = metadata !{i32 1460, i32 0, metadata !2457, null}
!2459 = metadata !{i32 1463, i32 0, metadata !2460, null}
!2460 = metadata !{i32 786443, metadata !1, metadata !609, i32 1463, i32 0, i32 356} ; [ DW_TAG_lexical_block ] [/home/fptesting/FPTesting/src/klee-float/build/runtime/POSIX//home/fptesting/FPTesting/src/klee-float/runtime/POSIX/fd.c]
!2461 = metadata !{i32 1467, i32 0, metadata !609, null}
!2462 = metadata !{i32 1468, i32 0, metadata !609, null}
!2463 = metadata !{i32 1469, i32 0, metadata !609, null}
!2464 = metadata !{i32 1470, i32 0, metadata !609, null}

; RUN: opt -S -simplifycfg < %s | FileCheck %s
; Radar 9342286
; Assign DebugLoc to trap instruction.
define void @foo() nounwind ssp {
; CHECK: call void @llvm.trap(), !dbg
  store i32 42, i32* null, !dbg !5
  ret void, !dbg !7
}

!llvm.dbg.cu = !{!2}
!llvm.dbg.sp = !{!0}

!0 = metadata !{i32 589870, metadata !8, metadata !1, metadata !"foo", metadata !"foo", metadata !"", i32 3, metadata !3, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, void ()* @foo, null, null, null, i32 0} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !8} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, metadata !8, i32 12, metadata !"Apple clang version 3.0 (tags/Apple/clang-206.1) (based on LLVM 3.0svn)", i1 true, metadata !"", i32 0, metadata !4, metadata !4, metadata !9, null, null, metadata !""} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !8, metadata !1, metadata !"", i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !4, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null}
!5 = metadata !{i32 4, i32 2, metadata !6, null}
!6 = metadata !{i32 589835, metadata !8, metadata !0, i32 3, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!7 = metadata !{i32 5, i32 1, metadata !6, null}
!8 = metadata !{metadata !"foo.c", metadata !"/private/tmp"}
!9 = metadata !{metadata !0}

; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instsimplify -S | FileCheck %s

define <2 x i1> @test1(<2 x i1> %a) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    ret <2 x i1> zeroinitializer
;
  %b = and <2 x i1> %a, <i1 true, i1 false>
  %res = mul <2 x i1> %b, <i1 false, i1 true>
  ret <2 x i1> %res
}
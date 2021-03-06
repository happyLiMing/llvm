; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-unknown-unknown | FileCheck %s

; computeKnownBits determines that we don't need a mask op that is required in the general case.

define i8 @foo(i8 %tmp325) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; CHECK-NEXT:    imull $111, %ecx, %eax
; CHECK-NEXT:    shrl $12, %eax
; CHECK-NEXT:    movzwl %ax, %eax
; CHECK-NEXT:    movb $37, %dl
; CHECK-NEXT:    # kill: %al<def> %al<kill> %eax<kill>
; CHECK-NEXT:    mulb %dl
; CHECK-NEXT:    subb %al, %cl
; CHECK-NEXT:    movl %ecx, %eax
; CHECK-NEXT:    retl
  %t546 = urem i8 %tmp325, 37
  ret i8 %t546
}


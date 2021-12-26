	.file ""
	.section .rodata.cst8,"a",@progbits
	.align	16
caml_negf_mask:
	.quad	0x8000000000000000
	.quad	0
	.align	16
caml_absf_mask:
	.quad	0x7fffffffffffffff
	.quad	-1
	.data
	.globl	camlPoly__data_begin
camlPoly__data_begin:
	.text
	.globl	camlPoly__code_begin
camlPoly__code_begin:
	.data
	.align	8
	.quad	1792
	.globl	camlPoly
camlPoly:
	.quad	1
	.data
	.align	8
	.globl	camlPoly__gc_roots
camlPoly__gc_roots:
	.quad	camlPoly
	.quad	0
	.text
	.align	16
	.globl	camlPoly__max_80
camlPoly__max_80:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L102:
	movq	%rax, 8(%rsp)
	movq	%rbx, (%rsp)
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	caml_greaterthan@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L100:
	movq	caml_young_ptr@GOTPCREL(%rip), %r11
	movq	(%r11), %r15
	cmpq	$1, %rax
	je	.L101
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.align	4
.L101:
	movq	(%rsp), %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlPoly__max_80,@function
	.size camlPoly__max_80,. - camlPoly__max_80
	.data
	.align	8
	.quad	4087
camlPoly__1:
	.quad	caml_curry2
	.quad	5
	.quad	camlPoly__max_80
	.text
	.align	16
	.globl	camlPoly__entry
camlPoly__entry:
	.cfi_startproc
.L103:
	movq	camlPoly__1@GOTPCREL(%rip), %rax
	movq	camlPoly@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	$1, %rax
	ret
	.cfi_endproc
	.type camlPoly__entry,@function
	.size camlPoly__entry,. - camlPoly__entry
	.data
	.align	8
	.text
	.globl	camlPoly__code_end
camlPoly__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlPoly__data_end
camlPoly__data_end:
	.quad	0
	.align	8
	.globl	camlPoly__frametable
camlPoly__frametable:
	.quad	1
	.quad	.L100
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L104
	.align	8
.L104:
	.long	(.L105 - .) + 1476395008
	.long	4368
	.quad	0
.L105:
	.ascii	"poly.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits

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
	.globl	camlTail__data_begin
camlTail__data_begin:
	.text
	.globl	camlTail__code_begin
camlTail__code_begin:
	.data
	.align	8
	.quad	1792
	.globl	camlTail
camlTail:
	.quad	1
	.data
	.align	8
	.globl	camlTail__gc_roots
camlTail__gc_roots:
	.quad	camlTail
	.quad	0
	.text
	.align	16
	.globl	camlTail__loop_80
camlTail__loop_80:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L102:
	movq	camlTail__1@GOTPCREL(%rip), %rbx
	movq	camlStdlib@GOTPCREL(%rip), %rax
	movq	304(%rax), %rax
	call	camlStdlib__output_string_224@PLT
.L100:
	movq	$1, %rax
	jmp	.L102
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlTail__loop_80,@function
	.size camlTail__loop_80,. - camlTail__loop_80
	.data
	.align	8
	.quad	4092
camlTail__1:
	.ascii	"I go on forever ..."
	.space	4
	.byte	4
	.data
	.align	8
	.quad	3063
camlTail__2:
	.quad	camlTail__loop_80
	.quad	3
	.text
	.align	16
	.globl	camlTail__entry
camlTail__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L104:
	movq	camlTail__2@GOTPCREL(%rip), %rax
	movq	camlTail@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	$1, %rax
	call	camlTail__loop_80@PLT
.L103:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlTail__entry,@function
	.size camlTail__entry,. - camlTail__entry
	.data
	.align	8
	.text
	.globl	camlTail__code_end
camlTail__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlTail__data_end
camlTail__data_end:
	.quad	0
	.align	8
	.globl	camlTail__frametable
camlTail__frametable:
	.quad	2
	.quad	.L103
	.word	17
	.word	0
	.align	8
	.quad	.L105
	.quad	.L100
	.word	17
	.word	0
	.align	8
	.quad	.L106
	.align	8
.L106:
	.long	(.L107 - .) + -1409286144
	.long	1966416
	.quad	0
	.align	8
.L105:
	.long	(.L108 - .) + 1073741824
	.long	20624
	.quad	0
.L107:
	.ascii	"stdlib.ml\0"
	.align	8
.L108:
	.ascii	"tail.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits

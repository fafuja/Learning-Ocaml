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
	.globl	camlFloat__data_begin
camlFloat__data_begin:
	.text
	.globl	camlFloat__code_begin
camlFloat__code_begin:
	.data
	.align	8
	.quad	768
	.globl	camlFloat
camlFloat:
	.data
	.align	8
	.globl	camlFloat__gc_roots
camlFloat__gc_roots:
	.quad	camlFloat
	.quad	0
	.data
	.align	8
	.quad	2045
camlFloat__1:
	.quad	0x4008000000000000
	.text
	.align	16
	.globl	camlFloat__entry
camlFloat__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L102:
	movq	camlFloat__1@GOTPCREL(%rip), %rax
	call	camlStdlib__string_of_float_172@PLT
.L100:
	movq	%rax, %rbx
	movq	camlStdlib@GOTPCREL(%rip), %rax
	movq	304(%rax), %rax
	call	camlStdlib__output_string_224@PLT
.L101:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlFloat__entry,@function
	.size camlFloat__entry,. - camlFloat__entry
	.data
	.align	8
	.text
	.globl	camlFloat__code_end
camlFloat__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlFloat__data_end
camlFloat__data_end:
	.quad	0
	.align	8
	.globl	camlFloat__frametable
camlFloat__frametable:
	.quad	2
	.quad	.L101
	.word	17
	.word	0
	.align	8
	.quad	.L103
	.quad	.L100
	.word	17
	.word	0
	.align	8
	.quad	.L104
	.align	8
.L104:
	.long	(.L105 - .) + -268435456
	.long	1979024
	.quad	0
	.align	8
.L103:
	.long	(.L105 - .) + -268435456
	.long	1978688
	.quad	0
.L105:
	.ascii	"stdlib.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits

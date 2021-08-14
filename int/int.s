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
	.globl	camlInt__data_begin
camlInt__data_begin:
	.text
	.globl	camlInt__code_begin
camlInt__code_begin:
	.data
	.align	8
	.quad	768
	.globl	camlInt
camlInt:
	.data
	.align	8
	.globl	camlInt__gc_roots
camlInt__gc_roots:
	.quad	camlInt
	.quad	0
	.text
	.align	16
	.globl	camlInt__entry
camlInt__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L102:
	movq	$7, %rax
	call	camlStdlib__string_of_int_161@PLT
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
	.type camlInt__entry,@function
	.size camlInt__entry,. - camlInt__entry
	.data
	.align	8
	.text
	.globl	camlInt__code_end
camlInt__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlInt__data_end
camlInt__data_end:
	.quad	0
	.align	8
	.globl	camlInt__frametable
camlInt__frametable:
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
.L103:
	.long	(.L105 - .) + -536870912
	.long	1974560
	.quad	0
	.align	8
.L104:
	.long	(.L105 - .) + -536870912
	.long	1974896
	.quad	0
.L105:
	.ascii	"stdlib.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits

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
	.globl	camlSmallest__data_begin
camlSmallest__data_begin:
	.text
	.globl	camlSmallest__code_begin
camlSmallest__code_begin:
	.data
	.align	8
	.quad	768
	.globl	camlSmallest
camlSmallest:
	.data
	.align	8
	.globl	camlSmallest__gc_roots
camlSmallest__gc_roots:
	.quad	camlSmallest
	.quad	0
	.data
	.align	8
	.quad	3068
camlSmallest__1:
	.ascii	"hello, world\12"
	.space	2
	.byte	2
	.text
	.align	16
	.globl	camlSmallest__entry
camlSmallest__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L101:
	movq	camlSmallest__1@GOTPCREL(%rip), %rbx
	movq	camlStdlib@GOTPCREL(%rip), %rax
	movq	304(%rax), %rax
	call	camlStdlib__output_string_224@PLT
.L100:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlSmallest__entry,@function
	.size camlSmallest__entry,. - camlSmallest__entry
	.data
	.align	8
	.text
	.globl	camlSmallest__code_end
camlSmallest__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlSmallest__data_end
camlSmallest__data_end:
	.quad	0
	.align	8
	.globl	camlSmallest__frametable
camlSmallest__frametable:
	.quad	1
	.quad	.L100
	.word	17
	.word	0
	.align	8
	.quad	.L102
	.align	8
.L102:
	.long	(.L103 - .) + -1409286144
	.long	1966416
	.quad	0
.L103:
	.ascii	"stdlib.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits

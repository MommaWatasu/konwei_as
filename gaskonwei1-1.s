	.file	"gaskonwei1.s"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, world!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	puts
	movq	$10, %r8
	movq	$15, -103(%rbp)
	movq	$0, -102(%rbp)
	movq	$1, %r10
	jmp	.LOOP1
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LOOP1:
	pushq	%r8
	movq	-103(%rbp), %rax
	decq	%rax
	movq	%rax, %r11
	movq	$1, %r8
	jmp	.LOOP2
	popq	%r8
	decq	%r8
	jnz	.LOOP1
	ret
.LOOP2:
	pushq	%r8
	movq	$0, %rdx
	cmp	%r11, %rdx
	ja	.IF1
	movq	%r11, %rax
	decq	-130(%rbp, %rax)
	movq	$0, %rdx
	cmp	-130(%rbp, %rax), %rdx
	je	.IF2
	popq	%r8
	decq	%r8
	jnz	.LOOP2
	jmp .-40
.LOOP6:
	pushq	%r8
	popq	%r8
	decq	%r8
	jnz	.LOOP6
	ret
.IF1:
	movq	-103(%rbp), %rax
	decq	%rax
	movq	%rax, %r11
	ret
.IF2:
	movq	%r11, %rax
	movq	-117(%rbp, %rax), %rdx
	movq	-103(%rbp), %rbx
	subq	%rax, %rbx
	decq	%rbx
	movq	%rbx, %r8
	jmp	.-50
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.1 20190827 (Red Hat 9.2.1-1)"
	.section	.note.GNU-stack,"",@progbits

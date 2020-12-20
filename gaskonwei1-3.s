	.file	"gaskonwei1.s"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, world!"
.ANS:
	.string "%d\n"
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
	movq	$15, -145(%rbp)
	movq	$0, -144(%rbp)
	jmp	.LOOP1
	pushq	-144(%rbp)
	pushq	$.ANS
	call	printf
	leave
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LOOP1:
	pushq	%r8
	movq	-145(%rbp), %rax
	decq	%rax
	movq	%rax, %r11
	movq	$1, %r8
	jmp	.LOOP2
	movq	$0, %rax
	movq	-145(%rbp), %r8
	jmp	.LOOP3
	jmp	.LOOP4
	cmp	%r9, -144(%rbp)
	jae	.+5
	movq	%r9, -144(%rbp)
	popq	%r8
	decq	%r8
	jnz	.LOOP1
	jmp	.-50
.LOOP2:
	pushq	%r8
	movq	$0, %rdx
	cmp	%r11, %rdx
	ja	.IF1
	movq	%r11, %rax
	decq	-141(%rbp, %rax)
	movq	$0, %rdx
	cmp	-141(%rbp, %rax), %rdx
	je	.IF2
	jne	.IF3
	popq	%r8
	jnz	.LOOP2
	jmp .-57
.LOOP3:
	pushq	%r8
	movq	-127(%rbp, %rax), %rbx
	movq	%rbx, -113(%rbp, %rax)
	incq	%rax
	popq	%r8
	decq	%r8
	jnz	.LOOP3
	jmp	.-50
.LOOP4:
	movq	$1, %rax
	cmp	%rax, -113(%rbp)
	je	.-50
	movq	-113(%rbp), %rax
	movq	$0, %r8
	jmp	.LOOP5
	incq	%r9
	jmp	.-50
.LOOP5:
	movq	-113(%rbp, %r8), %rbx
	movq	%rax, %rdx
	subq	%r8, %rdx
	decq	%rdx
	movq	-113(%rbp, %rdx), %r10
	movq	%r10, -113(%rbp, %r8)
	movq	%rbx, -113(%rbp, %rdx)
	incq	%r8
	movq	%r8, %rbx
	salq	$1, %rbx
	cmp	%rbx, %rax
	ja	.LOOP5
	jmp	.-50
.LOOP6:
	pushq	%r8
	movq	-126(%rbp, %rbx), %r10
	movq	%r10, -127(%rbp, %rbx)
	incq	%rbx
	popq	%r8
	decq	%r8
	jnz	.LOOP6
	jmp	.+30
.IF1:
	movq	-145(%rbp), %rax
	decq	%rax
	movq	%rax, %r11
	jmp	.-57
.IF2:
	movq	%r11, %rax
	movq	-127(%rbp, %rax), %rdx
	movq	-145(%rbp), %rbx
	subq	%rax, %rbx
	decq	%rbx
	movq	%rbx, %r8
	movq	%r11, %rbx
	jmp	.LOOP6
	movq	-145(%rbp), %rax
	decq	%rax
	movq	%rdx, -127(%rbp, %rax)
	movq	-145(%rbp), %rax
	subq	%r11,%rax
	movq	%rax,-141(%rbp,%r11)
	decq	%r11
	jmp	.-50
.IF3:
	movq	-141(%rbp,%r11),%rdx
	movq	-127(%rbp,%r11),%rbx
	movq	-145(%rbp), %rax
	subq	%rdx, %rax
	movq	-127(%rbp, %rax), %r10
	movq	%r10, -127(%rbp, %r11)
	movq	%rbx, -127(%rbp, %rax)
	decq	%r11
	popq	%r8
	decq	%r8
	pushq	%r8
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.1 20190827 (Red Hat 9.2.1-1)"
	.section	.note.GNU-stack,"",@progbits

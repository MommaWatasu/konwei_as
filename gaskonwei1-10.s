	.file	"gaskonwei1.s"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, world!"
.ANS:
	.ascii "%d\n"
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
	#ここから値の代入
	movb	$14, -100(%rbp)
	movb	$13, -101(%rbp)
	movb	$12, -102(%rbp)	
	movb	$11, -103(%rbp)
	movb	$10, -104(%rbp)
	movb	$9, -105(%rbp)
	movb	$8, -106(%rbp)
	movb	$7, -107(%rbp)
	movb	$6, -108(%rbp)
	movb	$5, -109(%rbp)
	movb	$4, -110(%rbp)
	movb	$3, -111(%rbp)
	movb	$2, -112(%rbp)
	movb	$1, -113(%rbp)
	movb	$14, -114(%rbp)
	movb	$13, -115(%rbp)
	movb	$12, -116(%rbp)
	movb	$11, -117(%rbp)
	movb	$10, -118(%rbp)
	movb	$9, -119(%rbp)
	movb	$8, -120(%rbp)
	movb	$7, -121(%rbp)
	movb	$6, -122(%rbp)
	movb	$5, -123(%rbp)
	movb	$4, -124(%rbp)
	movb	$3, -125(%rbp)
	movb	$2, -126(%rbp)
	movb	$1, -127(%rbp)
	movq	$1, -135(%rbp)
	movq	$2, -143(%rbp)
	movq	$3, -151(%rbp)
	movq	$4, -159(%rbp)
	movq	$5, -167(%rbp)
	movq	$6, -175(%rbp)
	movq	$7, -183(%rbp)
	movq	$8, -191(%rbp)
	movq	$9, -199(%rbp)
	movq	$10, -207(%rbp)
	movq	$11, -215(%rbp)
	movq	$12, -223(%rbp)
	movq	$13, -231(%rbp)
	movq	$14, -239(%rbp)
	movq	$6227020800, %r8
	movq	$14, %r10
	movb	$0, -240(%rbp)
	#LOOP1へ（全体のループ）
	jmp	.LOOP1
	mov	$.ANS, %rdi
	mov	-240(%rbp), %rsi
	mov	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LOOP1:
	pushq	%r8
	movq	%r10, %rax
	decq	%rax
	movq	%rax, %r9
	movq	$1, %r8
	#LOOP2へ（順列の作成）
	jmp	.LOOP2
	movq	$0, %rax
	movq	%r10, %r8
	#LOOP3へ（indicesから、ex_pに値を移す）
	jmp	.LOOP3
	movb	$0, -241(%rbp)
	jmp	.LOOP4
	movb	-241(%rbp), %al
	cmpb	%al, -240(%rbp)
	jae	.+8
	movb	%al, -240(%rbp)
	popq	%r8
	decq	%r8
	jnz	.LOOP1
	jmp	.-99
.LOOP2:
	pushq	%r8
	movq	$0, %rax
	cmp	%r9, %rax
	ja	.IF1
	movq	$0, %rbx
	movq	%r9, %rax
	salq	$3, %rax
	decq	-239(%rbp, %rax)
	cmp	-239(%rbp, %rax), %rbx
	je	.IF2
	jne	.IF3
	popq	%r8
	jnz	.LOOP2
	jmp	.-114
.LOOP3:
	pushq	%r8
	movb	-127(%rbp, %rax), %bl
	movb	%bl, -113(%rbp, %rax)
	incq	%rax
	popq	%r8
	decq	%r8
	jnz	.LOOP3
	jmp	.-124
.LOOP4:
	movb	$1, %bl
	cmpb	-113(%rbp), %bl
	je	.-122
	movq	$0, %rax
	movb	-113(%rbp), %al
	movq	$0, %r8
	jmp	.LOOP5
	incb	-241(%rbp)
	jmp	.LOOP4
.LOOP5:
	movb	-113(%rbp, %r8), %bl
	movq	%rax, %rdx
	subq	%r8, %rdx
	decq	%rdx
	movb	-113(%rbp, %rdx), %r11b
	movb	%r11b, -113(%rbp, %r8)
	movb	%bl, -113(%rbp, %rdx)
	incq	%r8
	movq	%r8, %rbx
	salq	$1, %rbx
	cmp	%rbx, %rax
	jbe	.-48
	jmp	.LOOP5
.LOOP6:
	decq	%r8
	ja	.+53
	movb	-126(%rbp, %rbx), %dh
	movb	%dh, -127(%rbp, %rbx)
	incq	%rbx
	jmp	.LOOP6
.IF1:
	movq	%r10, %rax
	decq	%rax
	movq	%rax, %r9
	jmp	.-175
.IF2:
	movq	%r9, %rax
	movb	-127(%rbp, %rax), %dl
	movq	%r10, %rbx
	subq	%rax, %rbx
	decq	%rbx
	movq	%rbx, %r8
	movq	%r9, %rbx
	jmp	.LOOP6	
	movq	%r10, %rax
	movb	%dl, -128(%rbp, %rax)
	subq	%r9,%rax#n-i
	movq	%r9, %rbx
	salq	$3, %rbx
	movq	%rax, -239(%rbp,%rbx)
	decq	%r9
	jmp	.-196
.IF3:
	movq	%r9, %rax
	salq	$3, %rax
	movq	-239(%rbp,%rax), %rdx
	movb	-127(%rbp,%r9), %bl
	movq	%r10, %rax
	subq	%rdx, %rax#%rdxの値が想定外となっていることが原因
	movb	-127(%rbp, %rax), %r11b
	movb	%r11b, -127(%rbp, %r9)
	movb	%bl, -127(%rbp, %rax)
	decq	%r9
	popq	%r8
	decq	%r8
	pushq	%r8
	jmp	.-245
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.1 20190827 (Red Hat 9.2.1-1)"
	.section	.note.GNU-stack,"",@progbits

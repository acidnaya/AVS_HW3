	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	dist
	.type	dist, @function
dist:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movq	rcx, xmm0
	movapd	xmm0, xmm1
	mov	eax, 0
	mov	edx, 0
	mov	rax, rcx
	movq	rdx, xmm0
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -8[rbp], rdx
	movapd	xmm1, xmm2
	movapd	xmm0, xmm3
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm4, xmm0
	subsd	xmm4, xmm1
	movq	rax, xmm4
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movapd	xmm5, xmm0
	addsd	xmm5, QWORD PTR -40[rbp]
	movq	rax, xmm5
	movq	xmm0, rax
	call	sqrt@PLT
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	dist, .-dist
	.globl	accurate_equal
	.type	accurate_equal, @function
accurate_equal:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	QWORD PTR -16[rbp], xmm1
	movsd	QWORD PTR -24[rbp], xmm2
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	andpd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, xmm1
	seta	al
	movzx	eax, al
	pop	rbp
	ret
	.size	accurate_equal, .-accurate_equal
	.globl	check_circle
	.type	check_circle, @function
check_circle:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	movq	rcx, xmm0
	movapd	xmm0, xmm1
	mov	eax, 0
	mov	edx, 0
	mov	rax, rcx
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	movapd	xmm1, xmm2
	movapd	xmm0, xmm3
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	movapd	xmm1, xmm4
	movapd	xmm0, xmm5
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	movapd	xmm1, xmm6
	movapd	xmm0, xmm7
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -72[rbp], rdx
	movsd	xmm2, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	movsd	QWORD PTR -88[rbp], xmm0
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR -40[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	movapd	xmm4, xmm0
	mulsd	xmm4, QWORD PTR -88[rbp]
	movsd	QWORD PTR -88[rbp], xmm4
	movsd	xmm2, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movsd	xmm1, QWORD PTR -56[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	mulsd	xmm0, QWORD PTR -96[rbp]
	movsd	xmm4, QWORD PTR -88[rbp]
	subsd	xmm4, xmm0
	movsd	QWORD PTR -88[rbp], xmm4
	movsd	xmm2, QWORD PTR -64[rbp]
	movsd	xmm0, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR -40[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist
	movsd	xmm1, QWORD PTR -96[rbp]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -88[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm2, xmm0
	pxor	xmm1, xmm1
	movq	xmm0, rax
	call	accurate_equal
	leave
	ret
	.size	check_circle, .-check_circle
	.globl	equal_points
	.type	equal_points, @function
equal_points:
	push	rbp
	mov	rbp, rsp
	movq	rcx, xmm0
	movapd	xmm0, xmm1
	mov	eax, 0
	mov	edx, 0
	mov	rax, rcx
	movq	rdx, xmm0
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -8[rbp], rdx
	movapd	xmm1, xmm2
	movapd	xmm0, xmm3
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	ucomisd	xmm0, xmm1
	jp	.L8
	ucomisd	xmm0, xmm1
	jne	.L8
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	ucomisd	xmm0, xmm1
	jp	.L8
	ucomisd	xmm0, xmm1
	jne	.L8
	mov	eax, 1
	jmp	.L12
.L8:
	mov	eax, 0
.L12:
	pop	rbp
	ret
	.size	equal_points, .-equal_points
	.globl	check_equal
	.type	check_equal, @function
check_equal:
	push	rbp
	mov	rbp, rsp
	push	r14
	push	r13
	push	r12
	sub	rsp, 24
	mov	QWORD PTR -40[rbp], rdi
	mov	r14d, 0
	mov	r12d, 0
	jmp	.L16
.L20:
	mov	eax, r12d
	add	eax, 1
	mov	r13d, eax
	jmp	.L17
.L19:
	mov	eax, r13d
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	mov	eax, r12d
	cdqe
	sal	rax, 4
	mov	rcx, rax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rcx
	movsd	xmm2, QWORD PTR [rdx]
	movsd	xmm0, QWORD PTR 8[rdx]
	mov	rdx, QWORD PTR [rax]
	movsd	xmm1, QWORD PTR 8[rax]
	movapd	xmm3, xmm0
	movq	xmm0, rdx
	call	equal_points
	test	eax, eax
	je	.L18
	mov	eax, r14d
	add	eax, 1
	mov	r14d, eax
.L18:
	mov	eax, r13d
	add	eax, 1
	mov	r13d, eax
.L17:
	mov	eax, r13d
	cmp	eax, 3
	jle	.L19
	mov	eax, r12d
	add	eax, 1
	mov	r12d, eax
.L16:
	mov	eax, r12d
	cmp	eax, 3
	jle	.L20
	mov	eax, r14d
	add	rsp, 24
	pop	r12
	pop	r13
	pop	r14
	pop	rbp
	ret
	.size	check_equal, .-check_equal
	.globl	check_line
	.type	check_line, @function
check_line:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 24
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	movsd	xmm1, QWORD PTR 8[rax]
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm1, xmm2
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR [rax]
	mulsd	xmm1, QWORD PTR -16[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	movsd	xmm1, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 16
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movapd	xmm2, xmm0
	movq	xmm0, rax
	call	accurate_equal
	test	eax, eax
	je	.L23
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 32
	movsd	xmm1, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 32
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movapd	xmm2, xmm0
	movq	xmm0, rax
	call	accurate_equal
	test	eax, eax
	je	.L23
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 48
	movsd	xmm1, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, 48
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movapd	xmm2, xmm0
	movq	xmm0, rax
	call	accurate_equal
	test	eax, eax
	je	.L23
	mov	eax, 1
	jmp	.L25
.L23:
	mov	eax, 0
.L25:
	leave
	ret
	.size	check_line, .-check_line
	.section	.rodata
.LC4:
	.string	"Point #%d:\n"
.LC5:
	.string	"%lf"
.LC6:
	.string	"Points lay in one circle!"
	.align 8
.LC7:
	.string	"Points do not lay in one circle!"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	sub	rsp, 104
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	mov	r15d, 0
	jmp	.L27
.L28:
	mov	eax, r15d
	add	eax, 1
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, r15d
	lea	rdx, -96[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, r15d
	lea	rdx, -96[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	add	rax, 8
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, r15d
	add	eax, 1
	mov	r15d, eax
.L27:
	mov	eax, r15d
	cmp	eax, 3
	jle	.L28
	lea	rax, -96[rbp]
	mov	rdi, rax
	call	check_equal
	mov	DWORD PTR -100[rbp], eax
	cmp	DWORD PTR -100[rbp], 1
	jg	.L29
	cmp	DWORD PTR -100[rbp], 1
	jne	.L30
	lea	rax, -96[rbp]
	mov	rdi, rax
	call	check_line
	test	eax, eax
	je	.L29
.L30:
	lea	rax, -96[rbp]
	mov	rdi, rax
	call	check_line
	test	eax, eax
	jne	.L31
	movsd	xmm6, QWORD PTR -48[rbp] # p[3].x
	movsd	xmm7, QWORD PTR -40[rbp] # p[3].y
	movsd	xmm4, QWORD PTR -64[rbp] # p[2].x
	movsd	xmm5, QWORD PTR -56[rbp] # p[2].y
	movsd	xmm2, QWORD PTR -80[rbp] # p[1].x
	movsd	xmm3, QWORD PTR -72[rbp] # p[1].y
	movsd	xmm0, QWORD PTR -96[rbp] # p[0].x
	movsd	xmm1, QWORD PTR -88[rbp] # p[0].y
	call	check_circle
	test	eax, eax
	jne	.L29
	movsd	xmm4, QWORD PTR -80[rbp] # p[1].x
	movsd	xmm5, QWORD PTR -72[rbp] # p[1].y
	movsd	xmm2, QWORD PTR -64[rbp] # p[2].x
	movsd	xmm3, QWORD PTR -56[rbp] # p[2].y
	call	check_circle
	test	eax, eax
	jne	.L29
	movsd	xmm6, QWORD PTR -80[rbp] # p[1].x
	movsd	xmm7, QWORD PTR -72[rbp] # p[1].y
	movsd	xmm4, QWORD PTR -48[rbp] # p[3].x
	movsd	xmm5, QWORD PTR -40[rbp] # p[1].y
	call	check_circle
	test	eax, eax
	je	.L31
.L29:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L32
.L31:
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
.L32:
	mov	eax, 0
	mov	rdx, QWORD PTR -24[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	mov	r15, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC2:
	.long	-1998362383
	.long	1055193269
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

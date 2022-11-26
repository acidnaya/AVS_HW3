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
	mov	QWORD PTR -16[rbp], rax # a.x
	mov	QWORD PTR -8[rbp], rdx # a.y
	movapd	xmm1, xmm2
	movapd	xmm0, xmm3
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax # b.x
	mov	QWORD PTR -24[rbp], rdx # b.y
	movsd	xmm0, QWORD PTR -16[rbp] # a.x
	movsd	xmm1, QWORD PTR -32[rbp] # b.x
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0 # 2
	movq	xmm0, rax # a.x - b.x
	call	pow@PLT # вызов pow с xmm0 - xmm1
	movsd	QWORD PTR -40[rbp], xmm0 # результат функции
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm4, xmm0
	subsd	xmm4, xmm1
	movq	rax, xmm4
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0 # 2
	movq	xmm0, rax # a.y - b.y
	call	pow@PLT # вызов pow с xmm0 - xmm1
	movapd	xmm5, xmm0 # результат функции
	addsd	xmm5, QWORD PTR -40[rbp]
	movq	rax, xmm5
	movq	xmm0, rax # сумма квадратов
	call	sqrt@PLT # вызов sqrt с xmm0
	movq	rax, xmm0 # результат
	movq	xmm0, rax # возвращаем результат через xmm0
	leave
	ret
	.size	dist, .-dist
	.globl	accurate_equal
	.type	accurate_equal, @function
accurate_equal:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -8[rbp], xmm0 # num
	movsd	QWORD PTR -16[rbp], xmm1 # check
	movsd	QWORD PTR -24[rbp], xmm2 # accuracy
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	andpd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, xmm1
	seta	al
	movzx	eax, al # результат функции
	pop	rbp
	ret
	.size	accurate_equal, .-accurate_equal
	.globl	check_circle
	.type	check_circle, @function
check_circle:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	movq	rcx, xmm0 # a.x
	movapd	xmm0, xmm1 # a.y
	mov	eax, 0
	mov	edx, 0
	mov	rax, rcx
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax # a.x
	mov	QWORD PTR -24[rbp], rdx # a.y
	movapd	xmm1, xmm2 # b.x
	movapd	xmm0, xmm3 # b.y
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -48[rbp], rax # b.x
	mov	QWORD PTR -40[rbp], rdx # b.y
	movapd	xmm1, xmm4 # c.x
	movapd	xmm0, xmm5 # c.y
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -64[rbp], rax # c.x
	mov	QWORD PTR -56[rbp], rdx # c.y
	movapd	xmm1, xmm6
	movapd	xmm0, xmm7
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -80[rbp], rax # d.x
	mov	QWORD PTR -72[rbp], rdx # d.y
	movsd	xmm2, QWORD PTR -64[rbp]  # c.x в xmm2
	movsd	xmm0, QWORD PTR -56[rbp] # c.y
	mov	rax, QWORD PTR -32[rbp] # a.x
	movsd	xmm1, QWORD PTR -24[rbp] # a.y в xmm1
	movapd	xmm3, xmm0  # c.y в xmm3
	movq	xmm0, rax # a.x в xmm0
	call	dist # вызов dist с xmm0 - xmm3
	movsd	QWORD PTR -88[rbp], xmm0 # ???
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR -40[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist # вызов dist с xmm0 - xmm3
	movapd	xmm4, xmm0
	mulsd	xmm4, QWORD PTR -88[rbp]
	movsd	QWORD PTR -88[rbp], xmm4
	movsd	xmm2, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist # вызов dist с xmm0 - xmm3
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movsd	xmm1, QWORD PTR -56[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist # вызов dist с xmm0 - xmm3
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
	call	dist # вызов dist с xmm0 - xmm3
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm2, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	movq	xmm0, rax
	call	dist # вызов dist с xmm0 - xmm3
	movsd	xmm1, QWORD PTR -96[rbp]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -88[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0 # double res
	movsd	xmm0, QWORD PTR .LC2[rip]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm2, xmm0 # 0.00001
	pxor	xmm1, xmm1 # 0
	movq	xmm0, rax # res
	call	accurate_equal # вызов dist с xmm0 - xmm2
	leave
	ret # возврат результата функции accurate_equal из функции check_circle через eax
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
	mov	QWORD PTR -16[rbp], rax # a.x
	mov	QWORD PTR -8[rbp], rdx # a.y
	movapd	xmm1, xmm2
	movapd	xmm0, xmm3
	mov	eax, 0
	mov	edx, 0
	movq	rax, xmm1
	movq	rdx, xmm0
	mov	QWORD PTR -32[rbp], rax # b.x
	mov	QWORD PTR -24[rbp], rdx # b.y
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
	mov	eax, 1 # результат работы функции помещен в eax
	jmp	.L12
.L8:
	mov	eax, 0 # результат работы функции помещен в eax
.L12:
	pop	rbp
	ret
	.size	equal_points, .-equal_points
	.globl	check_equal
	.type	check_equal, @function
check_equal:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # p
	mov	DWORD PTR -4[rbp], 0 # локальная переменная equals
	mov	DWORD PTR -12[rbp], 0 # локальная переменная i
	jmp	.L16
.L20:
	mov	eax, DWORD PTR -12[rbp]
	add	eax, 1
	mov	DWORD PTR -8[rbp], eax # локальная переменная j
	jmp	.L17
.L19:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 4
	mov	rcx, rax
	mov	rax, QWORD PTR -24[rbp]
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
	add	DWORD PTR -4[rbp], 1
.L18:
	add	DWORD PTR -8[rbp], 1
.L17:
	cmp	DWORD PTR -8[rbp], 3
	jle	.L19
	add	DWORD PTR -12[rbp], 1
.L16:
	cmp	DWORD PTR -12[rbp], 3
	jle	.L20
	mov	eax, DWORD PTR -4[rbp] # перенос equals в eax - результат работы функции
	leave
	ret
	.size	check_equal, .-check_equal
	.globl	check_line
	.type	check_line, @function
check_line:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 24
	mov	QWORD PTR -24[rbp], rdi # p
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
	movsd	QWORD PTR -16[rbp], xmm0 # локальная переменная k
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR [rax]
	mulsd	xmm1, QWORD PTR -16[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0 # локальная переменная b
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
	movapd	xmm2, xmm0 # 0.00001
	movq	xmm0, rax # k * p[1].x + b, p[1].y
	call	accurate_equal # вызов функции accurate_equal с xmm0 - xmm2
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
	movapd	xmm2, xmm0 # 0.00001
	movq	xmm0, rax # k * p[2].x + b, p[2].y
	call	accurate_equal # вызов функции accurate_equal с xmm0 - xmm2
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
	movapd	xmm2, xmm0 # 0.00001
	movq	xmm0, rax # k * p[3].x + b, p[3].y
	call	accurate_equal # вызов функции accurate_equal с xmm0 - xmm2
	test	eax, eax
	je	.L23
	mov	eax, 1 # результат работы функции помещен в eax
	jmp	.L25
.L23:
	mov	eax, 0 # результат работы функции помещен в eax
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
	sub	rsp, 96
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -88[rbp], 0 # DWORD PTR -88[rbp] - int i
	jmp	.L27
.L28:
	mov	eax, DWORD PTR -88[rbp]
	add	eax, 1
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rdx, -80[rbp] # -80[rbp] = points p
	mov	eax, DWORD PTR -88[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rdx, -80[rbp]
	mov	eax, DWORD PTR -88[rbp]
	cdqe
	sal	rax, 4
	add	rax, rdx
	add	rax, 8
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -88[rbp], 1
.L27:
	cmp	DWORD PTR -88[rbp], 3
	jle	.L28
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	check_equal
	mov	DWORD PTR -84[rbp], eax # DWORD PTR -84[rbp] - int equals
	cmp	DWORD PTR -84[rbp], 1
	jg	.L29 # equals > 1
	cmp	DWORD PTR -84[rbp], 1
	jne	.L30 # equals != 1
	lea	rax, -80[rbp]
	mov	rdi, rax # перенос p в rdi
	call	check_line # вызов функции check_line
	test	eax, eax # результат вызова функции помещается в eax и сравнивается с 0
	je	.L29
.L30:
	lea	rax, -80[rbp]
	mov	rdi, rax # перенос p в rdi
	call	check_line # вызов функции check_line
	test	eax, eax # результат вызова функции помещается в eax и сравнивается с 0
	jne	.L31
	movsd	xmm6, QWORD PTR -32[rbp] # p[3].x в xmm6
	movsd	xmm5, QWORD PTR -24[rbp] # p[3].y
	movsd	xmm4, QWORD PTR -48[rbp] # p[2].x в xmm4
	movsd	xmm3, QWORD PTR -40[rbp] # p[2].y
	movsd	xmm2, QWORD PTR -64[rbp] # p[1].x в xmm2
	movsd	xmm0, QWORD PTR -56[rbp] # p[1].y
	mov	rax, QWORD PTR -80[rbp] # p[0].x
	movsd	xmm1, QWORD PTR -72[rbp] # p[0].y в xmm1
	movapd	xmm7, xmm5 # p[3].y в xmm7
	movapd	xmm5, xmm3 # p[2].y в xmm5
	movapd	xmm3, xmm0 # p[1].y в xmm3
	movq	xmm0, rax # p[0].x в xmm0
	call	check_circle # вызов функции check_circle с переменными в xmm0 - xmm7
	test	eax, eax # результат вызова функции помещается в eax и сравнивается с 0
	jne	.L29
	movsd	xmm6, QWORD PTR -32[rbp] # p[3].x в xmm6
	movsd	xmm5, QWORD PTR -24[rbp] # p[3].y
	movsd	xmm4, QWORD PTR -64[rbp] # p[1].x в xmm4
	movsd	xmm3, QWORD PTR -56[rbp] # p[1].y
	movsd	xmm2, QWORD PTR -48[rbp] # p[2].x в xmm2
	movsd	xmm0, QWORD PTR -40[rbp] # p[2].y
	mov	rax, QWORD PTR -80[rbp] # p[0].x
	movsd	xmm1, QWORD PTR -72[rbp] # p[0].y в xmm1
	movapd	xmm7, xmm5 # p[3].y в xmm7
	movapd	xmm5, xmm3 # p[1].y в xmm5
	movapd	xmm3, xmm0 # p[2].y в xmm3
	movq	xmm0, rax # p[0].x в xmm0
	call	check_circle # вызов функции check_circle с переменными в xmm0 - xmm7
	test	eax, eax # результат вызова функции помещается в eax и сравнивается с 0
	jne	.L29
	movsd	xmm6, QWORD PTR -64[rbp] # p[1].x в xmm6
	movsd	xmm5, QWORD PTR -56[rbp] # p[1].y
	movsd	xmm4, QWORD PTR -32[rbp] # p[3].x в xmm4
	movsd	xmm3, QWORD PTR -24[rbp] # p[3].y
	movsd	xmm2, QWORD PTR -48[rbp] # p[2].x в xmm2
	movsd	xmm0, QWORD PTR -40[rbp] # p[2].y
	mov	rax, QWORD PTR -80[rbp] # p[0].x
	movsd	xmm1, QWORD PTR -72[rbp] # p[0].y в xmm1
	movapd	xmm7, xmm5 # p[1].y в xmm7
	movapd	xmm5, xmm3 # p[3].y в xmm5
	movapd	xmm3, xmm0 # p[2].y в xmm3
	movq	xmm0, rax # p[0].x в xmm0
	call	check_circle # вызов функции check_circle с переменными в xmm0 - xmm7
	test	eax, eax # результат вызова функции помещается в eax и сравнивается с 0
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
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
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

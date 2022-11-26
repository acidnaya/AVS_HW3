# Рубцова М.Е., БПИ-218, ИДЗ 3, Вариант 25.

## Задание

Разработать программу, решающую вопрос о принадлежности заданных 4-х точек одной окружности.
 
 ## Решение

### Исходный код на языке С на 6 баллов:
```c
#include <stdio.h>
#include <math.h>

typedef struct point {
    double x;
    double y;
} point;

double dist(point a, point b) {
    return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
}

int accurate_equal(double num, double check, double accuracy) {
    return (fabs(num - check) < accuracy) ? 1 : 0;
}

int check_circle(point a, point b, point c, point d) {
    double res = dist(a, c) * dist(b, d) - dist(a, b) * dist(c, d) - dist(b, c) * dist(a, d);
    return accurate_equal(res, 0, 0.00001);
}

int equal_points(point a, point b) {
    return (a.x == b.x && a.y == b.y) ? 1 : 0;
}

int check_equal(point *p) {
    int i;
    int j;
    int equals = 0;
    for (i = 0; i < 4; ++i) {
        for (j = i + 1; j < 4; ++j) {
            if (equal_points(p[i], p[j]))
                equals++;
        }
    }
    return equals;
}

int check_line(point *p) {
    double k = (p[0].y - p[1].y) / (p[0].x - p[1].x);
    double b = p[0].y - k * p[0].x;
    return accurate_equal(k * p[1].x + b, p[1].y, 0.00001) &&
    accurate_equal(k * p[2].x + b, p[2].y, 0.00001) &&
    accurate_equal(k * p[3].x + b, p[3].y, 0.00001);
}

int main() {
    point p[4];
    for (int i = 0; i < 4; ++i) {
        printf("Point #%d:\n", i + 1);
        scanf("%lf", &(p[i].x));
        scanf("%lf", &(p[i].y));
    }
    int equals = check_equal(p);
    if (equals > 1 || (equals == 1 && !check_line(p))
    || (!check_line(p) && (check_circle(p[0], p[1], p[2], p[3])
    || check_circle(p[0], p[2], p[1], p[3])
    || check_circle(p[0], p[2], p[3], p[1])))) {
        printf("Points lay in one circle!\n");
    } else {
        printf("Points do not lay in one circle!\n");
    }
    return 0;
}
```

### Процесс выполнения

Компиляция:
```sh
gcc -O0 -Wall -masm=intel -S main.c -o prog1.s
```
Компиляция без макросов:
```sh
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c -o prog2.s
```
Получение бинарного кода:
```sh
gcc prog2.s -c
```
Линковка в исполняемый файл с определенным названием:
```sh
 gcc prog2.o -o prog2 -lm
```

![Процесс](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/processing.png)

### Комментарии 

Комментарии, поясняющие представление переменных в main(4 балла):
```assembly
main:
 ```
 ```assembly
	mov	DWORD PTR -88[rbp], 0 # DWORD PTR -88[rbp] - int i
 ```
 ```assembly
.L28:
 ```
 ```assembly
	lea	rdx, -80[rbp] # -80[rbp] - points p
```

Комментарии, поясняющие представление локальных переменных в функциях (5 баллов):
```assembly
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
```
```assembly
check_line:
```
```assembly
	movsd	QWORD PTR -16[rbp], xmm0 # локальная переменная k
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR [rax]
	mulsd	xmm1, QWORD PTR -16[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0 # локальная переменная b
```

Комментарии, поясняющие передачу переменных в функции и перенос возвращаемого результата (5 баллов):
```assembly
dist:
 ```
 ```assembly
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
```
```assembly
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
```
```assembly
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
```

```assembly
check_circle:
```
```assembly
	mov	QWORD PTR -32[rbp], rax # a.x
	mov	QWORD PTR -24[rbp], rdx # a.y
```
```assembly
 mov	QWORD PTR -48[rbp], rax # b.x
	mov	QWORD PTR -40[rbp], rdx # b.y
```
```assembly
	mov	QWORD PTR -64[rbp], rax # c.x
	mov	QWORD PTR -56[rbp], rdx # c.y
```
```assembly
	mov	QWORD PTR -80[rbp], rax # d.x
	mov	QWORD PTR -72[rbp], rdx # d.y
```
```assembly
	mov	rax, QWORD PTR -32[rbp] # a.x
	movsd	xmm1, QWORD PTR -24[rbp] # a.y в xmm1
	movapd	xmm3, xmm0  # c.y в xmm3
	movq	xmm0, rax # a.x в xmm0
	call	dist # вызов dist с xmm0 - xmm3
```
```assembly
movsd	QWORD PTR -8[rbp], xmm0 # double res
	movsd	xmm0, QWORD PTR .LC2[rip]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm2, xmm0 # 0.00001
	pxor	xmm1, xmm1 # 0
	movq	xmm0, rax # res
	call	accurate_equal # вызов dist с xmm0 - xmm2
	leave
	ret # возврат результата функции accurate_equal из функции check_circle через eax
```

```assembly
equal_points:
```
```assembly
	mov	QWORD PTR -16[rbp], rax # a.x
	mov	QWORD PTR -8[rbp], rdx # a.y
```
```assembly
	mov	QWORD PTR -32[rbp], rax # b.x
	mov	QWORD PTR -24[rbp], rdx # b.y
```
```assembly
	mov	eax, 1 # результат работы функции помещен в eax
	jmp	.L12
.L8:
	mov	eax, 0 # результат работы функции помещен в eax
.L12:
	pop	rbp
	ret
```

```assembly
check_equal:
```
```assembly
.L16:
	cmp	DWORD PTR -12[rbp], 3
	jle	.L20
	mov	eax, DWORD PTR -4[rbp] # перенос equals в eax - результат работы функции
```
```assembly
check_line:
```
```assembly
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
```

Чуть более полную версию комментариев можно найти в prog2.s.

### Рефакторинг

Был проведен рефакторинг программы за счет использования регистров (r12-r15).\
Сокращены ненужные переносы из одного регистра в другой.\
Добавлены комментарии, поясняющие изменения (6 баллов).
```assembly
check_equal:
	push	rbp
	mov	rbp, rsp
	push	r14 # equals
	push	r13 # j
	push	r12 # i
```
```assembly
	main:
	push	rbp
	mov	rbp, rsp
	push	r15 # i
```
```assembly
main:
 ```
```assembly
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
```

Остальные изменения можно найти в prog3.s.

Сравнение размеров объектных и исполняемых файлов:

![Размер](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/sizenew.png)

### Тестирование всех вариантов программ

Все программы выдали один и тот же ожидаемый результат, ошибок при изменении кода не возникло.

|     Ввод     | prog1.s |  prog2.s  |  prog3.s  |Пояснение|
|---------------|---------|---------|----------|-----------|
|1 0 1 1 0 1 0 0|+|+|+|Окружность|
|1 0 0 0 1 1 0 1|+|+|+|Не важно в каком порядке точки|
|1 0 0 1 1 10 0 0|-|-|-|Не окружность|
|1 2 2 4 3 6 4 8|-|-|-|Прямая|
|1 2 2 4 3 6 3 6|-|-|-|Треугольник выродившийся в прямую|
|1 1 1 2 1 1 1 2|+|+|+|Две пары совпадающих точек|
|1 1 1 1 1 1 1 1|+|+|+|Четыре совпадающие точки|
|0.1 0 0 0 0.1 0.1 0 0.1|+|+|+|Окружность с точками, которые имеют нецелые значения|

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing1.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing2.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing3.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing4.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing5.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing6.png)

![Тестирование](https://github.com/acidnaya/AVS_HW3/blob/main/screenshots/testing7.png)

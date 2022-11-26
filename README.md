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

![Процесс](https://github.com/acidnaya/AVS_HW2/blob/main/screenshots/processing.png)

### Комментарии 

Комментарии, поясняющие представление переменных в main(4 балла):
```assembly

```

Комментарии, поясняющие представление локальных переменных в функциях (5 баллов):
```assembly

```
```assembly

```
```assembly

```

Комментарии, поясняющие передачу переменных в функции и перенос возвращаемого результата (5 баллов):
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```
```assembly

```

Чуть более полную версию комментариев можно найти в prog2.s.

### Рефакторинг

Был проведен рефакторинг программы за счет использования регистров r12-r15.\
Добавлены комментарии, поясняющие изменения (6 баллов).

```assembly

```

Остальные изменения можно найти в prog3.s.

Как итог: 371 строк prog1.s против 423 строк prog3.s, включая комментарии, поясняющие замену на регистры.

![Длина](https://github.com/acidnaya/AVS_HW2/blob/main/screenshots/length.png)

### Тестирование всех вариантов программ

Все программы выдали один и тот же ожидаемый результат, ошибок при изменении кода не возникло.

|     Input     | prog1.s |  prog2.s  |  prog3.s  |
|---------------|---------|---------|----------|
|||||
|||||
|||||

![Тестирование](https://github.com/acidnaya/AVS_HW2/blob/main/screenshots/testing.png)

---
## Front matter
title: "Отчет по лабораторной работе №8"
subtitle: "Дисциплина: архитектура компьютера"
author: "Николаева Ангелина Борисовна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Приобретение навыков написания программ с использованием циклов и обработкой
аргументов командной строки.

# Выполнение лабораторной работы

## Реализация циклов в NASM

Создаю каталог для программ лабораторной работы №8 (рис. -@fig:001).

![Создание каталога](image/1.png){#fig:001 width=70%}

Копирую в созданный файл программу из листинга. (рис. -@fig:002).

![Копирование программы из листинга](image/2.png){#fig:002 width=70%}

Запускаю программу, она показывает работу циклов в NASM (рис. -@fig:003).

![Запуск программы](image/3.png){#fig:003 width=70%}

Заменяю программу изначальную так, что в теле цикла я изменяю значение регистра ecx (рис. -@fig:004).

![Изменение программы](image/4.png){#fig:004 width=70%}

Из-за того, что теперь регистр ecx на каждой итерации уменьшается на 2 значения, количество итераций уменьшается вдвое (рис. -@fig:005).

![Запуск измененной программы](image/5.png){#fig:005 width=70%}

Добавляю команды push и pop в программу (рис. -@fig:006).

![Добавление push и pop в цикл программы](image/6.png){#fig:006 width=70%}

Теперь количество итераций совпадает введенному N, но произошло смещение выводимых чисел на -1 (рис. -@fig:007).

![Запуск измененной программы](image/7.png){#fig:007 width=70%}

## Обработка аргументов командной строки

Создаю новый файл для программы и копирую в него код из следующего листинга (рис. -@fig:008).

![Копирование программы из листинга](image/8.png){#fig:008 width=70%}

Компилирую программу и запускаю, указав аргументы. Программой было обратоно то же количество аргументов, что и было введено (рис. -@fig:009).

![Запуск второй программы](image/9.png){#fig:009 width=70%}

Создаю новый файл для программы и копирую в него код из третьего листинга (рис. -@fig:010).

![Копирование программы из третьего листинга](image/10.png){#fig:010 width=70%}

Компилирую программу и запускаю, указав в качестве аргументов некоторые числа, программа их складывает (рис. -@fig:011).

![Запуск третьей программы](image/11.png){#fig:011 width=70%}

Изменяю поведение программы так, чтобы указанные аргументы она умножала, а не складывала (рис. -@fig:012).

![Изменение третьей программы](image/12.png){#fig:012 width=70%}

Программа действительно теперь умножает данные на вход числа (рис. -@fig:013).

![Запуск измененной третьей программы](image/13.png){#fig:013 width=70%}

## Задание для самостоятельной работы

Пишу программму, которая будет находить сумма значений для функции f(x) = 10x-4,
которая совпадает с моим девытым варинтом (рис. -@fig:014).

![Написание программы для самостоятельной работы](image/14.png){#fig:014 width=70%}

Код программы:
```NASM
%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = 10x - 4", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
mov eax, msg_func
call sprintLF

pop ecx
pop edx
sub ecx, 1
mov esi, 0

next:
cmp ecx, 0h
jz _end
pop eax
call atoi

mov ebx, 10
mul ebx
sub eax, 4

add esi, eax

loop next

_end: 
mov eax, msg_result
call sprint
mov eax, esi
call iprintLF
call quit
```

Проверяю работу программы, указав в качестве аргумента несколько чисел (рис. -@fig:015).

![Запуск программы для самостоятельной работы](image/15.png){#fig:015 width=70%}

# Выводы

В результате выполнения данной лабораторной работы я приобрел навыки написания программ с использованием циклов а также научился обрабатывать аргументы командной строки.
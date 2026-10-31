# Лабораторная работа №2
**Выполнил:** Харитонова Алина 3525П1ИН3
**Вариант:** 2

## 1. Описание системы
Разработана интегрированная система моделирования процессов разработки ПО, состоящая из четырех `.bat`-скриптов. Система позволяет выбрать текстовый редактор для команды (Sublime Text, Atom, Notepad++), проверить знания разработчика в поиске дефектов кода и провести взвешенный сравнительный анализ альтернатив (WSM).

## 2. Листинги модулей

### 2.1. Модуль 1: `chapter1.bat` (Выбор технологий)
Этот модуль задает вопросы о бюджете, функционале и размере файлов. На основе ответов он рассчитывает баллы для трех редакторов и выдает рекомендацию.
*Ключевой участок кода:*
```bat
set /a score_sublime=0
set /a score_atom=0
set /a score_notepad=0
echo Вопрос 1: Какой у команды бюджет на покупку софта?
echo 1. Строго нулевой (только бесплатные решения)
echo 2. Ограниченный (до $80 на человека)
choice /c 12 /n
if errorlevel==1 set /a score_notepad+=15 & set /a score_atom+=10
```
### 2.2. Модуль 2: `chapter2.bat` (Инспекция кода)
Модуль показывает три фрагмента кода на Python и просит найти в них дефекты. Ведется подсчет правильных ответов и выводится уровень ревьюера (Junior/Middle/Senior).
Ключевой участок кода (подсчет процентов):

```bat
set /a percentage=0
if %correct%==1 set percentage=33
if %correct%==2 set percentage=66
if %correct%==3 set percentage=100

if %percentage% geq 80 goto level_senior
if %percentage% geq 50 goto level_middle
```
### 2.3. Модуль 3: `chapter3.bat` (Сравнительный анализ WSM)
Пользователь назначает веса критериям (сумма должна быть 100) и оценивает редакторы по 5-балльной шкале. Программа строит матрицу и выбирает победителя по формуле взвешенной суммы.
Ключевой участок кода:

```bat
set /a score_s=s_1*w1+s_2*w2+s_3*w3
set /a score_a=a_1*w1+a_2*w2+a_3*w3
if %score_s% gtr %score_a% if %score_s% gtr %score_n% (
    echo Победитель: Sublime Text
)
```
### 2.4. Главный файл: lab_system.bat
Объединяет все три модуля в меню. При выборе пункта 4 запускает все модули по очереди, считывает результаты из временных файлов result1.txt, result2.txt, result3.txt и формирует общий отчет report.txt.
### 3. Скриншоты работы системы
### 3.1. Главное меню системы
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_menu.png
3.2. Работа модуля 1 (Выбор редактора)
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_chapter1.png
3.3. Работа модуля 2 (Инспекция кода)
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_chapter2.png
3.4. Работа модуля 3 (Сравнительный анализ)
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_chapter3.png
3.5. Результат работы системы (Пункт 4)
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_lab_system.png
https://github.com/alinakharitonova2009-bit/lab2-comprehensive--/blob/main/photo_report.png

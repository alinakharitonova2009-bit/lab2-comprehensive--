@echo off
chcp 65001 >nul
color 0B
set correct=0
set total=3

echo ====================================================
echo МОДУЛЬ 2: Инспекция кода (поиск дефектов)
echo ====================================================
echo.

echo Фрагмент 1 (Настройка плагина редактора):
echo 10: def setup_plugin():
echo 11:     import os
echo 12:     config = {"theme": "dark", "font": "Consolas"}
echo 13:     return config
echo 14:     os.system("start editor.exe")
echo.
echo Какой дефект здесь скрыт?
echo 1. Мертвое присваивание
echo 2. Недостижимый код после return
echo 3. Утечка памяти
set /p ans1="Ваш ответ (1, 2 или 3): "

if "%ans1%"=="2" goto f1_correct
echo Неверно. Правильный ответ: 2
goto f2_start

:f1_correct
echo Верно! Строка 14 никогда не выполнится после return.
set /a correct+=1

:f2_start
echo.
echo Фрагмент 2 (Расчет стоимости лицензии):
echo 20: def calculate_license_cost(users):
echo 21:     cost = users * 80
echo 22:     if users ^> 10:
echo 23:         cost = cost * 0.9
echo 24:     return cost
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число
echo 2. Неинициализированная переменная
echo 3. Отсутствие обработки ошибок
set /p ans2="Ваш ответ (1, 2 или 3): "

if "%ans2%"=="1" goto f2_correct
echo Неверно. Правильный ответ: 1
goto f3_start

:f2_correct
echo Верно! Число 80 и 0.9 - это магические числа.
set /a correct+=1

:f3_start
echo.
echo Фрагмент 3 (Сохранение файла):
echo 30: def save_file(filename, content):
echo 31:     file = open(filename, "w")
echo 32:     file.write(content)
echo.
echo Какой дефект здесь скрыт?
echo 1. Утечка ресурса (файл не закрыт)
echo 2. Мертвое присваивание
echo 3. SQL-инъекция
set /p ans3="Ваш ответ (1, 2 или 3): "

if "%ans3%"=="1" goto f3_correct
echo Неверно. Правильный ответ: 1
goto report_start

:f3_correct
echo Верно! Нет конструкции with open() или file.close().
set /a correct+=1

:report_start
echo.
echo ====================================================
echo Итоговый отчет по ревью:
echo Правильных ответов: %correct% из %total%

set /a percentage=0
if %correct%==1 set percentage=33
if %correct%==2 set percentage=66
if %correct%==3 set percentage=100

echo Точность: %percentage%%%

if %percentage% geq 80 goto level_senior
if %percentage% geq 50 goto level_middle
goto level_junior

:level_senior
echo Ваш уровень: Senior Reviewer
echo Senior > result2.txt
goto finish

:level_middle
echo Ваш уровень: Middle Reviewer
echo Middle > result2.txt
goto finish

:level_junior
echo Ваш уровень: Junior Reviewer
echo Junior > result2.txt

:finish
echo.
echo [Нажмите любую клавишу, чтобы вернуться в меню...]
pause >nul
@echo off
chcp 65001 >nul
color 0A
set score_sublime=0
set score_atom=0
set score_notepad=0

echo ====================================================
echo МОДУЛЬ 1: Выбор текстового редактора для команды
echo ====================================================
echo.

echo Вопрос 1: Какой у команды бюджет на покупку софта?
echo 1. Строго нулевой (только бесплатные решения)
echo 2. Ограниченный (до $80 на человека)
echo 3. Бюджет не ограничен
choice /c 123 /n
if errorlevel==3 set /a score_sublime+=15
if errorlevel==2 set /a score_sublime+=10 & set /a score_atom+=5
if errorlevel==1 set /a score_notepad+=15 & set /a score_atom+=10

echo.
echo Вопрос 2: Насколько важна модульность и наличие огромной экосистемы плагинов?
echo 1. Критично (нужны плагины под всё)
echo 2. Важно, но не критично
echo 3. Достаточно базового функционала
choice /c 123 /n
if errorlevel==1 set /a score_atom+=15 & set /a score_sublime+=10
if errorlevel==2 set /a score_sublime+=10 & set /a score_atom+=10
if errorlevel==3 set /a score_notepad+=15

echo.
echo Вопрос 3: Какой размер файлов преимущественно открывает команда?
echo 1. Огромные логи и дампы (более 1 ГБ)
echo 2. Средние файлы (до 100 МБ)
echo 3. Маленькие скрипты и конфиги
choice /c 123 /n
if errorlevel==1 set /a score_notepad+=15
if errorlevel==2 set /a score_sublime+=10 & set /a score_atom+=5
if errorlevel==3 set /a score_notepad+=10 & set /a score_atom+=10 & set /a score_sublime+=5

echo.
echo ====================================================
echo Анализ профиля завершен. Идет расчет...
echo ====================================================
if %score_notepad% geq %score_sublime% if %score_notepad% geq %score_atom% (
    echo РЕКОМЕНДАЦИЯ: Notepad++
    echo Причина: Идеально подходит под ограниченный бюджет, легковесен и отлично работает с большими файлами.
    echo %score_notepad% > result1.txt
) else if %score_sublime% geq %score_atom% (
    echo РЕКОМЕНДАЦИЯ: Sublime Text
    echo Причина: Отличный баланс цены, скорости работы и удобства для команды.
    echo %score_sublime% > result1.txt
) else (
    echo РЕКОМЕНДАЦИЯ: Atom
    echo Причина: Лучший выбор для кастомизации и работы с плагинами.
    echo %score_atom% > result1.txt
)
echo.
pause
@echo off
chcp 65001 >nul
color 0E
echo ====================================================
echo МОДУЛЬ 3: Сравнительный анализ редакторов (WSM)
echo ====================================================
echo.
echo Назначьте веса критериям (сумма должна быть 100):
echo Критерий 1: Удобство и функционал
echo Критерий 2: Стоимость лицензии
echo Критерий 3: Производительность и вес
echo.
set /p w1="Вес критерия 1: "
set /p w2="Вес критерия 2: "
set /p w3="Вес критерия 3: "
set /a total_weight=w1+w2+w3
if %total_weight% neq 100 (
    echo Ошибка: сумма весов не равна 100!
    pause
    exit
)

echo.
echo Оцените альтернативы по шкале от 1 до 5:
echo --- Sublime Text ---
set /p s_1="Sublime по критерию 1: "
set /p s_2="Sublime по критерию 2: "
set /p s_3="Sublime по критерию 3: "

echo --- Atom ---
set /p a_1="Atom по критерию 1: "
set /p a_2="Atom по критерию 2: "
set /p a_3="Atom по критерию 3: "

echo --- Notepad++ ---
set /p n_1="Notepad++ по критерию 1: "
set /p n_2="Notepad++ по критерию 2: "
set /p n_3="Notepad++ по критерию 3: "

set /a score_s=s_1*w1+s_2*w2+s_3*w3
set /a score_a=a_1*w1+a_2*w2+a_3*w3
set /a score_n=n_1*w1+n_2*w2+n_3*w3

echo.
echo ====================================================
echo === Матрица решений ===
echo Критерий       ^| Вес ^| Sublime ^| Atom ^| Notepad++
echo Удобство/Функционал ^| %w1%  ^| %s_1%     ^| %a_1%  ^| %n_1%
echo Стоимость      ^| %w2%  ^| %s_2%     ^| %a_2%  ^| %n_2%
echo Производит.   ^| %w3%  ^| %s_3%     ^| %a_3%  ^| %n_3%
echo ИТОГО          ^|     ^| %score_s%     ^| %score_a%  ^| %score_n%
echo ====================================================
if %score_s% gtr %score_a% if %score_s% gtr %score_n% (
    echo Победитель: Sublime Text
    echo Sublime > result3.txt
) else if %score_a% gtr %score_s% if %score_a% gtr %score_n% (
    echo Победитель: Atom
    echo Atom > result3.txt
) else (
    echo Победитель: Notepad++
    echo Notepad++ > result3.txt
)
echo.
pause
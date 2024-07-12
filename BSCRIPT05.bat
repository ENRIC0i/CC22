:: Programmed by: Abenes, Enrico O.
:: Program Title: Reverse Multiplication Table
:: Program Date: June 05, 2024

@echo off
setlocal enabledelayedexpansion

:main
set "enteredNumbers="
cls

:mainLoop
cls
echo Creating the reverse multiplication table:
echo.

REM Generating the reverse multiplication table
for /l %%i in (10,-1,1) do (
    set "formatted="
    for /l %%j in (10,-1,1) do (
        set /a result=%%i * %%j
        if !result! LSS 10 (
            set "formatted=!formatted!   !result!"
        ) else (
            if !result! LSS 100 (
                set "formatted=!formatted!  !result!"
            ) else (
                set "formatted=!formatted! !result!"
            )
        )
    )
    echo !formatted!
)

echo.
:start
set /p num=Enter an integer (1 to 10) or type 'exit' to quit: 

if /i "%num%"=="exit" goto end

if %num% LSS 1 goto invalidInput
if %num% GTR 10 goto invalidInput

echo %enteredNumbers% | find " %num% " >nul
if %errorlevel%==0 (
    echo Number %num% has already been entered.
    echo Displaying the row for %num%:
    goto displayRow
)

set enteredNumbers=%enteredNumbers% %num%
goto displayRow

:displayRow
cls
echo Creating the reverse multiplication table:
echo.

REM Generating the reverse multiplication table again
for /l %%i in (10,-1,1) do (
    set "formatted="
    for /l %%j in (10,-1,1) do (
        set /a result=%%i * %%j
        if !result! LSS 10 (
            set "formatted=!formatted!   !result!"
        ) else (
            if !result! LSS 100 (
                set "formatted=!formatted!  !result!"
            ) else (
                set "formatted=!formatted! !result!"
            )
        )
    )
    echo !formatted!
)

echo.
echo Displaying the row for %num%:
echo.

REM Display the specific row
set "formatted="
for /l %%j in (10,-1,1) do (
    set /a result=%num% * %%j
    if !result! LSS 10 (
        set "formatted=!formatted!   !result!"
    ) else (
        if !result! LSS 100 (
            set "formatted=!formatted!  !result!"
        ) else (
            set "formatted=!formatted! !result!"
        )
    )
)
echo !formatted!
echo.
pause
goto mainLoop

:invalidInput
echo Invalid input. Please enter a number between 1 and 10.
pause
goto mainLoop

:end
echo Script execution finished.
pause
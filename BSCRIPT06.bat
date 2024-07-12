:: Programmed by: Abenes, Enrico O.
:: Program Title: Time Converter
:: Program Date: June 05, 2024

@echo off
setlocal enabledelayedexpansion

:mainLoop
cls
:timeConverter
set /p time24=Enter time in 24-hour format (HH:MM) or type 'exit' to quit: 

if /i "%time24%"=="exit" goto end

set hour=%time24:~0,2%
set min=%time24:~3,2%
if %hour% LSS 12 (
    if %hour%==00 (
        set hour=12
    )
    set ampm=AM
) else (
    if %hour% GTR 12 (
        set /a hour=hour-12
    )
    if %hour%==12 (
        set ampm=PM
    ) else (
        set ampm=PM
    )
)
if %hour%==12 set ampm=PM
echo %hour%:%min% %ampm%
pause
goto mainLoop

:end
echo Script execution finished.
pause

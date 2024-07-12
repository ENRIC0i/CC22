@echo off
setlocal enabledelayedexpansion

:MainMenu
cls

echo Choose a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
set /p choice=Enter your choice (1/2/3/4): 

if "%choice%"=="1" goto Circle
if "%choice%"=="2" goto Triangle
if "%choice%"=="3" goto Quadrilateral
if "%choice%"=="4" goto End
goto MainMenu

:Circle
set /p radius=Enter the radius of the circle: 
set /a area=314159*radius*radius/100000
echo The area of the circle is %area%
pause
goto MainMenu

:Triangle
set /p a=Enter the length of side a: 
set /p b=Enter the length of side b: 
set /p c=Enter the length of side c: 
set /a s=(a+b+c)/2
set /a area=s*(s-a)*(s-b)*(s-c)
call :sqrt area area
echo The area of the triangle is %area%

if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral
) else if %a%==%b% if not %b%==%c% (
    echo The triangle is isosceles
) else if %a%==%c% if not %b%==%c% (
    echo The triangle is isosceles
) else if %b%==%c% if not %a%==%c% (
    echo The triangle is isosceles
) else (
    echo The triangle is scalene
)
pause
goto MainMenu

:Quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=length*width
echo The area of the quadrilateral is %area%

if %length%==%width% (
    echo The quadrilateral is a square
) else (
    echo The quadrilateral is a rectangle
)
pause
goto MainMenu

:sqrt

setlocal
set /a N=%~1, X=N, Y=0
:SQRT_LOOP
if %X% gtr %Y% (
    set /a Y=X
    set /a X=(N/X + X) / 2
    goto SQRT_LOOP
)
endlocal & set "%~2=%X%"
goto :eof

:End
echo Goodbye!
pause

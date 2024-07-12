@echo off
setlocal enabledelayedexpansion

:MainMenu
cls
echo Choose a Windows utility command to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Exit
set /p choice=Enter your choice (1-9): 

if "%choice%"=="1" goto Ipconfig
if "%choice%"=="2" goto Tasklist
if "%choice%"=="3" goto Taskkill
if "%choice%"=="4" goto Chkdsk
if "%choice%"=="5" goto Format
if "%choice%"=="6" goto Defrag
if "%choice%"=="7" goto Find
if "%choice%"=="8" goto Attrib
if "%choice%"=="9" goto End
goto MainMenu

:Ipconfig
ipconfig
pause
goto MainMenu

:Tasklist
tasklist
pause
goto MainMenu

:Taskkill
set /p pid=Enter the PID of the process to kill: 
taskkill /PID %pid%
if errorlevel 1 echo Failed to kill the process.
pause
goto MainMenu

:Chkdsk
set /p drive=Enter the drive letter to check (e.g., C:): 
chkdsk %drive%
pause
goto MainMenu

:Format
set /p drive=Enter the drive letter to format (e.g., D:): 
echo Warning: Formatting will erase all data on %drive%. Proceed? (Y/N)
choice /c yn /m "Press Y to proceed or N to cancel."
if errorlevel 2 goto MainMenu
if errorlevel 1 format %drive%
pause
goto MainMenu

:Defrag
set /p drive=Enter the drive letter to defragment (e.g., C:): 
defrag %drive%
pause
goto MainMenu

:Find
set /p search=Enter the text to search for: 
set /p file=Enter the file to search in: 
find "%search%" %file%
pause
goto MainMenu

:Attrib
set /p file=Enter the file to change attributes: 
set /p attribs=Enter the attributes to set (e.g., +r -h): 
attrib %attribs% %file%
pause
goto MainMenu

:End
echo Goodbye!
pause

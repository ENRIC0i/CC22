@echo off
setlocal enabledelayedexpansion

echo Sorting text files on Drive C: by date...
forfiles /p C:\ /m *.txt /c "cmd /c echo @path @fdate @ftime" > sorted_files.txt

echo Archiving older files to Drive Z:...
forfiles /p C:\ /m *.txt /d -30 /c "cmd /c move @file Z:\Archived"

echo Sorting archived files by size...
forfiles /p Z:\Archived /m *.txt /c "cmd /c echo @path @fsize" > archived_files.txt

echo Do you want to delete the old, large files in the archive?
choice /c yn /m "Press Y to delete, N to skip."

if errorlevel 2 goto End
if errorlevel 1 goto DeleteFiles

:DeleteFiles
forfiles /p Z:\Archived /m *.txt /c "cmd /c del @file"
echo Old, large files deleted.
goto End

:End
pause

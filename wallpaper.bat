@echo off
setlocal

if "%~1"=="" (
    echo Usage: %~n0 "path\to\image.jpg"
    exit /b
)

set "file=%~f1"

if not exist "%file%" (
    echo File not found: "%file%"
    exit /b
)

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%file%" /f >nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
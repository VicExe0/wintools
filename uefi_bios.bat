@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Not running as admin, restarting...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

shutdown /r /fw /t 0
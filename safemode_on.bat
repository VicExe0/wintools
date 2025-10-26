@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Not running as admin, restarting...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

bcdedit /set {current} safeboot minimal
shutdown /r /t 0
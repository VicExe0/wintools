@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Not running as admin, restarting...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

bcdedit /set {current} safeboot minimal

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "ExitSafeMode" /t REG_SZ /d "bcdedit /deletevalue {current} safeboot" /f

shutdown /r /t 0

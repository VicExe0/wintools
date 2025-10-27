@echo off

del /q /f /s %temp%\*
del /s /q C:\Windows\temp\*

if /I "%~1"=="--clear-cache" (
  net session >nul 2>&1

  del /q /f /s "%localAppData%\NVIDIA\GLCache\*"
  del /q /f /s "%localAppData%\NVIDIA\DXCache\*"
)
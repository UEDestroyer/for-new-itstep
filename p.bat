@echo off
setlocal EnableDelayedExpansion

set "MSYS2_PATH=C:\msys64\usr\bin\bash.exe"
set "COMMAND="
set CURRENT_DIR=%cd%

if "%1"=="" (
    set /p "COMMAND=Enter command: "
) else (
    set "COMMAND=%*"
)

set "COMMAND=!COMMAND:.\=./!"

set "COMMAND=!COMMAND:\/=;!"

"%MSYS2_PATH%" -l -c "cd '%CURRENT_DIR%' && %COMMAND%"

@echo off
setlocal EnableDelayedExpansion

set "MSYS2_PATH=C:\msys64\usr\bin\bash.exe"
set "COMMAND="
set "CURRENT_DIR=%cd%"

if "%~1"=="" (
    set /p "COMMAND=Enter command: "
) else (
    set "COMMAND=%*"
)

set "COMMAND=!COMMAND:.\=./!"
set "COMMAND=!COMMAND:\/=/!"

set "POSIX_DIR=%CURRENT_DIR:\=/%"
set "DRIVE_LETTER=!POSIX_DIR:~0,1!"
set "POSIX_PATH=!POSIX_DIR:~2!"
set "POSIX_DIR=/%DRIVE_LETTER%!POSIX_PATH!"

"%MSYS2_PATH%" -l -c "cd '!POSIX_DIR!' && export PATH=/mingw64/bin:$PATH && !COMMAND!"
@echo on

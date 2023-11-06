@echo off
mode con: cols=80 lines=25

:menu
cls
echo.
echo Console | Users
echo --------------------------
echo 1. Add User
echo 2. Hardware Info
echo 3. System Info
echo 4. BIOS Date
echo 5. Exit
echo.
set /p "choice=Enter your choice: "

if "%choice%"==1 (
    call :addUser
) else if "%choice%"==2 (
    call :hardwareInfo
) else if "%choice%"==3 (
    call :systemInfo
) else if "%choice%"==4 (
    call :biosDate
) else if "%choice%"==5 (
    exit
) else (
    echo Invalid choice. Press any key to try again.
    pause > nul
)
goto menu

:addUser
cls
echo.
set /p "username=Enter username: "
set /p "password=Enter password: "
if not "%username%"=="" (
    net user %username% %password% /add
    if !errorlevel! equ 0 (
        echo User "%username%" added successfully.
    ) else (
        echo Failed to add user "%username%".
    )
    pause
)
goto :eof

:hardwareInfo
cls
echo.
systeminfo | find "System Manufacturer"
systeminfo | find "System Model"
pause
goto :eof

:systemInfo
cls
echo.
systeminfo | find "OS Name"
systeminfo | find "OS Version"
pause
goto :eof

:biosDate
cls
echo.
systeminfo | find "BIOS Version"
pause
goto :eof

@echo off
mode 150,50
chcp 65001 >nul

title Made by Malfol
color 1

:menu
cls
echo.
echo.
echo ██╗    ██╗███████╗██████╗ ██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗     ███████╗██████╗  █████╗ ███╗   ███╗███╗   ███╗███████╗██████╗          
echo ██║    ██║██╔════╝██╔══██╗██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝     ██╔════╝██╔══██╗██╔══██╗████╗ ████║████╗ ████║██╔════╝██╔══██╗         
echo ██║ █╗ ██║█████╗  ██████╔╝███████║██║   ██║██║   ██║█████╔╝█████╗███████╗██████╔╝███████║██╔████╔██║██╔████╔██║█████╗  ██████╔╝         
echo ██║███╗██║██╔══╝  ██╔══██╗██╔══██║██║   ██║██║   ██║██╔═██╗╚════╝╚════██║██╔═══╝ ██╔══██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  ██╔══██╗         
echo ╚███╔███╔╝███████╗██████╔╝██║  ██║╚██████╔╝╚██████╔╝██║  ██╗     ███████║██║     ██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗██║  ██║██╗██╗██╗
echo  ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝     ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝╚═╝
echo.
echo.
echo ┌────────────────────────────────┐
echo │            SPAMMER             │
echo ├────────────────────────────────┤
echo │ 1. Exit                        │
echo │ 2. Discord webhook spammer     │
echo └────────────────────────────────┘
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" exit /b
if "%choice%"=="2" goto messagesender
goto menu

:messagesender
cls
echo ┌────────────────────────────────┐
echo │     Discord webhook spammer    │
echo ├────────────────────────────────┤
echo.
set /p webhook=Enter Discord webhook URL: 
set /p message=Enter the message to send: 
set /p num_times=Enter the number of times to send the message: 
set /p delay=Enter delay between messages (1-20 ms): 

:: Validate input
if "%webhook%"=="" echo Invalid webhook URL! & pause & goto menu
if "%message%"=="" echo Message cannot be empty! & pause & goto menu
if "%num_times%"=="" echo Number of times cannot be empty! & pause & goto menu
if "%delay%"=="" echo Delay cannot be empty! & pause & goto menu
if %delay% LSS 1 set delay=1
if %delay% GTR 20 set delay=20

:: Loop to send messages
for /l %%n in (1,1,%num_times%) do (
    echo Sending message %%n/%num_times%...
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" "%webhook%"
    ping -n 1 -w %delay% 127.0.0.1 >nul
)

echo.
echo Messages sent successfully.
pause
goto menu
@echo off
chcp 65001 >nul
title Discord Webhook Spammer
color 1

:menu
cls
echo ┌────────────────────────────────┐
echo │       DISCORD SPAMMER          │
echo ├────────────────────────────────┤
echo │ 1. Start Spamming              │
echo │ 2. Exit                        │
echo └────────────────────────────────┘
echo.
set /p choice=Enter your choice: 

if "%choice%"=="2" exit /b
if "%choice%"=="1" goto spammer
goto menu

:spammer
cls
echo ┌────────────────────────────────┐
echo │      Webhook Spammer Setup     │
echo ├────────────────────────────────┤
set /p webhook=Enter Discord webhook URL: 
set /p message=Enter the message to send: 
set /p num_times=Enter number of messages: 

:: Validate input
if "%webhook%"=="" echo Invalid webhook! & pause & goto menu
if "%message%"=="" echo Message cannot be empty! & pause & goto menu
if "%num_times%"=="" echo Number of messages cannot be empty! & pause & goto menu

:: High-speed spamming using start command for multiple instances
for /l %%n in (1,1,%num_times%) do (
    start /b curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" "%webhook%" >nul 2>&1
)

echo.
echo Spam complete.
pause
goto menu

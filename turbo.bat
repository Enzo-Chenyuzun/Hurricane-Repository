@echo off
chcp 936 >nul
echo Forcing activation of High Performance mode... (正在强行唤醒并切换高性能模式...)

:: Try to unhide the hidden High Performance plan (尝试克隆隐藏的高性能模式)
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

:: Activate the power scheme (激活高性能模式)
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Check if the command was successful (判断是否切换成功)
if %errorlevel%==0 goto Success
goto Fail

:Success
echo Success! Switched to High-Performance mode. (已成功切换到高性能模式！)
goto End

:Fail
echo Failed! Please right-click and select "Run as administrator". (切换失败！请右键以管理员身份运行。)

:End
timeout /t 3 >nul
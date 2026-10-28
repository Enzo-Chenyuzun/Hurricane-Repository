@echo off
chcp 936 >nul
echo Forcing activation of Normal (Balanced) mode... (正在强行唤醒并切换到正常模式...)

:: Directly use the official Windows Balanced mode GUID (直接使用官方平衡模式GUID)
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e

:: Check if the command was successful (判断是否切换成功)
if %errorlevel%==0 goto Success
goto Fail

:Success
echo Success! Switched to Normal mode. (已成功切换到正常模式！)
goto End

:Fail
echo Failed! Please right-click and select "Run as administrator". (切换失败！请右键以管理员身份运行。)
echo Note: If it still fails, your system might be using a custom power plan. (注意：如果仍失败，您的系统可能正在使用自定义电源计划。)

:End
timeout /t 3 >nul
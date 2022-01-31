@echo off
:Menu
Echo.&Echo  1.Login Config
Echo.&Echo  2.Recovery
Echo.&Echo  3.Set CFPath
Echo.&Echo.
set /p a=Type 1-3 and press Enter to run:
If Not "%a%"=="" Set a=%a:~0,1%
If "%a%"=="1" Goto Config
If "%a%"=="2" Goto Recovery
If "%a%"=="3" Goto SetCFPath
Echo.&Echo Error,please type 1-3
PAUSE >NUL & CLS & GOTO Menu

:Config
cls
@ICACLS %CFPath%NTCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %CFPath%WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %CFPath%NTCLS\*.* >nul 2>nul
@attrib -r /s %CFPath%WeGameLauncher\*.* >nul 2>nul
@echo.>%CFPath%NTCLS\wegame_launch.ini
@echo [TCLS] >%CFPath%NTCLS\wegame_launch.ini
@echo data_name=cf >>%CFPath%NTCLS\wegame_launch.ini
@echo.>%CFPath%NTCLS\wegame_launch.tmp
@echo [TCLS] >%CFPath%NTCLS\wegame_launch.tmp
@echo LastLoginMethod=1 >>%CFPath%NTCLS\wegame_launch.tmp
@"%~dp0nircmd\nircmd.exe" shortcut "%CFPath%NTCLS\tgp_daemon.exe" "~$folder.desktop$" "穿越火线" >nul 2>nul
@ICACLS %CFPath%NTCLS\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO) /C /Q >nul 2>nul
@ICACLS %CFPath%WeGameLauncher\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO,RC,RA,REA,X) /C /Q >nul 2>nul  && exit

:Recovery
cls
@ICACLS %CFPath%NTCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %CFPath%WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %CFPath%NTCLS\*.* >nul 2>nul
@attrib -r /s %CFPath%WeGameLauncher\*.* >nul 2>nul && exit

:SetCFPath
cls
@for /f "tokens=*" %%a in ('dir \穿越火线卸载.exe /b /s') do SETX CFPath %%~dpa >nul 2>nul && exit
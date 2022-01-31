@echo off
:Menu
Echo.&Echo  1.Login Config
Echo.&Echo  2.Recovery
Echo.&Echo  3.Set LOLPath
Echo.&Echo.
set /p a=Type 1-3 and press Enter to run:
If Not "%a%"=="" Set a=%a:~0,1%
If "%a%"=="1" Goto Config
If "%a%"=="2" Goto Recovery
If "%a%"=="3" Goto SetLOLPath
Echo.&Echo Error,please type 1-3
PAUSE >NUL & CLS & GOTO Menu

:Config
cls
@ICACLS %LOLPath%TCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %LOLPath%WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %LOLPath%TCLS\*.* >nul 2>nul
@attrib -r /s %LOLPath%WeGameLauncher\*.* >nul 2>nul
@echo.>%LOLPath%TCLS\wegame_launch.ini
@echo [TCLS] >%LOLPath%TCLS\wegame_launch.ini
@echo data_name=lol >>%LOLPath%TCLS\wegame_launch.ini
@echo.>%LOLPath%TCLS\wegame_launch.tmp
@echo [TCLS] >%LOLPath%TCLS\wegame_launch.tmp
@echo LastLoginMethod=1 >>%LOLPath%TCLS\wegame_launch.tmp
@ICACLS %LOLPath%TCLS\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO) /C /Q >nul 2>nul
@ICACLS %LOLPath%WeGameLauncher\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO,RC,RA,REA,X) /C /Q >nul 2>nul  && exit

:Recovery
cls
@ICACLS %LOLPath%TCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %LOLPath%WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %LOLPath%TCLS\*.* >nul 2>nul
@attrib -r /s %LOLPath%WeGameLauncher\*.* >nul 2>nul && exit

:SetLOLPath
cls
@for /f "tokens=*" %%a in ('dir \Ó¢ÐÛÁªÃËÐ¶ÔØ.exe /b /s') do SETX LOLPath %%~dpa >nul 2>nul && exit
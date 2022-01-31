@echo off
:Menu
Echo.&Echo  1.Login Config
Echo.&Echo  2.Recovery
Echo.&Echo.
set /p a=Type 1 or 2 and press Enter to run:
If Not "%a%"=="" Set a=%a:~0,1%
If "%a%"=="1" Goto Config
If "%a%"=="2" Goto Recovery
Echo.&Echo Error,please type 1 or 2
PAUSE >NUL & CLS & GOTO Menu

:Config
cls
@ICACLS %~dp0TCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %~dp0WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %~dp0TCLS\*.* >nul 2>nul
@attrib -r /s %~dp0WeGameLauncher\*.* >nul 2>nul
@echo.>%~dp0TCLS\wegame_launch.ini
@echo [TCLS] >%~dp0TCLS\wegame_launch.ini
@echo data_name=lol >>%~dp0TCLS\wegame_launch.ini
@echo.>%~dp0TCLS\wegame_launch.tmp
@echo [TCLS] >%~dp0TCLS\wegame_launch.tmp
@echo LastLoginMethod=1 >>%~dp0TCLS\wegame_launch.tmp
@ICACLS %~dp0TCLS\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO) /C /Q >nul 2>nul
@ICACLS %~dp0WeGameLauncher\ /deny Everyone:(OI)(CI)(WD,AD,WA,WEA,DE,DC,WDAC,WO,RC,RA,REA,X) /C /Q >nul 2>nul  && exit

:Recovery
cls
@ICACLS %~dp0TCLS\ /reset /T /C /Q >nul 2>nul
@ICACLS %~dp0WeGameLauncher\ /reset /T /C /Q >nul 2>nul
@attrib -r /s %~dp0TCLS\*.* >nul 2>nul
@attrib -r /s %~dp0WeGameLauncher\*.* >nul 2>nul && exit
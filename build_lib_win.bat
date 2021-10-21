@echo off
set PROJ=lclfiledialog
mkdir out
mkdir lib
fpc -dLCLwin32 ^
-Fucomponents\lazarus-main\lcl\interfaces\win32 ^
-Ficomponents\lazarus-main\lcl\interfaces\win32 ^
@build_lib.cfg -WR %PROJ%.lpr
@echo off
set PROJ=lclfd

mkdir out
mkdir lib
fpc -MObjFPC -Schi -CX -WR -Os4 -XX -v0 -Fucomponents -FUlib -Fulib -FEout ^
%PROJ%.lpr
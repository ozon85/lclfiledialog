@echo off
rd lib /Q /S
rem del out /Q
exit /B

For /R .\ %%v In (*.ppu) Do ( 
Del "%%v" 
rem Echo ” ©«
rem "%%v"
)
echo deleted *.ppu

For /R .\ %%v In (*.o) Do ( 
Del "%%v" 
rem Echo ” ©«
rem "%%v"
)
echo deleted *.o

For /R .\ %%v In (*.obj) Do ( 
Del "%%v" 
rem Echo ” ©«
rem "%%v"
)
echo deleted *.obj

For /R .\ %%v In (*.rsj) Do ( 
Del "%%v" 
rem Echo ” ©«
rem "%%v"
)
echo deleted *.rsj
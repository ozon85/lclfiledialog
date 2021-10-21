PROJ=lclfiledialog
mkdir -p out
mkdir -p lib
fpc -dLCLqt \
-Fucomponents/lazarus-main/lcl/interfaces/qt \
-Ficomponents/lazarus-main/lcl/interfaces/qt \
-Fucomponents/lazarus-main/lcl/nonwin32 \
-Ficomponents/lazarus-main/lcl/nonwin32 \
@build_lib.cfg $PROJ.lpr
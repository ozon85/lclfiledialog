PROJ=lclfiledialog

mkdir -p out
mkdir -p lib
fpc -dLCLqt5 \
-Fucomponents/lazarus-main/lcl/interfaces/qt5 \
-Ficomponents/lazarus-main/lcl/interfaces/qt5 \
-Fucomponents/lazarus-main/lcl/nonwin32 \
-Ficomponents/lazarus-main/lcl/nonwin32 \
@build_lib.cfg $PROJ.lpr
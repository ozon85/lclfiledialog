PROJ=lclfiledialog
mkdir -p out
mkdir -p lib
fpc -dLCLgtk2 \
-Fucomponents/lazarus-main/lcl/interfaces/gtk2 \
-Ficomponents/lazarus-main/lcl/interfaces/gtk2 \
-Fucomponents/lazarus-main/lcl/nonwin32 \
-Ficomponents/lazarus-main/lcl/nonwin32 \
@build_lib.cfg $PROJ.lpr
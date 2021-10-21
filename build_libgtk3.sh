PROJ=lclfiledialog
mkdir -p out
mkdir -p lib
fpc -dLCLgtk3 \
-Fucomponents/lazarus-main/lcl/interfaces/gtk3 \
-Ficomponents/lazarus-main/lcl/interfaces/gtk3 \
-Fucomponents/lazarus-main/lcl/nonwin32 \
-Ficomponents/lazarus-main/lcl/nonwin32 \
-Fucomponents/lazarus-main/lcl/interfaces/gtk3/gtk3bindings \
@build_lib.cfg $PROJ.lpr
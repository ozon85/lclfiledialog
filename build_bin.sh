PROJ=lclfd

mkdir -p out
mkdir -p lib
fpc -MObjFPC -Schi -CX -Os4 -XX -v0 -Fucomponents -FUlib -Fulib -FEout \
$PROJ.lpr
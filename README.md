# lclfiledialog

This dynamic library is an attempt to have a native file dialog for applications that don't need graphical dependencies.
It is based on the graphical capabilities of Lazarus and theoretically should be compiled wherever the Lazarus file dialog is implemented (carbon, cocoa, gtk2, gtk3, mui, qt, qt5, win32, wince). The called dialog looks like system dialog according with implementation in lazarus.    
*Library will work only with widgets, wich used when compiled.*

__lclfiledialog.pas__ is pascal wrapper, and has its own definition of the Topendialog class, which refers only to the library.

There is also a project of an executable process for calling a dialog in scripts.

You may compile library as lazarus package with LCL dependency or using included scripts for free pascal compiler.

__build requirements:__ (keep the bits of the packets)

fpc-base, pfc-units    
_libs:_    
  X11.so (x11-devel)    
_for gtk2:_
  gdk-x11-2.0.so, gtk-x11-2.0.so (gtk+2.0-devel)    
  gdk_pixbuf-2.0.so (gdk_pixbuf2.0-devel)    
  pango-1.0.so (pango1.0-devel)    
  cairo.so (cairo-devel)    
  atk-1.0.so (atk1.0_0)

*for qt:* Qt4Pas.so (Qt4Pas-devel)    
*for qt5:* Qt5Pas.so (Qt5Pas-devel)    

if you compile library, using included scripts, you should provide the folder named 'components' with the
'lazarus-main' folder inside. It may be downloaded from    https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/main/lazarus-main.zip    or be a symlink to installed folder 'lazarus'. For example link /usr/lib64/lazarus to ...lclfiledialog/lazarus-main.    
When you change lcl widgetset (from gtk to qt and etc) call clear script.

For compiling binary project place portabledynlib.pas (look in other repository) into 'components' folder.    

This project tested only in Windows and Linux. 


# lclfiledialog

This dynamic library is an attempt to have a native file dialog for applications that don't need graphical dependencies.
It is based on the graphical capabilities of Lazarus and theoretically should be compiled wherever the Lazarus file dialog is implemented (carbon, cocoa, gtk2, gtk3, mui, qt, qt5, win32, wince). The called dialog looks like system dialog according with implementation in lazarus.

__lclfiledialog.pas__ is pascal wrapper, and has its own execution of the Topendialog class, which refers only to the library.

There is also a project of an executable process for calling a dialog in scripts.

You can compile this project as lazarus package with LCL dependency or using scripts for free pascal compiler.

__build requirements:__

fpc-base, pfc-units, portabledynlib (look in my repository)

__+libs:__

X11.so (x11-devel)

*for gtk2:*
gdk-x11-2.0.so, gtk-x11-2.0.so (gtk+2.0-devel)    
gdk_pixbuf-2.0.so (gdk_pixbuf2.0-devel)
pango-1.0.so (pango1.0-devel)
cairo.so (cairo-devel)
atk-1.0.so (atk1.0_0)

*for gtk3:*
gdk-x11-2.0.so, gtk-x11-2.0.so (gtk+3.0-devel)
pangocairo-1.0.so (pangocairo1.0-devel)
gdk_pixbuf-2.0.so (gdk_pixbuf2.0-devel)
pango-1.0.so (pango1.0-devel)
cairo.so (cairo-devel)
atk-1.0.so (atk1.0_0)
	  
*for qt:* Qt4Pas.so (Qt4Pas-devel)

*for qt5:* Qt5Pas.so (Qt5Pas-devel)


	

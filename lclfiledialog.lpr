library lclfiledialog;

{$mode objfpc}{$H+}

uses
  Classes,Interfaces,Forms,Dialogs;
const
{$IFdef LCLwin32}
LCLWidgetType='LCLwin32'
{$ENDIF}
{$IFdef LCLgtk}
LCLWidgetType='LCLgtk'
{$ENDIF}
{$IFdef LCLgtk2}
LCLWidgetType='LCLgtk2'
{$ENDIF}
{$IFdef LCLgtk3}
LCLWidgetType='LCLgtk3'
{$ENDIF}
{$IFdef LCLqt}
LCLWidgetType='LCLqt'
{$ENDIF}
{$IFdef LCLqt5}
LCLWidgetType='LCLqt5'
{$ENDIF}
{$IFdef LCLwince}
LCLWidgetType='LCLwince'
{$ENDIF}
{$IFdef LCLqcarbon}
LCLWidgetType='LCLcarbon'
{$ENDIF}
{$IFdef LCLmui}
LCLWidgetType='LCLmui'
{$ENDIF}
{$IFdef LCLcocoa}
LCLWidgetType='LCLcocoa'
{$ENDIF}
; 

var inited:boolean=false;

procedure Init;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
if not inited then
try
RequireDerivedFormResource:=True;
Application.Scaled:=True;
Application.Initialize;
finally
inited:=true;
end;
end;

procedure DeInit;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
Application.Terminate;
end;

function HasInited:boolean;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
  result:=inited;
end;

function WidgetType:PAnsiChar;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
result:=PAnsiChar(LCLWidgetType);
end;

function OpenDialogCreate:TOpenDialog;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
  if inited=false then Init;
  result:=TOpenDialog.Create(nil);
end;

function OpenDialogExecute(OpenDialog:TOpenDialog):boolean;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
  result:=OpenDialog.Execute;
end;

function OpenDialogFileName(OpenDialog:TOpenDialog):PAnsiChar;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
 result:=PAnsiChar(OpenDialog.FileName);
end;

procedure OpenDialogDestroy(OpenDialog:TOpenDialog);{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
OpenDialog.Destroy;
end;

procedure OpenDialogSetFileName(OpenDialog:TOpenDialog;NewName:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
OpenDialog.FileName:=NewName;
end;

function OpenDialogGetInitialDir(OpenDialog:TOpenDialog):PAnsiChar;
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin result:=PAnsiChar(OpenDialog.FileName);end;

procedure OpenDialogSetInitialDir(OpenDialog:TOpenDialog;NewInitialDir:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin OpenDialog.FileName:=NewInitialDir;end;

function OpenDialogGetFilter(OpenDialog:TOpenDialog):PAnsiChar;
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin result:=PAnsiChar(OpenDialog.Filter);end;

procedure OpenDialogSetFilter(OpenDialog:TOpenDialog;NewFilter:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin OpenDialog.Filter:=NewFilter;end;

exports
Init,
DeInit,
HasInited,
WidgetType,
OpenDialogCreate,
OpenDialogExecute,
OpenDialogFileName,
OpenDialogSetFileName,
OpenDialogDestroy,
OpenDialogGetInitialDir,
OpenDialogSetInitialDir,
OpenDialogSetFilter,
OpenDialogGetFilter;


begin

end.


program lclfd;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  sysutils,LCLFileDialog;

var OpenDialog1:TOpenDialog;

begin
  writeln(StdErr,'DefaultSystemCodePage=',DefaultSystemCodePage,' CP_UTF8=',CP_UTF8);
  LoadLCLFDLib;
  if LCLFDLibHandleIsValid then writeln(StdErr,'WidgetType is ',LCLFDLibWidgetType);
  InitLCLFDLib;
  if LCLFDLibHasInited then
    writeln(StdErr,'Library Inited')
  else begin
    writeln(StdErr,'Library Not Inited! Exit');
    exit;
  end;
  OpenDialog1:=TOpenDialog.Create;
  if OpenDialog1.Execute then begin
  {$IFdef MSWindows}
  writeln(UTF8ToAnsi(OpenDialog1.FileName));
  {$ELSE}
  //Linux tested
  writeln(OpenDialog1.FileName);
  {$ENDIF}
  end;
  OpenDialog1.Free;
  if UnLoadLCLFDLib then begin
    writeln(StdErr,'lib unloaded')
  end else
    writeln(StdErr,'lib unload fails!');
end.


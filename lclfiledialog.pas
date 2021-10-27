unit LCLFileDialog;

{$mode objfpc}{$H+}

interface

uses
  Classes,portabledynlib;

const
LCLFDLibName='lclfiledialog';

var LCLFDLibHandle:TLibHandle=NilHandle;

procedure LoadLCLFDLib;
function LCLFDLibHandleIsValid:boolean;
procedure InitLCLFDLib;
function LCLFDLibHasInited:boolean;
function UnLoadLCLFDLib:boolean;
function LCLFDLibWidgetType:string;

{$ASSERTIONS ON}

type

TOpenDialog = class
private
Fdialog:pointer;
function FFileName:string;
procedure SetFileName(NewName:string);
function GetInitialDir:string;
procedure SetInitialDir(NewInitialDir:string);
function GetFilter:string;
procedure SetFilter(NewFilter:string);
public
 { FCompStyle : LongInt;
    }
    function Execute: boolean; virtual;
   { property Handle: THandle read FHandle write SetHandle;
    property UserChoice: integer read FUserChoice write FUserChoice;
    procedure Close; virtual;
    procedure DoShow; virtual;
    procedure DoCanClose(var CanClose: Boolean); virtual;
    procedure DoClose; virtual;
    function HandleAllocated: boolean;
    property Width: integer read GetWidth write SetWidth;
    property Height: integer read GetHeight write SetHeight;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnCanClose: TCloseQueryEvent read FOnCanClose write FOnCanClose;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property HelpContext: THelpContext read FHelpContext write FHelpContext default 0;
    property Title: TTranslateString read FTitle write FTitle stored IsTitleStored;
}
    destructor Destroy; override;
 {   procedure DoCanClose(var CanClose: Boolean); override;
    procedure DoTypeChange; virtual;
    property Files: TStrings read FFiles;
    property HistoryList: TStrings read FHistoryList write SetHistoryList;
    procedure IntfFileTypeChanged(NewFilterIndex: Integer);
    class function FindMaskInFilter(aFilter, aMask: string): integer;
    class function ExtractAllFilterMasks(aFilter: string;
                                   SkipAllFilesMask: boolean = true): string;
    property Title;
    property DefaultExt: string read FDefaultExt write SetDefaultExt; }
    property FileName: String read FFileName write SetFileName;
    property Filter: String read GetFilter write SetFilter;
    {property FilterIndex: Integer read GetFilterIndex write SetFilterIndex default 1;}
    property InitialDir: string read GetinitialDir write SetInitialDir;
    {property OnHelpClicked: TNotifyEvent read FOnHelpClicked write FOnHelpClicked;
    property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;



 }
public
        constructor Create;
 {       procedure DoCanClose(var CanClose: Boolean); override;
        procedure DoFolderChange; virtual;
        procedure DoSelectionChange; virtual;
        procedure IntfSetOption(const AOption: TOpenOption; const AValue: Boolean);
      published
        property Options: TOpenOptions read FOptions write FOptions default DefaultOpenDialogOptions;
        property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
        property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
     } end;


{TFileDialog = class(TCommonDialog)
          private
            FInternalFilterIndex: Integer;
            FDefaultExt: string;
            FFileName : String;
            FFiles: TStrings;
            FFilter: String;
            FFilterIndex: Integer;
            FHistoryList: TStrings;
            FInitialDir: string;
            FOnHelpClicked: TNotifyEvent;
            FOnTypeChange: TNotifyEvent;
            procedure SetDefaultExt(const AValue: string);
            procedure SetFilterIndex(const AValue: Integer);
          protected
            class procedure WSRegisterClass; override;
            function GetFilterIndex: Integer; virtual;
            procedure SetFileName(const Value: String); virtual;
            procedure SetFilter(const Value: String); virtual;
            procedure SetHistoryList(const AValue: TStrings); virtual;
          public
            constructor Create(TheOwner: TComponent); override;
            destructor Destroy; override;
            procedure DoCanClose(var CanClose: Boolean); override;
            procedure DoTypeChange; virtual;
            property Files: TStrings read FFiles;
            property HistoryList: TStrings read FHistoryList write SetHistoryList;
            procedure IntfFileTypeChanged(NewFilterIndex: Integer);
            class function FindMaskInFilter(aFilter, aMask: string): integer;
            class function ExtractAllFilterMasks(aFilter: string;
                                           SkipAllFilesMask: boolean = true): string;
          published
            property Title;
            property DefaultExt: string read FDefaultExt write SetDefaultExt;
            property FileName: String read FFileName write SetFileName;
            property Filter: String read FFilter write SetFilter;
            property FilterIndex: Integer read GetFilterIndex write SetFilterIndex default 1;
            property InitialDir: string read FInitialDir write FInitialDir;
            property OnHelpClicked: TNotifyEvent read FOnHelpClicked write FOnHelpClicked;
            property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;
          end;
}
{
TSaveDialog = class(TOpenDialog)
              protected
                class procedure WSRegisterClass; override;
                function DefaultTitle: string; override;
              public
                constructor Create(AOwner: TComponent); override;
end;

 TSelectDirectoryDialog = class(TOpenDialog)
                protected
                  class procedure WSRegisterClass; override;
                  function CheckFileMustExist(const AFilename: string): boolean; override;
                  function DefaultTitle: string; override;
                public
                  constructor Create(AOwner: TComponent); override;
 end;

}

implementation

function GetMethod(LibHandle:TLibHandle;MethodName:string):pointer;
begin
result:=GetProcedureAddress(LibHandle,MethodName);
assert(result<>nil,'library method '+MethodName+' not found');
end;

procedure LoadLCLFDLib;
begin
if not LCLFDLibHandleIsValid then
LCLFDLibHandle:=FindAndLoadLibrary(LCLFDLibname);
end;

procedure InitLCLFDLib;
type TInit=procedure ;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
if not LCLFDLibHandleIsValid then LoadLCLFDLib;
assert(LCLFDLibHandleIsValid,'library named '+LCLFDLibname+' not loaded');
TInit(GetMethod(LCLFDLibHandle,'Init'))();
end;

procedure DeInitLCLFDLib;
type TDeInit=procedure ;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
if not LCLFDLibHandleIsValid then LoadLCLFDLib;
assert(LCLFDLibHandleIsValid,'library named '+LCLFDLibname+' not loaded');
TDeInit(GetMethod(LCLFDLibHandle,'DeInit'))();
end;

function UnLoadLCLFDLib:boolean;
begin
DeInitLCLFDLib;
result:=UnloadLibrary(LCLFDLibHandle);
if result then LCLFDLibHandle:=NilHandle;
end;

function LCLFDLibHandleIsValid:boolean;
begin
result:=not(LCLFDLibHandle=NilHandle);
end;

function LCLFDLibHasInited:boolean;
type THasInited=function():boolean;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
if not LCLFDLibHandleIsValid then
  LoadLCLFDLib;
assert(LCLFDLibHandleIsValid,'library named '+LCLFDLibname+' not loaded');
result:=THasInited(GetMethod(LCLFDLibHandle,'HasInited'))
();
end;

function LCLFDLibWidgetType:string;
type TWidgetType=function :PAnsiChar;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
if not LCLFDLibHandleIsValid then
  LoadLCLFDLib;
assert(LCLFDLibHandleIsValid,'library named '+LCLFDLibname+' not loaded');
result:=TWidgetType(GetMethod(LCLFDLibHandle,'WidgetType'))
();
end;

//------------------------------------------------------
constructor TOpenDialog.Create;
type TOpenDialogCreate=function :pointer;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
var Pproc:pointer=nil;
begin
if not LCLFDLibHandleIsValid then
  LoadLCLFDLib;
assert(LCLFDLibHandleIsValid,'library named '+LCLFDLibname+' not loaded');
Pproc:=GetMethod(LCLFDLibHandle,'OpenDialogCreate');
inherited;
FDialog :=TOpenDialogCreate(Pproc)();
end;

destructor TOpenDialog.Destroy;
type TOpenDialogDestroy=procedure (Dialog:pointer);{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
TOpenDialogDestroy(GetMethod(LCLFDLibHandle,'OpenDialogDestroy'))
(FDialog);
FDialog:=nil;
inherited;
end;

function TOpenDialog.Execute: boolean;
type TOpenDialogExecute=function (Dialog:pointer):boolean;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
result:=TOpenDialogExecute(GetMethod(LCLFDLibHandle,'OpenDialogExecute'))(FDialog);
end;

function TOpenDialog.FFileName:string;
type TOpenDialogFileName=function (Dialog:pointer):PAnsiChar;{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
result:=TOpenDialogFileName(GetMethod(LCLFDLibHandle,'OpenDialogFileName'))
(FDialog);
end;

procedure TOpenDialog.SetFileName(NewName:string);
type TOpenDialogSetFileName=procedure (Dialog:pointer;NewName:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
TOpenDialogSetFileName(GetMethod(LCLFDLibHandle,'OpenDialogSetFileName'))
(FDialog,PAnsiChar(NewName));
end;

function TOpenDialog.GetInitialDir:string;
type TOpenDialogGetInitialDir=function(Dialog:pointer):PAnsiChar;
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
result:=TOpenDialogGetInitialDir(GetMethod(LCLFDLibHandle,'OpenDialogGetInitialDir'))
(FDialog);
end;

procedure TOpenDialog.SetInitialDir(NewInitialDir:string);
type TOpenDialogSetInitialDir=procedure (Dialog:pointer;NewInitialDir:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
TOpenDialogSetInitialDir(GetMethod(LCLFDLibHandle,'OpenDialogSetInitialDir'))
  (FDialog,PAnsiChar(NewInitialDir));
end;

function TOpenDialog.GetFilter:string;
type TOpenDialogGetFilter=function (Dialog:pointer):PAnsiChar;
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
result:=TOpenDialogGetFilter(GetMethod(LCLFDLibHandle,'OpenDialogGetFilter'))
(FDialog);
end;

procedure TOpenDialog.SetFilter(NewFilter:string);
type TOpenDialogSetFilter=procedure (Dialog:pointer;NewFilter:PAnsiChar);
{$IFdef MSWindows}stdcall{$ELSE}Cdecl{$ENDIF};
begin
TOpenDialogSetFilter(GetMethod(LCLFDLibHandle,'OpenDialogSetFilter'))
  (FDialog,PAnsiChar(NewFilter));
end;


{$ASSERTIONS OFF}
end.


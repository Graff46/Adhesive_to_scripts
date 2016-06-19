unit ll1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, EditBtn,  Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    FileNameEdit1: TFileNameEdit;
    GroupBox1: TGroupBox;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    IconsDialog2: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FileNameEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IconsDialog2SelectionChange(Sender: TObject);
    procedure IconsDialog2TypeChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  str, nm, s_out, s_in,param,prnm, pth,fld, scpt:String;
  f:textfile;
  i, len : integer;
  listing:AnsiString ;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if (Length(Edit1.Text) > 1) then
      Button1.Enabled:=True
  else
      Button1.Enabled:=False;

end;

procedure TForm1.FileNameEdit1Change(Sender: TObject);
begin
   Edit1.Text:=FileNameEdit1.FileName;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image2.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'FPC\Icon.ico') ;
end;

procedure TForm1.IconsDialog2SelectionChange(Sender: TObject);
begin
  CopyFile( IconsDialog2.FileName, ExtractFilePath(Application.ExeName)+'FPC\Icon.ico', True);
     Image2.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'FPC\Icon.ico') ;
end;

procedure TForm1.IconsDialog2TypeChange(Sender: TObject);
begin
   CopyFile( IconsDialog2.FileName, ExtractFilePath(Application.ExeName)+'FPC\Icon.ico', True);
   Image2.Picture.LoadFromFile( ExtractFilePath(Application.ExeName)+'FPC\Icon.ico') ;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  IconsDialog2.Execute;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
    IconsDialog2.Execute;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
param:= Edit1.Text;
prnm:=  Edit2.Text;
nm:=OpenDialog1.FileName;
scpt:=FileNameEdit1.FileName;
pth:= SelectDirectoryDialog1.FileName;
fld:= ExtractFilePath(Application.ExeName);
//workdir:= SelectDirectoryDialog2.FileName;
listing := 'program Project1;{$mode objfpc}{$H+}{$APPTYPE GUI}uses{$IFDEF UNIX}{$IFDEF UseCThreads}cthreads,Process,{$ENDIF}{$ENDIF}Classes,SysUtils,CustApp,Process{you can add units after this};type{Lua}Lua=class(TCustomApplication)protected public end;{Lua}var Application:Lua;{$R *.rc}begin Application:=Lua.Create(nil);Application.Title:='''+prnm+''';SetCurrentDir('''+fld+''');with TProcess.Create(nil)do try Executable:='''+nm+''';Parameters.Add('''+param+''');Options:=[poNoConsole];Execute;finally Free;end;Application.Destroy;end.';
assignfile(f, fld + 'FPC\run.laz');
rewrite(f);//если файл есть, его очистит, если нет, создаст.
Writeln(f,listing) ;
//assign(f,'c:/text.txt');
CloseFile(f)   ;

     with TProcess.Create(nil) do
       try
         Executable := fld + 'FPC\fpc.exe';
         Parameters.Add( fld + 'FPC\run.laz');
         Options := [poWaitOnExit]; // ждать завершения запускаемого процесса
         Execute;
       finally
         free;
     if FileExists( fld+'FPC\run.exe') then
     begin
     CopyFile( fld+'FPC\run.exe',pth+'\'+prnm+'.exe');
     ShowMessage('Done!');
     end;
       end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SelectDirectoryDialog1.Execute;
end;


end.


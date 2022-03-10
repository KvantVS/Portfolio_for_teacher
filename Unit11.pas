unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, shellapi;

type
  Tframe_razrabotki = class(TFrame)
    Label2: TLabel;
    lbl_Zagolovok: TLabel;
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Unit1;

{$R *.dfm}

procedure Tframe_razrabotki.Label2Click(Sender: TObject);
var
  sFile, sDir:  string;
begin
  sFile:='Uchebnik.exe';
  sDir:=ExtractFilePath(Application.ExeName) + 'data\Творческая деятельность\Мои разработки\Учебник';
  ShellExecute(handle, 'open', PChar(sfile), nil, pchar(sDir), SW_NORMAL);
end;

procedure Tframe_razrabotki.Label2MouseEnter(Sender: TObject);
begin
  frmMain.LabelMouseEnter(sender);
end;

procedure Tframe_razrabotki.Label2MouseLeave(Sender: TObject);
begin
  frmMain.LabelMouseLeave(sender);
end;

end.

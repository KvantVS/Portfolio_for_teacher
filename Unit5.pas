unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmTitul = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTitul: TfrmTitul;
  BitmapFrmTitul: TBitmap;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmTitul.FormClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTitul.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  application.Terminate;
end;

procedure TfrmTitul.FormCreate(Sender: TObject);
begin
  BitmapFrmTitul := TBitmap.Create;
  BitmapFrmTitul.LoadFromFile('data\images\Texture0214.bmp');
end;

procedure TfrmTitul.FormPaint(Sender: TObject);
var
  X, Y, W, H: LongInt;
begin
  with BitmapFrmTitul do
  begin
    W := Width;
    H := Height;
  end;
  Y := 0;
  while Y < Height do
  begin
    X := 0;
    while X < Width do
    begin
      Canvas.Draw(X, Y, BitmapFrmTitul);
      Inc(X, W);
    end;
    Inc(Y, H);
  end;
end;

procedure TfrmTitul.Label3Click(Sender: TObject);
begin
//  frmMain.show;
//  hide;
  close;
end;

procedure TfrmTitul.Label3MouseEnter(Sender: TObject);
begin
  (sender as TLabel).Font.Color:=clBlue;
end;

procedure TfrmTitul.Label3MouseLeave(Sender: TObject);
begin
  (sender as TLabel).Font.Color:=clWindowText;
end;

end.

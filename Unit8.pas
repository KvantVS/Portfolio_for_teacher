unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit1, Unit7;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
  close;
  frmMain.hide;
  form7.show;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

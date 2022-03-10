unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm10 = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit7;

{$R *.dfm}

procedure TForm10.FormShow(Sender: TObject);
begin
  width:=image1.Width;
  Height:=image1.Height;
end;

procedure TForm10.Image1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to form7.Panel4.ComponentCount - 1 do
    (form7.Panel4.Components[i] as TControl).enabled:=true;
  close;
end;

end.

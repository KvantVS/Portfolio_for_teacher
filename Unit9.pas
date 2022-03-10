unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    lbl_QuestCount: TLabel;
    lbl_RightAnswers: TLabel;
    Label4: TLabel;
    lbl_Ball: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit1, Unit7;

{$R *.dfm}

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
  close;
  form7.close;
  frmMain.show;
end;

end.

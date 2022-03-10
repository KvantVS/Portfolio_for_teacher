program Portfolio;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmMain},
  Unit3 in 'Unit3.pas' {Frame3: TFrame},
  Unit4 in 'Unit4.pas' {Frame4: TFrame},
  Unit5 in 'Unit5.pas' {frmTitul},
  Unit6 in 'Unit6.pas' {frame_browser: TFrame},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {frame_razrabotki: TFrame},
  Unit12 in 'Unit12.pas' {Form12};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmTitul, frmTitul);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm12, Form12);
  frmTitul.Showmodal;
  Application.Run;
end.

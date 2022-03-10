unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Unit3, Unit4, shellAPI, Unit6,strUtils,
  Menus, Unit11;

type
  TfrmMain = class(TForm)
    pan_left: TPanel;
    menu_2: TBitBtn;
    menu_3: TBitBtn;
    menu_4: TBitBtn;
    menu_1: TBitBtn;
    pan_right: TPanel;
    pan_top: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Frame31: TFrame3;
    Bevel2: TBevel;
    Frame41: TFrame4;
    lbl_loading: TLabel;
    frame_browser1: Tframe_browser;
    menu_5: TBitBtn;
    menu_6: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    lbl_Back: TLabel;
    lbl_menu_4_1: TLabel;
    lbl_menu_4_2: TLabel;
    frame_razrabotki1: Tframe_razrabotki;
    Splitter1: TSplitter;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure menu_2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menu_1Click(Sender: TObject);
    procedure menu_3Click(Sender: TObject);
    procedure menu_4Click(Sender: TObject);
    procedure menu_6Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure lbl_BackClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure lbl_menu_4_1MouseEnter(Sender: TObject);
    procedure lbl_menu_4_1MouseLeave(Sender: TObject);
    procedure lbl_menu_4_1Click(Sender: TObject);
    procedure menu_5Click(Sender: TObject);
    procedure pan_leftResize(Sender: TObject);
    procedure lbl_menu_4_2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LabelClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
//    procedure lab_Menu_2_1Click(Sender: TObject);
    procedure SubMenu235Click(Sender: TObject);
    procedure Menu2Create;
    procedure Menu3Create;
    procedure Menu5Create;
    procedure Menu2VertResize;
    procedure Menu3VertResize;
    procedure Menu4VertResize;
    procedure Menu5VertResize;
    procedure Menu2ButtonsVertResize;
    procedure Menu3ButtonsVertResize;
    procedure Menu4ButtonsVertResize;
    procedure Menu5ButtonsVertResize;
  end;

var
  frmMain: TfrmMain;
  bMenu2Visible,bMenu3Visible,bMenu4Visible,bMenu5Visible:  boolean;
  sCurrentDir:  string;
  iMenu2Count,iMenu3Count,iMenu4Count,iMenu5Count:  integer;
  bitmapTop:  TBitmap;
  lastLabel:  TObject; // Последний лэйбл, на который нажали (для кнопки "Назад")

implementation

uses Unit2, Unit5, Unit8, Unit12;

{$R *.dfm}

procedure TfrmMain.menu_2Click(Sender: TObject);
var
  i:  integer;
  cmp:  tcomponent;
begin
  if bMenu4Visible then menu_4.Click;
  if bMenu3Visible then menu_3.Click;
  if bMenu5Visible then menu_5.Click;

  bMenu2Visible:=bMenu2Visible xor true;

  // --- переключаем visible свойство лэйблов-меню
  for I := 0 to iMenu2Count - 1 do
  begin
    cmp:=pan_left.FindComponent('lbl_menu_2_' + inttostr(i));
    if cmp<>nil then begin
      (cmp as TLabel).Visible:=bMenu2Visible;
    end;
  end;

  Menu2ButtonsVertResize;
end;

procedure TfrmMain.menu_3Click(Sender: TObject);
var
  i:  integer;
  cmp:  TComponent;
begin
  if bMenu2Visible then menu_2.Click;
  if bMenu4visible then menu_4.Click;
  if bMenu5Visible then menu_5.Click;

  bMenu3Visible:=bMenu3Visible xor true;

  for I := 0 to iMenu3Count - 1 do
  begin
    cmp:=pan_left.FindComponent('lbl_menu_3_' + inttostr(i));
    if cmp<>nil then begin
      (cmp as TLabel).Visible:=bMenu3Visible;
    end;
  end;

  Menu3ButtonsVertResize;
end;

procedure TfrmMain.menu_4Click(Sender: TObject);
begin
  if bMenu2Visible then menu_2.Click;
  if bMenu3Visible then menu_3.Click;
  if bMenu5Visible then menu_5.Click;

  bMenu4Visible:=bMenu4Visible xor true;
  lbl_menu_4_1.Visible:=bMenu4Visible;
  lbl_menu_4_2.Visible:=bMenu4Visible;

  Menu4ButtonsVertResize;
end;

procedure TfrmMain.menu_5Click(Sender: TObject);
var
  i:  integer;
  cmp:  TComponent;
begin
  if bMenu2Visible then menu_2.Click;
  if bMenu4visible then menu_4.Click;
  if bMenu3Visible then menu_3.Click;

//  bMenu5Visible:=bMenu5Visible xor true;

//  for I := 0 to iMenu5Count - 1 do
//  begin
//    cmp:=pan_left.FindComponent('lbl_menu_5_' + inttostr(i));
//    if cmp<>nil then begin
//      (cmp as TLabel).Visible:=bMenu5Visible;
//    end;
//  end;

  SubMenu235Click(sender);

  Menu5ButtonsVertResize;
end;

procedure TfrmMain.menu_6Click(Sender: TObject);
begin
  form8.showModal;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  menu_6.Click;
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  MessageBox(handle, PChar('Воронова Анастасия Геннадьевна'#10#13'студентка ПГПИ'#10#13'физико-математического факультета, группа Зинф-32с'#10#13#10#13'© 2011 год'),
  PChar('О программе'), MB_ICONASTERISK);
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  MessageBox(handle, PChar('Программа выполнена в среде программирования Borland Delphi 2009'#10#13#10#13'Рекомендуемое разрешение экрана 1024*768'),
  PChar('Справка'), MB_ICONASTERISK);
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  Form12.WebBrowser1.Navigate(ExtractFilePath(Application.ExeName) + 'data\В помощь учителю информатики.html');
  form12.ShowModal;
end;

procedure TfrmMain.pan_leftResize(Sender: TObject);
begin
  // --- Если "открыто" меню 2, то ищем эти лэйблы-субменю, и меняем их ширину (и .top если надо) и т.д.
  if bMenu2Visible then  Menu2VertResize;
  if bMenu3Visible then  Menu3VertResize;
  if bMenu4Visible then  Menu4VertResize;
  if bMenu5Visible then  Menu5VertResize;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
var
  X, Y, W, H: LongInt;
begin
  with BitmapTop do
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
      Canvas.Draw(X, Y, BitmapTop);
      Inc(X, W);
    end;
    Inc(Y, H);
  end;
end;

procedure TfrmMain.LabelClick(Sender: TObject);
var
  sName, sExt:  string;
  cmp:  TComponent;
begin
  getcurrentdir;
  cmp:=frame41.FindComponent((Sender as TLabel).Name + '_ext');
  sName:=(Sender as TLabel).Caption;  // имя файла
  sExt:=(cmp as TLabel).caption;      // расширение файла
  lbl_loading.Visible:=true;
  if (Lowercase(sExt)='.htm') or (Lowercase(sExt)='.html') then
  begin
    Frame41.Visible:=false;
    with frame_browser1 do begin
      Visible:=true;
//      sCurrentDir:=ExtractFilePath(Application.ExeName);
      if sCurrentDir[length(sCurrentDir)]<>'\' then sCurrentDir:=sCurrentDir + '\';
      webBrowser1.Navigate(sCurrentDir + {'data\Внеурочная деятельность\' + }sName + sExt);
//      webBrowser1.Navigate(ExtractFilePath(Application.ExeName) + 'data\В помощь учителю информатики.html');
      lbl_Back.Visible:=true;  // показываем кнопку "Назад"
    end;
  end
  else shellExecute(0, 'open', PChar(sName + sExt), nil, PChar(sCurrentDir), SW_SHOWNORMAL);
  application.ProcessMessages;
  lbl_loading.Visible:=false;
end;

procedure TfrmMain.LabelMouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Color:=clHighlight;
end;

procedure TfrmMain.LabelMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Color:=clWindowText;
end;


procedure TfrmMain.lbl_BackClick(Sender: TObject);
begin
  SubMenu235Click(lastLabel);
  lbl_Back.Visible:=false;
end;

procedure TfrmMain.lbl_menu_4_1Click(Sender: TObject);
begin
  lastLabel:=sender;  // запоминаем нажатое меню для кнопки "Назад"
  Frame_browser1.visible:=false;
  Frame41.Visible:=false;
  Frame31.Visible:=false;
  frame_razrabotki1.Visible:=true;
end;

procedure TfrmMain.lbl_menu_4_1MouseEnter(Sender: TObject);
begin
  LabelMouseEnter(Sender);
end;

procedure TfrmMain.lbl_menu_4_1MouseLeave(Sender: TObject);
begin
  LabelMouseLeave(Sender);
end;


procedure TfrmMain.lbl_menu_4_2Click(Sender: TObject);
begin
  SubMenu235Click(Sender);
end;

procedure TfrmMain.Menu2ButtonsVertResize;
var
  cmp:  TComponent;
begin
  // --- ищем последний лэйбл в меню, запоминаем его
  cmp:=pan_left.FindComponent('lbl_menu_2_' + inttostr(iMenu2Count-1));

  // --- раскрываем меню (убираем вниз остальные кнопки)
  if bMenu2Visible then
    menu_3.Top:=(cmp as TLabel).top + (cmp as TLabel).height + 10
  else
    menu_3.Top:=menu_2.top + menu_2.height + 6;
  menu_4.Top:=menu_3.top + menu_3.height + 6;
  menu_5.Top:=menu_4.top + menu_4.height + 6;
  menu_6.Top:=menu_5.top + menu_5.height + 6;
end;

procedure TfrmMain.Menu2Create;
var
  sr: TSearchRec;
  k,c:  integer;
  cmp: TComponent;
begin
  // --- Создаем меню
  sCurrentDir:=ExtractFilePath(Application.ExeName) + 'data\' + 'Методическая копилка';
  k:=FindFirst(sCurrentDir + '\*.*', faDirectory, sr);
  c:=0;
  while k=0 do begin
    if (sr.name <> '' ) and (sr.name <> '.') and (sr.name <> '..') and
       (ExtractFileExt(sr.Name)<>'.files') then
    begin
      with TLabel.Create(frmMain.pan_left) do begin
        visible:=false;
        height:=16;
        // --- если лэйбла первая, то считаем от кнопки
        if c=0 then cmp:=menu_2
        else begin // все остальные считаем от предыдущих лэйблов
          cmp:=pan_left.FindComponent('lbl_menu_2_' + inttostr(c-1));
        end;
        Top:=(cmp as TControl).Top + (cmp as TControl).Height ;

//        top:=menu_2.Top + menu_2.Height + 3 + 24*c;
        left:=20;
        autosize:=true;
        wordwrap:=true;
        name:='lbl_' + 'menu_2' + '_' + inttostr(c);
        Caption:=sr.Name;
        font.Size:=10;
        if sr.Name='Алгоритмизация' then font.Style:=[fsBold];
        OnClick:=SubMenu235Click;
        OnMouseEnter:=LabelMouseEnter;
        OnMouseLeave:=LabelMouseLeave;
        width:=127;
        Parent:=pan_left;
      end;
      inc(c);
    end;
    k:=FindNext(sr);
  end;
  Findclose(sr);
  iMenu2Count:=c;
  // --- выравниваем высоту лэйблов
  Menu2VertResize;
end;

procedure TfrmMain.Menu2VertResize;
var
  cmp,cmp2: TComponent;
  i:  integer;
begin
  for I := 0 to iMenu2Count - 1 do begin
    cmp:=pan_left.FindComponent('lbl_menu_2_' + inttostr(i));
    if cmp<>nil then begin
      LabelMouseEnter(cmp);  // для того, чтобы подгонялась высота
      LabelMouseLeave(cmp);   // (она подгоняется только при смене цвета в процедурах Label2MouseEnter
      (cmp as TLabel).Width:=pan_left.Width - 30;
//        (cmp as TLabel).top:=menu_2.Top + menu_2.Height + 3 + 24*i;
      if i=0 then cmp2:=menu_2
      else        cmp2:=pan_left.FindComponent('lbl_menu_2_' + inttostr(i-1));
      (cmp as TLabel).Top:=(cmp2 as TControl).Top + (cmp2 as TControl).Height + 6;
    end;
  end;
  // --- выравниваем заглавные кнопки нижеследующих меню
  Menu2ButtonsVertResize;
end;

procedure TfrmMain.Menu3ButtonsVertResize;
var
  cmp: TComponent;
begin
  // --- ищем последний лэйбл в меню, запоминаем его
  cmp:=pan_left.FindComponent('lbl_menu_3_' + inttostr(iMenu3Count-1));

  // --- раскрываем меню (убираем вниз остальные кнопки)
  if bMenu3Visible then
    menu_4.Top:=(cmp as TLabel).top + (cmp as TLabel).height + 10
  else
    menu_4.Top:=menu_3.top + menu_3.height + 6;
  menu_5.Top:=menu_4.top + menu_4.height + 6;
  menu_6.Top:=menu_5.Top + menu_5.height + 6;
end;

procedure TfrmMain.Menu3Create;
var
  sr: TSearchRec;
  k,c:  integer;
  cmp: TComponent;
begin
  // --- Создаем меню
  sCurrentDir:=ExtractFilePath(Application.ExeName) + 'data\' + 'Нормативная база';
  k:=FindFirst(sCurrentDir + '\*.*', faDirectory, sr);
  c:=0;
  while k=0 do begin
    if (sr.name <> '' ) and (sr.name <> '.') and (sr.name <> '..') and
       (ExtractFileExt(sr.Name)<>'.files') then
    begin
      with TLabel.Create(frmMain.pan_left) do begin
        visible:=false;
        height:=16;
        // --- если лэйбла первая, то считаем от кнопки
        if c=0 then cmp:=menu_3
        else begin // все остальные считаем от предыдущих лэйблов
          cmp:=pan_left.FindComponent('lbl_menu_3_' + inttostr(c-1));
        end;
        Top:=(cmp as TControl).Top + (cmp as TControl).Height ;

//        top:=menu_3.Top + menu_3.Height + 3 + 24*c;
        left:=20;
        autosize:=true;
        wordwrap:=true;
        name:='lbl_' + 'menu_3' + '_' + inttostr(c);
        Caption:=sr.Name;
        font.Size:=10;
        OnClick:=SubMenu235Click;
        OnMouseEnter:=LabelMouseEnter;
        OnMouseLeave:=LabelMouseLeave;
        width:=127;
        Parent:=pan_left;
      end;
      inc(c);
    end;
    k:=FindNext(sr);
  end;
  Findclose(sr);
  iMenu3Count:=c;
  // --- выравниваем высоту лэйблов
  Menu3VertResize;
end;

procedure TfrmMain.Menu3VertResize;
var
  cmp,cmp2: TComponent;
  i:  integer;
begin
  for I := 0 to iMenu3Count - 1 do begin
    cmp:=pan_left.FindComponent('lbl_menu_3_' + inttostr(i));
    if cmp<>nil then begin
      LabelMouseEnter(cmp);  // для того, чтобы подгонялась высота
      LabelMouseLeave(cmp);   // (она подгоняется только при смене цвета в процедурах LabelMouseEnter,Leave
      (cmp as TLabel).Width:=pan_left.Width - 30;
//        (cmp as TLabel).top:=menu_2.Top + menu_2.Height + 3 + 24*i;
      if i=0 then cmp2:=menu_3
      else        cmp2:=pan_left.FindComponent('lbl_menu_3_' + inttostr(i-1));
      (cmp as TLabel).Top:=(cmp2 as TControl).Top + (cmp2 as TControl).Height + 6;
    end;
  end;
  // --- выравниваем заглавные кнопки нижеследующих меню
  Menu3ButtonsVertResize;
end;

procedure TfrmMain.Menu4ButtonsVertResize;
begin
  if bMenu4Visible then
    menu_5.Top:=lbl_menu_4_2.top + lbl_menu_4_2.height + 10
  else
    menu_5.Top:=menu_4.top + menu_4.height + 6;
  menu_6.Top:=menu_5.Top + menu_5.height + 6;
end;

procedure TfrmMain.Menu4VertResize;
var
  cmp,cmp2: TComponent;
  i:  integer;
begin
  for I := 0 to iMenu4Count - 1 do begin
    cmp:=pan_left.FindComponent('lbl_menu_4_' + inttostr(i));
    if cmp<>nil then begin
      LabelMouseEnter(cmp);  // для того, чтобы подгонялась высота
      LabelMouseLeave(cmp);   // (она подгоняется только при смене цвета в процедурах Label2MouseEnter
      (cmp as TLabel).Width:=pan_left.Width - 30;
//        (cmp as TLabel).top:=menu_2.Top + menu_2.Height + 3 + 24*i;
      if i=0 then cmp2:=menu_4
      else        cmp2:=pan_left.FindComponent('lbl_menu_4_' + inttostr(i-1));
      (cmp as TLabel).Top:=(cmp2 as TControl).Top + (cmp2 as TControl).Height + 6;
    end;
  end;
  // --- выравниваем заглавные кнопки нижеследующих меню
  Menu4ButtonsVertResize;
end;

procedure TfrmMain.Menu5ButtonsVertResize;
var
  cmp: TComponent;
begin
  // --- ищем последний лэйбл в меню, запоминаем его
  cmp:=pan_left.FindComponent('lbl_menu_5_' + inttostr(iMenu5Count-1));

  if bMenu5Visible then
    menu_6.Top:=(cmp as TLabel).top + (cmp as TLabel).height + 10
  else
    menu_6.Top:=menu_5.top + menu_5.height + 6;
end;

procedure TfrmMain.Menu5Create;
var
  sr: TSearchRec;
  k,c:  integer;
  cmp: TComponent;
begin
  // --- Создаем меню
  sCurrentDir:=ExtractFilePath(Application.ExeName) + 'data\' + 'Внеурочная деятельность';
  k:=FindFirst(sCurrentDir + '\*.*', faDirectory, sr);
  c:=0;
  while k=0 do begin
    if (sr.name <> '' ) and (sr.name <> '.') and (sr.name <> '..') and
       (ExtractFileExt(sr.Name)<>'.files') then
    begin
      with TLabel.Create(frmMain.pan_left) do begin
        visible:=false;
        height:=16;
        // --- если лэйбла первая, то считаем от кнопки
        if c=0 then cmp:=menu_5
        else begin // все остальные считаем от предыдущих лэйблов
          cmp:=pan_left.FindComponent('lbl_menu_5_' + inttostr(c-1));
        end;
        Top:=(cmp as TControl).Top + (cmp as TControl).Height ;

//        top:=menu_5.Top + menu_5.Height + 3 + 24*c;
        left:=20;
        autosize:=true;
        wordwrap:=true;
        name:='lbl_' + 'menu_5' + '_' + inttostr(c);
        Caption:=sr.Name;
        font.Size:=10;
        OnClick:=SubMenu235Click;
        OnMouseEnter:=LabelMouseEnter;
        OnMouseLeave:=LabelMouseLeave;
        width:=127;
        Parent:=pan_left;
      end;
      inc(c);
    end;
    k:=FindNext(sr);
  end;
  Findclose(sr);
  iMenu5Count:=c;
  // --- выравниваем высоту лэйблов
  Menu5VertResize;
end;

procedure TfrmMain.Menu5VertResize;
var
  cmp,cmp2: TComponent;
  i:  integer;
begin
  for I := 0 to iMenu5Count - 1 do begin
    cmp:=pan_left.FindComponent('lbl_menu_5_' + inttostr(i));
    if cmp<>nil then begin
      LabelMouseEnter(cmp);  // для того, чтобы подгонялась высота
      LabelMouseLeave(cmp);   // (она подгоняется только при смене цвета в процедурах Label2MouseEnter
      (cmp as TLabel).Width:=pan_left.Width - 30;
//        (cmp as TLabel).top:=menu_2.Top + menu_2.Height + 3 + 24*i;
      if i=0 then cmp2:=menu_5
      else        cmp2:=pan_left.FindComponent('lbl_menu_5_' + inttostr(i-1));
      (cmp as TLabel).Top:=(cmp2 as TControl).Top + (cmp2 as TControl).Height + 6;
    end;
  end;
  // --- выравниваем заглавные кнопки нижеследующих меню
  Menu5ButtonsVertResize;
end;

procedure TfrmMain.SubMenu235Click(Sender: TObject);
var
  k,i,c: integer;
  sr:  TSearchRec;
  cmp:  TComponent;
  s,s2,s3:  string;
begin
  lastLabel:=sender;  // запоминаем нажатое меню для кнопки "Назад"
//  Frame41.richedit1.visible:=false;
  Frame_browser1.visible:=false;
  Frame41.Visible:=true;
  Frame31.Visible:=false;
  Frame_razrabotki1.Visible:=false;

  s:=(sender as TControl).Name;

  if LeftStr(s, 10)='lbl_menu_2' then s2:='Методическая копилка\';
  if LeftStr(s, 10)='lbl_menu_3' then s2:='Нормативная база\';
  if LeftStr(s, 10)='lbl_menu_4' then s2:='Творческая деятельность\';
  if s='menu_5' then s2:='Внеурочная деятельность\';

  s3:=ExtractFilePath(Application.ExeName) + 'data\' + s2;
  if s='menu_5' then sCurrentDir:=s3
  else               sCurrentDir:=s3 + (Sender as TLabel).Caption;

  // очищаем фрэйм от старых лэйблов-файлов
  I:=0;
  repeat
    if Frame41.ComponentCount<>0 then
    begin
      cmp:=Frame41.Components[i];
      if cmp.ClassName='TLabel' then cmp.Free
      else inc(i);
    end;
  until i>=frame41.ComponentCount;

  // создаем заголовок
  with TLabel.Create(FrmMain.Frame41) do begin
    top:=6;
    left:=0;
    height:=27;
    autosize:=false;
    Alignment:=taCenter;
    width:=Frame41.Width-1;
    Anchors:=[akleft,aktop,akRight];
    name:='lbl_Zagolovok';
    if sender.ClassName='TBitBtn' then Caption:=(Sender as TBitBtn).Caption
    else    Caption:=(Sender as TLabel).Caption;
    font.Style:=[fsbold];
    font.Size:=15;
    color:=$00958D00;
    font.Color:=clCream;
    Transparent:=false;
    Parent:=Frame41;
  end;

  // создаем лэйблы - ссылающиеся на файлы
  c:=1;
  k:=FindFirst(sCurrentDir + '\*.*', faAnyFile, sr);
  while k=0 do begin
    if (sr.name <> '' ) and (sr.name <> '.') and (sr.name <> '..') and
       (ExtractFileExt(sr.Name)<>'.files') and (sr.Attr<>faDirectory) then
    begin
      with TLabel.Create(FrmMain.Frame41) do begin
        top:=40 + 18*c;
        left:=12;
        height:=13;
        autosize:=true;
        if sender.ClassName='TBitBtn' then name:=(Sender as TBitBtn).Name + '_' + inttostr(c)
        else                               name:=(sender as TLabel).Name + '_' + inttostr(c);
        s:=sr.Name;
        s2:=ExtractFileExt(s);  // расширение файла
        delete(s, pos(s2, s), length(s2));
        Caption:=s;  { TODO : Убрать расширение файла отсюда }
        font.Style:=[fsbold,fsunderline];
        font.Size:=9;
        cursor:=crHandPoint;
        OnClick:=LabelClick;  // процедура открытия файла
        OnMouseEnter:=LabelMouseEnter;
        OnMouseLeave:=LabelMouseLeave;
        Parent:=Frame41;
      end;   {with}
      // --- создаем невидимый лэйбл с расширением файла
      with TLabel.Create(FrmMain.Frame41) do begin
        if sender.ClassName='TBitBtn' then name:=(Sender as TBitBtn).Name + '_' + inttostr(c) + '_ext'
        else                               name:=(sender as TLabel).Name + '_' + inttostr(c) + '_ext';
        Caption:=s2;
        visible:=false;
        Parent:=Frame41;
      end;   {with}
      inc(c);
    end;  {if}
    k:=FindNext(sr);
  end; {while}
  FindClose(sr);
end;

procedure TfrmMain.menu_1Click(Sender: TObject);
begin
  Frame31.Visible:=true;
  frame41.Visible:=false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SetCurrentDir(Extractfilepath(application.ExeName));
  bitmapTop:=TBitmap.Create;
  bitmapTop.LoadFromFile('data\images\Texture0214.bmp');

  SetCurrentDir(ExtractFilePath(Application.ExeName));
  Randomize;
  bMenu2Visible:=false;
  bMenu3Visible:=false;
  bMenu4Visible:=false;
  Frame31.Align:=alClient;
  Frame31.Visible:=true;
//  frame41.RichEdit1.Align:=alClient;
  Frame41.Align:=alClient;
  frame_browser1.Align:=alClient;
  frame_razrabotki1.Align:=alClient;
  Menu2Create;
  Menu3Create;
//  Menu5Create;  // Внеурочная деятельность
end;

end.

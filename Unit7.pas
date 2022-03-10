unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Buttons, strutils;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CheckListBox1: TCheckListBox;
    Image1: TImage;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    btnAnswer: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnAnswerClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure CheckListBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartTest;
    procedure RadioButClick(Sender: TObject);
    procedure SelectNextQuestion;
    procedure EndTest;
    procedure CheckBoxClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  end;

var
  Form7: TForm7;
  iQuestionsCount:  integer;  // кол-во вопросов ВСЕГО
  Voprosy:  array of record
    sVopros:  string;                     // текст вопроса
    iAnswersCount:  byte;                 // кол-во ответов для данного вопроса
    iRightAnswersCount: byte;             // кол-во ПРАВИЛЬНЫХ ответов
    aRightAnswerNumbers: array of byte; // массив правильных ответов с конца
    bQuestionHaveImage: boolean;          // имеется ли картинка в вопросе
    bAnswersHaveImage: boolean;           // имеется ли картинка в вопросе
    aAnswers: array of string;            // текст ответов (массив)
    sQuestionImagePath: string;           // путь к файлу с картинкой к вопросу
    aAnswerImagePaths:  array of string;  // массив. пути к файлам-картинкам к ответам
    bQuestionHasBeenAnswered: boolean;    // Ответили ли на этот вопрос
  end;
  iVopros:  integer;
//  usedQuestions: set of byte = [];
  aQuestionRandomNumbers: array of integer;  // массив "случайных" выбранных номеров вопросов
  aAnswerRandomNumbers:   array of shortint; // массив номеров ответов в случайном порядке (организует случайный порядок)
  iSelectedQuestionsCount: integer;  // кол-во вопросов для ОДНОГО ТЕСТИРОВАНИЯ (обычно 30)
  iAnsweredQuestionsCount: integer;  // кол-во всего отвеченных (и правильно и нет) вопросов в этом тестировании
  iCurrentQuestion: integer;   // номер текущего вопроса
  //--------------------------
  iRightAnswerQuestions: integer;  // количество правильно отвеченных вопросов
  iCheckedCheckBoxCount:  integer;  // кол-во Чекнутых чекбоксов
  n:  integer = 0;
  iBall:  integer;

implementation

uses Unit1, Unit9, Unit10;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
  EndTest;
end;

procedure TForm7.btnAnswerClick(Sender: TObject);
var
  c, iAnswers:  integer;
  I: Integer;
  cmp: TComponent;
  aPravOtvety:  array of byte;
  J: Integer;
  iRightAnswers:  byte;  // количество правильных ответов сделанных пользователем в ЭТОМ вопросе (в одном)
begin
  if voprosy[aQuestionRandomNumbers[iCurrentQuestion]].bQuestionHaveImage
    then image1.Picture.Bitmap.ReleaseHandle;
  iAnswers:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iAnswersCount;  // кол-во всех ответов

  c:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iRightAnswersCount;    // кол-во ПРАВИЛЬНЫХ ответов
  setlength(aPravOtvety, c);

  // --- заполняем временный массив правильных ответов из чекнутых радиокнопок
  j:=0;  // для чекбоксов
//  if c = 1 then  // если в вопросе ОДИН правильный ответ
//  begin
    for i := 0 to iAnswers-1 do  // ищем "чекнутый" радиобуттон
    begin
      cmp:=panel4.FindComponent('answer' + inttostr(i));
      if cmp<>nil then
      begin
        { DONE : if cmp.className='TRadioButton' }
        if cmp.ClassName='TRadioButton' then begin
          if (cmp as TRadioButton).Checked then begin
            aPravOtvety[0]:=(cmp as TRadioButton).Tag;
            break;
          end;
        end;
        if cmp.ClassName='TCheckBox' then begin
          if (cmp as TCheckBox).Checked then begin
            aPravOtvety[J]:=(cmp as TCheckBox).Tag;
            inc(j);
          end;
        end;
        { DONE : if cmp.className='TCheckBox' }
      end;
    end;
//  end;

  // --- Сравниваем номерА выбраннЫХ ответОВ с номерами правильных оветов
  iRightAnswers:=0;
  for I := 0 to c - 1 do
  begin
    for J := 0 to c - 1 do
    begin
      if aPravOtvety[i] = voprosy[aQuestionRandomNumbers[iCurrentQuestion]].aRightAnswerNumbers[j]
      then begin
        inc(iRightAnswers);  // специальная переменная для вопросов, в котором НЕСКОЛЬКО правильных ответов
      end;
    end; //for j
  end; //for i

  // если верно выбранных ответов = кол-ву правильных ответов в данном вопросе, то вопрос отвечен верно.
  if iRightAnswers = c then
  begin
    inc(iRightAnswerQuestions);
  end;

  inc(iAnsweredQuestionsCount);

  voprosy[aQuestionRandomNumbers[iCurrentQuestion]].bQuestionHasBeenAnswered:=true;
  CheckListBox1.Checked[iCurrentQuestion]:=true;

  inc(iCurrentQuestion);
  if iCurrentQuestion <> iSelectedQuestionsCount then SelectNextQuestion
  else  EndTest;
end;

procedure TForm7.CheckBoxClick(Sender: TObject);
var
  I: Integer;
  cmp:  TComponent;
begin
  btnAnswer.Enabled:=true;

  // --- считаем сколько чекбоксов выбрано учеником ----------------------------
  iCheckedCheckBoxCount:=0;
  for I := 0 to Panel4.ComponentCount - 1 do
  begin
    cmp:=Panel4.Components[i];
    if cmp.ClassName='TCheckBox' then
    begin
      if (cmp as TCheckBox).Checked then
        inc(iCheckedCheckBoxCount);
    end;
  end;

  // --- Если их число совпадает с кол-вом правильных ответов в вопросе, то отключаем остальные чекбоксы
  if iCheckedCheckBoxCount = voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iRightAnswersCount then
  begin
    for I := 0 to Panel4.ComponentCount - 1 do
    begin
      cmp:=Panel4.Components[i];
      if cmp.ClassName='TCheckBox' then
        if not (cmp as TCheckBox).Checked then
          (cmp as TCheckBox).Enabled:=false;
    end;
  end else
  begin
    for I := 0 to Panel4.ComponentCount - 1 do
    begin
      cmp:=Panel4.Components[i];
      if cmp.ClassName='TCheckBox' then
        if not (cmp as TCheckBox).Checked then
          (cmp as TCheckBox).Enabled:=true;
    end;
  end;

end;

procedure TForm7.CheckListBox1ClickCheck(Sender: TObject);
begin
  CheckListBox1.checked[n]:=voprosy[aQuestionRandomNumbers[n]].bQuestionHasBeenAnswered;
end;

procedure TForm7.CheckListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then n:=iCurrentQuestion;
  key:=0;
end;

procedure TForm7.CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  n:=CheckListBox1.ItemAtPos(Point(x,y), false);
end;

procedure TForm7.CheckListBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckListBox1.ItemIndex:=iCurrentQuestion;
end;

procedure TForm7.EndTest;
var
  s:  string;
  i:  integer;
  bEndTest: boolean;
begin
  bEndTest:=true;
  if iAnsweredQuestionsCount <> iSelectedQuestionsCount then begin
    bEndTest:=false;
    i:=iSelectedQuestionsCount - iAnsweredQuestionsCount;

    s:='Осталось неотвеченных вопросов: ' + inttostr(i) + #$D#$A + 'Вы действительно хотите закончить тестирование?';
    messagebeep(MB_ICONASTERISK);
    i:=messageBox(handle, pchar(s), pchar('Тестирование'), MB_YESNO+MB_ICONQUESTION);
    if i=mrYes then bEndTest:=true;
  end;

  if bEndTest then
  begin
    with form9 do begin
      lbl_QuestCount.caption:='Количество вопросов: ' + inttostr(iSelectedQuestionsCount);
      lbl_RightAnswers.caption:='Правильно отвеченных: ' + inttostr(iRightAnswerQuestions);
  //    lbl_Ball:=      { TODO : Разбалловку и вычисление оценки }
      case iRightAnswerQuestions of
        0..9: iBall:=2;
        10..18: iBall:=3;
        19..24: iBall:=4;
        25..30: iBall:=5;
      end;
      lbl_Ball.Caption:=inttostr(iBall);
    end;
    form9.showmodal;
  end;
end;

procedure TForm7.FormCreate(Sender: TObject);
var
  SysMenu: HMenu;
  f: textfile;
  s:  string;
  i, j: Integer;
  b: byte;
begin
  screen.Cursors[22]:=LoadCursorFromFile('data\47.cur');
  Image1.Cursor:=22;
  Randomize;
  SysMenu := GetSystemMenu(Handle, False);
  Windows.EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);

  // --- Загружаем тесты -------------------------------------------------------
  // ----- Открываем файл и читаем сколько вопросов в "базе"
  assignFile(f, ExtractFilePath(application.exename) + 'data\configt.dat');
  reset(f);
  readln(f, s);
  iQuestionsCount:=strtoint(s);
  setlength(Voprosy, iQuestionsCount);

  // ----- Заполняем вопросы из файла ------------------------------------------
  for i := 0 to iQuestionsCount - 1 do
  begin
    with voprosy[i] do begin
      readln(f, sVopros);                                   // кол-во вопросов
      readln(f, s);  iAnswersCount:=strtoint(trim(s));      // ко-во ответов для данного вопроса
      readln(f, s);  iRightAnswersCount:=strtoint(trim(s)); // кол-во прав. ответов
      SetLength(aRightAnswerNumbers, iRightAnswersCount);   // массив номерв правильных ответов
      for j := 0 to iRightAnswersCount - 1 do begin         //
        readln(f, s);                                       //
        b:=strtoint(trim(s));             // сразу вычисляем действительный...
        b:=iAnswersCount - b + 1;         // ...номер правильного ответа
        aRightAnswerNumbers[j]:=b;                          //
      end;
      readln(f, s);                                         // есть ли картинка в вопросе
        if trim(s)='0' then bQuestionHaveImage:=false       //
        else bQuestionHaveImage:=true;                      //
      readln(f, s);                                         // есть ли картинка в ответах
        if trim(s)='0' then bAnswersHaveImage:=false        //
        else bAnswersHaveImage:=true;                       //
      setLength(aAnswers, iAnswersCount);                   // сами ответы (строчки)
      for j := 0 to iAnswersCount - 1 do begin              //
        readln(f, s);  aAnswers[j]:=s;                      //
      end;
      if bQuestionHaveImage then begin                      // если есть картинка в вопросе,
        readln(f, sQuestionImagePath);                      // , то тут имя файла картинки без расширения
      end;                                                  // --- в папке image, расширение bmp ---
      if bAnswersHaveImage then begin                       // если есть картинки в ответах,
        setlength(aAnswerImagePaths, iAnswersCount);
        for j := 0 to iAnswersCount - 1 do begin            // , то тут массив с именами файлов
          readln(f, s);                                     //
          aAnswerImagePaths[j]:=s;                          //
        end;
      end;
    end; //with
  end; //for
  closefile(f);
end;

procedure TForm7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F4) and (ssAlt in Shift) then
  begin
    MessageBeep(0);
    Key := 0;
  end;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  StartTest;
end;


procedure TForm7.Image1Click(Sender: TObject);
begin
  ImageClick(Sender);
end;

procedure TForm7.ImageClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Panel4.ComponentCount - 1 do
    (Panel4.Components[i] as TControl).enabled:=False;
  form10.Image1.Picture.Assign((Sender as TImage).Picture);
  Form10.showModal;
end;

procedure TForm7.RadioButClick(Sender: TObject);
begin
  btnAnswer.enabled:=true;
end;

procedure TForm7.SelectNextQuestion;
var
  I, iAnswers, ileft, itop, k, t, l, w, iRand: integer;
  cmp:  TComponent;
  bGood, bAnswHaveImage:  boolean;
  s, sImageFile: string;
begin
  {  пояснение для себя:
  voprosy[aQuestionRandomNumbers[iCurrentQuestion]]
          aQuestionRandomNumbers - массив номеров вопросов выбранных случайным образом
                                 iCurrentQuestion - номер текущего вопроса (по порядку 0, 1, 2,...)
  всё вместе [aQuestionRandomNumbers[iCurrentQuestion]] даёт случайный номер вопроса (какой отображать следующим)
  }
  iCheckedCheckBoxCount:=0;
  btnAnswer.Enabled:=false;
  CheckListBox1.ItemIndex:=iCurrentQuestion;

//  #$D#$A
  s:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].sVopros;
  s:=ReplaceText(s, '#$D#$A', #$D#$A);
  label1.Caption:='Вопрос №' + inttostr(iCurrentQuestion+1) + '. ' + s;  // берем из массива вопросов вопрос с выбранным случайным номером
  if voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iRightAnswersCount > 1 then
       label2.Caption:='Выберите несколько вариантов ответа.'
  else label2.Caption:='Выберите один из вариантов ответа.';
  iAnswers:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iAnswersCount;  // кол-во всех ответов

  bAnswHaveImage:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].bAnswersHaveImage;

  // --- показываем картинку в вопросе, если есть таковая ----------------------
  setcurrentdir(extractfilepath(application.ExeName));
  if voprosy[aQuestionRandomNumbers[iCurrentQuestion]].bQuestionHaveImage then
  begin
    image1.Picture.LoadFromFile('data\images\' + voprosy[aQuestionRandomNumbers[iCurrentQuestion]].sQuestionImagePath + '.bmp');
    image1.Visible:=true;
  end else image1.Visible:=false;

  // --- делаем массив случайного порядка ответов ------------------------------
  k:=0;
  setlength(aAnswerRandomNumbers, iAnswers);
  for i:=0 to high(aAnswerRandomNumbers) do aAnswerRandomNumbers[i]:=-1;  // "обнуляем" массив случайных номеров
  repeat
    iRand:=random(iAnswers);
    bGood:=true;

    for i:=0 to iAnswers-1 do if iRand=aAnswerRandomNumbers[i] then bGood:=false;

    if bGood then begin
      aAnswerRandomNumbers[k]:=iRand;
      inc(k);
    end;
  until k=iAnswers;

// --- очищаем от предыдущих кнопок ответов (Radiobutton`ы и checkbox`ы, и картинки если были)
  for I := 0 to panel4.ComponentCount-1 do begin
    cmp:=panel4.FindComponent('answer' + inttostr(i));
    if cmp<>nil then (cmp as TControl).Free;
    cmp:=panel4.FindComponent('img_answer' + inttostr(i));
    if cmp<>nil then cmp.Free;
  end;


  // --- создаем кнопки (radiobutton или checkbox) ответов ---------------------
  k:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].iRightAnswersCount;  // кол-во правильных ответов в вопросе
  ileft:=10;
  if bAnswHaveImage then iTop:=6//16
    else itop:=10;

  // --- если правильных ответов > 1, то создаем checkbox'ы ответов (вместо радиобуттонов) ---
  if k > 1 then begin
    for I := 0 to iAnswers - 1 do
    begin
      with TCheckBox.Create(form7.Panel4) do begin
        Name:='answer' + inttostr(i);
        Caption:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].aAnswers[aAnswerRandomNumbers[i]];
        Left:=iLeft;
        Top:=iTop;
        Width:=Panel4.ClientWidth-left-10;
        if bAnswHaveImage then Height:=63 else Height:=37;
        WordWrap:=True;
        Anchors:=[akLeft,akTop,akRight];
        Tag:=aAnswerRandomNumbers[i]+1; // +1 потому что, в массиве хранятся ИНДЕКСЫ, начинающиеся с нуля.
        OnClick:=CheckBoxClick;
        Parent:=Panel4;
      end;
      if bAnswHaveImage then t:=63
      else t:=37;
      iTop:=iTop + t + 6;
    end;
  end;

  // --- если правильный ответ один, то создаем радиокнопки ответов ---
  if k = 1 then begin
    for I := 0 to iAnswers - 1 do
    begin
      with TRadioButton.Create(form7.Panel4) do begin
        Name:='answer' + inttostr(i);
        Caption:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].aAnswers[aAnswerRandomNumbers[i]];
        Left:=iLeft;
        Top:=iTop;
        Width:=Panel4.ClientWidth-left-10;
        if bAnswHaveImage then Height:=63 else Height:=37;
        WordWrap:=True;
        Anchors:=[akLeft,akTop,akRight];
        Tag:=aAnswerRandomNumbers[i]+1; // +1 потому что, в массиве хранятся ИНДЕКСЫ, начинающиеся с нуля.
        OnClick:=RadioButClick;
        Parent:=Panel4;
      end;
      if bAnswHaveImage then t:=63
      else t:=37;
      iTop:=iTop + t + 6;
    end;
  end;

  // --- если есть картинки в ответах, то их надо создавать.....................
  setcurrentdir(extractfilepath(Application.ExeName));
  if bAnswHaveImage then
  begin
    for I := 0 to iAnswers - 1 do
    begin
      // --- сначала создаем временный лэйбл, для определения левой границы картинки благодаря его свойству AutoSize
      with TLabel.Create(panel4) do begin
        left:=iLeft + 16;
        autosize:=true;
        alignment:=taLeftJustify;
        name:='tmplabel' + inttostr(i);
        caption:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].aAnswers[aAnswerRandomNumbers[i]];
        parent:=Panel4;
      end;

      // --- теперь создаем картинку там где заканчивается лэйбл ---------------
      // --- сначала ищем только что созданную лэйблу и запоминаем ее ширину, какая получилась
      cmp:=panel4.FindComponent('tmplabel'+inttostr(i));
      if cmp<>nil then begin
        l:=(cmp as TLabel).Left;
        w:=(cmp as TLabel).width;
      end;
      // --- после этого временный лэйбл можно удалять -------------------------
      cmp:=panel4.FindComponent('tmplabel'+inttostr(i));
      if cmp<>nil then cmp.Free;

      // --- (ширина ответов = ширине лэйбла (укорачиваем)), чтобы можно было нажать на картинку
      cmp:=panel4.FindComponent('answer'+inttostr(i));
      if cmp<>nil then
        (cmp as TControl).Width:=w+16;

      // --- затем ищем кнопку ответа и запоминаем ее позицию по вертикали
      cmp:=panel4.FindComponent('answer'+inttostr(i));
//      if cmp<>nil then
        t:=(cmp as TControl).top;

      // --- и создаем картинку справа от той кнопки ---------------------------
      with TImage.Create(panel4) do begin
      { TODO : если не помещается в форму, то сделать ниже }
      {if ((l+w+8 + 80) > panel4.width then t:=t+.. answer[i].top?...  }
        left:=l + w + 8;
        top:=t;
        width:=80;
        height:=63;
//        Transparent:=true;
        Proportional:=true;
        Center:=true;
        sImageFile:=voprosy[aQuestionRandomNumbers[iCurrentQuestion]].aAnswerImagePaths[{i}aAnswerRandomNumbers[i]];
        if sImageFile<>'' then begin
          Picture.LoadFromFile('data\images\' + sImageFile + '.bmp');
        end;
        name:='img_answer'+inttostr(i);
        cursor:=22;//crHandPoint;
        OnClick:=ImageClick;
        parent:=panel4;
      end; //with
    end; //for i.. to iAnswers
  end; //if если есть картинки в ответах

end;

procedure TForm7.StartTest;
var
  i, iRand, k: integer;
  bGood:  boolean;
begin
  iAnsweredQuestionsCount:=0;
  iRightAnswerQuestions:=0;
  iSelectedQuestionsCount:=30;  // выбираем произвольные 30 вопросов
  // --- стираем пометку об отвеченных вопросах
  for I := 0 to iQuestionsCount-1 do
    voprosy[i].bQuestionHasBeenAnswered:=false;
  CheckListBox1.Items.Clear;

  // --- заполняем массив случайных номеров вопросов из базы вопросов ----------
  k:=0;
  setlength(aQuestionRandomNumbers, iSelectedQuestionsCount);
  for i:=0 to high(aQuestionRandomNumbers) do aQuestionRandomNumbers[i]:=-1;  // "обнуляем" массив случайных номеров
  repeat
    iRand:=random(iQuestionsCount);
    bGood:=true;

    for i:=0 to iQuestionsCount-1 do if iRand=aQuestionRandomNumbers[i] then bGood:=false;

    if bGood then begin // если mojno=1, то такой карточки еще нет, добавляем ее
      aQuestionRandomNumbers[k]:=iRand;
      inc(k);
    end;
  until k=iSelectedQuestionsCount;

  // --- Заполняем Listbox в левой панели --------------------------------------
  for I := 0 to iSelectedQuestionsCount - 1 do
  begin
    CheckListBox1.Items.Add('Вопрос №' + inttostr(i+1));
  end;

  // --- Показываем 1-ый вопрос: ---
  iCurrentQuestion:=0;
  SelectNextQuestion;
end;

end.

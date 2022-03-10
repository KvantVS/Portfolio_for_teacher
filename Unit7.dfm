object Form7: TForm7
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1058#1077#1089#1090
  ClientHeight = 524
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 705
    Height = 524
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 120
      Align = alTop
      TabOrder = 0
      DesignSize = (
        703
        120)
      object Label1: TLabel
        Left = 5
        Top = 0
        Width = 546
        Height = 90
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = #1042#1086#1087#1088#1086#1089' '#8470'1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitWidth = 421
      end
      object Image1: TImage
        Left = 557
        Top = 7
        Width = 105
        Height = 105
        Anchors = [akTop, akRight]
        Center = True
        Proportional = True
        OnClick = Image1Click
        ExplicitLeft = 187
      end
      object Label2: TLabel
        Left = 5
        Top = 96
        Width = 546
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = #1042
        ExplicitWidth = 421
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 121
      Width = 703
      Height = 402
      Align = alClient
      TabOrder = 1
      DesignSize = (
        703
        402)
      object BitBtn1: TBitBtn
        Left = 593
        Top = 364
        Width = 95
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1090#1077#1089#1090
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object btnAnswer: TBitBtn
        Left = 501
        Top = 364
        Width = 86
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1054#1090#1074#1077#1090#1080#1090#1100
        DoubleBuffered = True
        Enabled = False
        Kind = bkOK
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btnAnswerClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 524
    Align = alLeft
    TabOrder = 1
    object CheckListBox1: TCheckListBox
      Left = 1
      Top = 1
      Width = 183
      Height = 522
      OnClickCheck = CheckListBox1ClickCheck
      Align = alClient
      Flat = False
      ItemHeight = 13
      TabOrder = 0
      OnKeyDown = CheckListBox1KeyDown
      OnMouseDown = CheckListBox1MouseDown
      OnMouseUp = CheckListBox1MouseUp
    end
  end
end

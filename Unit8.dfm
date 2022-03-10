object Form8: TForm8
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086#1077' '#1087#1086#1088#1090#1092#1086#1083#1080#1086
  ClientHeight = 131
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    328
    131)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 330
    Height = 53
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1053#1072#1095#1072#1090#1100' '#1090#1077#1089#1090'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 320
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 76
    Width = 93
    Height = 33
    Caption = #1053#1072#1095#1072#1090#1100
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkYes
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 76
    Width = 93
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkNo
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end

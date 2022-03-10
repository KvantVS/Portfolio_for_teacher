object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1086#1077' '#1087#1086#1088#1090#1092#1086#1083#1080#1086
  ClientHeight = 570
  ClientWidth = 802
  Color = clBtnFace
  Constraints.MinHeight = 440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 157
    Top = 73
    Height = 497
    Beveled = True
    ResizeStyle = rsUpdate
    ExplicitLeft = 160
    ExplicitTop = 232
    ExplicitHeight = 100
  end
  object pan_left: TPanel
    Left = 0
    Top = 73
    Width = 157
    Height = 497
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = pan_leftResize
    DesignSize = (
      157
      497)
    object Bevel2: TBevel
      Left = 151
      Top = 0
      Width = 6
      Height = 497
      Align = alRight
      Shape = bsRightLine
      ExplicitHeight = 507
    end
    object lbl_Back: TLabel
      Left = 89
      Top = 472
      Width = 56
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = '< '#1053#1072#1079#1072#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_BackClick
    end
    object lbl_menu_4_1: TLabel
      Left = 20
      Top = 194
      Width = 95
      Height = 16
      Caption = #1052#1086#1080' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = lbl_menu_4_1Click
      OnMouseEnter = lbl_menu_4_1MouseEnter
      OnMouseLeave = lbl_menu_4_1MouseLeave
    end
    object lbl_menu_4_2: TLabel
      Left = 20
      Top = 216
      Width = 103
      Height = 16
      Caption = #1052#1086#1080' '#1087#1088#1077#1079#1077#1085#1090#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = lbl_menu_4_2Click
      OnMouseEnter = lbl_menu_4_1MouseEnter
      OnMouseLeave = lbl_menu_4_1MouseLeave
    end
    object menu_2: TBitBtn
      Left = 8
      Top = 54
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1052#1077#1090#1086#1076#1080#1095#1077#1089#1082#1072#1103' '#1082#1086#1087#1080#1083#1082#1072
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = menu_2Click
    end
    object menu_3: TBitBtn
      Left = 8
      Top = 100
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1073#1072#1079#1072
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = menu_3Click
    end
    object menu_4: TBitBtn
      Left = 8
      Top = 146
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1058#1074#1086#1088#1095#1077#1089#1082#1072#1103' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      WordWrap = True
      OnClick = menu_4Click
    end
    object menu_1: TBitBtn
      Left = 8
      Top = 8
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = menu_1Click
    end
    object menu_5: TBitBtn
      Left = 8
      Top = 192
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1085#1077#1091#1088#1086#1095#1085#1072#1103' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = menu_5Click
    end
    object menu_6: TBitBtn
      Left = 8
      Top = 238
      Width = 136
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = #1058#1045#1057#1058
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      WordWrap = True
      OnClick = menu_6Click
    end
  end
  object pan_right: TPanel
    Left = 160
    Top = 73
    Width = 642
    Height = 497
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    inline Frame31: TFrame3
      Left = 6
      Top = 6
      Width = 611
      Height = 131
      VertScrollBar.Tracking = True
      AutoScroll = True
      Color = 14540733
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Visible = False
      ExplicitLeft = 6
      ExplicitTop = 6
      ExplicitWidth = 611
      ExplicitHeight = 131
      DesignSize = (
        594
        131)
      inherited Label2: TLabel
        Width = 489
        ExplicitWidth = 591
      end
      inherited Label5: TLabel
        Top = 172
        Width = 489
        ExplicitTop = 172
        ExplicitWidth = 557
      end
    end
    inline Frame41: TFrame4
      Left = 6
      Top = 159
      Width = 335
      Height = 70
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      ExplicitLeft = 6
      ExplicitTop = 159
      ExplicitWidth = 335
      ExplicitHeight = 70
    end
    inline frame_browser1: Tframe_browser
      Left = 12
      Top = 256
      Width = 320
      Height = 77
      TabOrder = 2
      Visible = False
      ExplicitLeft = 12
      ExplicitTop = 256
      ExplicitHeight = 77
      inherited WebBrowser1: TWebBrowser
        Height = 77
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 77
        ControlData = {
          4C00000013210000F50700000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    inline frame_razrabotki1: Tframe_razrabotki
      Left = 0
      Top = 344
      Width = 429
      Height = 153
      Align = alCustom
      Color = clCream
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      Visible = False
      ExplicitTop = 344
      ExplicitWidth = 429
      ExplicitHeight = 153
      DesignSize = (
        429
        153)
      inherited lbl_Zagolovok: TLabel
        Width = 428
        ExplicitWidth = 428
      end
    end
  end
  object pan_top: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 802
      Height = 63
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #1069#1051#1045#1050#1058#1056#1054#1053#1053#1054#1045' '#1055#1054#1056#1058#1060#1054#1051#1048#1054
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Monotype Corsiva'
      Font.Style = [fsItalic]
      GlowSize = 1
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      ExplicitWidth = 812
    end
    object Bevel1: TBevel
      Left = 0
      Top = 63
      Width = 802
      Height = 10
      Align = alBottom
      Shape = bsBottomLine
      ExplicitTop = -678
    end
    object lbl_loading: TLabel
      Left = 384
      Top = 54
      Width = 58
      Height = 13
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072'...'
      Visible = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 12
    Top = 12
    object N1: TMenuItem
      Caption = #1051#1077#1082#1094#1080#1080
      Visible = False
    end
    object N2: TMenuItem
      Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      object N5: TMenuItem
        Caption = #1053#1072#1095#1072#1090#1100
        ShortCut = 16468
        OnClick = N5Click
      end
    end
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N9: TMenuItem
        Caption = #1042' '#1087#1086#1084#1086#1097#1100' '#1091#1095#1080#1090#1077#1083#1102' '#1080#1085#1092#1086#1088#1084#1072#1090#1080#1082#1080
        OnClick = N9Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ShortCut = 112
        OnClick = N7Click
      end
    end
    object N10: TMenuItem
      Caption = '|'
      Enabled = False
    end
    object N4: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N4Click
    end
  end
end

object Form2: TForm2
  Left = 862
  Top = 122
  BorderStyle = bsToolWindow
  Caption = #1053#1077#1087#1088#1080#1082#1072#1089#1072#1077#1084#1086#1077' '#1089#1091#1076#1086#1082#1091
  ClientHeight = 551
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 144
    Width = 168
    Height = 37
    Caption = #1042#1040#1064#1045' '#1048#1052#1071
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 16
    Width = 97
    Height = 105
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
    Items.Strings = (
      '8'#1093'8'
      '9'#1093'9')
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 144
    Top = 16
    Width = 105
    Height = 105
    Caption = #1057#1083#1086#1078#1085#1086#1089#1090#1100
    Items.Strings = (
      #1053#1054#1042#1048#1063#1054#1050
      #1051#1070#1041#1048#1058#1045#1051#1068
      #1055#1056#1054#1060#1045#1057#1057#1054#1056)
    TabOrder = 1
  end
  object Username: TEdit
    Left = 32
    Top = 192
    Width = 137
    Height = 21
    TabOrder = 2
    Text = 'noname'
    OnKeyPress = UsernameKeyPress
  end
  object Button2: TButton
    Left = 144
    Top = 224
    Width = 99
    Height = 49
    Caption = #1043#1051#1040#1042#1053#1054#1045' '#1052#1045#1053#1070
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 224
    Width = 97
    Height = 49
    Caption = #1053#1040#1063#1040#1058#1068
    TabOrder = 4
    OnClick = Button3Click
  end
  object CreateSudoku: TButton
    Left = 32
    Top = 288
    Width = 97
    Height = 49
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 5
    OnClick = CreateSudokuClick
  end
end

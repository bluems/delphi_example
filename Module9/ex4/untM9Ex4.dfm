object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblRes: TLabel
    Left = 128
    Top = 160
    Width = 345
    Height = 113
    AutoSize = False
    Color = clGradientActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 104
    Top = 53
    Width = 21
    Height = 13
    Caption = 'A '#44050
  end
  object Label3: TLabel
    Left = 280
    Top = 53
    Width = 20
    Height = 13
    Caption = 'B '#44050
  end
  object Label4: TLabel
    Left = 456
    Top = 53
    Width = 21
    Height = 13
    Caption = 'C '#44050
  end
  object edtA: TEdit
    Left = 72
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtB: TEdit
    Left = 238
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtC: TEdit
    Left = 416
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnCalc: TButton
    Left = 256
    Top = 115
    Width = 75
    Height = 25
    Caption = #49892#54665
    TabOrder = 3
    OnClick = btnCalcClick
  end
end

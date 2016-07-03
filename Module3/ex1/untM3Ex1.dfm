object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 316
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResult: TLabel
    Left = 48
    Top = 168
    Width = 121
    Height = 33
    Caption = 'lblResult'
    Visible = False
  end
  object edtValue1: TEdit
    Left = 48
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValue2: TEdit
    Left = 48
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnSum: TButton
    Left = 192
    Top = 46
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 2
    OnClick = calc
  end
  object btnSub: TButton
    Left = 296
    Top = 46
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 3
    OnClick = calc
  end
  object btnMulti: TButton
    Left = 192
    Top = 86
    Width = 75
    Height = 25
    Caption = 'x'
    TabOrder = 4
    OnClick = calc
  end
  object btnDiv: TButton
    Left = 296
    Top = 86
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 5
    OnClick = calc
  end
end

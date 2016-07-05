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
  object lblResult: TLabel
    Left = 312
    Top = 160
    Width = 40
    Height = 13
    Caption = 'lblResult'
  end
  object edtYear: TEdit
    Left = 184
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtCalc: TButton
    Left = 352
    Top = 48
    Width = 75
    Height = 25
    Caption = #44160#49324
    TabOrder = 1
    OnClick = edtCalcClick
  end
end

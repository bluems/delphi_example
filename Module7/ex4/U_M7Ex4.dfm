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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblResult: TLabel
    Left = 320
    Top = 216
    Width = 40
    Height = 13
    AutoSize = False
    Caption = 'lblResult'
  end
  object edtNumber: TEdit
    Left = 248
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 0
    OnEnter = btnCalcClick
  end
  object btnCalc: TButton
    Left = 408
    Top = 136
    Width = 75
    Height = 25
    Caption = 'btnCalc'
    TabOrder = 1
    OnClick = btnCalcClick
  end
end

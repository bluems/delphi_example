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
  object lblS: TLabel
    Left = 432
    Top = 5
    Width = 31
    Height = 13
    Caption = 'S '#44600#51060
  end
  object lblN: TLabel
    Left = 558
    Top = 5
    Width = 32
    Height = 13
    Caption = 'N '#44079#49688
  end
  object Image1: TImage
    Left = 0
    Top = 51
    Width = 552
    Height = 246
  end
  object edtS: TEdit
    Left = 385
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtN: TEdit
    Left = 512
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnDraw: TButton
    Left = 558
    Top = 64
    Width = 75
    Height = 25
    Caption = 'btnDraw'
    TabOrder = 2
    OnClick = btnDrawClick
  end
end

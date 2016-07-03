object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 33
    Height = 13
    Caption = #47112#51060#48660
  end
  object Button1: TButton
    Left = 48
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Enable'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Disable'
    TabOrder = 1
    OnClick = Button2Click
  end
end

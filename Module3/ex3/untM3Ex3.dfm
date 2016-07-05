object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = edtH
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
  object Label1: TLabel
    Left = 235
    Top = 59
    Width = 32
    Height = 13
    Caption = '<==>'
  end
  object Label2: TLabel
    Left = 152
    Top = 29
    Width = 22
    Height = 13
    Caption = #49884#49549
  end
  object Label3: TLabel
    Left = 312
    Top = 29
    Width = 22
    Height = 13
    Caption = #52488#49549
  end
  object edtH: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtS: TEdit
    Left = 272
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnStoH: TButton
    Left = 136
    Top = 96
    Width = 75
    Height = 25
    Caption = #49884#49549'->'#52488#49549
    TabOrder = 2
    OnClick = btnStoHClick
  end
  object btnHtoS: TButton
    Left = 297
    Top = 96
    Width = 75
    Height = 25
    Caption = #52488#49549'->'#49884#49549
    TabOrder = 3
    OnClick = btnHtoSClick
  end
end

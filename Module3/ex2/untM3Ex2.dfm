object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = edtF
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
    Width = 36
    Height = 13
    Caption = 'F('#54868#50472')'
  end
  object Label3: TLabel
    Left = 312
    Top = 29
    Width = 37
    Height = 13
    Caption = 'C('#49453#50472')'
  end
  object edtF: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtC: TEdit
    Left = 272
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCtoF: TButton
    Left = 136
    Top = 96
    Width = 75
    Height = 25
    Caption = #54868#50472'->'#49453#50472
    TabOrder = 2
    OnClick = btnCtoFClick
  end
  object btnFtoC: TButton
    Left = 297
    Top = 96
    Width = 75
    Height = 25
    Caption = #49453#50472'->'#54868#50472
    TabOrder = 3
    OnClick = btnFtoCClick
  end
end

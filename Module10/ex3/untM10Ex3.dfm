object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 561
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 96
    Width = 897
    Height = 409
  end
  object Label1: TLabel
    Left = 744
    Top = 50
    Width = 44
    Height = 13
    Caption = #46160#50864#44760#50640
  end
  object ComboBox1: TComboBox
    Left = 744
    Top = 69
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = '1'
    OnChange = ComboBox1Change
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
  end
  object Button1: TButton
    Left = 416
    Top = 528
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 305
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      #49688#51649
      #49688#54217
      #50896
      #49324#44033#54805)
    TabOrder = 2
  end
  object ColorGrid1: TColorGrid
    Left = 432
    Top = -3
    Width = 300
    Height = 100
    TabOrder = 3
    OnChange = ColorGrid1Change
  end
end

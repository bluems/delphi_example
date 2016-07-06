object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = MyGrid
  Caption = 'Form1'
  ClientHeight = 632
  ClientWidth = 601
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
    Top = 327
    Width = 47
    Height = 13
    AutoSize = False
    Caption = #54665#51032' '#44060#49688
  end
  object Label2: TLabel
    Left = 48
    Top = 368
    Width = 47
    Height = 13
    AutoSize = False
    Caption = #50676#51032' '#44060#49688
  end
  object Label3: TLabel
    Left = 48
    Top = 414
    Width = 69
    Height = 13
    AutoSize = False
    Caption = #44256#51221#54665#51032' '#44060#49688
  end
  object Label4: TLabel
    Left = 48
    Top = 461
    Width = 69
    Height = 13
    AutoSize = False
    Caption = #44256#51221#50676#51032' '#44060#49688
  end
  object Label5: TLabel
    Left = 224
    Top = 327
    Width = 84
    Height = 13
    AutoSize = False
    Caption = #51648#51221#54665'/'#50676#51032' '#44060#49688
  end
  object MyGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 601
    Height = 321
    DrawingStyle = gdsClassic
    FixedColor = clInactiveCaption
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object edtColumn: TEdit
    Left = 48
    Top = 344
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtRow: TEdit
    Left = 48
    Top = 387
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtFixColumn: TEdit
    Left = 48
    Top = 432
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtFixRow: TEdit
    Left = 48
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 224
    Top = 344
    Width = 337
    Height = 21
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 224
    Top = 387
    Width = 337
    Height = 114
    TabOrder = 6
  end
  object btnCellRed: TButton
    Left = 120
    Top = 528
    Width = 75
    Height = 25
    Caption = #49472' '#49353#49345'(RED)'
    TabOrder = 7
    OnClick = btnCellRedClick
  end
  object btnFCGreen: TButton
    Left = 224
    Top = 528
    Width = 105
    Height = 25
    Caption = #44256#51221' '#49472' '#49353#49345'(Green)'
    TabOrder = 8
    OnClick = btnFCGreenClick
  end
  object Button1: TButton
    Left = 360
    Top = 528
    Width = 89
    Height = 25
    Caption = #51648#51221' '#50741#49496' '#53364#47533
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 559
    Width = 75
    Height = 25
    Caption = #49472' '#49353#49345'(Yellow)'
    TabOrder = 10
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 590
    Width = 75
    Height = 25
    Caption = #49472' '#49353#49345'(BLUE)'
    TabOrder = 11
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 224
    Top = 559
    Width = 105
    Height = 25
    Caption = #44256#51221' '#49472' '#49353#49345'(Silver)'
    TabOrder = 12
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 224
    Top = 590
    Width = 105
    Height = 25
    Caption = #44256#51221' '#49472' '#49353#49345'(Aqua)'
    TabOrder = 13
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 360
    Top = 559
    Width = 89
    Height = 25
    Caption = #52972#47100#45936#51060#53552#54364#49884
    TabOrder = 14
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 360
    Top = 590
    Width = 89
    Height = 25
    Caption = 'Button7'
    TabOrder = 15
    OnClick = Button7Click
  end
end

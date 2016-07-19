object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 384
  Width = 575
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=testdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=412lab.xyz'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 160
    Top = 80
  end
  object FDQuery1: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from employees')
    Left = 368
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 272
    Top = 176
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 168
    Top = 216
  end
end

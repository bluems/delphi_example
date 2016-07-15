object DM: TDM
  OldCreateOrder = False
  Height = 216
  Width = 278
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Delphi\1607\sukyoung\testDB.s3db'
      'DriverID=sQLite')
    BeforeConnect = FDConnection1BeforeConnect
    Left = 80
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 168
    Top = 48
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM illness WHERE illname LIKE '#39#39'%:pillname%'#39#39)
    Left = 168
    Top = 104
    ParamData = <
      item
        Name = 'PILLNAME'
        ParamType = ptInput
      end>
  end
end

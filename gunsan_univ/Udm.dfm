object dm: Tdm
  OldCreateOrder = False
  Height = 537
  Width = 937
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    Connected = True
    Left = 64
    Top = 48
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 208
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 344
    Top = 48
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'CUST_NO'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'CUSTOMER'
    TableName = 'CUSTOMER'
    Left = 472
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 456
    Top = 256
  end
end

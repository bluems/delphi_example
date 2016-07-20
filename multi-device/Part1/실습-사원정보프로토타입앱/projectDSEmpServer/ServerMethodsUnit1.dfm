object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 444
  Width = 614
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=mySQL'
      'Database=testdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=412lab.xyz'
      'CharacterSet=utf8')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object qryEmployeeList: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from employees')
    Left = 208
    Top = 48
  end
  object qryGetEmpInfo: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT emp_name, emp_dept FROM employees WHERE emp_no=:no')
    Left = 216
    Top = 136
    ParamData = <
      item
        Name = 'NO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qryEmployeeList
    Left = 48
    Top = 240
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 48
    Top = 328
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 48
    Top = 128
  end
end

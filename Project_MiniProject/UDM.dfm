object DM: TDM
  OldCreateOrder = False
  Height = 370
  Width = 562
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Project'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver240.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=ServerName'
      'User_Name=root'
      'Password=masterkey'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'Database=db'
      'ServerCharSet=utf8')
    Left = 80
    Top = 56
  end
  object EmployeeSource: TDataSource
    DataSet = Employee
    Left = 128
    Top = 128
  end
  object Employee: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'EMPLOYEE'
    DataSet.CommandType = ctTable
    DataSet.DataSource = EmployeeSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 56
    Top = 128
  end
  object Dept: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'DEPT'
    DataSet.CommandType = ctTable
    DataSet.DataSource = DeptSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 56
    Top = 192
  end
  object DeptSource: TDataSource
    DataSet = Dept
    Left = 136
    Top = 192
  end
  object ProjectSource: TDataSource
    DataSet = Project
    Left = 144
    Top = 256
  end
  object subEmployeeSource: TDataSource
    DataSet = SimpleDataSet1
    Left = 400
    Top = 56
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'EMPLOYEE'
    DataSet.CommandType = ctTable
    DataSet.DataSource = subEmployeeSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftWideString
        Name = 'E_TEAM'
        ParamType = ptInput
        Value = '4'#54016
      end>
    IndexFieldNames = 'E_TEAM'
    MasterFields = 'D_TEAM'
    MasterSource = DeptSource
    PacketRecords = 0
    Params = <>
    Left = 320
    Top = 56
  end
  object DeptQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from dept'
      'order by D_dept,d_team')
    SQLConnection = SQLConnection1
    Left = 328
    Top = 205
  end
  object EmployeeQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Team'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Select E_name,E_team'
      'from Employee'
      'where e_team = :Team')
    SQLConnection = SQLConnection1
    Left = 400
    Top = 205
  end
  object ProjectQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pmname'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(PM_member) as total'
      'from projectmember'
      'where PM_name like :pmname')
    SQLConnection = SQLConnection1
    Left = 472
    Top = 208
  end
  object Project: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'PROJECT'
    DataSet.CommandType = ctTable
    DataSet.DataSource = ProjectSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 64
    Top = 240
  end
  object ProjectMember: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'PROJECTMEMBER'
    DataSet.CommandType = ctTable
    DataSet.DataSource = PMSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 72
    Top = 304
  end
  object PMSource: TDataSource
    DataSet = ProjectMember
    Left = 152
    Top = 312
  end
  object SimpleDataSet2: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'PROJECTMEMBER'
    DataSet.CommandType = ctTable
    DataSet.DataSource = SubPMSource
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftWideString
        Name = 'PM_NAME'
        ParamType = ptInput
        Value = '1'
      end>
    IndexFieldNames = 'PM_NAME'
    MasterFields = 'P_NAME'
    MasterSource = ProjectSource
    PacketRecords = 0
    Params = <>
    Left = 320
    Top = 112
  end
  object SubPMSource: TDataSource
    DataSet = SimpleDataSet2
    Left = 400
    Top = 112
  end
  object dateQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'date1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'name1'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select distinct(PM_Member) from Project,ProjectMember where :dat' +
        'e1 < p_dateend and PM_Member like :name1')
    SQLConnection = SQLConnection1
    Left = 296
    Top = 280
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db'
      'User_Name=root'
      'Password=masterkey'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 152
    Top = 56
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 192
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 240
    Top = 128
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select E_name,E_team'
      'from Employee'
      'where e_team = :Team')
    Left = 400
    Top = 272
    ParamData = <
      item
        Name = 'TEAM'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end

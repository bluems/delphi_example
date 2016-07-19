unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXInterBase, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, SimpleDS, Data.DBXMySQL, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    EmployeeSource: TDataSource;
    Employee: TSimpleDataSet;
    Dept: TSimpleDataSet;
    DeptSource: TDataSource;
    ProjectSource: TDataSource;
    subEmployeeSource: TDataSource;
    SimpleDataSet1: TSimpleDataSet;
    DeptQuery: TSQLQuery;
    EmployeeQuery: TSQLQuery;
    ProjectQuery: TSQLQuery;
    Project: TSimpleDataSet;
    ProjectMember: TSimpleDataSet;
    PMSource: TDataSource;
    SimpleDataSet2: TSimpleDataSet;
    SubPMSource: TDataSource;
    dateQuery: TSQLQuery;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    procedure EmployeeSourceDataChange(Sender: TObject; Field: TField);
    procedure EmployeeSourceStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses UEmployee, UDept;

{$R *.dfm}

procedure TDM.EmployeeSourceDataChange(Sender: TObject; Field: TField);
begin
  EmployeeForm.Button1.Enabled := not Employee.Bof;
  EmployeeForm.Button2.Enabled := not Employee.Bof;
  EmployeeForm.Button3.Enabled := not Employee.Eof;
  EmployeeForm.Button4.Enabled := not Employee.Eof;

end;

procedure TDM.EmployeeSourceStateChange(Sender: TObject);
begin

  EmployeeForm.Bt_Insert.Enabled := Employee.State = dsBrowse;
  EmployeeForm.Bt_Delete.Enabled := Employee.State = dsBrowse;
  EmployeeForm.Bt_CanCel.Enabled := Employee.State in [dsinsert, dsedit];
  EmployeeForm.Bt_Post.Enabled := Employee.State in [dsinsert, dsedit];

end;

end.

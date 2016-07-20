unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    qryEmployeeList: TFDQuery;
    qryGetEmpInfo: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetEmpInfo(ANo: integer):string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetEmpInfo(ANo: integer): string;
var
  name, dept:string;
begin
  qryGetEmpInfo.Close;
  qrygetempinfo.ParamByName('no').AsInteger:=ANo;
  qrygetempinfo.Open;
  result:='';
  if not qrygetempinfo.Eof then
  begin
    name:=qrygetempinfo.FieldByName('emp_name').AsString;
    dept:=qrygetempinfo.FieldByName('emp_dept').AsString;
    result:= '이름 : '+name+#13#10'부서 : '+dept;
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.


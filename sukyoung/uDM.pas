unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
begin
{$IF DEFINED(IOS) or DEFINED(ANDROID)}
   FDConnection1.params.values['Database'] := GetHomePath + PathDelim + 'testDB.s3db';
{$ENDIF}
end;

end.

unit EmployeeDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NewData;
    procedure SaveData(AImage,AThumbnail:TStream);
    procedure CancelData;
    procedure DeleteData;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.CancelData;
begin
  if FDquery1.UpdateStatus = tupdatestatus.usInserted then
    fdquery1.Cancel;
end;

procedure TDataModule1.DeleteData;
begin
  if FdQuery1.UpdateStatus = TUpdatestatus.usInserted then
  begin
    Fdquery1.Cancel;
  end
  else if Fdquery1.UpdateStatus = Tupdatestatus.usUnmodified then
  begin
    FDquery1.Delete;
    fdquery1.ApplyUpdates(0);
    fdquery1.CommitUpdates;
    fdquery1.Refresh;
  end;
end;

procedure TDataModule1.NewData;
begin
  FDQuery1.Append;
end;

procedure TDataModule1.SaveData(AImage, AThumbnail: TStream);
begin
  if FDQuery1.UpdateStatus = TUpdateStatus.usUnmodified then
    FDQuery1.Edit;

  if FDQuery1.UpdateStatus = Tupdatestatus.usInserted then
    FdQuery1.FieldByName('emp_no').AsInteger :=0;

  (FDquery1.FieldByName('emp_image') as TBlobfield).LoadFromStream(AImage);
  (FDQuery1.FieldByName('emp_thumb') as TBlobfield).LoadFromStream(AThumbnail);

  FDQuery1.Post;

  FDquery1.ApplyUpdates(0);
  FDQuery1.CommitUpdates;
  FDQuery1.Refresh;
end;

end.

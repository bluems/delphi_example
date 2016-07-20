unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FMX.StdCtrls,
  FMX.ListView, FMX.Layouts, FMX.Edit, FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Layout1: TLayout;
    ListView1: TListView;
    Label1: TLabel;
    edtEmpName: TEdit;
    Label2: TLabel;
    edtEmpDept: TEdit;
    Button2: TButton;
    Button3: TButton;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Unit3;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('emp_name').AsString := edtEmpName.Text;
  ClientDataSet1.FieldByName('emp_dept').AsString := edtEmpDept.Text;
  ClientDataSet1.Post;
  ClientDataSet1.ApplyUpdates(-1);
  ClientDataSet1.Refresh;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  Method: TServermethods1Client;
  EmpNo: integer;
  EmpInfo: string;
begin
  Method := TServermethods1Client.Create(SQLConnection1.DBXConnection);

  EmpNo := ClientDataSet1.FieldByName('emp_no').AsInteger;

  EmpInfo := Method.GetEmpInfo(EmpNo);
  showmessage(EmpInfo);
end;

end.

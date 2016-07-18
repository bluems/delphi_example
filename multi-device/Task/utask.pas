unit utask;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FMX.ListView,
  FMX.StdCtrls, FMX.Controls.Presentation, FireDAC.Phys.IBBase,
  FireDAC.Phys.IBLiteDef;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    ListView1: TListView;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDQueryInsert: TFDQuery;
    FDQueryDelete: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure ListView1DeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OnIdle(Sender: TObject; var ADone: Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses System.IOUtils, FMX.DialogService;

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  TaskName:string;
begin
  try
    InputQuery('새로운 작업 입력',['작업관리'],[''],
      procedure(const AResult: TModalResult; const AValues: array of string)
      begin
        if AResult = mrOK then
          TaskName:=AValues[0]
        else
          TaskName:='';
        if not (TaskName.Trim = '') then
        begin
          FDQueryInsert.ParamByName('TaskName').AsString:=TaskName;
          FdQueryInsert.ExecSQL;
          FDTable1.Refresh;
          LinkFillControlToField1.BindList.FillList;
        end;
      end);
  except
    on e: Exception do
    begin
    ShowMessage(e.Message);
    end;

  end;
end;

procedure TForm1.FDConnection1BeforeConnect(Sender: TObject);
begin
  {$IFNDEF MSWINDOWS}
  FDConnection1.Params.Values['Database']:=TPath.Combine(TPath.GetDocumentsPath,'TASKS.GDB');
  {$ENDIF}

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    // For unidirectional dataset, don't refill automatically when dataset is activated
    // because dataset is reactivated everytime use DataSet.First.
    LinkFillControlToField1.AutoActivate := False;
    LinkFillControlToField1.AutoFill := False;
    Application.OnIdle := OnIdle;
    FDConnection1.Connected := True;
    FDTable1.Active := True;
    LinkFillControlToField1.BindList.FillList;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TForm1.ListView1DeletingItem(Sender: TObject; AIndex: Integer;
  var ACanDelete: Boolean);
var
  TaskName:string;
begin
  TaskName:=ListView1.Items[AIndex].Text;
  try
    FDQueryDelete.ParamByName('TaskName').AsString:=TaskName;
    FDQueryDelete.ExecSQL;
    ACanDelete:=True;
    if ListView1.ItemIndex = AIndex then
      ListView1.ItemIndex := 0;

  except
    on e:Exception do
    begin
      ShowMessage(e.Message);
    end;

  end;
end;

procedure TForm1.OnIdle(Sender: TObject; var ADone: Boolean);
begin
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'TASKS.GDB';
  {$ELSEIF DEFINED (MACOS)}
  FDConnection1.Params.Values['Database'] := TPath.GetHomePath + PathDelim + 'TASKS.GDB';
  {$ELSEIF DEFINED(MSWINDOWS)}
  FDConnection1.Params.Values['Database'] := GetCurrentDir + PathDelim + 'TASKS.GDB';
  {$ENDIF}
  FDConnection1.Params.Values['User_name'] := 'sysdba';
  FDConnection1.Params.Values['Password'] := 'masterkey';
end;

end.

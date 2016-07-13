unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, Data.DBXInterBase, Data.DB, Data.SqlExpr, Data.FMTBcd, System.IOUtils, Data.DbxSqlite,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.ListBox, FMX.Layouts, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ListView1: TListView;
    SQLConnection1: TSQLConnection;
    QueryI: TSQLQuery;
    Select1_sb: TSpeedButton;
    MsgLabel: TLabel;
    Label1: TLabel;
    Insert_sb: TSpeedButton;
    StatusBar2: TStatusBar;
    FDConnection1: TFDConnection;
    FDQueryI: TFDQuery;
    FireSel_sb: TSpeedButton;
    FListBox: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    FireDel_SB: TSpeedButton;
    procedure Select1_sbClick(Sender: TObject);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Insert_sbClick(Sender: TObject);
    procedure FireSel_sbClick(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FireDel_SBClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SandBoxDir : string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

//******************************************************
procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF IOS}
  SandBoxDir := GetHomePath + PathDelim + 'Library' + PathDelim;    //  StartUp\Library
  {$ELSE}
  SandBoxDir := GetHomePath + PathDelim;                            // .\assets\internal
  {$ENDIF}
end;


//---------------------------------------------------------------
procedure TForm1.SQLConnection1BeforeConnect(Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  SQLConnection1.Params.Values[ 'Database' ] :=  SandBoxDir + 'testdb.s3db';
  {$ENDIF}
end;


//******************************************************
procedure TForm1.Select1_SBClick(Sender: TObject);
var
  qi : integer;
  LItem: TListViewItem;
begin
  SQLConnection1.Open;
  try
    QueryI.Close;
    QueryI.SQL.Clear;
    QueryI.SQL.Add( 'Select * from sitemenu' );
    QueryI.Open;
    QueryI.First;

    ListView1.Items.Clear;
    ListView1.BeginUpdate();
    qi := 0;
    while Not QueryI.EOF do
    begin
      LItem := ListView1.Items.Add;
      LItem.Text :=  QueryI.FieldByName('no').AsString;
      LItem.Detail := QueryI.FieldByName('title').AsString;

      QueryI.Next;
      qi := qi + 1;
    end;
    ListView1.EndUpdate();

  except
    on e: Exception do begin
      ShowMessage( e.Message );
    end;
  end;
  SQLConnection1.Close;

//  LItem.Objects.AccessoryObject.Visible := FALSE;

{  ListView1.Items[2].Objects.AccessoryObject.Visible := TRUE;
  ListView1.Items[2].Checked := TRUE;

 if ListView1.Items[2].Checked then
    ShowMessage('checked');
}
end;


//******************************************************
procedure TForm1.Insert_sbClick(Sender: TObject);
begin
  SQLConnection1.Open;
  try
    QueryI.Close;
    QueryI.SQL.Clear;
    QueryI.Sql.Add( 'insert into sitemenu ( no, title ) ' );
    QueryI.Sql.Add( 'values( :no, :title );' );

    QueryI.ParamByName('no').AsString  := FormatDateTime( 'hhmmss', NOW );
    QueryI.ParamByName('title').AsString  := MsgLabel.Text;
    QueryI.ExecSQL();
  except
    on e: Exception do begin
      ShowMessage( e.Message );
    end;
  end;
  SQLConnection1.Close;

  Select1_SBClick( Sender );  // 화면 Refresh
end;


procedure TForm1.ListView1Click(Sender: TObject);
begin

end;

{$REGION 'FireDAC'}

//******************************************************
procedure TForm1.FDConnection1BeforeConnect(Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values[ 'Database' ] :=
           TPath.Combine( TPath.GetDocumentsPath(), 'testdb.s3db');
  {$ENDIF}
end;


//******************************************************
procedure TForm1.FireSel_sbClick(Sender: TObject);
var
  qi : integer;
  subI: TListBoxItem;
begin
  FDConnection1.Open;
  try
    FDQueryI.Close;
    FDQueryI.SQL.Clear;
    FDQueryI.SQL.Add( 'Select * from sitemenu' );
    FDQueryI.Open;
    FDQueryI.First;

    FListBox.Clear();
    FListBox.BeginUpdate();
    qi := 0;
    while Not FDQueryI.EOF do
    begin
      subI := TListBoxItem.Create( FListBox );
      subI.Text :=  FDQueryI.FieldByName('title').AsString;
      subI.Tag  :=  FDQueryI.FieldByName('no').AsInteger;
      FListBox.AddObject( subI );

      FDQueryI.Next;
      qi := qi + 1;
    end;
    FListBox.EndUpdate();

  except
    on e: Exception do begin
      ShowMessage( e.Message );
    end;
  end;
  FDConnection1.Close;
end;

//******************************************************
procedure TForm1.FireDel_SBClick(Sender: TObject);
begin
  FDConnection1.Open;
  try
    FDQueryI.Close;
    FDQueryI.SQL.Clear;
    FDQueryI.Sql.Add( 'delete from sitemenu ' );
    FDQueryI.Sql.Add( 'where no = :delItem ;' );

    FDQueryI.ParamByName('delItem').AsInteger  := FListBox.Selected.Tag;
    FDQueryI.ExecSQL();
  except
    on e: Exception do begin
      ShowMessage( e.Message );
    end;
  end;
  FDConnection1.Close;

  FireSel_sbClick( Sender );  // 화면 Refresh
end;


{$ENDREGION}


end.

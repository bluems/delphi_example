unit untM19Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    MyGrid: TStringGrid;
    edtColumn: TEdit;
    edtRow: TEdit;
    edtFixColumn: TEdit;
    edtFixRow: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    btnCellRed: TButton;
    btnFCGreen: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure btnCellRedClick(Sender: TObject);
    procedure btnFCGreenClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateGrid(n1, n2, n3, n4 : integer);
    procedure GetGridParameter(var n1, n2, n3, n4:integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnCellRedClick(Sender: TObject);
begin
  MyGrid.Color:=clRed;
end;

procedure TForm1.btnFCGreenClick(Sender: TObject);
begin
  MyGrid.FixedColor:=clGreen;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
nl,ns,nfl,nfs:integer;
begin
  GetGridParameter(nl,ns,nfl,nfs);
  CreateGrid(nl,ns,nfl,nfs);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MyGrid.Color:=clYellow;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  MyGrid.Color:=clBlue;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MyGrid.FixedColor:=clSilver;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MyGrid.FixedColor:=clAqua;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i:byte;
begin
  if StrToInt(edit5.Text) > MyGrid.ColCount then
    raise Exception.Create('컬럼 수 초과');

    memo1.Lines.Clear;
    for i := 0 to MyGrid.RowCount -1 do
    begin
      memo1.Lines.Add(MyGrid.Cells[StrToInt(Edit5.Text)-1, i]);
     end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var
  i:byte;
begin
  if StrToInt(edit5.Text) > MyGrid.rowCount then
    raise Exception.Create('행 수 초과');

    memo1.Lines.Clear;
    for i := 0 to MyGrid.ColCount -1 do
    begin
      memo1.Lines.Add(MyGrid.Cells[i,StrToInt(Edit5.Text)-1]);
     end;
end;

procedure TForm1.CreateGrid(n1, n2, n3, n4: integer);
var
 i, j:integer;
begin
  MyGrid.RowCount:=n2;
  MyGrid.ColCount:=n1;
  MyGrid.FixedCols:=n4;
  MyGrid.FixedRows:=n3;

  for i := 0 to MyGrid.RowCount-1 do
    for j := 0 to MyGrid.ColCount-1 do
      MyGrid.Cells[j,i]:='컬럼'+IntToStr(i)+'행'+IntToStr(i);


end;

procedure TForm1.GetGridParameter(var n1, n2, n3, n4: integer);
begin
  if (edtColumn.Text='') or (edtRow.Text='') then
  raise Exception.Create('행의 개수와 열의 개수는 반드시 입력하세요');

  n1:=StrToInt(edtColumn.Text);
  n2:=StrToInt(edtRow.Text);

  if edtFixColumn.Text='' then
    n3:=0
  else
    n3:=StrToInt(edtFixColumn.Text);
  if edtFixRow.Text='' then
    n4:=0
  else
    n4:=StrToInt(edtFixRow.Text);
end;

end.

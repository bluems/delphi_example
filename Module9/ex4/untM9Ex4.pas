unit untM9Ex4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblRes: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtA: TEdit;
    edtB: TEdit;
    edtC: TEdit;
    btnCalc: TButton;
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function max(a,b,c:integer):integer;
    function min(a,b,c:integer):integer;
  end;

var
  Form1:TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcClick(Sender: TObject);
var
t:single;
a,b,c:integer;
begin
  a:=strtoint(edtA.Text);
  b:=strtoint(edtB.Text);
  c:=strtoint(edtC.Text);

  t:=(max(a,b,c)-min(a,b,c))/(2+(max(a,b,c)*min(a,b,c)));
  lblRes.Caption:=floattostr(t);
end;

function TForm1.max(a, b, c: integer): integer;
var
res:integer;
begin
  if a>b then
    res:=a
  else
    res:=b;
  if res<c then
    res:=c;

  Result:=res;

end;

function TForm1.min(a, b, c: integer): integer;
var
res:integer;
begin
  if a>b then
    res:=b
  else
    res:=a;
  if res>c then
    res:=c;

  Result:=res;
end;

end.

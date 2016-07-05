unit untM11Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblS: TLabel;
    lblN: TLabel;
    edtS: TEdit;
    edtN: TEdit;
    btnDraw: TButton;
    Image1: TImage;
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDrawClick(Sender: TObject);
var
 s, n, i,x,y:integer;
begin
  s:=strtoint(edtS.Text);
  n:=strtoint(edtN.Text);
  x:=0;
  //=0;
  for i := 1to n do
  begin
    Image1.Canvas.Rectangle(x,0,s+x,s);
    x:=s+x+10;
  end;



end;

end.

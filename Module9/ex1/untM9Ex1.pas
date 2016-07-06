unit untM9Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblRes: TLabel;
    procedure FormCreate(Sender: TObject);
    function yCalc(x:integer):real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
x:real;
begin
    x:=yCalc(6)+yCalc(13)+yCalc(21);
    lblRes.Caption:=floattostr(x/2);

end;

function TForm1.yCalc(x: integer): real;
begin
  Result:=SQR(x)+x;
end;

end.

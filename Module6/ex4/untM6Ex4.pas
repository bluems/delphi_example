unit untM6Ex4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtA: TEdit;
    edtN: TEdit;
    btnExe: TButton;
    lblResult: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnExeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExeClick(Sender: TObject);
var
 i,sum:integer;
begin
  for i := StrToInt(edtA.Text) to StrToInt(edtN.Text) do
  begin
    sum:=sum+i;
  end;

  if sum mod 2=0 then
    lblResult.Caption:='Â¦¼ö'
  else
    lblResult.Caption:='È¦¼ö';
end;

end.

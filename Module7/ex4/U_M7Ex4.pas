unit U_M7Ex4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNumber: TEdit;
    btnCalc: TButton;
    lblResult: TLabel;
    procedure btnCalcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s:String='';


implementation

{$R *.dfm}


procedure TForm1.btnCalcClick(Sender: TObject);
var
  k: integer;
begin
  if 1<=strtoint(edtNumber.Text) then
    if strtoint(edtNumber.Text)<=180 then
    begin
      k:=StrToInt(edtNumber.text)*2-1;
      copy(s,k,2);
      lblResult.Caption:=IntToStr(k);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
I:integer;
begin
  for I := 10 to 99 do
    s:=s+IntToStr(I);

end;

end.

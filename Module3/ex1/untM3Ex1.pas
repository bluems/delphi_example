unit untM3Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblResult: TLabel;
    edtValue1: TEdit;
    edtValue2: TEdit;
    btnSum: TButton;
    btnSub: TButton;
    btnMulti: TButton;
    btnDiv: TButton;

    procedure calc(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }


{ TForm1 }

procedure TForm1.calc(Sender: TObject);
var
  value1:Double;
  value2:Double;
begin
  lblResult.Visible:=True;
  value1:=StrToFloat(edtValue1.Text);
  value2:=StrToFloat(edtValue2.Text);

  if Sender = btnSum then
    lblResult.Caption:=FloatToStr(value1+value2)
  else if Sender = btnSub then
    lblResult.Caption:=FloatToStr(value1-value2)
  else if Sender = btnMulti then
    lblResult.Caption:=FloatToStr(value1*value2)
  else
    lblResult.Caption:=FloatToStr(value1/value2);
end;

end.

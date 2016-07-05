unit untM7Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtYear: TEdit;
    edtCalc: TButton;
    lblResult: TLabel;
    procedure edtCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.edtCalcClick(Sender: TObject);
var
  y:integer;
begin
  y:=StrToInt(edtYear.Text);

  if y mod 400 = 0 then
    lblResult.Caption:='¿±≥‚¿‘¥œ¥Ÿ.'
  else if y mod 4 = 0 then
    lblResult.Caption:='¿±≥‚¿‘¥œ¥Ÿ.'
  else
    lblResult.Caption:='¿±≥‚¿Ã æ∆¥’¥œ¥Ÿ.';




end;

end.

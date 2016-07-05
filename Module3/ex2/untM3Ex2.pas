unit untM3Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtF: TEdit;
    edtC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCtoF: TButton;
    btnFtoC: TButton;
    procedure btnCtoFClick(Sender: TObject);
    procedure btnFtoCClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnCtoFClick(Sender: TObject);
var
  f:single;
begin
  f:=StrToFloat(edtF.Text);
  edtC.Text:=FloatToStr(5/9*f-32);
end;

procedure TForm1.btnFtoCClick(Sender: TObject);
var
  c:single;
begin
  c:=StrToFloat(edtC.Text);
  edtF.Text:=FloatToStr(9/5*c+32);
end;

end.

unit untM3Ex3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtH: TEdit;
    edtS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnStoH: TButton;
    btnHtoS: TButton;
    procedure btnStoHClick(Sender: TObject);
    procedure btnHtoSClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnStoHClick(Sender: TObject);
var
  h:single;
begin
  h:=StrToFloat(edtH.Text);
  edtS.Text:=FloatToStr(h/3600);
end;

procedure TForm1.btnHtoSClick(Sender: TObject);
var
  s:single;
begin
  s:=StrToFloat(edtS.Text);
  edtH.Text:=FloatToStr(s*3600);
end;

end.

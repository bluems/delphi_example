unit untM2Ex3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;

    procedure Signal(Sender:Tobject);
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

procedure TForm1.Signal(Sender: Tobject);
begin
  Label1.Enabled:=False;
  Label2.Enabled:=False;
  Label3.Enabled:=False;

  if Sender = Button1 then
    Label1.Enabled:=True
  else if Sender = Button2 then
    Label2.Enabled:=True
  else if Sender = Button3 then
    Label3.Enabled:=True;


end;

end.

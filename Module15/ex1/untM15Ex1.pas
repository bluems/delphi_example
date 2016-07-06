unit untM15Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    memA: TMemo;
    memB: TMemo;
    memC: TMemo;
    btnExcude: TButton;
    procedure btnExcudeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExcudeClick(Sender: TObject);
var
  I:integer;
  M:integer;
begin
  for I := 0 to memA.Lines.Count do
  begin
    M:=StrToInt(memA.Lines[I].

    if M>0 then
      memB.Lines.Append(memA.Lines[I])
    else if M<0 then
      memC.Lines.Append(memA.Lines[I]);
  end;

end;

end.

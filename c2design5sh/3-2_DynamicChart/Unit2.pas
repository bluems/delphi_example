unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  button2 := Tbutton.Create(self);
  button2.Parent:=Form2;

  button2.Text:='My New Button';
  button2.Width:=100;
  button2.Height:=100;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if assigned(button2) then
    button2.Release;
end;

end.

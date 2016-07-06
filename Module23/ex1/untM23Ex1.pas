unit untM23Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  pos:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  pos:=pos* -1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  pos:= pos* (-1);
  if pos > 0 then
  begin
    image1.Visible:=True;
    image2.Visible:=False;
    image3.Visible:=False;
    image4.Visible:=True;
    image5.Visible:=True;
    image6.Visible:=False;
  end
  else
  begin
    image1.Visible:=False;
    image2.Visible:=True;
    image3.Visible:=True;
    image4.Visible:=False;
    image5.Visible:=False;
    image6.Visible:=True;
  end;
end;

end.

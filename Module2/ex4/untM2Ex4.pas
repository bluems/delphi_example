unit untM2Ex4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnBgColorR: TButton;
    btnBgColorG: TButton;
    btnBgColorB: TButton;
    btnFontColorR: TButton;
    btnFontColorG: TButton;
    btnFontColorB: TButton;
    btnFontSize15: TButton;
    btnFontSize10: TButton;
    btnFontSize5: TButton;
    btnFontFamilyA: TButton;
    btnFontFamilyB: TButton;
    btnFontFamilyC: TButton;

    procedure bgColor(Sender:TObject);
    procedure fontColor(Sender:TObject);
    procedure fontSize(Sender:TObject);
    procedure fontFamily(Sender:TObject);
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

procedure TForm1.bgColor(Sender: TObject);
begin
  if Sender = btnBgColorR then
    Label1.Color:=clRed
  else if Sender = btnBgColorG then
    Label1.Color:=clGreen
  else
    Label1.Color:=clBlue;
end;

procedure TForm1.fontColor(Sender: TObject);
begin
  if Sender = btnFontColorR then
    Label1.Font.Color:=clRed
  else if Sender = btnFontColorG then
    Label1.Font.Color:=clGreen
  else
    Label1.Font.Color:=clBlue;
end;

procedure TForm1.fontFamily(Sender: TObject);
begin
  if Sender = btnFontFamilyA then
    Label1.font.Name:='arial'
  else if Sender = btnFontFamilyB then
    Label1.Font.Name:='system'
  else Label1.Font.Name:='¸¼Àº °íµñ';
end;

procedure TForm1.fontSize(Sender: TObject);
begin
  if Sender = btnFontSize15 then
    Label1.font.Size:=15
  else if Sender = btnFontSize10 then
    Label1.Font.Size:=10
  else
    Label1.Font.Size:=5;
end;

end.

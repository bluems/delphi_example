unit untM10Ex3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ColorGrd, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    Button1: TButton;
    ListBox1: TListBox;
    ColorGrid1: TColorGrid;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
 i, j, s, n, m:integer;
 x, y: integer;
 r,r1,r2:integer;

procedure TForm1.Button1Click(Sender: TObject);
var
x,y:integer;
begin
  x:=(ClientWidth div 2);
  y:=(ClientHeight div 2);

  case Listbox1.ItemIndex of
    0: begin
      Canvas.MoveTo(x-100,y);
      Canvas.LineTo(x-100, y+100);
    end;
    1: begin
      Canvas.MoveTo(x-100,y+100);
      Canvas.LineTo(x+100, y+100);
    end;
    2: Canvas.Ellipse(100, 100, ClientWidth div 3, ClientWidth div 3);
    3: Canvas.Ellipse(x-50,y-50,x+100,y+100);

  end;
end;

procedure TForm1.ColorGrid1Change(Sender: TObject);
begin
  Canvas.Brush.Color:= ColorGrid1.ForegroundColor;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Canvas.Pen.Width:=strtoint(combobox1.Items[Combobox1.ItemIndex]);
end;

end.

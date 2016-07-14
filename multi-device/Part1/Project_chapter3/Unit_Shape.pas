unit Unit_Shape;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Colors, FMX.Edit, FMX.Objects;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ComboColorBox1: TComboColorBox;
    ComboColorBox2: TComboColorBox;
    GroupBox5: TGroupBox;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
var
  center,radius:TPointf;
  opacity, startAngel, sweepAngel:single;
begin
  if (trystrtoFloat(edit1.Text, center.X) and
      trystrtoFloat(edit2.Text, center.y) and
      trystrtoFloat(edit3.Text, radius.X) and
      trystrtoFloat(edit4.Text, radius.y) and
      trystrtoFloat(edit5.Text, startangel) and
      trystrtoFloat(edit6.Text, sweepangel) and
      trystrtoFloat(edit7.Text, opacity))  then
   begin
      image1.Bitmap.Canvas.BeginScene;
      image1.Bitmap.Canvas.fill.Color :=  ComboColorBox2.Color;
      image1.Bitmap.Canvas.FillArc(center, radius, startangel, sweepangel, opacity);
      image1.Bitmap.Canvas.EndScene;
   end
   else
      showmessage('input data error');
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  center,radius:TPointf;
  opacity, startAngel, sweepAngel:single;
begin
  if (trystrtoFloat(edit1.Text, center.X) and
      trystrtoFloat(edit2.Text, center.y) and
      trystrtoFloat(edit3.Text, radius.X) and
      trystrtoFloat(edit4.Text, radius.y) and
      trystrtoFloat(edit5.Text, startangel) and
      trystrtoFloat(edit6.Text, sweepangel) and
      trystrtoFloat(edit7.Text, opacity))  then
   begin
      image1.Bitmap.Canvas.BeginScene;
      image1.Bitmap.Canvas.Stroke.Color :=  ComboColorBox1.Color;
      image1.Bitmap.Canvas.DrawArc(center, radius, startangel, sweepangel, opacity);
      image1.Bitmap.Canvas.EndScene;
   end
   else
      showmessage('input data error');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Image1.Bitmap.Create(round(image1.Width), round(image1.height));
end;

end.

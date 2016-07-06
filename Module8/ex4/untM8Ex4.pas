unit untM8Ex4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnExe: TButton;
    edtAX: TEdit;
    edtAY: TEdit;
    Label2: TLabel;
    edtBX: TEdit;
    edtBY: TEdit;
    Label3: TLabel;
    edtCX: TEdit;
    edtCY: TEdit;
    Label4: TLabel;
    edtDX: TEdit;
    edtDY: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblRes: TLabel;
    procedure btnExeClick(Sender: TObject);
    type
      Txy=array[0..3]of array[0..1] of integer;

    function squareCalc(xy:Txy):Real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExeClick(Sender: TObject);
var
sum:Real;
AX,AY,BX,BY,CX,CY,DX,DY:integer;
xy:Txy;
begin
  xy[0][0]:=StrtoInt(edtAX.Text);  //[��ǥ��ȣ][0=x 1=y]
  xy[1][0]:=StrtoInt(edtBX.Text);
  xy[2][0]:=StrtoInt(edtCX.Text);
  xy[3][0]:=StrtoInt(edtDX.Text);
  xy[0][1]:=StrtoInt(edtAY.Text);
  xy[1][1]:=StrtoInt(edtBY.Text);
  xy[2][1]:=StrtoInt(edtCY.Text);
  xy[3][1]:=StrtoInt(edtDY.Text);

  sum:=squareCalc(xy);

  lblRes.Caption:='ũ�� : '+FloatToStr(sum);
end;

function TForm1.squareCalc(xy: Txy): Real;
var
i:integer;
sum:real;
begin
  for i := 0 to 2 do
  begin
    sum:=(xy[i][0]+xy[i+1][0])*(xy[i][1]-xy[i+1][1]);
    {
    � �ٰ����� ���� : (A��x��ǥ + B��x��ǥ)*(A��y��ǥ - B��y��ǥ)�� ��
    }
  end;
  sum:=abs(sum);   //�� ���� ���밪
  Result:=sum/2;   //���밪�� �ݺ��� ���� �ٰ����� ����. ����. ���� �ٰ����� ���� ����.
end;

end.

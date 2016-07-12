unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani,
  FMX.Gestures;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Circle1: TCircle;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    Text8: TText;
    GestureManager1: TGestureManager;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Text1Click(Sender: TObject);
  private
    { Private declarations }
    procedure pUpDn( i : integer );
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  layout1.Position.X := -150;  // 초기 위치 설정
end;


procedure TForm1.pUpDn( i : integer );
begin
  FloatAnimation1.Enabled := FALSE;
  FloatAnimation1.StartValue := Circle1.RotationAngle;

  if i = 1  then
    FloatAnimation1.StopValue := Circle1.RotationAngle - 45
  else
    FloatAnimation1.StopValue := Circle1.RotationAngle + 45;

  FloatAnimation1.Enabled := TRUE;
end;


procedure TForm1.FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
  var Handled: Boolean);
begin
   case EventInfo.GestureID of
     sgiUp   : pUpDn( 1 );
     sgiDown : pUpDn( 2 );
   end;
end;


procedure TForm1.Text1Click(Sender: TObject);
begin
  Label1.Text := ( Sender as TText ).Text;
end;



end.

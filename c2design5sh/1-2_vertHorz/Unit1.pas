unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Objects;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FixButton: TButton;
    Button5: TButton;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WD, WH : single;
    isLandMode : boolean;
    procedure ButtonSizeSet;
    procedure ImagePositionSet;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

//*******************************************************
procedure TForm1.FormResize(Sender: TObject);
begin
  WD := Form1.ClientWidth;   // = Layout1.Width
  WH := Form1.ClientHeight;

  if WD < WH then            // 세로모드
     isLandMode := FALSE
  else                       // 가로모드
     isLandMode := TRUE;

  ButtonSizeSet();
  ImagePositionSet();
end;

//------------------------------------------------------
procedure TForm1.ButtonSizeSet;
var
  bw : single;
const
  BH = 60;   // 버튼 높이
  sp = 20;   // 버튼 간격
begin
  WD := Form1.ClientWidth;   // = Layout1.Width
  bw := ( WD - ( sp*4 ) )/ 3;    // 버튼 width

  Button1.Width := bw;      Button1.Height := BH;
  Button2.Width := bw;      Button2.Height := BH;
  Button3.Width := bw;      Button3.Height := BH;

  Button1.Position.X := sp;           Button1.Position.Y := 20;
  Button2.Position.X := sp*2 + bw;    Button2.Position.Y := 20;
  Button3.Position.X := sp*3 + bw*2;  Button3.Position.Y := 20;

  //---------------------------------------------------
  FixButton.Width  := 100;
  FixButton.Height := BH;
  FixButton.Position.X := sp;    FixButton.Position.Y := 100;

  Button5.Width  := WD - sp*3 - FixButton.Width;
  Button5.Height := BH;
  Button5.Position.X := sp*2 + FixButton.Width;
  Button5.Position.Y := 100;
end;

//-----------------------------------------------------
procedure TForm1.ImagePositionSet;
begin
  if isLandMode then
  begin
//    Layout1.Visible := FALSE;
//    StatusBar1.Align := TAlignLayout.alClient;

    Image1.Width  := WD / 3;       Image1.Height := StatusBar1.Height;
    Image2.Width  := WD / 3;       Image2.Height := StatusBar1.Height;
    Image3.Width  := WD / 3;       Image3.Height := StatusBar1.Height;

    Image1.Position.X := 0;        Image1.Position.Y :=0;
    Image2.Position.X := WD/3;     Image2.Position.Y :=0;
    Image3.Position.X := WD/3*2;   Image3.Position.Y :=0;
  end
  else
  begin
  //  Layout1.Visible   := TRUE;
  //  StatusBar1.Align  := TAlignLayout.alBottom;
    StatusBar1.Height := 280;

    Image1.Width  := WD/2;       Image1.Height := StatusBar1.Height/3;
    Image2.Width  := WD/2;       Image2.Height := StatusBar1.Height/3;
    Image3.Width  := WD/2;       Image3.Height := StatusBar1.Height/3;

    Image1.Position.X :=0;
    Image2.Position.X :=0;
    Image3.Position.X :=0;

    Image3.Position.Y := 0;
    Image2.Position.Y := Image3.Height;
    Image1.Position.Y := Image3.Height*2;
  end;

end;



end.

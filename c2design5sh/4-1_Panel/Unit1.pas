unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.Layouts, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    BaseImage: TImage;
    ArrowImg: TImage;
    BreakButton: TButton;
    AccelButton: TButton;
    FloatAnimation1: TFloatAnimation;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    procedure AccelButtonClick(Sender: TObject);
    procedure BreakButtonClick(Sender: TObject);
    procedure FloatAnimation1Process(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.AccelButtonClick(Sender: TObject);
begin
  FloatAnimation1.StartValue := 180;
  FloatAnimation1.StopValue  := 470;
  FloatAnimation1.Duration := 5;

  FloatAnimation1.Enabled := TRUE;
end;

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  FloatAnimation1.Enabled := FALSE;
end;

procedure TForm1.FloatAnimation1Process(Sender: TObject);
begin
  Label1.Text := Format( '%.0f' ,[ 800*( ArrowImg.RotationAngle-180 )/( 470-180 ) ] );
  ProgressBar1.Value := ArrowImg.RotationAngle;

  Label2.Text := Label1.Text;
  Label2.Position.X := ProgressBar1.Width*( ArrowImg.RotationAngle-180 )/( 470-180 );
  Label3.Text := Format( '%.0f' ,[ArrowImg.RotationAngle] );
  Label3.Position.X := Label2.Position.X;
end;


procedure TForm1.BreakButtonClick(Sender: TObject);
begin
  FloatAnimation1.Enabled := FALSE;
  ArrowImg.RotationAngle := 180;
  Label1.Text := '0';
  ProgressBar1.Value := ArrowImg.RotationAngle;

  Label2.Text := Label1.Text;
  Label2.Position.X := 0;
  Label3.Text := '0';
  Label3.Position.X := 0;
end;


end.

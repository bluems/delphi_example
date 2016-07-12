unit Flight1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, System.Math.Vectors, FMX.Media,
  FMX.Controls3D, FMX.Objects;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    btnOn: TButton;
    btnOff: TButton;
    Camera1: TCamera;
    Camera: TCameraComponent;
    Layout2: TLayout;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnOnClick(Sender: TObject);
    procedure btnOffClick(Sender: TObject);
  private
  procedure SetFlashState(Active:Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TForm1 }

procedure TForm1.btnOffClick(Sender: TObject);
begin
  SetFlashState(false);
  showmessage('»Ë');
end;

procedure TForm1.btnOnClick(Sender: TObject);
begin
  SetFlashState(true);
  showmessage('–è');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnOff.Enabled:= camera.HasFlash;
  camera.Active:=True;
end;

procedure TForm1.SetFlashState(Active: Boolean);
begin
  if Active then
  begin
    camera.TorchMode := TtorchMode.ModeOn;
  end
  else
  camera.TorchMode:=TTorchMode.ModeOff;
end;

end.

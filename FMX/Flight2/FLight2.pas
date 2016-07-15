unit FLight2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, FMX.Media;

type
  TFlashLight2 = class(TForm)
    camera: TCameraComponent;
    Timer1: TTimer;
    Timer2: TTimer;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    flash1: TImage;
    flash2: TImage;
    Btn_Off: TButton;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure flash1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetFlashState(Active:Boolean);

  public
    { Public declarations }
  end;

var
  FlashLight2: TFlashLight2;
  f1:integer;
  f2:integer;

implementation

{$R *.fmx}

procedure TFlashLight2.Button1Click(Sender: TObject);
begin
 showmessage('버튼1');
end;

procedure TFlashLight2.Button2Click(Sender: TObject);
begin
   showmessage('버튼2');
end;

procedure TFlashLight2.flash1Click(Sender: TObject);
begin
if f1=0 then
  begin
    setflashstate(True);
    f1:=1;
  end
  else if f1=1 then
       begin
         setflashstate(False);
         f1:=0;
       end;
end;

procedure TFlashLight2.FormCreate(Sender: TObject);
begin
           Btn_Off.Enabled:=Camera.HasFlash;
           Camera.Active:=True;
end;

procedure TFlashLight2.SetFlashState(Active: Boolean);
begin
if Active then
begin
  Camera.TorchMode:=TTorchMode.ModeOn;
end
else Camera.TorchMode:=TTorchMode.ModeOff;
end;

procedure TFlashLight2.Timer1Timer(Sender: TObject);
begin
setflashstate(true);
end;

procedure TFlashLight2.Timer2Timer(Sender: TObject);
begin
setflashstate(false);
end;

end.

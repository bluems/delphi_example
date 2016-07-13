unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls3D, FMX.MaterialSources, FMX.Objects3D,
  FMX.Layouts, FMX.Viewport3D, FMX.StdCtrls, System.Math.Vectors, FMX.Types3D, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    MViewport3D: TViewport3D;
    Layout1: TLayout;
    Grid3D1: TGrid3D;
    Cone1: TCone;
    Camera1: TCamera;
    Light1: TLight;
    PosZ_TrackBar: TTrackBar;
    LabelZ: TLabel;
    Label2: TLabel;
    AngleZ_TrackBar: TTrackBar;
    PosX_TrackBar: TTrackBar;
    PosY_TrackBar: TTrackBar;
    LightMaterialSource1: TLightMaterialSource;
    SpeedButton1: TSpeedButton;
    Cylinder1: TCylinder;
    Switch1: TSwitch;
    Cylinder2: TCylinder;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    AngleX_TrackBar: TTrackBar;
    LabelX: TLabel;
    Text3D1: TText3D;
    procedure AngleX_TrackBarChange(Sender: TObject);
    procedure PosX_TrackBarChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure PosY_TrackBarChange(Sender: TObject);
    procedure AngleZ_TrackBarChange(Sender: TObject);
    procedure PosZ_TrackBarChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CameraInit;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.FormResize(Sender: TObject);
begin
  CameraInit();
end;


//*********************************************************
procedure TForm1.AngleX_TrackBarChange(Sender: TObject);
begin
  Camera1.RotationAngle.X := AngleX_Trackbar.Value;
  LabelX.Text := 'Angle.X= '+ Format( '%f', [Camera1.RotationAngle.X] );
end;

procedure TForm1.AngleZ_TrackBarChange(Sender: TObject);
begin
  Camera1.RotationAngle.Z := AngleZ_Trackbar.Value;
  LabelZ.Text := 'Angle.Z= '+ Format( '%f', [Camera1.RotationAngle.Z] );
end;


//*********************************************************
procedure TForm1.PosX_TrackBarChange(Sender: TObject);
begin
  Camera1.Position.X := PosX_Trackbar.Value;
end;

procedure TForm1.PosY_TrackBarChange(Sender: TObject);
begin
  Camera1.Position.Y := PosY_Trackbar.Value;
end;

procedure TForm1.PosZ_TrackBarChange(Sender: TObject);
begin
  Camera1.Position.Z := PosZ_Trackbar.Value;
end;

//*****************************************************
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  CameraInit();
end;

//----------------------------------------------------

procedure TForm1.CameraInit;
begin
  Camera1.Position.Vector := Vector3D( 0, 0, 0 );

  Camera1.Position.Vector := Vector3D( 0, -5, -20 );
  Camera1.RotationAngle.Vector := Vector3D( 0,0,0 );

  AngleX_Trackbar.Value := AngleX_Trackbar.Tag;
  AngleZ_Trackbar.Value := AngleZ_Trackbar.Tag;

  PosX_Trackbar.Value := PosX_Trackbar.Tag;
  PosY_Trackbar.Value := PosY_Trackbar.Tag;
  PosZ_Trackbar.Value := PosZ_Trackbar.Tag;
end;

//*****************************************************
procedure TForm1.Switch1Switch(Sender: TObject);
begin
  if Switch1.IsChecked then
     Camera1.Target := Cylinder2
  else
     Camera1.Target := nil;
end;



end.

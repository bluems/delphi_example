unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Types3D,
  System.Math.Vectors, FMX.MaterialSources, FMX.Objects3D, FMX.Ani,
  FMX.Controls3D, FMX.Viewport3D;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
    Light1: TLight;
    FloatAnimation1: TFloatAnimation;
    Cube1: TCube;
    Cylinder1: TCylinder;
    Cone1: TCone;
    Sphere1: TSphere;
    LightMaterialSource1: TLightMaterialSource;
    LightMaterialSource2: TLightMaterialSource;
    LightMaterialSource3: TLightMaterialSource;
    procedure Cylinder1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Single; RayPos, RayDir: TVector3D);
    procedure Cylinder1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
    procedure FormCreate(Sender: TObject);
    procedure Cube1Render(Sender: TObject; Context: TContext3D);
    procedure Sphere1Render(Sender: TObject; Context: TContext3D);
    procedure FloatAnimation1Process(Sender: TObject);
  private
    function GetDeltaMove: TPoint3D;
    procedure SetDeltaMove(const Value: TPoint3D);
    { Private declarations }
  public
    { Public declarations }
    AndroidButton: Boolean;
    MoveStart, MoveEnd: TPoint3D;
    property DeltaMove: TPoint3D read GetDeltaMove write SetDeltaMove;
  end;

var
  Form1: TForm1;

implementation

uses System.Math;

{$R *.fmx}

procedure TForm1.Cube1Render(Sender: TObject; Context: TContext3D);
var
  s: TCube;
  l: Single;
  d, n, m: TPoint3D;
begin
  if not(Sender is TCube) then
    exit;
  if not assigned(TCube(Sender)) then
    exit;
  s := TCube(Sender);
  l := TCube(s.Parent).Width * 0.5 + s.Width * 0.5;
  d := s.RotationCenter.Point - (DeltaMove * s.TagFloat);
  n := d.Normalize * l;
  m := Sphere1.AbsoluteToLocal3D(s.AbsoluteToLocal3D(n));
  if m.Length > (Sphere1.Width * 0.5) then
    s.Position.Point := n
  else
    s.Position.Point := s.RotationCenter.Point * l;
end;

procedure TForm1.Cylinder1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single; RayPos, RayDir: TVector3D);
begin
  if ssLeft in Shift then
    with Cylinder1 do
    begin
      if not AndroidButton then
      begin
        RotationCenter.Point := Position.Point - RayPos.Length *
          (RayDir * point3D(1, 1, 0));
        AndroidButton := True;
        DeltaMove := RayPos.Length * RayDir;
      end;
      Position.Point := RotationCenter.Point + RayPos.Length *
        (RayDir * point3D(1, 1, 0));
      DeltaMove := RayPos.Length * RayDir;
    end;
end;

procedure TForm1.Cylinder1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single; RayPos, RayDir: TVector3D);
begin
  AndroidButton := false;
  DeltaMove := MoveEnd;
end;

procedure TForm1.FloatAnimation1Process(Sender: TObject);
begin
  if AndroidButton then
    DeltaMove := MoveEnd;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  a, b: integer;
  s, C: TCube;
  P: TPoint3D;
  K, G, d: Single;
  m: integer;
begin
  Cylinder1.AutoCapture := True;
  m := 24;
  d := c2pi / m;
  G := cpidiv2;
  for a := 1 to m do
  begin
    P := point3D(cos(G), -1, sin(G)).Normalize;
    G := G + d;
    K := 0;
    C := nil;
    s := TCube(Cube1.Clone(Nil));
    s.OnRender := Cube1Render;
    s.RotationCenter.Point := P.Normalize;
    s.TagFloat := 0;
    Sphere1.AddObject(s);

    C := s;
    s := nil;
    if sin(G) > -0.4 then
    begin
      for b := 1 to 8 do
      begin
        K := K + (1 / 8)*random;
        s := TCube(Cube1.Clone(nil));
        s.OnRender := Cube1Render;
        P := P + point3D(0, P.Length, 0);
        s.RotationCenter.Point := P.Normalize;
        s.TagFloat := K;
        C.AddObject(s);
        C := s;
        s := nil;
      end;
    end;

  end;
end;

function TForm1.GetDeltaMove: TPoint3D;
begin
  result := (MoveStart - MoveEnd) * 10;
end;

procedure TForm1.SetDeltaMove(const Value: TPoint3D);
begin
  MoveEnd := MoveStart;
  MoveStart := Value;
end;

procedure TForm1.Sphere1Render(Sender: TObject; Context: TContext3D);
var
  r: TPoint3D;
begin
  r := Context.CurrentCameraInvMatrix.m[3] - Sphere1.AbsolutePosition;
  r := r.Normalize;
  Sphere1.ResetRotationAngle;
  Sphere1.RotationAngle.Y := (arctan2(r.X, r.Z) + cpi) * c180divpi;
  Sphere1.RotationAngle.X := arcsin(r.Y) * c180divpi;
end;

end.

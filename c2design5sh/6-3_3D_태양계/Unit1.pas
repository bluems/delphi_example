unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls3D, FMX.Objects3D, FMX.Layouts,
  FMX.Viewport3D, FMX.MaterialSources, FMX.StdCtrls, FMX.Ani, System.Math.Vectors, FMX.Types3D;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
    Grid3D1: TGrid3D;
    SunSphere: TSphere;
    Light1: TLight;
    EarthSphere: TSphere;
    FloatAnimation1: TFloatAnimation;
    EDummy: TDummy;
    MDummy: TDummy;
    MoonSphere: TSphere;
    FloatAnimation2: TFloatAnimation;
    VenusSphere: TSphere;
    FloatAnimation3: TFloatAnimation;
    VDummy: TDummy;
    LightMaterialSource2: TLightMaterialSource;
    LightMaterialSource3: TLightMaterialSource;
    LightMaterialSource1: TLightMaterialSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.fmx}


end.

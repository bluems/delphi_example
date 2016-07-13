unit ULight;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.MaterialSources, FMX.Controls3D,
  FMX.Objects3D;

type
  TForm1 = class(TForm3D)
    Cube1: TCube;
    Light1: TLight;
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

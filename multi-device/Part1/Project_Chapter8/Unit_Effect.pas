unit Unit_Effect;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Filter.Effects, FMX.StdCtrls, FMX.Edit;

type
  TForm2 = class(TForm)
    ImageControl1: TImageControl;
    RippleEffect1: TRippleEffect;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ShadowEffect1: TShadowEffect;
    GlowEffect1: TGlowEffect;
    BlurEffect1: TBlurEffect;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}


end.

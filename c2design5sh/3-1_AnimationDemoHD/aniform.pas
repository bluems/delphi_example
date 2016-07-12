
//---------------------------------------------------------------------------

// This software is Copyright (c) 2012 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit aniform;

interface

uses
  System.SysUtils, System.Classes, System.Types, FMX.StdCtrls,
  FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.Controls, FMX.Types, FMX.Ani, FMX.Effects, FMX.Controls.Presentation;

type
  TForm4 = class(TForm)
    Ellipse1: TEllipse;
    FloatAnimation1: TFloatAnimation;
    Rectangle1: TRectangle;
    Text1: TText;
    ColorAnimation1: TColorAnimation;
    Text2: TText;
    Rectangle2: TRectangle;
    Text3: TText;
    FloatAnimation2: TFloatAnimation;
    Image1: TImage;
    BitmapAnimation1: TBitmapAnimation;
    Text4: TText;
    Rectangle3: TRectangle;
    FloatAnimation4: TFloatAnimation;
    Text5: TText;
    AniIndicator1: TAniIndicator;
    Label1: TLabel;
    AniIndicator2: TAniIndicator;
    AniIndicator3: TAniIndicator;
    RoundRect1: TRoundRect;
    PathAnimation1: TPathAnimation;
    Text6: TText;
    Path1: TPath;
    PathText: TText;
    PathAnimation2: TPathAnimation;
    Button1: TButton;
    BottomRectangle: TRectangle;
    BottomText: TText;
    Button2: TButton;
    FloatAnimation3: TFloatAnimation;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
//   BottomText.AnimateFloat( 'Position.X', 0, 10 );
//    BottomText.AnimateFloat( 'Position.X', -BottomText.Width, 10 );
//    BottomText.AnimateFloatDelay( 'Position.X', 0, 10, 3 );

  TAnimator.Create.AnimateFloat( BottomText, 'Position.X', 0, 10 );
end;

end.

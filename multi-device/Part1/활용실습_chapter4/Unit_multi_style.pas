unit Unit_multi_style;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    StyleBookWin: TStyleBook;
    StyleBookMac: TStyleBook;
    StyleBookAndroid: TStyleBook;
    StyleBookiOS: TStyleBook;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF MSWINDOWS} Form1.StyleBook := StyleBookWin; {$ENDIF}
  {$IFDEF MACOS} Form1.StyleBook := StyleBookMac; {$ENDIF}
  {$IFDEF Android} Form1.StyleBook := StyleBookAndroid; {$ENDIF}
  {$IFDEF IOS} Form1.StyleBook := StyleBookiOS; {$ENDIF}

  StyleBookWin.UseStyleManager := true;
  StyleBookMac.UseStyleManager := true;
  StyleBookAndroid.UseStyleManager := true;
  StyleBookios.UseStyleManager := true;

end;

end.

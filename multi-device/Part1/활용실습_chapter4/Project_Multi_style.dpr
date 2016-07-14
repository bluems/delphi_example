program Project_Multi_style;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Unit_multi_style in 'Unit_multi_style.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

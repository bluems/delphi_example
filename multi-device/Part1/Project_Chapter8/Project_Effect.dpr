program Project_Effect;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Unit_Effect in 'Unit_Effect.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

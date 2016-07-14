program Project_hello;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Unit_hello in 'Unit_hello.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

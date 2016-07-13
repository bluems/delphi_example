program TeCamera;

uses
  System.StartUpCopy,
  FMX.Forms,
  MpUnit in 'MpUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

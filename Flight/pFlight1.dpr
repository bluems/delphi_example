program pFlight1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Flight1 in 'Flight1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program pDanger;

uses
  System.StartUpCopy,
  FMX.Forms,
  UDanger in 'UDanger.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

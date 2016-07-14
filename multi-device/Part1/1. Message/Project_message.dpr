program Project_message;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_message in 'Unit_message.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

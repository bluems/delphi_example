program pBasic_UI;

uses
  System.StartUpCopy,
  FMX.Forms,
  Basic_UI in 'Basic_UI.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

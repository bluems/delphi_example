program TSeverManager;

uses
  System.StartUpCopy,
  FMX.Forms,
  TSMUnit in 'TSMUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

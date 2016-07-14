program Project_child;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_child in 'Unit_child.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

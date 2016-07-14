program Project_basic;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit_basic in 'Unit_basic.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.

program Project2.First;

uses
  FMX.Forms,
  Unit_First in 'Unit_First.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

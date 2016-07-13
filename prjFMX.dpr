program prjFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'c2design5sh\7-2_SQLite\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program prjFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  utest1 in 'Layout\utest1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program prjVCL;

uses
  Vcl.Forms,
  untM2Ex1 in 'untM2Ex1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

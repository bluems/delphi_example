program prjVCL;

uses
  Vcl.Forms,
  untM2Ex2 in 'Module2\ex2\untM2Ex2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

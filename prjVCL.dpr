program prjVCL;

uses
  Vcl.Forms,
  untM23Ex1 in 'Module23\ex1\untM23Ex1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

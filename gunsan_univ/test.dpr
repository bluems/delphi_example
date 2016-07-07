program test;

uses
  Vcl.Forms,
  Utest1 in 'Utest1.pas' {Form1},
  utest2 in 'utest2.pas' {Form2},
  Utest4 in 'Utest4.pas',
  Utest3 in 'Utest3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

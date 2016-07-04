program P_TEdit;

uses
  Vcl.Forms,
  U_TEdit in 'U_TEdit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

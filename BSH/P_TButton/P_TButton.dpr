program P_TButton;

uses
  Vcl.Forms,
  U_TButton in 'U_TButton.pas' {frmButtonExample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmButtonExample, frmButtonExample);
  Application.Run;
end.

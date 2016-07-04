program P_TLabel;

uses
  Vcl.Forms,
  U_TLabel in 'U_TLabel.pas' {frmLabelExample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLabelExample, frmLabelExample);
  Application.Run;
end.

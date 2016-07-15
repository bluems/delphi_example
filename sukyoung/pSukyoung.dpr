program pSukyoung;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Mainform},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainform, Mainform);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

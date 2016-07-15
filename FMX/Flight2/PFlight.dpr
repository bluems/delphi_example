program PFlight;

uses
  System.StartUpCopy,
  FMX.Forms,
  FLight2 in 'FLight2.pas' {FlashLight2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFlashLight2, FlashLight2);
  Application.Run;
end.

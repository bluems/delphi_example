program Project_LiveBinding;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  UliveBinding in 'UliveBinding.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

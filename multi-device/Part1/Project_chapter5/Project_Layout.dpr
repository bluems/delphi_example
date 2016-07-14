program Project_Layout;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ULayout_Align in 'ULayout_Align.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

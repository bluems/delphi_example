program pPhoto;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPhoto in 'uPhoto.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

unit PMUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, System.Tether.Manager, System.Tether.AppProfile, Vcl.Imaging.jpeg;
type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    ActionList1: TActionList;
    Image1: TImage;
    PrinterAction: TAction;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure PrinterActionExecute(Sender: TObject);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure TetheringManager1PairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Uses
 Printers, FMX.Objects;


{$R *.dfm}


procedure Print_Out( pImage : Vcl.ExtCtrls.TImage );
begin
 Printer.BeginDoc;
 printer.Canvas.Draw(100,50, pImage.Picture.Graphic);
 Printer.EndDoc;
end;

procedure TForm1.PrinterActionExecute(Sender: TObject);
begin
  Memo1.Lines.Add( '이미지 프린트 출력...');
  Print_Out( Image1 );
end;

procedure TForm1.TetheringManager1PairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add( '테더링 연결됨...');
end;


procedure TForm1.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
var
  fxImage : FMX.Objects.TImage;
  jpic : TJpegImage;
begin
  if  AResource.ResType = TRemoteResourceType.Stream then
  begin
    Memo1.Lines.Add( '이미지 수신...');

    try
      fxImage := FMX.Objects.TImage.Create(nil);
      fxImage.Bitmap.LoadFromStream( AResource.Value.AsStream );
      fxImage.Bitmap.SaveToFile( 'c:\temp\ttt.jpg' );
    finally
      fxImage.Release;
    end;

    try
      jpic := TJpegImage.Create;
      jpic.LoadFromFile( 'c:\temp\ttt.jpg' );
    finally
      Image1.Picture.Bitmap.Assign( jpic );
      FreeAndNil(jpic);
    end;
  end;
end;


end.

unit MpUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Image1: TImage;
    Layout1: TLayout;
    MActionList: TActionList;
    Camera_bt: TButton;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    ConButton: TSpeedButton;
    LogText: TText;
    Send_bt: TButton;
    PrintAction_bt: TButton;
    Label1: TLabel;
    AlbumButton: TButton;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    Image2: TImage;
    procedure TakePhotoFromCameraAction1DidFinishTaking( photoBitmap: TBitmap);
    procedure Camera_btClick(Sender: TObject);
    procedure ConButtonClick(Sender: TObject);
    procedure TetheringManager1EndManagersDiscovery(const Sender: TObject;
      const ARemoteManagers: TTetheringManagerInfoList);
    procedure TetheringManager1EndProfilesDiscovery(const Sender: TObject;
      const ARemoteProfiles: TTetheringProfileInfoList);
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string;
      var Password: string);
    procedure Send_btClick(Sender: TObject);
    procedure PrintAction_btClick(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DocPath : string;
    procedure Send_ServerImage();
  end;

var
  Form1: TForm1;

implementation

uses
  FMX.Platform,FMX.MediaLibrary;

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  DocPath :=  System.IOUtils.TPath.GetSharedPicturesPath() + PathDelim;
end;


procedure TForm1.Image1Click(Sender: TObject);
var
  Service : IFMXPhotoLibrary;    // FMX.Platform,FMX.MediaLibrary;
begin
 // �ٹ��� ��� ���̰� ����.  ~ ī�޶� �Կ��ô� �ʿ� ���� -> NeedSaveToAlbum : TRUE
  if TPlatformServices.Current.SupportsPlatformService(IFMXPhotoLibrary, Service) then
     Service.AddImageToSavedPhotosAlbum( Image1.Bitmap );
end;

procedure TForm1.Camera_btClick(Sender: TObject);
begin
  TakePhotoFromCameraAction1.ExecuteTarget( Sender );   // ��ư Action�� ���� �����ص� ��.
end;

// �׼Ǽ����� MaxWidth / MaxHeight ���� �����ؾ� ���� �ػ� ������.
// NeedSaveToAlbum : TRUE üũ�� �ٹ��� �����.
procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking( photoBitmap: TBitmap);
begin
  Image1.Bitmap.Assign( photoBitmap );

 // Ư����ο� ���� �����Ҷ�..     // Android Permission : Write External storage �߰� �Ǿ�� ��.
{  try
    SetCurrentDir( DocPath );
    CreateDir( 'Delphi' );

    Image1.Bitmap.SaveToFile( DocPath+PathDelim+'Delphi'+PathDelim+ FormatDateTime( 'YYYYMMDD_hhmmss',now ) + 'Delphi.png' );

  finally
    ShowMessage('����Ϸ�');
  end;
}
end;

// �׼Ǽ����� MaxWidth / MaxHeight ���� �����ؾ� ���� �ػ� ������.
procedure TForm1.TakePhotoFromLibraryAction1DidFinishTaking( Image: TBitmap );
begin
  Image1.Bitmap.Assign( Image );
end;

//*********************************************************************************************************
// ����õ� �� ���� ���ÿ� ó��
procedure TForm1.ConButtonClick(Sender: TObject);
var
  i : integer;
begin
  if TetheringManager1.PairedManagers.Count > 0 then // ���� �Ǿ�������  ���� ����
  begin
    for i := TetheringManager1.PairedManagers.Count - 1 downto 0 do
        TetheringManager1.UnPairManager (TetheringManager1.PairedManagers[i].ManagerIdentifier);
  end

  else  // ���� �ȵǾ����� ���� �õ�
  begin
    LogText.Text := '�״��� ���� �Ŵ��� �˻�..';
    TetheringManager1.DiscoverManagers; // �Ŵ��� �˻� ����
//    TetheringManager1.DiscoverManagers( 20000, '112.216.52.122' );
//    TetheringManager1.AutoConnect( 20000, '192.168.168.104' );

  end;
end;


//**********************************************************************************************************************
// �Ŵ��� �˻���
procedure TForm1.TetheringManager1EndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
var
  rManagerInfo: TTetheringManagerInfo;
begin
  LogText.Text := '�Ŵ��� �˻���. �������� ����õ�..';
  for rManagerInfo in ARemoteManagers do
  begin
    LogText.Text := rManagerInfo.ConnectionString;
    LogText.TagString := LogText.Text;
    if rManagerInfo.ManagerText = 'TSManager' then
       TetheringManager1.PairManager( rManagerInfo );    // �������� �˻� �õ�
   end;
end;


// �������� �˻���.
procedure TForm1.TetheringManager1EndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
var
  rProfile: TTetheringProfileInfo;
begin
  for rProfile in ARemoteProfiles do
  begin
    if rProfile.ProfileText = 'TSProfile' then
    begin
//    if TetheringAppProfile1.Connect( TetheringManager1.RemoteProfiles[0] ) then // Ư���������ϰ� ����
      if TetheringAppProfile1.Connect( rProfile ) then  // ��� �������ϰ� ����
      begin
        LogText.Text :=  LogText.TagString + ' �� �����.';
      end;
    end;
  end;
end;


procedure TForm1.TetheringManager1RequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  Password := '1234';
end;


// ������ �̹��� ����
procedure TForm1.Send_ServerImage();
var
  mStream: TMemoryStream;
  i : integer;
begin
  mStream := TMemoryStream.Create;
  try
    Image1.Bitmap.SaveToStream( mStream );

    // ����� ��� �������Ͽ� ����
    for i := 0 to TetheringManager1.PairedManagers.Count - 1 do
        TetheringAppProfile1.SendStream( TetheringManager1.RemoteProfiles[i], 'CCC', mStream);

  finally
    mStream.Free;
  end;
end;


procedure TForm1.Send_btClick(Sender: TObject);
begin
  Send_ServerImage();
end;


procedure TForm1.PrintAction_btClick(Sender: TObject);
begin
  TetheringAppProfile1.RunRemoteAction( TetheringManager1.RemoteProfiles.First, 'PrinterAction' );
end;

end.

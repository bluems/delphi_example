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
 // 앨범에 즉시 보이게 저장.  ~ 카메라 촬영시는 필요 없음 -> NeedSaveToAlbum : TRUE
  if TPlatformServices.Current.SupportsPlatformService(IFMXPhotoLibrary, Service) then
     Service.AddImageToSavedPhotosAlbum( Image1.Bitmap );
end;

procedure TForm1.Camera_btClick(Sender: TObject);
begin
  TakePhotoFromCameraAction1.ExecuteTarget( Sender );   // 버튼 Action에 직접 연결해도 됨.
end;

// 액션설정의 MaxWidth / MaxHeight 값을 변경해야 사진 해상도 높아짐.
// NeedSaveToAlbum : TRUE 체크시 앨범에 저장됨.
procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking( photoBitmap: TBitmap);
begin
  Image1.Bitmap.Assign( photoBitmap );

 // 특정경로에 수동 저장할때..     // Android Permission : Write External storage 추가 되어야 됨.
{  try
    SetCurrentDir( DocPath );
    CreateDir( 'Delphi' );

    Image1.Bitmap.SaveToFile( DocPath+PathDelim+'Delphi'+PathDelim+ FormatDateTime( 'YYYYMMDD_hhmmss',now ) + 'Delphi.png' );

  finally
    ShowMessage('저장완료');
  end;
}
end;

// 액션설정의 MaxWidth / MaxHeight 값을 변경해야 사진 해상도 높아짐.
procedure TForm1.TakePhotoFromLibraryAction1DidFinishTaking( Image: TBitmap );
begin
  Image1.Bitmap.Assign( Image );
end;

//*********************************************************************************************************
// 연결시도 및 종료 동시에 처리
procedure TForm1.ConButtonClick(Sender: TObject);
var
  i : integer;
begin
  if TetheringManager1.PairedManagers.Count > 0 then // 연결 되었을때는  연결 종료
  begin
    for i := TetheringManager1.PairedManagers.Count - 1 downto 0 do
        TetheringManager1.UnPairManager (TetheringManager1.PairedManagers[i].ManagerIdentifier);
  end

  else  // 연결 안되었을때 연결 시도
  begin
    LogText.Text := '테더링 서버 매니저 검색..';
    TetheringManager1.DiscoverManagers; // 매니저 검색 시작
//    TetheringManager1.DiscoverManagers( 20000, '112.216.52.122' );
//    TetheringManager1.AutoConnect( 20000, '192.168.168.104' );

  end;
end;


//**********************************************************************************************************************
// 매니저 검색됨
procedure TForm1.TetheringManager1EndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
var
  rManagerInfo: TTetheringManagerInfo;
begin
  LogText.Text := '매니저 검색됨. 프로파일 연결시도..';
  for rManagerInfo in ARemoteManagers do
  begin
    LogText.Text := rManagerInfo.ConnectionString;
    LogText.TagString := LogText.Text;
    if rManagerInfo.ManagerText = 'TSManager' then
       TetheringManager1.PairManager( rManagerInfo );    // 프로파일 검색 시도
   end;
end;


// 프로파일 검색됨.
procedure TForm1.TetheringManager1EndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
var
  rProfile: TTetheringProfileInfo;
begin
  for rProfile in ARemoteProfiles do
  begin
    if rProfile.ProfileText = 'TSProfile' then
    begin
//    if TetheringAppProfile1.Connect( TetheringManager1.RemoteProfiles[0] ) then // 특정프로파일과 연결
      if TetheringAppProfile1.Connect( rProfile ) then  // 모든 프로파일과 연결
      begin
        LogText.Text :=  LogText.TagString + ' 와 연결됨.';
      end;
    end;
  end;
end;


procedure TForm1.TetheringManager1RequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  Password := '1234';
end;


// 서버에 이미지 전송
procedure TForm1.Send_ServerImage();
var
  mStream: TMemoryStream;
  i : integer;
begin
  mStream := TMemoryStream.Create;
  try
    Image1.Bitmap.SaveToStream( mStream );

    // 연결된 모든 프로파일에 전송
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

unit TSMUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, FMX.Layouts, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Edit, System.Actions, FMX.ActnList, FMX.TabControl, FMX.Ani, System.Rtti, FMX.ScrollBox;

type
  TMainForm = class(TForm)
    TopRectangle: TRectangle;
    Text1: TText;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    ReceiveImage: TImage;
    LogMemo: TMemo;
    SendEdit: TEdit;
    SendTextButton: TButton;
    ActionList1: TActionList;
    ServerAction1: TAction;
    MTabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem3: TTabItem;
    Splitter2: TSplitter;
    SendImage: TImage;
    SendImageButton: TButton;
    OpenDialog1: TOpenDialog;
    FileOpenButto: TButton;
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure SendTextButtonClick(Sender: TObject);
    procedure ServerAction1Execute(Sender: TObject);
    procedure TetheringManager1PairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringManager1RemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
    procedure SendImageButtonClick(Sender: TObject);
    procedure FileOpenButtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Log_Show( sLogMes : string );
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

// Client 연결됨 ****************************************************************************************************
procedure TMainForm.TetheringManager1PairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Log_Show( AManagerInfo.ManagerText + ' 연결됨 : ' + AManagerInfo.ManagerIdentifier  );
end;

procedure TMainForm.TetheringManager1RemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  Log_Show( '연결 해제됨 : ' + AManagerIdentifier  );
end;

// Client로 부터 데이터 수신 ************************************************************************************
procedure TMainForm.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
begin
  case AResource.ResType of

  TRemoteResourceType.Data:
    begin
      Log_Show('문자 데이터를 수신합니다.');
      if AResource.Hint = 'CLIENT_STRING' then       // AResource.Hint는 보내는쪽 SendStream 이나 SendString의 두번째 파라미터(Description)
         Log_Show( AResource.Value.AsString )
    end;

  TRemoteResourceType.Stream:
    begin
      Log_Show( AResource.Hint + '의 스트리밍 데이터를 수신합니다.');
      ReceiveImage.Bitmap.LoadFromStream( AResource.Value.AsStream );
    end;
  end;
end;

//**************************************************************
// Client 에서 호출되는 서버 액센 정의  : 서버 TetheringAppProfile1에 액션이 등록 되어 있어야 함.
procedure TMainForm.ServerAction1Execute(Sender: TObject);
begin
  Log_Show('클라이언트가 호출한 서버 액션' );
  TAnimator.Create.AnimateFloat( ReceiveImage, 'RotationAngle', ReceiveImage.RotationAngle + 360, 0.5 );
end;

// Client에게 텍스트 전송 **************************************************
procedure TMainForm.SendTextButtonClick(Sender: TObject);
var
  i : integer;
begin
  // 연결된 모든 Client 에게 전부 보냄.
  for i := 0 to TetheringAppProfile1.ConnectedProfiles.Count - 1 do
  begin
    if TetheringAppProfile1.ConnectedProfiles[i].ProfileText = 'MobileSignPadProfile' then
       TetheringAppProfile1.SendString( TetheringAppProfile1.ConnectedProfiles[i], 'SERVER_STRING', SendEdit.Text);
  end;
end;

// Client에게 이미지 전송 **************************************************
procedure TMainForm.SendImageButtonClick(Sender: TObject);
var
  mStream: TMemoryStream;
  i : integer;
begin
  mStream := TMemoryStream.Create;
  try
    SendImage.Bitmap.SaveToStream( mStream );

    // 연결된 모든 프로파일에 전송
    for i := 0 to TetheringAppProfile1.ConnectedProfiles.Count - 1 do
    begin
      if TetheringAppProfile1.ConnectedProfiles[i].ProfileText = 'MobileSignPadProfile' then
         TetheringAppProfile1.SendStream( TetheringAppProfile1.ConnectedProfiles[i], 'SERVER_IMAGE', mStream);  // 두번째 파라미터(Description)는 받는쪽의 AResource.Hint에 할당됨.
    end;

  finally
    mStream.Free;
  end;
end;

//----------------------------------------------------
procedure TMainForm.FileOpenButtoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
     SendImage.Bitmap.LoadFromFile( OpenDialog1.FileName )
end;


//----------------------------------------------------
procedure TMainForm.Log_Show( sLogMes : string );
begin
  LogMemo.Lines.Add( FormatDateTime( '[hh:mm:ss]   ', now ) +  sLogMes );
  LogMemo.ScrollBy( 0, -9999999);
end;





end.

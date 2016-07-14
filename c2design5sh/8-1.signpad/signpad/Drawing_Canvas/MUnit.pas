// �׸���� ���� �����ҽ�
// http://stackoverflow.com/questions/10291330/firemonkey-penmode-equivalent-drawline/10325437#10325437

// ������� ����� ~ �ȵ���̵�� �۹̼� 2�� �߰�.

unit MUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.StdCtrls, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.Edit,
  FMX.TabControl, FMX.Ani;

type
  TForm1 = class(TForm)
    SPadImage: TImage;
    TetheringAppProfile1: TTetheringAppProfile;
    TetheringManager1: TTetheringManager;
    BaseRectangle: TRectangle;
    LogText: TText;
    TBLayout: TLayout;
    TopRectangle: TRectangle;
    BottRectangle: TRectangle;
    Connect_bt: TSpeedButton;
    Send_bt: TSpeedButton;
    Clear_bt: TSpeedButton;
    SendText_bt: TSpeedButton;
    ActionCall_bt: TSpeedButton;
    SEdit: TEdit;
    SaveImage_bt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SPadImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure SPadImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure SPadImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure TetheringManager1EndManagersDiscovery(const Sender: TObject;
      const ARemoteManagers: TTetheringManagerInfoList);
    procedure TetheringManager1EndProfilesDiscovery(const Sender: TObject;
      const ARemoteProfiles: TTetheringProfileInfoList);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure TetheringManager1RemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
    procedure TetheringAppProfile1Disconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
    procedure FormResize(Sender: TObject);
    procedure Connect_btClick(Sender: TObject);
    procedure Send_btClick(Sender: TObject);
    procedure Clear_btClick(Sender: TObject);
    procedure SendText_btClick(Sender: TObject);
    procedure ActionCall_btClick(Sender: TObject);
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string;
      var Password: string);
    procedure SaveImage_btClick(Sender: TObject);
  private
    { Private declarations }
    PFrom, PTo: TPointF;
    ResPath, DocPath, TmpPath : string;
    procedure Init_SImages();
  public
    { Public declarations }
    UserName : string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

//*****************************************************************************
procedure TForm1.FormResize(Sender: TObject);
begin
  // SPadImage ������ �ܸ��� ������� �����ϰ� ���� ��Ŵ
  SPadImage.Width := 340;
  SPadImage.Height := 440;
  SPadImage.Align := TAlignLayout.Center;
end;


//*****************************************************************************
procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF IOS}
  ResPath := GetHomePath() + PathDelim + 'Library' + PathDelim;       //  StartUp\Library
  DocPath := System.IOUtils.TPath.GetDocumentsPath() + PathDelim;     //  StartUp\Documents       : ini, db
  TmpPath := GetHomePath() + PathDelim + 'Library' + PathDelim + 'Caches' + PathDelim;  //  StartUp\Library\Caches
  {$ELSE}
     {$IFDEF ANDROID}
       ResPath := GetHomePath() + PathDelim;                       // .\assets\internal
//     DocPath := System.IOUtils.TPath.GetSharedCameraPath() + PathDelim + 'Camera' + PathDelim;
       DocPath := System.IOUtils.TPath.GetSharedPicturesPath() + PathDelim;
       TmpPath := ResPath;
     {$ELSE}
       ResPath := ExtractFilePath(ParamStr(0));
       DocPath := ResPath;
       TmpPath := ResPath;
     {$ENDIF}
  {$ENDIF}

  Init_SImages();
  UserName := 'User1';
end;

{$REGION '�״�������'}

//*********************************************************************************************************
// ����õ� �� ���� ���ÿ� ó��
procedure TForm1.Connect_btClick(Sender: TObject);
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


// ���� ������
procedure TForm1.TetheringManager1RemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  LogText.Text := '�״��� �Ŵ����� ������';
end;

procedure TForm1.TetheringManager1RequestManagerPassword(const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  Password := '1234';
end;

procedure TForm1.TetheringAppProfile1Disconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
begin
  LogText.Text := '�״��� �������ϰ� ������';
end;


//-------------------------------------------------------
// ������ �����޽��� ����
procedure TForm1.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
begin
  case AResource.ResType of

  TRemoteResourceType.Data :
    begin
      if AResource.Hint = 'SERVER_STRING' then
         LogText.Text := AResource.Value.AsString;
    end;

  TRemoteResourceType.Stream:
    begin
      if AResource.Hint = 'SERVER_IMAGE' then
         SPadImage.Bitmap.LoadFromStream( AResource.Value.AsStream );
    end;
  end;
end;

//-------------------------------------------------------------
// ������ �̹��� ����
procedure TForm1.Send_btClick(Sender: TObject);
var
  mStream: TMemoryStream;
  i : integer;
begin
  mStream := TMemoryStream.Create;
  try
    SPadImage.Bitmap.SaveToStream( mStream );

    //  TetheringAppProfile1.SendStream( TetheringManager1.RemoteProfiles.First, UserName, Stream);  // ù��° �ϳ��� ����

    // ����� ��� �������Ͽ� ����
    for i := 0 to TetheringManager1.PairedManagers.Count - 1 do
        TetheringAppProfile1.SendStream( TetheringManager1.RemoteProfiles[i], UserName, mStream);  // �ι�° �Ķ����(Description)�� �޴����� AResource.Hint�� �Ҵ��.

  finally
    mStream.Free;
  end;
end;


//-------------------------------------------------------------------------------------------------------------
// ������ �ؽ�Ʈ ���� ����
procedure TForm1.SendText_btClick(Sender: TObject);
begin
  TetheringAppProfile1.SendString(TetheringManager1.RemoteProfiles.First, 'CLIENT_STRING', SEdit.Text );
end;

// ������ �׼� ȣ�� ���� : ���� TetheringAppProfile1�� �׼��� ��� �Ǿ� �־�� ��.
procedure TForm1.ActionCall_btClick(Sender: TObject);
begin
  TetheringAppProfile1.RunRemoteAction( TetheringManager1.RemoteProfiles.First, 'ServerAction1' );
end;


{$ENDREGION}

//********************************************************************************************************
procedure TForm1.SPadImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  pointRect : TRectF;
begin
  if Button = TMouseButton.mbLeft then
  begin
    PFrom := PointF(X, Y);
  end;
end;

procedure TForm1.SPadImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  if ((PFrom.X <> -1) and (PFrom.X <> -1)) then
  with SPadImage.Bitmap.Canvas do
  begin
    BeginScene;
    if ssLeft in Shift then
    begin
      PTo := PointF(X, Y);
      if (pFrom<>pTo) then
      begin
        Stroke.Color := $FF0000FF;
        Stroke.Thickness := 3;
        Stroke.Kind := TBrushKind.Solid;
        DrawLine( pFrom, pTo, 255 );
        pFrom := pTo;
      end;
    end;
    EndScene;
  end;
end;

procedure TForm1.SPadImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  pFrom := PointF(-1, -1);
  pTo := PointF(-1, -1);

//  Send_btClick( Sender );  // �̹��� �ǽð� ���۽ÿ�..
end;

//---------------------------------------------------------------------------------------
procedure TForm1.Init_SImages();
begin
  SPadImage.Bitmap.Assign( nil );
  SPadImage.MultiResBitmap.Items[0].Bitmap.Width  := Round( SPadImage.Width );   // sets the size of the TBitmap
  SPadImage.MultiResBitmap.Items[0].Bitmap.Height := Round( SPadImage.Height );
  SPadImage.Bitmap.Canvas.BeginScene;  // �ȵ���̵� �� ��ũ�� ��������.
  SPadImage.Bitmap.Canvas.EndScene;

  pFrom := PointF(-1, -1);
  pTo := PointF(-1, -1);
end;


//*********************************************************************************************************
procedure TForm1.Clear_btClick(Sender: TObject);
begin
  Init_SImages();

  //  Image2.Bitmap.Assign( SPadImage.Bitmap );           // �ٸ��̹����� �Ҵ�
end;

//*********************************************************************************************************
// Android Permission : Write External storage �߰� �Ǿ�� ��.
procedure TForm1.SaveImage_btClick(Sender: TObject);
begin
  try
    SetCurrentDir( DocPath );
    CreateDir( 'Delphi' );

    SPadImage.Bitmap.SaveToFile( DocPath+PathDelim+'Delphi'+PathDelim+ FormatDateTime( 'YYYYMMDD_hhmmss',now ) + 'Delphi.png' );

  finally
    ShowMessage('����Ϸ�');
  end;
end;

end.

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

// Client ����� ****************************************************************************************************
procedure TMainForm.TetheringManager1PairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Log_Show( AManagerInfo.ManagerText + ' ����� : ' + AManagerInfo.ManagerIdentifier  );
end;

procedure TMainForm.TetheringManager1RemoteManagerShutdown(const Sender: TObject; const AManagerIdentifier: string);
begin
  Log_Show( '���� ������ : ' + AManagerIdentifier  );
end;

// Client�� ���� ������ ���� ************************************************************************************
procedure TMainForm.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
begin
  case AResource.ResType of

  TRemoteResourceType.Data:
    begin
      Log_Show('���� �����͸� �����մϴ�.');
      if AResource.Hint = 'CLIENT_STRING' then       // AResource.Hint�� �������� SendStream �̳� SendString�� �ι�° �Ķ����(Description)
         Log_Show( AResource.Value.AsString )
    end;

  TRemoteResourceType.Stream:
    begin
      Log_Show( AResource.Hint + '�� ��Ʈ���� �����͸� �����մϴ�.');
      ReceiveImage.Bitmap.LoadFromStream( AResource.Value.AsStream );
    end;
  end;
end;

//**************************************************************
// Client ���� ȣ��Ǵ� ���� �׼� ����  : ���� TetheringAppProfile1�� �׼��� ��� �Ǿ� �־�� ��.
procedure TMainForm.ServerAction1Execute(Sender: TObject);
begin
  Log_Show('Ŭ���̾�Ʈ�� ȣ���� ���� �׼�' );
  TAnimator.Create.AnimateFloat( ReceiveImage, 'RotationAngle', ReceiveImage.RotationAngle + 360, 0.5 );
end;

// Client���� �ؽ�Ʈ ���� **************************************************
procedure TMainForm.SendTextButtonClick(Sender: TObject);
var
  i : integer;
begin
  // ����� ��� Client ���� ���� ����.
  for i := 0 to TetheringAppProfile1.ConnectedProfiles.Count - 1 do
  begin
    if TetheringAppProfile1.ConnectedProfiles[i].ProfileText = 'MobileSignPadProfile' then
       TetheringAppProfile1.SendString( TetheringAppProfile1.ConnectedProfiles[i], 'SERVER_STRING', SendEdit.Text);
  end;
end;

// Client���� �̹��� ���� **************************************************
procedure TMainForm.SendImageButtonClick(Sender: TObject);
var
  mStream: TMemoryStream;
  i : integer;
begin
  mStream := TMemoryStream.Create;
  try
    SendImage.Bitmap.SaveToStream( mStream );

    // ����� ��� �������Ͽ� ����
    for i := 0 to TetheringAppProfile1.ConnectedProfiles.Count - 1 do
    begin
      if TetheringAppProfile1.ConnectedProfiles[i].ProfileText = 'MobileSignPadProfile' then
         TetheringAppProfile1.SendStream( TetheringAppProfile1.ConnectedProfiles[i], 'SERVER_IMAGE', mStream);  // �ι�° �Ķ����(Description)�� �޴����� AResource.Hint�� �Ҵ��.
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

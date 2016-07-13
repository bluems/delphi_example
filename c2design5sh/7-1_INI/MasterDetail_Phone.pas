unit MasterDetail_Phone;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Graphics, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Objects, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.MobilePreview, System.IniFiles, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation;

type
  TPhoneMasterDetail = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    MasterToolbar: TToolBar;
    MasterLabel: TLabel;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    lblName: TLabel;
    imgContact: TImage;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    lblTitle: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    BackButton: TSpeedButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ListView1: TListView;
    LinkListControlToField2: TLinkListControlToField;
    Timer1: TTimer;
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FilePath : string;
    function  ReadINI_Setup( var endTime : string) : integer;
    procedure  WriteINI_Setup();
  end;

var
  PhoneMasterDetail: TPhoneMasterDetail;

implementation


{$R *.fmx}

procedure TPhoneMasterDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteINI_Setup();
end;

procedure TPhoneMasterDetail.FormCreate(Sender: TObject);
var
  strTime : string;
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  BackButton.Visible := False;
{$ENDIF}

  //-------------------------------------------
  {$IFDEF IOS}
  FilePath := System.IOUtils.TPath.GetDocumentsPath() + PathDelim;  //  StartUp\Documents  <- GetHomePath() 안먹음
  {$ELSE}
  FilePath := GetHomePath() + PathDelim;                            // .\assets\internal
  {$ENDIF}

  Timer1.Enabled := TRUE;
end;

// 라이브바인딩 ListView 적용 시차 반영
procedure TPhoneMasterDetail.Timer1Timer(Sender: TObject);
var
  strTime : string;
begin
  Timer1.Enabled := FALSE;
  ListView1.ItemIndex := ReadINI_Setup( strTime);
  MasterLabel.Text := '지난종료시간:' + strTime;
end;


procedure TPhoneMasterDetail.FormKeyUp(Sender: TObject; var Key: Word;  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if TabControl1.ActiveTab = TabItem2 then
    begin
      ChangeTabAction1.Tab := TabItem1;
      ChangeTabAction1.ExecuteTarget(Self);
      Key := 0;
    end;
  end;
end;

procedure TPhoneMasterDetail.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
{ This triggers the slide animation }
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(Self);
  ChangeTabAction1.Tab := TabItem1;
end;



//------------------------------------------------------
function TPhoneMasterDetail.ReadINI_Setup( var endTime : string) : integer;
var
  frINI : TIniFile;      // System.IniFiles
begin
  frINI := TIniFile.Create( FilePath + 'TestConfig.ini'  );
  result  := frINI.ReadInteger( 'Config' , 'LineNo', 0 );
  endTime := frINI.ReadString( 'Config' , 'EndTime', '00:00' );
  frINI.Free;
end;


procedure  TPhoneMasterDetail.WriteINI_Setup();
var
  frINI : TIniFile;      // System.IniFiles
begin
  frINI := TIniFile.Create( FilePath + 'TestConfig.ini'  );
  frINI.WriteInteger( 'Config' , 'LineNo', ListView1.ItemIndex );
  frINI.WriteString ( 'Config', 'EndTime', FormatDateTime( 'hh:mm:ss', now ) );
  frINI.Free;
end;



end.

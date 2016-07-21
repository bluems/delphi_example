unit MasterDetail_Phone;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  FMX.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Graphics, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Objects, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.ListView.Types, FMX.ListView, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation,
  FMX.MediaLibrary.Actions, FMX.StdActns, Data.Bind.DBScope, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr;

type
  TPhoneMasterDetail = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    MasterToolbar: TToolBar;
    MasterLabel: TLabel;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    imgContact: TImage;
    BackButton: TSpeedButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ListView1: TListView;
    ListBox1: TListBox;
    btnAdd: TButton;
    btnSave: TButton;
    edtName: TEdit;
    edtDept: TEdit;
    ListBoxItem1: TListBoxItem;
    edtAge: TEdit;
    ListBoxItem2: TListBoxItem;
    edtEmail: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure Button3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure SaveData(AImage, AThumbnail: TStream);
    procedure DeleteData;
  end;

var
  PhoneMasterDetail: TPhoneMasterDetail;

implementation

{$R *.fmx}

uses Unit4;

//uses EmployeeDM;

procedure TPhoneMasterDetail.BackButtonClick(Sender: TObject);
begin
  //datamodule1.CancelData;
  if clientdataset1.UpdateStatus = tupdatestatus.usInserted then
    clientdataset1.Cancel;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(self);
end;

procedure TPhoneMasterDetail.btnAddClick(Sender: TObject);
begin
  clientdataset1.Append;
  //clientdataset1.Insert;

  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(self);
end;

procedure TPhoneMasterDetail.btnSaveClick(Sender: TObject);
var
  Thumbnail: TBitmap;
  ImgStream, ThumbStream: TMemoryStream;
begin
  ImgStream := TMemoryStream.Create;
  ThumbStream := TMemoryStream.Create;
  try
    imgContact.Bitmap.SaveToStream(ImgStream);
    Thumbnail := imgContact.Bitmap.CreateThumbnail(100, 100);
    Thumbnail.SaveToStream(ThumbStream);
    SaveData(ImgStream, ThumbStream);

    ChangeTabAction1.Tab := TabItem1;
    ChangeTabAction1.ExecuteTarget(self);
  finally
    ImgStream.Free;
    ThumbStream.Free;
  end;
end;

procedure TPhoneMasterDetail.Button3Click(Sender: TObject);
begin
  imgContact.Bitmap.Clear(TAlphaColorRec.Null);
end;

procedure TPhoneMasterDetail.Button4Click(Sender: TObject);
begin
  DeleteData;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(self);
end;

procedure TPhoneMasterDetail.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  BackButton.Visible := False;
{$ENDIF}
end;

procedure TPhoneMasterDetail.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if TabControl1.ActiveTab = TabItem2 then
    begin
      ChangeTabAction1.Tab := TabItem1;
      ChangeTabAction1.ExecuteTarget(self);
      Key := 0;
    end;
  end;
end;

procedure TPhoneMasterDetail.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  { This triggers the slide animation }
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(self);
  ChangeTabAction1.Tab := TabItem1;
end;

procedure TPhoneMasterDetail.SaveData(AImage, AThumbnail: TStream);
begin
  if clientdataset1.UpdateStatus = TUpdateStatus.usUnmodified then
    clientdataset1.Edit;

  if clientdataset1.UpdateStatus = Tupdatestatus.usInserted then
    clientdataset1.Insert;
    //clientdataset1.FieldByName('emp_no').AsInteger :=0;

  clientdataset1.FieldByName('emp_age').AsInteger:=strtoint(edtAge.Text);
  clientdataset1.FieldByName('emp_email').AsString:=edtemail.Text;
  (clientdataset1.FieldByName('emp_image') as TBlobfield).LoadFromStream(AImage);
  (clientdataset1.FieldByName('emp_thumb') as TBlobfield).LoadFromStream(AThumbnail);

  clientdataset1.Post;

  clientdataset1.ApplyUpdates(-1);

  clientdataset1.Refresh;
end;

procedure TPhoneMasterDetail.DeleteData;
begin
  if clientdataset1.UpdateStatus = TUpdatestatus.usInserted then
  begin
    clientdataset1.Cancel;
  end
  else if clientdataset1.UpdateStatus = Tupdatestatus.usUnmodified then
  begin
    clientdataset1.Delete;
    clientdataset1.post;
    clientdataset1.ApplyUpdates(-1);

    clientdataset1.Refresh;
  end;
end;

procedure TPhoneMasterDetail.TakePhotoFromCameraAction1DidFinishTaking
  (Image: TBitmap);
begin
  imgContact.Bitmap.Assign(Image);
end;

procedure TPhoneMasterDetail.TakePhotoFromLibraryAction1DidFinishTaking
  (Image: TBitmap);
begin
  imgContact.Bitmap.Assign(Image);
end;

end.

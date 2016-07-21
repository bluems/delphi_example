unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, System.Rtti, FMX.Grid.Style, FMX.Objects, FMX.Edit,
  FMX.ScrollBox, FMX.Grid, FMX.TabControl, FMX.StdCtrls, FMX.Ani,
  System.Actions, FMX.ActnList, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FMX.Controls.Presentation, FMX.Layouts;

type
  TMainform = class(TForm)
    Layout_Main: TLayout;
    RoundRect1: TRoundRect;
    TabControl1: TTabControl;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ChangeTabAction1: TChangeTabAction;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Btn_home: TButton;
    Btn_previous_tab: TButton;
    Label_Title: TLabel;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    Label_roundrect: TLabel;
    TabItem_Main: TTabItem;
    TabItem_classify_01: TTabItem;
    TabItem_5su_01: TTabItem;
    TabItem_therapy_01: TTabItem;
    TabItem_therapy_02: TTabItem;
    TabItem_therapy_03: TTabItem;
    TabItem_Image: TTabItem;
    Layout_Buttons: TLayout;
    Layout_Title: TLayout;
    btn_5su: TButton;
    btn_classify: TButton;
    btn_mind: TButton;
    btn_therapy_menu: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_class_left: TButton;
    btn_class_right: TButton;
    btn_class_qna: TButton;
    btn_lung: TButton;
    btn_heart: TButton;
    btn_nasal: TButton;
    btn_L_intestine: TButton;
    btn_S_intestine: TButton;
    btn_phlegm: TButton;
    btn_simpo: TButton;
    btn_liver: TButton;
    btn_nerve: TButton;
    btn_samcho: TButton;
    btn_stomach: TButton;
    btn_bladder: TButton;
    btn_recipe_by_illness: TButton;
    btn_therapy_qna: TButton;
    btn_recipe_by_part: TButton;
    Layout7: TLayout;
    StringGrid1: TStringGrid;
    Edit_therapy: TEdit;
    btn_therapy_search: TButton;
    btn_part_internal: TButton;
    btn_part_eye: TButton;
    btn_part_bone: TButton;
    btn_part_urology: TButton;
    btn_part_nose: TButton;
    btn_part_tooth: TButton;
    btn_part_obgyn: TButton;
    btn_part_mental: TButton;
    btn_part_skin: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FloatAnimation3Finish(Sender: TObject);
    procedure FloatAnimation4Finish(Sender: TObject);
    procedure btn_lungClick(Sender: TObject);
    procedure btn_class_qnaClick(Sender: TObject);
    procedure btn_5suClick(Sender: TObject);
    procedure btn_classifyClick(Sender: TObject);
    procedure btn_therapy_menuClick(Sender: TObject);
    procedure btn_recipe_by_illnessClick(Sender: TObject);
    procedure btn_mindClick(Sender: TObject);
    procedure btn_recipe_by_partClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Animation_Start;
    procedure Animation_InvStart;
  end;

var
  Mainform: TMainform;

implementation

{$R *.fmx}

uses
  uDM, Androidapi.Helpers, Androidapi.JNI.App;

var
  Tab_Item: TTabItem;
  BackButtonState: integer;

procedure TMainform.Animation_InvStart;
begin
  if not FloatAnimation1.Inverse then
  begin
    FloatAnimation1.Inverse := True;
    FloatAnimation1.Start;
    FloatAnimation2.StartValue := ToolBar1.Position.Y;
    FloatAnimation2.StopValue := ToolBar1.Position.Y - 49;
    FloatAnimation2.Start;
  end;
end;

procedure TMainform.Animation_Start;
begin
  if not FloatAnimation1.Inverse then
  begin
    FloatAnimation1.Inverse := False;
    FloatAnimation1.Start;
    FloatAnimation2.StartValue := -49;
    FloatAnimation2.StopValue := 0;
    FloatAnimation2.Start;
  end;
end;

procedure TMainform.btn_5suClick(Sender: TObject);
begin
  Label_Title.Text := '오수혈 위치 상세 설명';
  Animation_Start;
  ChangeTabAction1.Tab := TabItem_5su_01;
  ChangeTabAction1.ExecuteTarget(btn_5su);
end;

procedure TMainform.btn_classifyClick(Sender: TObject);
begin
  Label_Title := '사상인 판별';
  Animation_Start;
  Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Mind.jpg');
  ChangeTabAction1.Tab := TabItem_Image;
  ChangeTabAction1.ExecuteTarget(btn_mind);
  TabItem_Image.Tag := 1;
end;

procedure TMainform.btn_class_qnaClick(Sender: TObject);
begin
  showmessage('Lite ㄴㄴ염');
end;

procedure TMainform.btn_lungClick(Sender: TObject);
begin

  case (Sender as TButton).Tag of
    - 2 .. -1:
      begin
        if (Sender as TButton).Tag = -1 then
          Label_Title.Text := '사상인 판별 - 좌수'
        else
          Label_Title.Text := '사상인 판별 - 우수';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Sasang_Left.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(nil);
        TabItem_Image.Tag := 2;
      end;

    1:
      begin
        Label_Title.Text := '폐경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Lung.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_lung);
        TabItem_Image.Tag := 3;
      end;

    2:
      begin
        Label_Title.Text := '심포경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Simpo.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_simpo);
        TabItem_Image.Tag := 3;
      end;

    3:
      begin
        Label_Title.Text := '심장경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Heart.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_heart);
        TabItem_Image.Tag := 3;
      end;

    4:
      begin
        Label_Title.Text := '간경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Liver.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_liver);
        TabItem_Image.Tag := 3;
      end;

    5:
      begin
        Label_Title.Text := '비경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Nasal.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_simpo);
        TabItem_Image.Tag := 3;
      end;

    6:
      begin
        Label_Title.Text := '신경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Nerve.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_nerve);
        TabItem_Image.Tag := 3;
      end;

    7:
      begin
        Label_Title.Text := '대장경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'L_Intestine.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_L_intestine);
        TabItem_Image.Tag := 3;
      end;

    8:
      begin
        Label_Title.Text := '삼초경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Samcho.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_samcho);
        TabItem_Image.Tag := 3;
      end;

    9:
      begin
        Label_Title.Text := '소장경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'S_Intestine.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_S_intestine);
        TabItem_Image.Tag := 3;
      end;

    10:
      begin
        Label_Title.Text := '위경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'S_Intestine.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_S_intestine);
        TabItem_Image.Tag := 3;
      end;

    11:
      begin
        Label_Title.Text := '담경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Phlegm.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_phlegm);
        TabItem_Image.Tag := 3;
      end;

    12:
      begin
        Label_Title.Text := '방광경락';
        Image1.Bitmap.LoadFromFile(GetHomePath + PathDelim + 'Bladder.jpg');
        ChangeTabAction1.Tab := TabItem_Image;
        ChangeTabAction1.ExecuteTarget(btn_bladder);
        TabItem_Image.Tag := 3;
      end;
  end;
end;

procedure TMainform.btn_mindClick(Sender: TObject);
begin
  label_title.Text:='수경침 봉사자의 정신';
  animation_start;
  image1.Bitmap.LoadFromFile(gethomepath+pathdelim+'mind.jpg');
  changetabaction1.Tab:=tabitem_image;
  changetabaction1.ExecuteTarget(btn_mind);
  tabitem_image.Tag:=1;
end;

procedure TMainform.btn_recipe_by_illnessClick(Sender: TObject);
var
i:integer;
begin
  Label_title.Text:='질병별 처방';
  edit_therapy.Text:='';
  for i := 0 to stringgrid1.ColumnCount - 1 do
  begin
    Stringgrid1.Columns[i].DisposeOf;
  end;
  Layout7.Visible:=true;
  changetabaction1.Tab:=tabitem_therapy_02;
  changetabaction1.ExecuteTarget(btn_recipe_by_illness);
  tabitem_therapy_02.Tag:=4;
end;

procedure TMainform.btn_recipe_by_partClick(Sender: TObject);
var
   i:integer;
begin

end;

procedure TMainform.btn_therapy_menuClick(Sender: TObject);
begin
  Label_Title := '질병별 시침 방법';
  Animation_Start;
  ChangeTabAction1.Tab := TabItem_therapy_01;
  ChangeTabAction1.ExecuteTarget(btn_therapy_menu);
end;

procedure TMainform.FloatAnimation3Finish(Sender: TObject);
begin
  FloatAnimation4.Start;
end;

procedure TMainform.FloatAnimation4Finish(Sender: TObject);
begin
  RoundRect1.Visible := False;
end;

procedure TMainform.FormCreate(Sender: TObject);
begin
  Label_Title.Text := '수신경락 팔체질';
  TabControl1.ActiveTab := TabItem_Main;
  BackButtonState := 0;
  ToolBar1.Enabled := True;
end;

procedure TMainform.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = vkMenu then
  begin
    Btn_home.OnClick(Btn_home);
    Key := 0;
  end
  else if (Key = vkHardwareBack) AND (BackButtonState = 0) then
  begin
    if TabControl1.ActiveTab = TabItem_Main then
    begin
      Messagedlg('어플 끌까여?', System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0,
        procedure(const AResult: TModalResult)
        begin
          case AResult of
            mrOK:
              begin
                SharedActivity.finish;
              end;
            mrCancel:
              begin

              end;
          end;
        end);
      Key := 0;

    end;
  end;

end;

procedure TMainform.FormShow(Sender: TObject);
begin
  try
    DM.FDConnection1.Connected := True;
  except
    raise Exception.Create('DB연경이 안됨ㅋ');
  end;
end;

procedure TMainform.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  BackButtonState := 0;
end;

procedure TMainform.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  BackButtonState := 1;
end;

end.

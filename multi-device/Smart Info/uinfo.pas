unit uinfo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Androidapi.Jni.Os, Androidapi.Helpers, Androidapi.Jni.JavaTypes;

{$R *.fmx}

function GetAndroidCodename(VerString: string): string;
begin
  if VerString = '1.0' then
    Result := 'BASE'
  else if VerString = '1.1' then
    Result := 'BASE_1_1'
  else if VerString = '1.5' then
    Result := 'CUPCAKE'
  else if VerString = '1.6' then
    Result := 'DONUT'
  else if VerString = '2.0' then
    Result := 'ECLAIR'
  else if VerString = '2.0.1' then
    Result := 'ECLAIR_0_1'
  else if VerString = '2.1' then
    Result := 'ECLAIR_MR1'
  else if VerString = '2.2' then
    Result := 'FROYO'
  else if VerString = '2.3' then
    Result := 'GINGERBREAD'
  else if VerString = '2.3.3' then
    Result := 'GINGERBREAD_MR1'
  else if VerString = '3.0' then
    Result := 'HONEYCOMB'
  else if VerString = '3.1' then
    Result := 'HONEYCOMB_MR1'
  else if VerString = '3.2' then
    Result := 'HONEYCOMB_MR2'
  else if VerString = '4.0' then
    Result := 'ICE_CREAM_SANDWICH'
  else if VerString = '4.0.3' then
    Result := 'ICE_CREAM_SANDWICH_MR1'
  else if VerString = '4.1' then
    Result := 'JELLY_BEAN'
  else if VerString = '4.2' then
    Result := 'JELLY_BEAN_MR1'
  else if VerString = '4.3' then
    Result := 'JELLY_BEAN_MR2'
  else if Pos('4.4',VerString) = 1 then
    Result := 'KITKAT'
  else if (Pos('5.0',VerString) = 1) or (Pos('5.1',VerString) = 1) then
    Result:= 'JellyBean'
  else if Pos('6.0',VerString) = 1 then
    Result:= 'MarshMallow'
  else if Pos('7.0',VerString)=1 then
    Result:='Nougat'
  else Result := 'UNKNOWN';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ListBoxItem1.ItemData.Detail := JStringToString(TJBuild.JavaClass.MODEL);
  ListBoxItem2.ItemData.Detail :=
    GetAndroidCodename(JStringToString(tjbuild_version.JavaClass.RELEASE));
  ListBoxItem3.ItemData.Detail :=
    JStringToString(tjbuild_version.JavaClass.RELEASE);
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    showmessage('안드로이드 백버튼');
    Key := 0; // 앱종료 차단
  end;
end;

end.

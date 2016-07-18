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
var
  iVer: single;
begin
  if TryStrToFloat(VerString, iVer) then  //문제가 있음.    boolean 0으로 떨어짐.
  begin                                   //begin..end 통째로 안돌아감.
    showmessage(floattostr(iVer));
    if iVer >= 6.0 then
      Result := '마시멜로'
    else if iVer >= 5.0 then
      Result := '롤리팝'
    else if iVer >= 4.4 then
      Result := 'KitKat'
    else if iVer >= 4.1 then
      Result := 'JellyBean'
    else if iVer >= 4.0 then
      Result := 'Icecream Sandwitch'
    else if iVer >= 3.0 then
      Result := 'Honey Com'
    else if iVer >= 2.3 then
      Result := 'Ginger Bread'
    else if iVer >= 2.2 then
      Result := 'Proyo'
    else
      Result := 'Unknown';
  end
  else
    Result := floattostr(iver);
    //showmessage(JStringToString(tjbuild_version.JavaClass.RELEASE));
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

unit uCall;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Media,
  FMX.ListBox, FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    Text1: TText;
    ToolBar1: TToolBar;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    MediaPlayer1: TMediaPlayer;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FilePath : string;
      procedure Phone_Call(pNumber:string);
  end;

var
  Form1: TForm1;

implementation

uses FMX.Platform, FMX.PhoneDialer;

{$R *.fmx}



procedure TForm1.FormCreate(Sender: TObject);
begin
    {$IFDEF IOS}
  FilePath := System.IOUtils.TPath.GetDocumentsPath() + PathDelim;  //  StartUp\Documents
  {$ELSE}
  FilePath := GetHomePath() + PathDelim;                            // .\assets\internal
  {$ENDIF}
end;

procedure TForm1.ListBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
Text1.Text:=ListBox1.ItemDown.ItemData.Detail;

MediaPlayer1.Clear;
MediaPlayer1.FileName:= FilePath+'button.mp3';
MediaPlayer1.Play;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
       Phone_Call(Text1.Text);
end;

procedure TForm1.Phone_Call(pNumber: string);
var
PhoneDialerService:IFMXPhoneDialerService;
begin
  if pNumber = '' then exit;

  if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDialerService)) then
  PhoneDialerService.Call(pNumber);
end;

end.

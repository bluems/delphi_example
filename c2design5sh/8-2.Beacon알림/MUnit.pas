unit MUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,System.Notification,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.ListBox, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DbxHTTPLayer, Data.DB, Data.SqlExpr,
  FMX.StdCtrls, System.Beacon, System.Beacon.Components, System.Bluetooth, FMX.Ani, FMX.Objects;

type
  TForm1 = class(TForm)
    NotificationCenter1: TNotificationCenter;
    Memo1: TMemo;
    Beacon1: TBeacon;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Text1: TText;
    ColorAnimation1: TColorAnimation;
    procedure Beacon1BeaconProximity(const Sender: TObject; const ABeacon: IBeacon; Proximity: TBeaconProximity);
    procedure FormCreate(Sender: TObject);
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
  private
    { Private declarations }
    procedure NotifyBeaconProximity(const BeaconName: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.fmx}

//******************************************************************************************************************
procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  Beacon1.Enabled := True;
  {$ENDIF}
 end;


//******************************************************************************************************************
procedure TForm1.Beacon1BeaconProximity(const Sender: TObject; const ABeacon: IBeacon; Proximity: TBeaconProximity);
var
  nStr : string;
begin
  nStr := ABeacon.GUID.ToString + ':' + ABeacon.Major.ToString + ',' + ABeacon.Minor.ToString;

  if ABeacon.Minor <> 4 then
     Exit;


  // http://docwiki.embarcadero.com/Libraries/Berlin/en/System.Beacon.TBeaconProximity
  if Proximity = TBeaconProximity.Immediate then
  begin
    Memo1.Lines.Add(nStr);
    NotifyBeaconProximity( ABeacon.Minor.ToString );
    ColorAnimation1.Start;
  end;

  if Proximity = TBeaconProximity.Near then
  begin
    ColorAnimation1.Stop;
  end;

end;


//----------------------------------------------------------------------------
procedure TForm1.NotifyBeaconProximity( const BeaconName: string );
var
  MyNotification: TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  try
    MyNotification.Name := 'BeaconProximityNotification';
    MyNotification.AlertBody := 'Á¢±Ù: ' + BeaconName + FormatDateTime( ' hh:mm:ss ', now );
    MyNotification.EnableSound := TRUE;
    NotificationCenter1.PresentNotification(MyNotification);
  finally
    MyNotification.Free;
  end;
end;

//******************************************************************************************************************
procedure TForm1.NotificationCenter1ReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
begin
  Memo1.Lines.Add('Noti Touch');
end;


end.

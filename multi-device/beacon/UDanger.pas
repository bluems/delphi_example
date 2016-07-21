unit UDanger;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Media, FMX.Layouts, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  System.IOUtils,
  System.Beacon, System.Bluetooth, System.Beacon.Components;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Switch1: TSwitch;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label3: TLabel;
    lblDistance: TLabel;
    MediaPlayer1: TMediaPlayer;
    FloatAnimation1: TFloatAnimation;
    Beacon1: TBeacon;
    Timer1: TTimer;
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Switch1Switch(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FBeacon: IBeacon;

    FIsWarning: Boolean;
    FDangerAreaStaySecs, FDangerAreaOutSecs: integer;
    procedure StartWarning;
    procedure StopWarning;
    procedure StartSiren;
    procedure StopSiren;

  public

    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  FBeacon := ABeacon;
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  FBeacon := nil;
end;

procedure TForm1.StartSiren;
begin
  MediaPlayer1.FileName := tpath.Combine(tpath.GetDocumentsPath, 'alert.mp3');
  MediaPlayer1.Play;
end;

procedure TForm1.StartWarning;
begin
  MediaPlayer1.Stop;
end;

procedure TForm1.StopSiren;
begin
  Rectangle1.visible := true;
  FloatAnimation1.Enabled := true;

  StartSiren;
end;

procedure TForm1.StopWarning;
begin
  Rectangle1.visible := false;
  FloatAnimation1.Enabled := false;

  StopSiren;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  Beacon1.Enabled := Switch1.IsChecked;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  InDangerArea: Boolean;
begin
  if Assigned(FBeacon) then
  begin
    InDangerArea := FBeacon.Distance <= 1;

    if not FIsWarning then
    begin
      if InDangerArea then
        Inc(FDangerAreaStaySecs)
      else
        FDangerAreaStaySecs := 0;

      if FDangerAreaStaySecs >= 3 then
      begin
        FIsWarning := true;
        StartWarning;
        FDangerAreaStaySecs := 0;
      end;
    end
    else if FIsWarning then
    begin
      if not InDangerArea then
        Inc(FDangerAreaOutSecs)
      else
        FDangerAreaOutSecs := 0;

      if FDangerAreaOutSecs >= 3 then
      begin
        FIsWarning := false;
        StopWarning;
        FDangerAreaOutSecs := 0;
      end;
    end;

    lblDistance.Text := FBeacon.Distance.ToString;
    Label2.Text := '위험지역과의 거리 : ' + FBeacon.Distance.ToString + ' m';
  end;
end;

end.

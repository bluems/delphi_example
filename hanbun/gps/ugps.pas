unit ugps;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  System.Sensors.Components, FMX.WebBrowser, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    LocationSensor1: TLocationSensor;
    procedure LocationSensor1LocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LocationSensor1.Active:=True;
end;

procedure TForm1.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  x, y, mapURL: string;
begin
  x := Format('%2.6f', [NewLocation.Latitude]);
  y := Format('%2.6f', [NewLocation.Longitude]);
  mapURL := Format('https://maps.google.com/maps?f=q&q=(%2.6f,%2.6f)',
    [NewLocation.Latitude, NewLocation.Longitude]);
  WebBrowser1.Navigate(mapURL);
  LocationSensor1.Active := FALSE;

end;

end.

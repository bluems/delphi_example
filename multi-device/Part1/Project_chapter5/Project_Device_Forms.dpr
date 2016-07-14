program Project_Device_Forms;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  {$IFDEF IOS}
  iOSapi.UIKit,
  {$ENDIF }
  {$IFDEF ANDROID}
  FMX.Platform.Android,
  {$ENDIF }
  Unit_PhoneForm in 'E:\RAD_STUDIO\모바일기초과정\소스\Part2_Source\Project_chapter5\Unit_PhoneForm.pas' {PhoneMainForm},
  Unit_TableForm in 'E:\RAD_STUDIO\모바일기초과정\소스\Part2_Source\Project_chapter5\Unit_TableForm.pas' {TabletMainForm};

{$R *.res}
{$IFDEF IOS}
function IsTablet: Boolean;
begin
  Result := TUIDevice.Wrap(TUIDevice.OCClass.currentDevice).userInterfaceIdiom = UIUserInterfaceIdiomPad;
end;
{$ENDIF}
{$IFDEF ANDROID}
function IsTablet: Boolean;
begin
  Result := (MainActivity.getResources.getConfiguration.screenLayout and TJConfiguration.JavaClass.SCREENLAYOUT_SIZE_MASK)
    >= TJConfiguration.JavaClass.SCREENLAYOUT_SIZE_LARGE;
end;
{$ENDIF}
begin
  Application.Initialize;
//   if IsTablet then
//    Application.CreateForm(TTabletMainForm, TabletMainForm)
//  else
//    Application.CreateForm(TPhoneMainForm, PhoneMainForm);

  Application.CreateForm(TPhoneMainForm, PhoneMainForm);
  Application.CreateForm(TTabletMainForm, TabletMainForm);
  Application.RegisterFormFamily('Main', [TTabletMainForm, TPhoneMainForm]);
  //  application.MainForm := Application.GetDeviceForm('Main');
  Application.Run;
end.

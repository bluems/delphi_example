program Project_Prototype;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  MasterDetail_Phone in 'MasterDetail_Phone.pas' {PhoneMasterDetail},
  EmployeeDM in 'EmployeeDM.pas' {DataModule1: TDataModule},
  Unit4 in 'Unit4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPhoneMasterDetail, PhoneMasterDetail);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

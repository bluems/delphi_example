//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, FMX.StdCtrls, System.Bluetooth.Components, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.TabControl;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    BluetoothLE1: TBluetoothLE;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    ListBox2: TListBox;
    ToolBar1: TToolBar;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    ListBox3: TListBox;
    AniIndicator1: TAniIndicator;
    Label_int: TLabel;
    Label_Single: TLabel;
    Label_Double: TLabel;
    Label_String: TLabel;
    Btn_Unsub: TButton;
    Label_int8: TLabel;
    Label_int16: TLabel;
    Label_int32: TLabel;
    Label_int64: TLabel;
    Label_uint8: TLabel;
    Label_uint16: TLabel;
    Label_uint32: TLabel;
    Label_uint64: TLabel;
    Label_cal: TLabel;
    Label_val: TLabel;
    VertScrollBox1: TVertScrollBox;
    Label_val0: TLabel;
    Label_val1: TLabel;
    Label_val2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BluetoothLE1DiscoverLEDevice(const Sender: TObject;
      const ADevice: TBluetoothLEDevice; Rssi: Integer;
      const ScanResponse: TScanResponse);
    procedure Timer1Timer(Sender: TObject);
    procedure BluetoothLE1EndDiscoverDevices(const Sender: TObject;
      const ADeviceList: TBluetoothLEDeviceList);
    procedure BluetoothLE1ServicesDiscovered(const Sender: TObject;
      const AServiceList: TBluetoothGattServiceList);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ListBox2ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormCreate(Sender: TObject);
    procedure ListBox3ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure BluetoothLE1CharacteristicRead(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure Btn_UnsubClick(Sender: TObject);
  private
    Scanning: Boolean;
    Subscribing : boolean;
    TimeScanning: Integer;
    FBLEDeviceList : TBluetoothLEDeviceList;
    FBLEDevice : TBluetoothLEDevice;
    DeviceName : string;
    FBLEGattServiceList : TBluetoothGattServiceList;
    FBLEGattService : TBluetoothGattService;
    FBLEGattCharList : TBluetoothGattCharacteristicList;
    FBLEGattChar : TBluetoothGattCharacteristic;

    { Private declarations }
  public
    { Public declarations }
  end;

const
  ScanningTime = 10000;

var
  Form6: TForm6;
  pre_val : double=0;

implementation

{$R *.fmx}

function BytesToString(const B: TBytes): string;
var
  I: Integer;
begin
  if Length(B) > 0 then
  begin
    Result := Format('%0.2X', [B[0]]);
    for I := 1 to High(B) do
      Result := Result + Format(' %0.2X', [B[I]]);
  end
  else
    Result := '';
end;

procedure TForm6.BluetoothLE1CharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  AGattStatus: TBluetoothGattStatus);
var
  val1 : double;
  val2 : double;
  val3 : double;
  val4 : string;
  current_val : double;
begin
  if TabControl1.ActiveTab <> Tabitem3 then
    TabControl1.ActiveTab := Tabitem3;

//  val1 := (ACharacteristic.GetValueAsInteger shr 8)/10;
  Label_int.Text := IntToStr(ACharacteristic.GetValueAsInteger);
  Label_Single.Text := FloatToStr(ACharacteristic.GetValueAsSingle);
  //Format('%3.1f',[ACharacteristic.GetValueAsSingle]);
  Label_Double.Text := FloatToStr(ACharacteristic.GetValueAsDouble);

  Label_int8.Text :=  IntToStr(ACharacteristic.GetValueAsInt8);
  Label_int16.Text :=  IntToStr(ACharacteristic.GetValueAsInt16);
  Label_int32.Text :=  IntToStr(ACharacteristic.GetValueAsInt32 shr 8);
  Label_int64.Text :=  IntToStr(ACharacteristic.GetValueAsInt64);

  Label_uint8.Text :=  IntToStr(ACharacteristic.GetValueAsInt8);
  Label_uint16.Text :=  IntToStr(ACharacteristic.GetValueAsInt16);
  Label_uint32.Text :=  IntToStr(ACharacteristic.GetValueAsInt32);
  Label_uint64.Text :=  IntToStr(ACharacteristic.GetValueAsInt64);

  Label_val.Text := BytesToString(ACharacteristic.Value);
  if ACharacteristic.GetValueAsInteger = 17505805 then
  begin
    Label_val0.Text := Format('%3.1f' ,[(ACharacteristic.Value[8].ToDouble*256 + ACharacteristic.Value[9].ToDouble) / 100]);
  end
  else if ACharacteristic.GetValueAsInteger = 34872845 then
  begin
    Label_val0.Text := Format('%3.1f' ,[(ACharacteristic.Value[13].ToDouble*256 + ACharacteristic.Value[14].ToDouble) / 100]);
  end;


  Label_val1.Text := ACharacteristic.Value[1].ToString;
  Label_val2.Text := IntToStr(Length(ACharacteristic.Value));
  //ACharacteristic.Value[2].ToString;

  if pre_val <> ACharacteristic.GetValueAsDouble then
  begin
  current_val := ACharacteristic.GetValueAsDouble;
  Label_Cal.Text := FloatToStr(current_val - pre_val);
  pre_val := current_val;
  end

  //Format('%3.1f',[ACharacteristic.GetValueAsDouble]);
//  Form6.Label_String.Text := ACharacteristic.GetValueAsString;
  //Format('%3.1f',[ACharacteristic.GetValueAsString]);
end;

procedure TForm6.BluetoothLE1DiscoverLEDevice(const Sender: TObject;
  const ADevice: TBluetoothLEDevice; Rssi: Integer;
  const ScanResponse: TScanResponse);
var
  Name: string;
  I: Integer;
  DCount: Integer;
  NumberOfDevices: Integer;
  item : TListboxItem;
begin
  DCount := BluetoothLE1.DiscoveredDevices.Count;
  NumberOfDevices := Listbox1.Count;
  for I  := 0 to DCount - 1 do
  begin
    Name := BluetoothLE1.DiscoveredDevices[I].DeviceName;
    if Name = '' then
      Name := 'Unknown device';
    Name := ' - '+ Name + ' - ' + BluetoothLE1.DiscoveredDevices[I].Identifier;
    if NumberOfDevices = I then
    begin
      Listbox1.Items.Add((NumberOfDevices + 1).ToString+Name);
//      FBLEDeviceList.Add(ADevice);
    end
    else
    begin
      Listbox1.Items[I] := IntToStr((I + 1))+Name;
//      FBLEDeviceList.Add(ADevice);
    end;
  end;
end;

procedure TForm6.BluetoothLE1EndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
var
  Name : string;
  Device : TBluetoothLEDevice;
  item : TListboxItem;
  I : integer;
  NumberOfDevices: Integer;
begin
  Timer1.Enabled := False;
  Scanning := False;
  AniIndicator1.Enabled := False;
  AniIndicator1.Visible := False;
  Button1.Enabled := True;
  if ADeviceList.Count = 0 then
  begin
    item := TListboxitem.Create(Listbox1);
    item.Text := '발견된 디바이스가 없습니다.';
    item.HitTest := True;
    Button2Click(Sender);
    Exit;
  end;

  FBLEDeviceList := ADeviceList;
  NumberOfDevices := BluetoothLE1.DiscoveredDevices.Count;
  for I  := 0 to ADeviceList.Count - 1 do
  begin
//    Showmessage(FBLEDeviceList[I].DeviceName);
  end;


end;

procedure TForm6.BluetoothLE1ServicesDiscovered(const Sender: TObject;
  const AServiceList: TBluetoothGattServiceList);
var
  I, C: Integer;
  item : TListboxitem;
begin
  AniIndicator1.Enabled := False;
  AniIndicator1.Visible := False;
  if AServiceList.Count > 0 then
  begin
    FBLEGattServiceList := AServiceList;
    for I := 0 to AServiceList.Count - 1 do
    begin
      item := TListboxitem.Create(Listbox2);
      item.Text := (I + 1).ToString+' - '+AServiceList[I].UUIDName+' - '+AServiceList[I].UUID.ToString;
      Listbox2.AddObject(item);
      //BluetoothLE1.GetCharacteristics(AServiceList[I]);

//      for C := 0 to AServiceList[I].Characteristics.Count - 1 do
//      begin
//        item := TListboxitem.Create(Listbox2);
//        item.HitTest := True;
//        item.ItemData.Detail := AServiceList[I].Characteristics[C].UUID.ToString;
//        item.Text := '    - '+AServiceList[I].Characteristics[C].UUIDName+' - '+AServiceList[I].Characteristics[C].UUID.ToString;
//        Listbox2.AddObject(item);
//      end;
    end;
  end
  else
  begin
    item := TListboxitem.Create(Listbox2);
    item.HitTest := True;
    item.Text := '- Not allow access or no services';
    Listbox2.AddObject(item);
  end;
  Listbox1.Enabled := True;
end;

procedure TForm6.Btn_UnsubClick(Sender: TObject);
begin
  if Assigned(FBLEDevice) and Assigned(FBLEGattChar) then
  begin
    BluetoothLE1.UnSubscribeToCharacteristic(FBLEDevice, FBLEGattChar);
    ShowMessage('구독해제 완료');
    Subscribing := False;
  end;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  if not Scanning then
  begin
    Listbox1.Clear;
    Button1.Enabled := False;
    AniIndicator1.Enabled := True;
    AniIndicator1.Visible := True;
    TimeScanning := 0;
    BluetoothLE1.DiscoverDevices(ScanningTime);
    ProgressBar1.Value := 0;
    Timer1.Enabled := True;
    Scanning := True;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  BluetoothLE1.CancelDiscovery;
  Timer1.Enabled := False;
  Scanning := False;
  Button1.Enabled := True;

//  if Assigned(FBLEDevice) and Assigned(FBLEGattChar) then
//   BluetoothLE1.UnSubscribeToCharacteristic(FBLEDevice, FBLEGattChar);

//  BluetoothLE1.Enabled := False;
//  Timer1.Enabled := False;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  Scanning := False;
  Subscribing := False;
end;

procedure TForm6.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  item2 : TListboxitem;
begin
  Button2Click(Sender);
  FBLEDevice := FBLEDeviceList[Item.Index];
//  ShowMessage(FBLEDevice.DeviceName + '이 FBLEDevice 로 할당되었습니다');
  AniIndicator1.Enabled := True;
  AniIndicator1.Visible := True;
  Listbox2.Clear;
  item2 := TListboxitem.Create(Listbox2);
  item2.HitTest := True;
  item2.Text := '- Discovering services -->';
  Listbox2.AddObject(item2);
  TThread.CreateAnonymousThread(procedure begin
    if not FBLEDevice.DiscoverServices then
      if not FBLEDevice.DiscoverServices then
      begin
        TThread.Synchronize(nil,procedure
        begin
          item2 := TListboxitem.Create(Listbox2);
          item2.HitTest := True;
          item2.Text := '- Discover services not allow';
          Listbox2.AddObject(item2);
          AniIndicator1.Enabled := False;
          AniIndicator1.Visible := False;
          Listbox1.Enabled := True;
        end);
      end;
  end).Start;

//  if not FBLEDevice.DiscoverServices then
//  begin
//    if not FBLEDevice.DiscoverServices then
//      begin
//        item2 := TListboxitem.Create(Listbox2);
//        item2.HitTest := True;
//        item2.Text := '- Discover services not allow';
//        Listbox2.AddObject(item2);
//        AniIndicator1.Enabled := False;
//        AniIndicator1.Visible := False;
//        Listbox1.Enabled := True;
//      end;
//  end;
//  Listbox1.Enabled := False;
end;

procedure TForm6.ListBox2ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  I, C : integer;
  GattCharList : TBluetoothGattCharacteristicList;
  GattChar : TBluetoothGattCharacteristic;
  new_item : TListboxitem;
begin
  if FBLEGattServiceList[Item.Index-1].Characteristics.Count > 0 then
  begin
    Label1.Text := Item.Text;
    Listbox3.Clear;
    Tabcontrol1.ActiveTab := Tabitem2;
  //  Showmessage(IntToStr(Item.Index)); // 그냥 index 테스트 한 것

    FBLEGattCharList := FBLEGattServiceList[Item.Index-1].Characteristics;
    for C := 0 to FBLEGattServiceList[Item.Index-1].Characteristics.Count - 1 do
    begin
      new_item := TListboxitem.Create(Listbox3);
      new_item.Text := FBLEGattServiceList[Item.Index-1].Characteristics[C].UUID.ToString;
      Listbox3.AddObject(new_item);

    end;
  end;



//      for C := 0 to AServiceList[I].Characteristics.Count - 1 do
//      begin
//        item := TListboxitem.Create(Listbox2);
//        item.HitTest := True;
//        item.ItemData.Detail := AServiceList[I].Characteristics[C].UUID.ToString;
//        item.Text := '    - '+AServiceList[I].Characteristics[C].UUIDName+' - '+AServiceList[I].Characteristics[C].UUID.ToString;
//        Listbox2.AddObject(item);
//      end;
end;

procedure TForm6.ListBox3ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  C : integer;
  new_item : TListboxItem;
begin
  if not Subscribing then
  begin
    FBLEGattChar := FBLEGattCharList[Item.Index];
    ShowMessage(FBLEDevice.DeviceName + ': FBLEDevice' + FBLEGattChar.UUID.ToString + ': FBLEGattChar 구독 시도중');

    if BluetoothLE1.SubscribeToCharacteristic(FBLEDevice, FBLEGattChar) then // 구독하면 OnCharacteristicRead 이벤트를 통해 특성 값을 받음
    begin
      BluetoothLE1.SubscribeToCharacteristic(FBLEDevice, FBLEGattChar);
      FBLEDevice.ReadCharacteristic(FBLEGattChar);
  //    new_item := TListboxItem.Create(Listbox4);
  //    new_item.Text := '특성에 구독했습니다.';
  //    new_item.HitTest := True;
  //    Listbox4.AddObject(new_item);
      ShowMessage('특성구독 완료');
      Subscribing := True;
    end;
  end
  else
  begin
    ShowMessage('구독하기 전 이전 구독내용을 해제하여야 합니다.');
  end;


end;

procedure TForm6.Timer1Timer(Sender: TObject);
var
  partial: single;
begin
  inc(TimeScanning);
  partial := ScanningTime / 10000;
  ProgressBar1.Value := ((Timer1.Interval / 100) / partial)  * TimeScanning;
end;

end.


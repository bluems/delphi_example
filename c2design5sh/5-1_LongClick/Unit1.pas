unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox, FMX.Layouts, FMX.StdCtrls, FMX.Objects,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBoxItem2: TListBoxItem;
    Timer1: TTimer;
    ListBoxItem1: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ToolBar1: TToolBar;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure ListBoxItem1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Image_TouchAni( sImage:TImage; aTime:single );
  end;

var
  Form1: TForm1;

implementation

var
  ClickInterval : Cardinal = 0;
const
  LONG_TIME = 8;  // Long Touch Time : 0.8 sec

{$R *.fmx}

//********************************************************************
procedure TForm1.ListBoxItem1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  ClickInterval := 0;
  Timer1.Enabled := TRUE;
  Timer1.Tag := 1;            // Listbox 와 이미지 구별
end;

//********************************************************************
// ~ 초 미만으로 눌렀다 떼면 숏터치로 판단.
procedure TForm1.ListBoxItem1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if ClickInterval < LONG_TIME then  // 타이머 8번(0.8초) 미만 호출시 숏터치로 판단.
  begin
    Timer1.Enabled := FALSE;
    ClickInterval := 0;
    ShowMessage( 'ListBox Shot Touch..!!');
  end;
end;


//********************************************************************
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  ClickInterval := 0;
  Timer1.Enabled := TRUE;
  Timer1.Tag := 2;         // Listbox 와 이미지 구별
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if ClickInterval < LONG_TIME then
  begin
    Timer1.Enabled := FALSE;
    ClickInterval := 0;
    Image_TouchAni( Image1, 0.1 );
  end;
end;

//----------------------------------------------
procedure TForm1.Image_TouchAni( sImage:TImage; aTime:single );
begin
  sImage.AnimateFloat( 'Opacity', 0.1, aTime );
  sImage.AnimateFloatDelay( 'Opacity', 1.0, aTime, aTime+0.02 );
end;


//*******************************************************************************
// 롱클릭 메소드는 이곳에서 처리함.
// 0.1 초마다 한번씩 호출됨  ->  타이머 8번 호출되어 0.8초를 롱터치로 판단.
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ClickInterval := ClickInterval + 1;

  if ( ClickInterval = LONG_TIME ) and ( Timer1.Tag = 1 ) then
  begin
    Combobox1.DropDown();
    Timer1.Enabled := FALSE;
  end

  else if ( ClickInterval = LONG_TIME ) and ( Timer1.Tag = 2 ) then
  begin
    Image_TouchAni( Image1, 1.5 );
    Timer1.Enabled := FALSE;
  end;

end;




end.

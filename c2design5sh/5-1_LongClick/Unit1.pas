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
  Timer1.Tag := 1;            // Listbox �� �̹��� ����
end;

//********************************************************************
// ~ �� �̸����� ������ ���� ����ġ�� �Ǵ�.
procedure TForm1.ListBoxItem1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if ClickInterval < LONG_TIME then  // Ÿ�̸� 8��(0.8��) �̸� ȣ��� ����ġ�� �Ǵ�.
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
  Timer1.Tag := 2;         // Listbox �� �̹��� ����
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
// ��Ŭ�� �޼ҵ�� �̰����� ó����.
// 0.1 �ʸ��� �ѹ��� ȣ���  ->  Ÿ�̸� 8�� ȣ��Ǿ� 0.8�ʸ� ����ġ�� �Ǵ�.
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

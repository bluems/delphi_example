unit Unit_basic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.Layouts, FMX.TabControl, FMX.Gestures,
  System.Actions, FMX.ActnList, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView;

type
  TForm5 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    CalendarEdit1: TCalendarEdit;
    Edit1: TEdit;
    ComboEdit1: TComboEdit;
    TabControl2: TTabControl;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    ToolBar1: TToolBar;
    Button1: TButton;
    ToolBar2: TToolBar;
    Button2: TButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    GestureManager1: TGestureManager;
    ListView1: TListView;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Button1Click(Sender: TObject);
begin
   tabcontrol2.ActiveTab := tabitem4;
   TabControl2.TabIndex := 1;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
   tabcontrol2.ActiveTab := tabitem2;
   TabControl2.TabIndex := 0;

end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
  ListBoxItem5.Text := Edit1.Text;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  c: Char;
  i: Integer;
  Buffer: String;
  ListViewItem : TListViewItem;
  ListBoxGroupHeader : TListBoxGroupHeader;


begin
  ListView1.BeginUpdate;
  try
   for I := 1 to 10 do
    begin
      ListViewItem := ListView1.Items.Add;
      ListViewItem.Text := IntToStr(I);
      ListViewItem.Accessory := TAccessoryType(i mod 3);
      ListView1.ItemAppearance.ItemAppearance := 'ListitemRightDetail';
      ListViewItem.Detail := inttostr(i) + '¿‘¥œ¥Ÿ';
      ListView1.ItemAppearanceObjects.ItemObjects.Detail.WordWrap := true;
    end;
  finally
    ListView1.EndUpdate;
  end;
end;


end.

unit UliveBinding;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, Datasnap.DBClient, FMX.ListView, FMX.TabControl,
  FMX.Layouts, FMX.Gestures, System.Actions, FMX.ActnList, FMX.Edit, FMX.Objects;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Image1: TImage;
    Edit1: TEdit;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    GestureManager1: TGestureManager;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.

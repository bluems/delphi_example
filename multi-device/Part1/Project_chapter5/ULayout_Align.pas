unit ULayout_Align;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    ToolBar2: TToolBar;
    SpeedButton4: TSpeedButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Layout1: TLayout;
    Image1: TImage;
    Image2: TImage;
    Layout2: TLayout;
    Image3: TImage;
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
  Layout1.Visible := not Layout1.Visible;
end;

end.

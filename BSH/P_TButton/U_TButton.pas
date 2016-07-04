unit U_TButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmButtonExample = class(TForm)
    btnMyButton: TButton;
    procedure btnMyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmButtonExample: TfrmButtonExample;

implementation

{$R *.dfm}

procedure TfrmButtonExample.btnMyButtonClick(Sender: TObject);
begin
  frmButtonExample.Close;
end;

end.

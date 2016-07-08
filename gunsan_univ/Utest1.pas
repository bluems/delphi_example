unit Utest1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Utest4, utest2, Utest3;

procedure TForm1.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  button3.Caption:=inttostr(i);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  button4.Caption:=inttostr(divide(10,2));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form3:=TForm3.Create(application);//create, free 세트. nil -> 프로그램이 종료되도 안 사라짐. application -> 메인 폼이 내려가면 다 사라짐
  if Form3.ShowModal = mrok then
    showMessage('ok');
  Form3.Free;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form2:=TForm2.Create(application);
  Form2.Show;
end;

end.

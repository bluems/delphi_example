unit Utest4;

//type, var, const, procedure, function ����
//�������̽��� ����� ���� �ܺ� ���ֿ����� ���� ����.
interface
uses
  Vcl.Dialogs;
type
  country = array[0..2] of string;

var
  Countries:country;
  a1:array of string;
  a2:array of array of string;
  i:NativeInt=100;// 32bit or 64bit

  procedure Test;
  function Add(x,y:integer):integer;
  function Divide(x, y:integer):integer; overload;
  function Divide(x, y:real):extended; overload;

  {
  function sub(x:integer):integer;
  function division(x:integer):integer;
  function mul(x:integer):integer;                }
  //�̰��� ����� ���� ���� ���ο����� ���� ����.
implementation
var
  j:integer=1;


procedure Test;
var
  k:integer;
begin
  showMessage('Hi');
end;

function add(x,y:integer):integer;
begin
  //add:=x+y;
  //exit(x+y);//2010����
  Result:=x+y;
end;
function Divide(x, y:integer):integer;
begin
  Result:= x div y;
end;
function Divide(x, y:real):extended;
begin
  Result:=x / y;
end;

//�ʱ� ó��:����Ʈ �Ҵ�
//uses ���� ������ ����
initialization
begin
  Countries[0]:='�ѱ�';
  Countries[1]:='�̱�';
  Countries[2]:='�Ϻ�';
  SetLength(a1,2);
  SetLength(a2,2,2);
  a1[0]:='a1';
  a2[0,0]:='a2';
end;

//finalization

end.

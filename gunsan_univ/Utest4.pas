unit Utest4;

//type, var, const, procedure, function 선언
//인터페이스에 선언된 것은 외부 유닛에서도 참조 가능.
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
  //이곳에 선언된 것은 유닛 내부에서만 참조 가능.
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
  //exit(x+y);//2010부터
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

//초기 처리:디폴트 할당
//uses 절을 만나면 실행
initialization
begin
  Countries[0]:='한국';
  Countries[1]:='미국';
  Countries[2]:='일본';
  SetLength(a1,2);
  SetLength(a2,2,2);
  a1[0]:='a1';
  a2[0,0]:='a2';
end;

//finalization

end.

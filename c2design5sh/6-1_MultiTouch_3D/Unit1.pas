unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Math.Vectors,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls3D, FMX.Objects3D, FMX.Viewport3D, FMX.Layers3D, FMX.StdCtrls, FMX.MaterialSources, FMX.Types3D,
  FMX.Objects, System.Math, FMX.TabControl, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    MViewport3D: TViewport3D;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Rect3DImage: TImage3D;
    Label1: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormTouch(Sender: TObject; const Touches: TTouches; const Action: TTouchAction);
  private
    { Private declarations }
    ResPath : string;
    procedure MapView_Init();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


var
  CameraDummyX, CameraDummyY : TDummy;
  Camera1 : TCamera;

  DownR, ODownX, ODownY  : single;
  TCount : integer = 0;
  OCount : integer = 0;
  MoveR : array[0..24] of single;    // Two Touch Move position
  OPos  : array[0..24] of TPointF;   // One Touch position
  isUp : Boolean = FALSE;

Const
  CZoom1 = -20;   //  ī�޶�Zoom �ʱⰪ

{$R *.fmx}

//-----------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF IOS}
  ResPath := GetHomePath() + PathDelim + 'Library' + PathDelim;    //  StartUp\Library
  ResPath := System.IOUtils.TPath.GetDocumentsPath() + PathDelim;  //  StartUp\Documents
  {$ELSE}
     {$IFDEF ANDROID}
       ResPath := GetHomePath() + PathDelim;                       // .\assets\internal
     {$ELSE}
       ResPath := '..\..\SImage\';
     {$ENDIF}
  {$ENDIF}

end;

procedure TForm1.FormResize(Sender: TObject);
begin
  MapView_Init();
end;

procedure TForm1.MapView_Init();
begin
  CameraDummyY := TDummy.Create(nil);
  CameraDummyY.Parent := Form1.MViewport3D;

  CameraDummyX := TDummy.Create(nil);
  CameraDummyX.Parent := CameraDummyY;

  CameraDummyX.RotationAngle.Vector := Vector3D( 0,0,0 );
  CameraDummyX.Position.Y := 0;      // ȭ�� ���� ��ġ ����

  Camera1 := TCamera.Create(nil);
  Camera1.Parent := CameraDummyX;
  Camera1.Target := CameraDummyX;

  Camera1.Position.Z := CZoom1;  // �̹��� �ּ��϶�..���̻� �����ʿ�� ���� Ȯ�븸 ��Ŵ.

  MViewport3D.Camera := Camera1;
  MViewport3D.UsingDesignCamera := False;

  Rect3DImage.Height := 13.5;                            // ȭ�鿡 �´� ���� ũ�� ���� ���� ~ �뷫���� ��
  Rect3DImage.Width  := Rect3DImage.Height * 922 / 1200 // 1200 : 922 = MapPlane.Height : MapPlane.Width
end;


procedure TForm1.FormTouch(Sender: TObject; const Touches: TTouches; const Action: TTouchAction);
var
  panR : single;
begin
  // Pan ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if ( Length( Touches ) = 1 ) then
  begin
    if ( Action = TTouchAction.Down )  then
    begin
      ODownX := Touches[0].Location.X;
      ODownY := Touches[0].Location.Y;
      OCount := 0;
    end;

    if ( Action = TTouchAction.Move )  then
    begin
      if isUP then   // ����ġ Zoom ������ �Ѽհ����� ���� ���� �ٿ��̸Ծ� �������� Pan�� �߻��ϹǷ� �ٿ��ʱⰪ�� ������ �����Ͽ� Move ������ - Move ������ ������ǥ�̸� panR ���� �ǹ̰� ���� Pan�� �۵�����.
      begin
        isUp := FALSE;
        ODownX := Touches[0].Location.X;
        ODownY := Touches[0].Location.Y;
        OCount := 0;
      end;

      OPos[OCount].X  := Touches[0].Location.X;
      OPos[OCount].Y  := Touches[0].Location.Y;

      panR :=  SQRT( Power( ODownX-OPos[OCount].X, 2 ) +  Power( ODownY-OPos[OCount].Y, 2 ) );

      if ( panR > 10 ) then
      begin
        if  Camera1.Position.Z > CZoom1  then  // �ּ� ������ �̻��϶��� �̵�
        begin
          CameraDummyX.Position.X := CameraDummyX.Position.X - (OPos[OCount].X - ODownX)* 0.02 ;
          CameraDummyY.Position.Y := CameraDummyY.Position.Y - (OPos[OCount].Y - ODownY)* 0.02 ;

          ODownX := OPos[OCount].X;
          ODownY := OPos[OCount].Y;
          OCount := 0;
        end;
      end
      else
        Inc( OCount );
    end;
  end

  // Zoom ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  else if ( Length( Touches ) = 2 ) then
  begin
    if ( Action = TTouchAction.Down )  then
    begin
      DownR := SQRT( Power( Touches[0].Location.X-Touches[1].Location.X, 2 ) +
                     Power( Touches[0].Location.Y-Touches[1].Location.Y, 2 ) );
      TCount := 0;
    end;

    if ( Action = TTouchAction.Move ) then
    begin
      MoveR[TCount] := SQRT( Power( Touches[0].Location.X-Touches[1].Location.X, 2 ) +
                             Power( Touches[0].Location.Y-Touches[1].Location.Y, 2 ) );

      if ( MoveR[TCount] - DownR > 10 ) then  // �̼��ϰ� �����϶��� ���� - ���� ȣ�� ����
      begin
        if  Camera1.Position.Z < -5  then  // ����Ȯ�� ����
        begin
          Camera1.Position.Z := Camera1.Position.Z + MoveR[TCount] * 0.005;
          DownR := MoveR[TCount];
          TCount := 0;
        end;
      end
      else if ( DownR - MoveR[TCount] > 10 ) then
      begin
        if  Camera1.Position.Z > CZoom1  then  // �ּһ�����(����ũ��) �̻��϶��� ���
        begin
          Camera1.Position.Z := Camera1.Position.Z - MoveR[TCount] * 0.005;
          DownR := MoveR[TCount];
          TCount := 0;
        end
        else   // �ּ���(����ũ��)�� �ڵ�����ġ.
        begin
          CameraDummyX.Position.X := 0;
          CameraDummyY.Position.Y := 0;
        end;
      end
      else
        Inc( TCount );
    end;  // of Move

    if( Action = TTouchAction.Up ) then // Zoom ���� �Ѽհ��� ���� ������ �˷���.
      isUp := TRUE;
  end;  // of Zoom
end;


end.

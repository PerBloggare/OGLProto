unit ControlWin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin, ExtCtrls, ComCtrls;

type

  { TfrmControl }

  TfrmControl = class(TForm)
    Fovy: TSpinEdit;
    Fps: TMemo;
    Front: TSpinEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pagSettings: TPageControl;
    Rear: TSpinEdit;
    RSX: TSpinEdit;
    RSY: TSpinEdit;
    RSZ: TSpinEdit;
    Spinx: TSpinEdit;
    Spiny: TSpinEdit;
    Spinz: TSpinEdit;
    TabPerspective: TTabSheet;
    tmrFps: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrFpsTimer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmControl: TfrmControl;


implementation
uses
  glWin;
{$R *.lfm}

{ TfrmControl }


procedure TfrmControl.tmrFpsTimer(Sender: TObject);
begin
  Fps.Append(inttostr(frmGl.GetFps)+ Chr(9) +'fps');
end;

procedure TfrmControl.FormCreate(Sender: TObject);
begin

  TmrFps.Interval :=1000;
  TmrFps.Enabled := true;

end;



end.


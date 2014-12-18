unit GlWin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,  OpenGLContext, Forms, Controls,
  ControlWin,GL,GLU;

type

  { TfrmGL }

  TfrmGL = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure FormCreate(Sender: TObject);
    procedure IdleFunc(Sender: TObject; var Done: Boolean);
    procedure Draw;
    procedure OpenGLControl1Resize(Sender: TObject);
  private
    { private declarations }
    fpsCounter: integer;
  public
    { public declarations }
    function GetFps: integer;

  end;

var
  frmGL: TfrmGL;

implementation

{$R *.lfm}

{ TfrmGL }

procedure TfrmGL.FormCreate(Sender: TObject);
begin
      Application.OnIdle:=@IdleFunc;
      fpsCounter:=0;
end;

procedure TfrmGL.IdleFunc(Sender: TObject; var Done: Boolean);
begin
  Draw;
  Done:=false; // tell lcl to handle messages and return immediatly
end;

procedure TfrmGL.Draw;
begin
  if OpenGLControl1.MakeCurrent  then
  begin

   glClearColor(0.0, 0.0, 0.0, 1);
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   gluPerspective(ControlWin.frmControl.Fovy.Value, double(OpenGLControl1.width / OpenGLControl1.height), ControlWin.frmControl.Front.Value, ControlWin.frmControl.Rear.Value);
  end;

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  glTranslatef(frmControl.Spinx.Value ,frmControl.Spiny.Value,frmControl.Spinz.Value );
  glRotatef(frmControl.RSX.Value,1,0,0);
  glRotatef(frmControl.RSY.Value,0,1,0);
  glRotatef(frmControl.RSZ.Value,0,0,1);
  glColor3f(0.0,1.0,0.0); // Set The Color To Green
  glBegin(gl_Lines);
                    glVertex3f(0.0, 0.0, 0.0);
                    glVertex3f(200.0, 0.0, 0.0);

  glEnd;
  glBegin(gl_Lines);
                    glVertex3f(0.0, 0.0, 0.0);
                    glVertex3f(0.0, 200.0, 0.0);

  glEnd;
  glBegin(gl_Lines);
                    glVertex3f(0.0, 0.0, 0.0);
                    glVertex3f(0.0, 0.0, 200.0);

  glEnd;



  OpenGLControl1.SwapBuffers;
  inc(fpsCounter);
end;

procedure TfrmGL.OpenGLControl1Resize(Sender: TObject);
begin
   if OpenGLControl1.MakeCurrent then
    glViewport (0, 0, OpenGLControl1.Width, OpenGLControl1.Height);
end;

function TfrmGL.GetFps:integer;
begin
  result := fpsCounter;
  fpsCounter:= 0;
end;



end.


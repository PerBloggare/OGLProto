program OGLProto;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazopenglcontext,
  controlwin, glwin;



{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmControl, frmControl);
  Application.CreateForm(TfrmGL, frmGL);
  Application.Run;
end.


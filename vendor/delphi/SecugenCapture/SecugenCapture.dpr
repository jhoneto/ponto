program SecugenCapture;

uses
  Forms,
  FSecugenCapture in 'FSecugenCapture.pas' {frmSecugenCapture},
  dmDados in '..\Common\dmDados.pas' {dtmDados: TDataModule},
  uConstBioMatch in '..\Common\uConstBioMatch.pas',
  uSecugen in '..\Common\uSecugen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSecugenCapture, frmSecugenCapture);
  Application.Run;
end.

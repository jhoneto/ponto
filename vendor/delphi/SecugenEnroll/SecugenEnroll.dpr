program SecugenEnroll;

uses
  Forms,
  fSecugenEnroll in 'fSecugenEnroll.pas' {frmSecugenEnroll},
  uConstBioMatch in '..\Common\uConstBioMatch.pas',
  dmDados in '..\Common\dmDados.pas' {dtmDados: TDataModule},
  uSecugen in '..\Common\uSecugen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSecugenEnroll, frmSecugenEnroll);
  Application.CreateForm(TdtmDados, dtmDados);
  Application.Run;
end.

program BioMatchSync;

uses
  Forms,
  FBioMatchSync in 'FBioMatchSync.pas' {Form1},
  dmDados in '..\Common\dmDados.pas' {dtmDados: TDataModule},
  uItiumSync in 'uItiumSync.pas',
  uSecugen in '..\Common\uSecugen.pas',
  uConstBioMatch in '..\Common\uConstBioMatch.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdtmDados, dtmDados);
  Application.Run;
end.

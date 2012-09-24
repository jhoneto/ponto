program BioMatchMigrate;

uses
  Forms,
  fMigrate in 'fMigrate.pas' {frmMigrate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMigrate, frmMigrate);
  Application.Run;
end.

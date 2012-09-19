unit FSecugenCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dmDados, uSecugen;

type
  TfrmSecugenCapture = class(TForm)
    edtStatus: TEdit;
    btnInicializar: TButton;
    procedure btnInicializarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDados : TdtmDados;
    FSecugen : TItiumSecugen;
    procedure capturar(var cancelado : boolean);
  public
    { Public declarations }
  end;

var
  frmSecugenCapture: TfrmSecugenCapture;

implementation

uses uConstBioMatch;

{$R *.dfm}

procedure TfrmSecugenCapture.btnInicializarClick(Sender: TObject);
var cancelado : boolean;
begin
  cancelado := false;
  while not cancelado do
    capturar(cancelado);
end;

procedure TfrmSecugenCapture.capturar(var cancelado : boolean);
var digital : string;
    erro : string;
begin
  if FSecugen.capturar(digital, erro, cancelado) then
  begin
    if FDados.registrar_ponto(digital, erro) then
      edtStatus.Text := 'Ponto registro'
    else
      edtStatus.Text := erro;
  end
  else
  begin
    edtStatus.Text := erro;
  end;
end;

procedure TfrmSecugenCapture.FormCreate(Sender: TObject);
var erro : string;
begin
  FDados := TdtmDados.Create(Self);
  FSecugen := TItiumSecugen.Create;
  if not FSecugen.inicializar_leitor(erro) then
  begin
    edtStatus.Text := erro;
    btnInicializar.Enabled := False;
  end;
end;

procedure TfrmSecugenCapture.FormDestroy(Sender: TObject);
begin
  FDados.Free;
  FSecugen.Free;
end;

end.

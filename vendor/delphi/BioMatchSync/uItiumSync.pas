unit uItiumSync;

interface

uses
  Classes, dmDados, StdCtrls, Windows, SysUtils;

type
  TItiumSync = class(TThread)
  private
    { Private declarations }
    FDados : TdtmDados;
    FAtuBatidas : boolean;
    FAtuFuncionarios : boolean;
    FLog : TMemo;
    procedure exportar_batidas;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; _log : TMemo; _atubatidas : boolean; _atufuncionarios : boolean);
    
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TItiumSync.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TItiumSync }

constructor TItiumSync.Create(CreateSuspended: Boolean; _log : TMemo; _atubatidas : boolean; _atufuncionarios : boolean);
begin
  inherited Create (CreateSuspended);
  FLog := _log;
  FAtuBatidas := _atubatidas;
  FAtuFuncionarios := _atufuncionarios;
  FreeOnTerminate := false;
end;



procedure TItiumSync.Execute;
begin
  while (not Terminated) do
  begin
    Sleep (5000);
    Synchronize(exportar_batidas);
    Sleep (100000);
  end;
end;

procedure TItiumSync.exportar_batidas;
begin
  FLog.Lines.Add('Iniciando exportação');
  with TdtmDados.Create(nil) do
  try
    try
      exportar_batidas(FLog);
      FLog.Lines.Add('Exportação concluída');
    except
      on E:Exception do
      begin
        FLog.Lines.Add(E.Message);
      end;
    end;
  finally
    Free;
  end;
end;

end.

unit FBioMatchSync;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, ExtCtrls, uItiumSync;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    chkSyncEmployees: TCheckBox;
    chkSyncPoints: TCheckBox;
    Panel1: TPanel;
    Button1: TButton;
    ActionList1: TActionList;
    actSicronizar: TAction;
    Memo1: TMemo;
    Button2: TButton;
    actParar: TAction;
    procedure actSicronizarExecute(Sender: TObject);
    procedure actSicronizarUpdate(Sender: TObject);
    procedure actPararExecute(Sender: TObject);
    procedure actPararUpdate(Sender: TObject);
  private
    { Private declarations }
    FItiumThread : TItiumSync;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.actPararExecute(Sender: TObject);
begin
  FItiumThread.Terminate;
  FItiumThread.Free;
end;

procedure TForm1.actPararUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := FItiumThread <> nil;
end;

procedure TForm1.actSicronizarExecute(Sender: TObject);
begin
  FItiumThread := TItiumSync.Create(true, Memo1, true, true);
  FItiumThread.Resume;

end;

procedure TForm1.actSicronizarUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := chkSyncEmployees.Checked or chkSyncPoints.Checked;
end;

end.

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'BioMatch Sync'
  ClientHeight = 251
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 40
    Width = 418
    Height = 73
    Align = alTop
    Caption = ' A'#231#245'es '
    TabOrder = 0
    ExplicitTop = 0
    object chkSyncEmployees: TCheckBox
      Left = 24
      Top = 24
      Width = 281
      Height = 17
      Caption = ' Sincronizar cadastro de funcion'#225'rios'
      TabOrder = 0
    end
    object chkSyncPoints: TCheckBox
      Left = 24
      Top = 47
      Width = 193
      Height = 17
      Caption = ' Sincronizar batidas'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 40
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Action = actSicronizar
      TabOrder = 0
    end
    object Button2: TButton
      Left = 89
      Top = 9
      Width = 75
      Height = 25
      Action = actParar
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 113
    Width = 418
    Height = 138
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 40
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object ActionList1: TActionList
    Left = 376
    Top = 8
    object actSicronizar: TAction
      Caption = 'Iniciar'
      OnExecute = actSicronizarExecute
      OnUpdate = actSicronizarUpdate
    end
    object actParar: TAction
      Caption = 'Parar'
      OnExecute = actPararExecute
      OnUpdate = actPararUpdate
    end
  end
end

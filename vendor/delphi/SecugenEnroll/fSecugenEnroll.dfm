object frmSecugenEnroll: TfrmSecugenEnroll
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Digitais'
  ClientHeight = 212
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 8
    Top = 56
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  object lblMatricula: TLabel
    Left = 8
    Top = 88
    Width = 50
    Height = 13
    Caption = 'Matr'#237'cula: '
  end
  object edtStatus: TEdit
    Left = 0
    Top = 191
    Width = 401
    Height = 21
    Align = alBottom
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 154
      Height = 13
      Caption = 'Informe o n'#250'mero da matr'#237'cula: '
    end
    object edtMatricula: TEdit
      Left = 168
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnVerificar: TButton
      Left = 312
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Verificar'
      TabOrder = 1
      OnClick = btnVerificarClick
    end
  end
  object btnCapturar: TButton
    Left = 312
    Top = 160
    Width = 75
    Height = 25
    Action = actCapturar
    TabOrder = 2
  end
  object actPrincipal: TActionList
    Left = 360
    Top = 64
    object actCapturar: TAction
      Caption = 'Capturar'
      OnExecute = actCapturarExecute
      OnUpdate = actCapturarUpdate
    end
  end
end

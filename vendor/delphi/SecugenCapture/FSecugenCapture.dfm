object frmSecugenCapture: TfrmSecugenCapture
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Registro de ponto'
  ClientHeight = 212
  ClientWidth = 418
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
  object edtStatus: TEdit
    Left = 0
    Top = 191
    Width = 418
    Height = 21
    Align = alBottom
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
    ExplicitWidth = 401
  end
  object btnInicializar: TButton
    Left = 168
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Inicializar'
    TabOrder = 1
    OnClick = btnInicializarClick
  end
end

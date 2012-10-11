object frmSecugenCapture: TfrmSecugenCapture
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Registro de ponto'
  ClientHeight = 400
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object edtStatus: TEdit
    Left = 0
    Top = 0
    Width = 784
    Height = 37
    Align = alTop
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    ExplicitWidth = 418
  end
  object btnInicializar: TButton
    Left = 184
    Top = 51
    Width = 402
    Height = 25
    Caption = 'Inicializar'
    TabOrder = 1
    OnClick = btnInicializarClick
  end
end

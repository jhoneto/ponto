object frmMigrate: TfrmMigrate
  Left = 0
  Top = 0
  Caption = 'frmMigrate'
  ClientHeight = 366
  ClientWidth = 714
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
    Top = 0
    Width = 714
    Height = 105
    Align = alTop
    Caption = ' Conex'#227'o MySQL '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Servidor: '
    end
    object Label2: TLabel
      Left = 208
      Top = 24
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object Label3: TLabel
      Left = 391
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Banco de dados: '
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 43
      Height = 13
      Caption = 'Usu'#225'rio: '
    end
    object Label5: TLabel
      Left = 208
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Senha: '
    end
    object edtServerMySQL: TEdit
      Left = 69
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'localhost'
    end
    object edtPortMySQL: TEdit
      Left = 244
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '3306'
    end
    object edtBDMySQL: TEdit
      Left = 480
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'registroponto'
    end
    object edtUserMySQL: TEdit
      Left = 69
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'root'
    end
    object edtPasswordMySQL: TEdit
      Left = 244
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'root'
    end
    object Button1: TButton
      Left = 526
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 714
    Height = 105
    Align = alTop
    Caption = ' Conex'#227'o PostgreSQL '
    TabOrder = 1
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Servidor: '
    end
    object Label7: TLabel
      Left = 208
      Top = 24
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object Label8: TLabel
      Left = 391
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Banco de dados: '
    end
    object Label9: TLabel
      Left = 16
      Top = 64
      Width = 43
      Height = 13
      Caption = 'Usu'#225'rio: '
    end
    object Label10: TLabel
      Left = 208
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Senha: '
    end
    object edtServerPostgres: TEdit
      Left = 69
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'localhost'
    end
    object edtPortPostgres: TEdit
      Left = 244
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '5432'
    end
    object edtBDPostgres: TEdit
      Left = 480
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'ponto'
    end
    object edtUserPostgres: TEdit
      Left = 69
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'postgres'
    end
    object edtPasswordPostgres: TEdit
      Left = 244
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Maker@1'
    end
    object Button2: TButton
      Left = 526
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object mmoLog: TMemo
    Left = 0
    Top = 251
    Width = 714
    Height = 115
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 200
    ExplicitTop = 280
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object Panel1: TPanel
    Left = 0
    Top = 210
    Width = 714
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 184
    ExplicitTop = 224
    ExplicitWidth = 185
    object Button3: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Migrar'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object cnnMySQL: TZConnection
    Protocol = 'mysql-5'
    Left = 376
    Top = 56
  end
  object cnnPostgres: TZConnection
    Protocol = 'postgresql'
    Left = 384
    Top = 160
  end
  object qryMySQL: TZQuery
    Connection = cnnMySQL
    Params = <>
    Left = 424
    Top = 56
  end
  object qryPostgres: TZQuery
    Connection = cnnPostgres
    Params = <>
    Left = 424
    Top = 160
  end
  object qryEnterprises: TZQuery
    Connection = cnnPostgres
    SQL.Strings = (
      'select * from enterprises order by id')
    Params = <>
    Left = 464
    Top = 160
  end
end

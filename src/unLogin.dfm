object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 171
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object edtUsuario: TEdit
    Left = 78
    Top = 24
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'EDTUSUARIO'
  end
  object edtSenha: TEdit
    Left = 78
    Top = 64
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 107
    Width = 75
    Height = 25
    Caption = 'Logar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 124
    Top = 107
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end

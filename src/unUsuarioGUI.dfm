object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 419
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 55
    Width = 14
    Height = 13
    Caption = 'Id:'
  end
  object lblID: TLabel
    Left = 40
    Top = 55
    Width = 24
    Height = 13
    Caption = '0000'
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 29
    Height = 13
    Caption = 'Login:'
  end
  object Label4: TLabel
    Left = 240
    Top = 136
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object lstUsuarios: TListBox
    Left = 0
    Top = 192
    Width = 597
    Height = 227
    Align = alBottom
    ItemHeight = 13
    TabOrder = 0
    OnClick = lstUsuariosClick
  end
  object edtNome: TEdit
    Left = 56
    Top = 85
    Width = 505
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edtUsername: TEdit
    Left = 56
    Top = 133
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 2
  end
  object edtPassword: TEdit
    Left = 288
    Top = 133
    Width = 145
    Height = 21
    PasswordChar = '*'
    ReadOnly = True
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Insert'
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Edit'
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 183
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Delete'
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 264
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Cancel'
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 348
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Post'
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 429
    Top = 8
    Width = 75
    Height = 25
    Hint = 'Refresh'
    Caption = 'Atualizar'
    TabOrder = 9
    OnClick = BitBtn6Click
  end
end

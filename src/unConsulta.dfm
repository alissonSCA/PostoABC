object frmConsulta: TfrmConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Consultar Base de Dados'
  ClientHeight = 326
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 112
      Height = 13
      Caption = 'Par'#226'metro de consulta:'
    end
    object edtParametro: TEdit
      Left = 134
      Top = 13
      Width = 405
      Height = 21
      TabOrder = 0
      OnChange = edtParametroChange
      OnKeyPress = edtParametroKeyPress
    end
    object ckbDinamico: TCheckBox
      Left = 16
      Top = 49
      Width = 137
      Height = 17
      Caption = 'Buscar enquanto digita?'
      TabOrder = 2
    end
    object btnBuscar: TBitBtn
      Left = 464
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 566
    Height = 245
    Align = alClient
    DataSource = dtsCons
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object qryCons: TFDQuery
    Connection = DM.FDConnection1
    Left = 280
    Top = 168
  end
  object dtsCons: TDataSource
    DataSet = qryCons
    Left = 224
    Top = 152
  end
end

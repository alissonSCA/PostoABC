object frmCombustivel: TfrmCombustivel
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Combustiveis'
  ClientHeight = 397
  ClientWidth = 704
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
    Top = 8
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
    FocusControl = DBEdit3
  end
  object DBText1: TDBText
    Left = 24
    Top = 25
    Width = 65
    Height = 17
    DataField = 'ID'
    DataSource = dtsCombustiveis
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 64
    Width = 394
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dtsCombustiveis
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 104
    Width = 251
    Height = 21
    DataField = 'PRECO'
    DataSource = dtsCombustiveis
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 153
    Width = 704
    Height = 25
    DataSource = dtsCombustiveis
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 147
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 178
    Width = 704
    Height = 219
    Align = alBottom
    DataSource = dtsCombustiveis
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object qryCombustiveis: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEL')
    Left = 536
    Top = 32
    object qryCombustiveisID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCombustiveisDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
    object qryCombustiveisPRECO: TBCDField
      DisplayLabel = 'Pre'#231'o (R$)'
      FieldName = 'PRECO'
      Origin = 'PRECO'
      EditFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
  end
  object dtsCombustiveis: TDataSource
    DataSet = qryCombustiveis
    Left = 448
    Top = 16
  end
end

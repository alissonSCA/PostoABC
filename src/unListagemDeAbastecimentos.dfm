object frmListagemAbastecimento: TfrmListagemAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmListagemAbastecimento'
  ClientHeight = 498
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 42
    Top = 24
    Width = 794
    Height = 1123
    DataSource = dtsListagemAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = RLExpressionParser1
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 19
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 4
        Top = 2
        Width = 33
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 452
        Top = -1
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 515
        Top = 2
        Width = 46
        Height = 16
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 659
        Top = 2
        Width = 54
        Height = 16
        Caption = 'Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 616
        Top = 2
        Width = 36
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 135
        Top = 2
        Width = 109
        Height = 16
        Caption = 'Bomba - Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 347
        Top = 2
        Width = 82
        Height = 16
        Caption = 'Combustivel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 57
      Width = 718
      Height = 20
      object RLDBText1: TRLDBText
        Left = 4
        Top = 2
        Width = 124
        Height = 16
        AutoSize = False
        DataField = 'DATA'
        DataSource = dtsListagemAbastecimento
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 135
        Top = 1
        Width = 22
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'BOMBA'
        DataSource = dtsListagemAbastecimento
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 161
        Top = 2
        Width = 166
        Height = 16
        AutoSize = False
        DataField = 'tanque'
        DataSource = dtsListagemAbastecimento
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 347
        Top = 2
        Width = 93
        Height = 16
        AutoSize = False
        DataField = 'combustivel'
        DataSource = dtsListagemAbastecimento
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 452
        Top = 2
        Width = 41
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'PRECO'
        DataSource = dtsListagemAbastecimento
        DisplayMask = '#,##0.00'
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 500
        Top = 2
        Width = 61
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'QUANTIDADE'
        DataSource = dtsListagemAbastecimento
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 566
        Top = 2
        Width = 86
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'TOTAL'
        DataSource = dtsListagemAbastecimento
        DisplayMask = '#,##0.00'
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 659
        Top = 2
        Width = 54
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'IMPOSTO'
        DataSource = dtsListagemAbastecimento
        DisplayMask = '#,##0.00'
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 77
      Width = 718
      Height = 20
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult1: TRLDBResult
        Left = 566
        Top = 2
        Width = 86
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'sum(total)'
        DataSource = dtsListagemAbastecimento
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBResult2: TRLDBResult
        Left = 659
        Top = 2
        Width = 54
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'sum(imposto)'
        DataSource = dtsListagemAbastecimento
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
  end
  object qryListagemAbastecimento: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select'
      '    a.data,'
      '    a.bomba,'
      '    t.descricao as "tanque",'
      '    c.descricao as "combustivel",'
      '    a.quantidade,'
      '    a.preco,'
      '    a.total,'
      '    a.imposto'
      'from'
      '    abastecimento a inner join bombas b on'
      '        a.bomba = b.id'
      '    inner join tanque t on'
      '        a.tanque = t.id'
      '    inner join combustivel c on'
      '        a.combustivel = c.id'
      'order by'
      '   a.data desc')
    Left = 248
    Top = 240
  end
  object dtsListagemAbastecimento: TDataSource
    DataSet = qryListagemAbastecimento
    Left = 392
    Top = 256
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 418
    Top = 184
  end
end

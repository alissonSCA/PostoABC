object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto ABC - Sistema de gerenciamento de abastecimentos'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 296
    Top = 88
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object Combustiveis1: TMenuItem
        Caption = 'Combustiveis'
        OnClick = Combustiveis1Click
      end
      object anques1: TMenuItem
        Caption = 'Tanques'
        OnClick = anques1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
    end
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object Abastecer1: TMenuItem
        Caption = 'Abastecer'
        OnClick = Abastecer1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object ListagemdeAbastecimentos1: TMenuItem
        Caption = 'Listagem de Abastecimentos'
        OnClick = ListagemdeAbastecimentos1Click
      end
    end
  end
end

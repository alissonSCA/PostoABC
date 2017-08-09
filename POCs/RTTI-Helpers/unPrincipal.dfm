object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Helpers e RTTI'
  ClientHeight = 451
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 256
    Top = 0
    Width = 438
    Height = 451
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
    ExplicitLeft = 264
    ExplicitTop = -8
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 48
    Width = 145
    Height = 25
    Caption = 'ListBox Helper'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 48
    Top = 17
    Width = 145
    Height = 25
    Caption = 'Preencher ListBox'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 48
    Top = 88
    Width = 145
    Height = 25
    Caption = 'RecordHelper'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
end

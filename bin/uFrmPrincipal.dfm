object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'DFP Posto Combustivel'
  ClientHeight = 115
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 295
    object btnVenda: TSpeedButton
      Left = 152
      Top = 16
      Width = 113
      Height = 73
      Caption = 'Venda'
      OnClick = btnVendaClick
    end
    object btnGerenciamento: TSpeedButton
      Left = 16
      Top = 16
      Width = 113
      Height = 73
      Caption = 'Gerenciamento Vendas'
      OnClick = btnGerenciamentoClick
    end
  end
end

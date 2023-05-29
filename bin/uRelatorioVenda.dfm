object frmRelatorioVenda: TfrmRelatorioVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda'
  ClientHeight = 556
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlRelatorioVenda: TRLReport
    AlignWithMargins = True
    Left = -8
    Top = -24
    Width = 794
    Height = 1123
    AdjustableMargins = True
    DataSource = frmRelatorioGrid.dsRelatorioVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 111
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 216
        Top = 16
        Width = 258
        Height = 32
        Caption = 'Relat'#243'rio de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPosto: TRLLabel
        Left = 16
        Top = 56
        Width = 43
        Height = 16
        Caption = 'Posto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtPosto: TRLDBText
        Left = 72
        Top = 56
        Width = 88
        Height = 16
        DataField = 'NOMEPOSTO'
        DataSource = frmRelatorioGrid.dsPosto
        Text = ''
      end
      object lblCNPJ: TRLLabel
        Left = 16
        Top = 80
        Width = 42
        Height = 16
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtCNPJ: TRLDBText
        Left = 72
        Top = 78
        Width = 37
        Height = 16
        DataField = 'CNPJ'
        DataSource = frmRelatorioGrid.dsPosto
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 149
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object lblDataVenda: TRLLabel
        Left = 16
        Top = 6
        Width = 90
        Height = 16
        Caption = 'Data da Venda'
      end
      object lblTanque: TRLLabel
        Left = 184
        Top = 6
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object lblBomba: TRLLabel
        Left = 352
        Top = 6
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object lblValorTotalBomba: TRLLabel
        Left = 480
        Top = 6
        Width = 152
        Height = 16
        Caption = 'Valor Total Venda Bomba'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 173
      Width = 718
      Height = 24
      object dbtxtDataVenda: TRLDBText
        Left = 16
        Top = 6
        Width = 83
        Height = 16
        DataField = 'DATAVENDA'
        DataSource = frmRelatorioGrid.dsRelatorioVenda
        Text = ''
      end
      object dbtxtTanque: TRLDBText
        Left = 184
        Top = 6
        Width = 43
        Height = 16
        DataField = 'NOME'
        DataSource = frmRelatorioGrid.dsRelatorioVenda
        Text = ''
      end
      object dbtxtBomba: TRLDBText
        Left = 352
        Top = 6
        Width = 57
        Height = 16
        DataField = 'NOME_1'
        DataSource = frmRelatorioGrid.dsRelatorioVenda
        Text = ''
      end
      object dbtxtValorBomba: TRLDBText
        Left = 511
        Top = 6
        Width = 88
        Height = 16
        DataField = 'VALORTOTAL'
        DataSource = frmRelatorioGrid.dsRelatorioVenda
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 197
      Width = 718
      Height = 40
      BandType = btSummary
      object RLLabel2: TRLLabel
        Left = 480
        Top = 20
        Width = 40
        Height = 16
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbResultTotal: TRLDBResult
        Left = 528
        Top = 20
        Width = 133
        Height = 16
        DataField = 'VALORTOTAL'
        DataSource = frmRelatorioGrid.dsRelatorioVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
  end
end

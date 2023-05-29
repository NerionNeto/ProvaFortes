object frmRelatorioGrid: TfrmRelatorioGrid
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relat'#243'rio de Venda'
  ClientHeight = 294
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 260
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlSuperior'
    TabOrder = 0
    object grdRelatorioVenda: TDBGrid
      Left = 0
      Top = 0
      Width = 446
      Height = 260
      Align = alClient
      DataSource = dsRelatorioVenda
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAVENDA'
          Title.Caption = 'Data Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_1'
          Title.Caption = 'Bomba'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Tanque'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORTOTAL'
          Title.Caption = 'Valor Total'
          Width = 80
          Visible = True
        end>
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 253
    Width = 446
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSair: TButton
      Left = 352
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnImprimir: TButton
      Left = 24
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnImprimirClick
    end
  end
  object qryRelatorioVenda: TFDQuery
    Connection = DataModuleBanco.ConnDFPBanco
    SQL.Strings = (
      'SELECT V.DATAVENDA,'
      '  T.NOME, '
      '  B.NOME, '
      '  SUM(V.VALORTOTAL) AS VALORTOTAL'
      'FROM'
      '  VENDA V'
      '  JOIN BOMBA B ON B.ID = V.IDBOMBA'
      '  JOIN TANQUE T ON T.TIPOCOMBUSTIVEL = B.TIPOCOMBUSTIVEL'
      'GROUP BY V.DATAVENDA, B.NOME')
    Left = 216
    Top = 104
    object qryRelatorioVendaDATAVENDA: TDateTimeField
      FieldName = 'DATAVENDA'
      Origin = 'DATAVENDA'
      Required = True
    end
    object qryRelatorioVendaNOME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryRelatorioVendaNOME_1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_1'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryRelatorioVendaVALORTOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object dsRelatorioVenda: TDataSource
    DataSet = qryRelatorioVenda
    Left = 312
    Top = 104
  end
  object qryPosto: TFDQuery
    Connection = DataModuleBanco.ConnDFPBanco
    SQL.Strings = (
      'SELECT *  FROM CADASTRO')
    Left = 216
    Top = 160
    object qryPostoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPostoNOMEPOSTO: TWideStringField
      FieldName = 'NOMEPOSTO'
      Origin = 'NOMEPOSTO'
      Required = True
      Size = 32767
    end
    object qryPostoCNPJ: TLargeintField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
  end
  object dsPosto: TDataSource
    DataSet = qryPosto
    Left = 304
    Top = 160
  end
end

object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Venda'
  ClientHeight = 317
  ClientWidth = 447
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
    Width = 447
    Height = 121
    Align = alTop
    TabOrder = 0
    object lblLitro: TLabel
      Left = 194
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Litro(s):'
    end
    object lblTipoCombustivel: TLabel
      Left = 9
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Tipo Combustivel:'
    end
    object lblDataVenda: TLabel
      Left = 8
      Top = 64
      Width = 75
      Height = 13
      Caption = 'Data da Venda:'
    end
    object lblBomba: TLabel
      Left = 194
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Bomba:'
    end
    object cbBomba: TDBLookupComboBox
      Left = 194
      Top = 27
      Width = 135
      Height = 21
      DataField = 'NOME'
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsBomba
      TabOrder = 1
    end
    object edtLitro: TEdit
      Left = 194
      Top = 83
      Width = 89
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object dtpDataVenda: TDateTimePicker
      Left = 8
      Top = 83
      Width = 85
      Height = 21
      Date = 45074.000000000000000000
      Time = 0.948214108793763400
      TabOrder = 2
    end
    object cbTipoCombustivel: TComboBox
      Left = 9
      Top = 27
      Width = 85
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      OnChange = cbTipoCombustivelChange
      OnExit = cbTipoCombustivelExit
      Items.Strings = (
        ''
        'Gasolina'
        'Diesel')
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 120
    Width = 447
    Height = 197
    Align = alBottom
    Caption = 'pnlInferior'
    TabOrder = 1
    object grdVenda: TDBGrid
      Left = 0
      Top = 39
      Width = 447
      Height = 120
      DataSource = dsVenda
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grdVendaCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'ID Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAVENDA'
          Title.Caption = 'Data Venda'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOCOMBUSTIVEL'
          Title.Caption = 'Tipo Comb.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITRO'
          Title.Caption = 'Litro(s)'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORLITRO'
          Title.Caption = 'Valor Litro'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTO'
          Title.Caption = 'Imposto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORTOTAL'
          Title.Caption = 'Valor Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Bomba'
          Width = 75
          Visible = True
        end>
    end
    object btnSair: TButton
      Left = 352
      Top = 165
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnInserir: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 2
      OnClick = btnInserirClick
    end
    object btnDeletar: TButton
      Left = 102
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Deletar'
      TabOrder = 3
      OnClick = btnDeletarClick
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    Left = 160
    Top = 160
  end
  object qryVenda: TFDQuery
    Connection = DataModuleBanco.ConnDFPBanco
    SQL.Strings = (
      'SELECT '
      '  V.ID,'
      '  V.VALORLITRO, '
      '  V.DATAVENDA, '
      '  V.IMPOSTO, '
      '  V.LITRO,'
      '  V.TIPOCOMBUSTIVEL,'
      '  V.VALORTOTAL,'
      '  V.IDBOMBA,'
      '  B.NOME'
      'FROM VENDA V'
      '  JOIN BOMBA B ON B.ID = V.IDBOMBA')
    Left = 219
    Top = 160
    object qryVendaVALORLITRO: TBCDField
      FieldName = 'VALORLITRO'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object qryVendaTIPOCOMBUSTIVEL: TWideStringField
      FieldName = 'TIPOCOMBUSTIVEL'
      Required = True
      Size = 32767
    end
    object qryVendaIMPOSTO: TBCDField
      FieldName = 'IMPOSTO'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object qryVendaLITRO: TIntegerField
      FieldName = 'LITRO'
      Required = True
    end
    object qryVendaDATAVENDA: TDateTimeField
      FieldName = 'DATAVENDA'
      Required = True
    end
    object qryVendaVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object qryVendaNOME: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryVendaIDBOMBA: TIntegerField
      FieldName = 'IDBOMBA'
      Origin = 'IDBOMBA'
      Required = True
    end
    object qryVendaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object qryBomba: TFDQuery
    Connection = DataModuleBanco.ConnDFPBanco
    SQL.Strings = (
      'SELECT * FROM BOMBA'
      'WHERE TIPOCOMBUSTIVEL = :PTIPOCOMBUSTIVEL')
    Left = 288
    Top = 224
    ParamData = <
      item
        Name = 'PTIPOCOMBUSTIVEL'
        ParamType = ptInput
      end>
    object qryBombaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryBombaNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 32767
    end
    object qryBombaTIPOCOMBUSTIVEL: TWideStringField
      FieldName = 'TIPOCOMBUSTIVEL'
      Origin = 'TIPOCOMBUSTIVEL'
      Required = True
      Size = 32767
    end
    object qryBombaVALORLITRO: TBCDField
      FieldName = 'VALORLITRO'
      Origin = 'VALORLITRO'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 216
    Top = 224
  end
end

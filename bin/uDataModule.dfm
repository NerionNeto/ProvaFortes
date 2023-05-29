object DataModuleBanco: TDataModuleBanco
  OldCreateOrder = False
  Height = 181
  Width = 276
  object ConnDFPBanco: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\nerio\Desktop\Prova\Teste Fortes\DFPPostoGasol' +
        'ina.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 72
    Top = 24
  end
  object qryInsert: TFDQuery
    Connection = ConnDFPBanco
    Left = 32
    Top = 119
  end
  object qrySelect: TFDQuery
    Connection = ConnDFPBanco
    Left = 88
    Top = 119
  end
  object qryDelete: TFDQuery
    Connection = ConnDFPBanco
    Left = 152
    Top = 119
  end
  object dsInsert: TDataSource
    DataSet = qryInsert
    Left = 31
    Top = 78
  end
  object dsSelect: TDataSource
    DataSet = qrySelect
    Left = 87
    Top = 78
  end
  object dsDelete: TDataSource
    DataSet = qryDelete
    Left = 151
    Top = 78
  end
end

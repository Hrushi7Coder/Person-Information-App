object dmGeneral: TdmGeneral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 292
  Width = 673
  object adMainConnection: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 320
    Top = 128
  end
  object tblGeneral: TADOTable
    Connection = adMainConnection
    TableName = 'persondata'
    Left = 296
    Top = 176
  end
  object qryGeneral: TADOQuery
    Connection = adMainConnection
    Parameters = <>
    Left = 392
    Top = 144
    object qryGeneralIdentNr: TStringField
      FieldName = 'IdentNr'
    end
  end
  object dsPersonalInfo: TDataSource
    DataSet = tblGeneral
    Left = 376
    Top = 200
  end
end

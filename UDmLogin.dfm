object DmLogin: TDmLogin
  OldCreateOrder = False
  Height = 254
  Width = 370
  object qLogin: TADOQuery
    Connection = DmConexao.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Usuario')
    Left = 144
    Top = 48
    object qLoginCD_USU: TAutoIncField
      FieldName = 'CD_USU'
    end
    object qLoginNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Size = 50
    end
    object qLoginLOGIN_USU: TStringField
      FieldName = 'LOGIN_USU'
    end
    object qLoginSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
    end
  end
  object DsLogin: TDataSource
    DataSet = qLogin
    Left = 208
    Top = 40
  end
end

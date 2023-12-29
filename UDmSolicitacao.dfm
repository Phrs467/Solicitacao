object DmSolicitacao: TDmSolicitacao
  OldCreateOrder = False
  Height = 209
  Width = 296
  object qSolicitacao: TADOQuery
    Connection = DmConexao.Conexao
    Parameters = <>
    Left = 48
    Top = 48
  end
  object qPesqSolicitacao: TADOQuery
    Connection = DmConexao.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      'IDSolicitacao,'
      'Usuario,'
      'Descricao_Solicitacao,'
      'Texto_Solicitacao,'
      'Imagem'
      'from Solicitacao')
    Left = 176
    Top = 48
    object qPesqSolicitacaoIDSolicitacao: TIntegerField
      FieldName = 'IDSolicitacao'
    end
    object qPesqSolicitacaoUsuario: TStringField
      FieldName = 'Usuario'
    end
    object qPesqSolicitacaoDescricao_Solicitacao: TStringField
      FieldName = 'Descricao_Solicitacao'
      Size = 50
    end
    object qPesqSolicitacaoTexto_Solicitacao: TStringField
      DisplayWidth = 20
      FieldName = 'Texto_Solicitacao'
      Size = 500
    end
    object qPesqSolicitacaoImagem: TStringField
      FieldName = 'Imagem'
      Size = 80
    end
  end
  object dsPesqSolicitacao: TDataSource
    DataSet = qPesqSolicitacao
    Left = 176
    Top = 120
  end
end

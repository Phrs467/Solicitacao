object DmConexao: TDmConexao
  OldCreateOrder = False
  Height = 176
  Width = 229
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=saoba123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=ProjetoSolicitacao;Data Source=DESEN' +
      'V5'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 96
    Top = 64
  end
end

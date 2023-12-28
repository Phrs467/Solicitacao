unit USolicitacao;

interface
uses
  SysUtils;

Type
  TSolicitacao = class
  private
    FId : Integer;
    FUsuario : String;
    FDescricao : String;
    FSolicitacao : String;
    FImagem : string;
  public
    Property Id : Integer read FId write FId;
    Property Usuario : String read FUsuario write FUsuario;
    Property Descricao : String read FDescricao write FDescricao;
    Property Solicitacao : String read FSolicitacao write FSolicitacao;
    Property Imagem : string read FImagem write FImagem;

    Function incluir : Boolean;
  end;

implementation

uses UDmSolicitacao;

{ TSolicitacao }

function TSolicitacao.incluir: Boolean;
var
  sqlInsert, sqlCampos, sqlValues : string;
begin
  Result := True;

  try
    sqlCampos :=
    '  INSERT INTO Solicitacao          '+
    '           (Usuario                '+
    '           ,Descricao_Solicitacao  '+
    '           ,Texto_Solicitacao      '+
    '           ,Imagem                 '+
    '                           )       ';

    sqlValues :=
    '   VALUES (                         '+
    '           :Usuario                 '+
    '           ,:Descricao_Solicitacao  '+
    '           ,:Texto_Solicitacao      '+
    '           ,:Imagem                 '+
    '                           )        ';

    sqlInsert:= sqlCampos + sqlValues;

    DmSolicitacao.qSolicitacao.Close;
    DmSolicitacao.qSolicitacao.SQL.Text := sqlInsert;

    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Usuario').Value := Self.Usuario;
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Descricao_Solicitacao').Value := Self.Descricao;
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Texto_Solicitacao').Value := Self.Solicitacao;
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Imagem').Value := Self.Imagem;

    DmSolicitacao.qSolicitacao.ExecSQL;

  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.

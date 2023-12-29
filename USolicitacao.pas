unit USolicitacao;

interface
uses
  SysUtils, Classes,Datasnap.DBClient, Data.DB ;

Type
  TSolicitacao = class
  private
    FId : Integer;
    FUsuario : String;
    FDescricao : String;
    FTextoSolicitacao : String;
    FImagem : string;
  public
    Property Id : Integer read FId write FId;
    Property Usuario : String read FUsuario write FUsuario;
    Property Descricao : String read FDescricao write FDescricao;
    Property TextoSolicitacao : String read FTextoSolicitacao write FTextoSolicitacao;
    Property Imagem : string read FImagem write FImagem;

    Function incluir : Boolean;
    Function Pesquisar : Boolean;
  end;

implementation

uses UDmSolicitacao;

{ TSolicitacao }

function TSolicitacao.incluir: Boolean;
var
  sqlInsert, sqlCampos, sqlValues : string;
  Stream: TMemoryStream;
begin
  Result := True;
  Stream := TMemoryStream.Create;

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
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Texto_Solicitacao').Value := Self.TextoSolicitacao;
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('Imagem').Value := Self.Imagem;

    DmSolicitacao.qSolicitacao.ExecSQL;

  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TSolicitacao.Pesquisar: Boolean;
var
  sql : string;

begin
  Result := True;

  try
    sql :=
        '  select                 '+
        '  IDSolicitacao,         '+
        '  Usuario,               '+
        '  Descricao_Solicitacao, '+
        '  Texto_Solicitacao,     '+
        '  Imagem                 '+
        '  from Solicitacao       ';

    sql := sql + ' where IDSolicitacao = :IDSolicitacao ';

    DmSolicitacao.qSolicitacao.Close;
    DmSolicitacao.qSolicitacao.SQL.Text := sql;
    DmSolicitacao.qSolicitacao.Parameters.ParamByName('IDSolicitacao').Value := Self.Id;
    DmSolicitacao.qSolicitacao.Open;

    Result := not DmSolicitacao.qSolicitacao.IsEmpty;

    if Result then
    begin
      Self.Usuario := DmSolicitacao.qSolicitacao.FieldByName('Usuario').AsString;
      Self.Descricao := DmSolicitacao.qSolicitacao.FieldByName('Descricao_Solicitacao').AsString;
      Self.TextoSolicitacao := DmSolicitacao.qSolicitacao.FieldByName('Texto_Solicitacao').AsString;
      Self.Imagem := DmSolicitacao.qSolicitacao.FieldByName('Imagem').AsString;
    end;

  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;

end;

end.

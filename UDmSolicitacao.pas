unit UDmSolicitacao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.DBClient;

type
  TDmSolicitacao = class(TDataModule)
    qSolicitacao: TADOQuery;
    qPesqSolicitacao: TADOQuery;
    dsPesqSolicitacao: TDataSource;
    qPesqSolicitacaoUsuario: TStringField;
    qPesqSolicitacaoIDSolicitacao: TIntegerField;
    qPesqSolicitacaoDescricao_Solicitacao: TStringField;
    qPesqSolicitacaoTexto_Solicitacao: TStringField;
    qPesqSolicitacaoImagem: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSolicitacao: TDmSolicitacao;

implementation

uses
  UConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

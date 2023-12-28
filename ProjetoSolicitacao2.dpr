program ProjetoSolicitacao2;

uses
  Vcl.Forms,
  UConexao in 'UConexao.pas' {DmConexao: TDataModule},
  UDmLogin in 'UDmLogin.pas' {DmLogin: TDataModule},
  UDmSolicitacao in 'UDmSolicitacao.pas' {DmSolicitacao: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FormSolicitacao},
  UPrint in 'UPrint.pas' {Captura},
  USolicitacao in 'USolicitacao.pas',
  UTelaLogin in 'UTelaLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmSolicitacao, DmSolicitacao);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmLogin, DmLogin);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormSolicitacao, FormSolicitacao);
  Application.CreateForm(TCaptura, Captura);
  Application.Run;
end.

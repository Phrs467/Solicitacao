unit UTelaLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormLogin = class(TForm)
    edt_Login: TLabeledEdit;
    edt_Senha: TLabeledEdit;
    btn_Entrar: TButton;
    Label1: TLabel;
    procedure btn_EntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses
  UDmLogin, UPrincipal;

procedure TFormLogin.btn_EntrarClick(Sender: TObject);
var
  bconectado : Boolean;
begin
  DmLogin.qLogin.Close;
  DmLogin.qLogin.SQL.Clear;
  DmLogin.qLogin.SQL.Text := 'SELECT * FROM Usuario where LOGIN_USU ='''+ edt_Login.Text +
  ''' and SENHA_USU ='''+edt_Senha.Text+''' ';
  DmLogin.qLogin.Active := True;


  if DmLogin.qLogin.RecordCount >0 then
  begin
    DmLogin.ID_Logado := DmLogin.qLogin.FieldByName('CD_USU').AsString;
    DmLogin.Usuario_Logado := DmLogin.qLogin.FieldByName('NOME_USU').AsString;
    FormSolicitacao.ShowModal;
    Self.Hide;
  end
  else
    ShowMessage('Usuário ou senha inválidos!');
end;

end.

unit UPesqSolicitacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormPesqSolicitacao = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    btnPesquisar: TButton;
    Selecionar: TButton;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    procedure btnPesquisarClick(Sender: TObject);
    procedure SelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FrmIdSolicitacao  : Integer;
    FrmUsuario    : string;
  end;

var
  FormPesqSolicitacao: TFormPesqSolicitacao;

implementation

uses
  UDmSolicitacao;

{$R *.dfm}

procedure TFormPesqSolicitacao.btnPesquisarClick(Sender: TObject);
var
  sql : String;
begin
  sql :=
  '  select                 '+
  '  IDSolicitacao,         '+
  '  Usuario,               '+
  '  Descricao_Solicitacao, '+
  '  Texto_Solicitacao,     '+
  '  Imagem                 '+
  '  from Solicitacao       ';

  if RadioGroup1.ItemIndex = 0 then
  begin
    DmSolicitacao.qPesqSolicitacao.Close;
    DmSolicitacao.qPesqSolicitacao.SQL.Text := sql;
    DmSolicitacao.qPesqSolicitacao.Open;
  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
    sql := sql + ' where Usuario like ''%' + Edit1.Text + '%''';

    DmSolicitacao.qPesqSolicitacao.Close;
    DmSolicitacao.qPesqSolicitacao.SQL.Text := sql;
    DmSolicitacao.qPesqSolicitacao.Open;
  end;
end;

procedure TFormPesqSolicitacao.SelecionarClick(Sender: TObject);
begin
  FrmIdSolicitacao := 0;
  FrmUsuario := '';
  if not DmSolicitacao.qPesqSolicitacao.IsEmpty then
  begin
     FrmIdSolicitacao := DmSolicitacao.qPesqSolicitacaoIDSolicitacao.AsInteger;
     FrmUsuario := DmSolicitacao.qPesqSolicitacaoUsuario.AsString;
  end;
  Self.Close;
end;

end.

unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,UDmSolicitacao,USolicitacao,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.ExtDlgs;

type
  TFormSolicitacao = class(TForm)
    EditId: TEdit;
    Labelid: TLabel;
    EditUsu�rio: TEdit;
    LabelUsu�rio: TLabel;
    EditDescricao: TEdit;
    LabelDescricao: TLabel;
    MemoSolicitacao: TMemo;
    LabelSolicitacao: TLabel;
    ButtonSalvar: TButton;
    ButtonNovo: TButton;
    btn_CapturarTela: TButton;
    Label4: TLabel;
    edtArquivoAnexo: TEdit;
    btnSelecArquivo: TButton;
    odArquivo: TOpenDialog;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Fechar1: TMenuItem;
    Abrir: TOpenPictureDialog;
    Image1: TImage;
    Panel1: TPanel;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure btn_CapturarTelaClick(Sender: TObject);
    procedure btnSelecArquivoClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Solicitacao :  TSolicitacao;

    procedure LimparForm;
  public
    { Public declarations }
  end;

var
  FormSolicitacao: TFormSolicitacao;

implementation

uses
  UPrint, UDmLogin;
{$R *.dfm}


procedure TFormSolicitacao.btnSelecArquivoClick(Sender: TObject);
var
  FName : string;
begin
  odArquivo.FileName := '*.*';
  if odArquivo.Execute then
  begin
    FName := odArquivo.FileName;
    edtArquivoAnexo.Text := FName;
  end;
end;

procedure TFormSolicitacao.btn_CapturarTelaClick(Sender: TObject);
var
  form : TCaptura;
begin
  form := TCaptura.Create(nil);
  form.ShowModal;
  FreeAndNil(form);
end;

procedure TFormSolicitacao.ButtonNovoClick(Sender: TObject);
begin
  EditDescricao.Enabled := True;
  MemoSolicitacao.Enabled := True;
  edtArquivoAnexo.Enabled := True;
  btnSelecArquivo.Enabled := True;
  EditId.Enabled := True;
  EditUsu�rio.Enabled := True;

  if (EditUsu�rio.Text <> '') or (EditDescricao.Text <> '') or (MemoSolicitacao.Text <> '') then
  begin
    if Application.MessageBox('Voc� deseja limpar os dados preenchidos? ', 'Aviso',
    MB_ICONQUESTION+MB_YESNO) = mrNo then
    Exit;
  end;

  LimparForm;

  EditUsu�rio.Text := DmLogin.Usuario_Logado;
end;

procedure TFormSolicitacao.ButtonSalvarClick(Sender: TObject);
begin
  Solicitacao := TSolicitacao.Create;

  Solicitacao.Usuario := EditUsu�rio.Text;
  Solicitacao.Descricao := EditDescricao.Text;
  Solicitacao.Solicitacao := MemoSolicitacao.Text;

  if EditUsu�rio.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher o Usu�rio' , 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    Abort
  end;

  if EditDescricao.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher a Descri��o', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  if MemoSolicitacao.Text = '' then
  begin
    Application.MessageBox('Voc� deve preencher a Soliticao', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
    abort
  end;

  Solicitacao.incluir;

  Solicitacao.Free;
end;


procedure TFormSolicitacao.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormSolicitacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFormSolicitacao.FormCreate(Sender: TObject);
begin
  EditDescricao.Enabled := False;
  MemoSolicitacao.Enabled := False;
  edtArquivoAnexo.Enabled := False;
  btnSelecArquivo.Enabled := False;
  EditId.Enabled := False;
  EditUsu�rio.Enabled := False;
end;

procedure TFormSolicitacao.LimparForm;
begin
  EditUsu�rio.Clear;
  EditDescricao.Clear;
  MemoSolicitacao.Clear;
end;

end.

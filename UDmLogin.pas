unit UDmLogin;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDmLogin = class(TDataModule)
    qLogin: TADOQuery;
    DsLogin: TDataSource;
    qLoginCD_USU: TAutoIncField;
    qLoginNOME_USU: TStringField;
    qLoginLOGIN_USU: TStringField;
    qLoginSENHA_USU: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Logado : String;
    Usuario_Logado : string;
  end;

var
  DmLogin: TDmLogin;

implementation

uses
  UConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

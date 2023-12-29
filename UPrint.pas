unit UPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TCaptura = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    TimerContagem: TTimer;
    Label1: TLabel;
    btn_SalvarImg: TButton;
    SavePictureDialog1: TSavePictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure TimerContagemTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SalvarImgClick(Sender: TObject);
  private
    { Private declarations }
    Contagem : Integer;
  public
    { Public declarations }
    procedure CapturarCursor(ACanvas : TCanvas; Posicao : TPoint);
    function CapturarTela: TBitmap;

  end;

var
  Captura: TCaptura;

implementation

{$R *.dfm}

{ TForm1 }

procedure TCaptura.Button1Click(Sender: TObject);
begin
  TimerContagem.Enabled := True;
  Label1.Visible := True;
//  ShowMessage(Label1.Caption);

  Color := clLime;
  TransparentColorValue := clLime;
  TransparentColor := True;
  Panel1.Visible := False;
  BorderStyle := bsNone;
end;

procedure TCaptura.btn_SalvarImgClick(Sender: TObject);
begin
//  // Exibe o di�logo de salvamento
//  if SaveDialog1.Execute then
//  begin
//    // Verifica se a extens�o do arquivo � v�lida e a adiciona, se necess�rio
//    if ExtractFileExt(SaveDialog1.FileName) = '' then
//      SaveDialog1.FileName := SaveDialog1.FileName + '.bmp'; // Voc� pode escolher o formato desejado aqui
//
//    // Salva a imagem do TImage no arquivo especificado
//    Image1.Picture.Bitmap.SaveToFile(SaveDialog1.FileName);
//  end;

   if SavePictureDialog1.Execute then
     Image1.Picture.SaveToFile(SavePictureDialog1.FileName + '.jpg');

end;

procedure TCaptura.CapturarCursor(ACanvas: TCanvas; Posicao: TPoint);
var
  HCursor : THandle;
begin
  HCursor := GetCursor;
  DrawIconEx(ACanvas.Handle, Posicao.X, Posicao.Y, HCursor, 32, 32, 0, 0, DI_NORMAL);
end;

function TCaptura.CapturarTela: TBitmap;
var
  dc : HDC;
  cv: TCanvas;//tcanvas para poder extrair a imagem da tela
  CurPos: TPoint;
begin
  Result := TBitmap.Create;
  try
    Result.Width := Screen.Width;
    Result.Height := Screen.Height;

    dc := GetDC(0);
    cv := TCanvas.Create;
    cv.Handle := dc;

    //CopyRect para copiar a imagem da tela para a propriedade Canvas da classe TBitMap
    Result.Canvas.CopyRect(Rect(0,0, Screen.Width, Screen.Height), cv, Rect(0,0, Screen.Width, Screen.Height));
    cv.Free;
    ReleaseDC(0, dc);
    GetCursorPos(CurPos);
    CapturarCursor(Result.Canvas, CurPos);
  finally
    ReleaseDC(WindowHandle, dc);
  end;
end;

procedure TCaptura.FormCreate(Sender: TObject);
begin
  Contagem := 5;
end;

procedure TCaptura.TimerContagemTimer(Sender: TObject);
begin
  Contagem := Contagem -1;
  Label1.Caption := 'Realizando Print em: ' + IntToStr(Contagem);

  if Contagem = 0 then
  begin
    TimerContagem.Enabled := False;

    Label1.Visible := False;
    Application.ProcessMessages;
    Image1.Visible :=  true;
    Image1.Align := alClient;
    Image1.Picture.Assign(CapturarTela);
    Panel1.Visible := True;
    BorderStyle := bsSingle;

    TransparentColor := False;
    Color := clBtnFace;
  end;

end;

end.

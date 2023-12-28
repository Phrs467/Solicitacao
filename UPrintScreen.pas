unit UPrintScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormCapturar = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    function CapturarTela : TBitmap;
  end;

var
  FormCapturar: TFormCapturar;

implementation

{$R *.dfm}

{ TForm1 }

function TFormCapturar.CapturarTela: TBitmap;
var
  dc : HDC;
  cv: TCanvas;//tcanvas para poder extrair a imagem da tela
begin
  Result := TBitmap.Create;
  Result.Width := Screen.Width;
  Result.Height := Screen.Height;

  dc := GetDC(0);
  cv := TCanvas.Create;
  cv.Handle := dc;

  //CopyRect para copiar a imagem da tela para a propriedade Canvas da classe TBitMap
  Result.Canvas.CopyRect(Rect(0,0, Screen.Width, Screen.Height), cv, Rect(0,0, Screen.Width, Screen.Height));
  cv.Free;
  ReleaseDC(0, dc);
end;

end.

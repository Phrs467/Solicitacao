object Captura: TCaptura
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Captura'
  ClientHeight = 472
  ClientWidth = 694
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 449
    Height = 410
    Align = alCustom
    Stretch = True
    Visible = False
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 694
    Height = 410
    Align = alClient
    Alignment = taCenter
    BiDiMode = bdLeftToRight
    Caption = 'Realizando Print em: 5'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
    ExplicitWidth = 237
    ExplicitHeight = 25
  end
  object Panel1: TPanel
    Left = 0
    Top = 410
    Width = 694
    Height = 62
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Capturar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object btn_SalvarImg: TButton
      Left = 105
      Top = 16
      Width = 96
      Height = 25
      Caption = 'Salvar Imagem'
      TabOrder = 1
      OnClick = btn_SalvarImgClick
    end
  end
  object TimerContagem: TTimer
    Enabled = False
    OnTimer = TimerContagemTimer
    Left = 544
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap|.bmp'
    Left = 544
    Top = 232
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 632
    Top = 112
  end
end

object FormSolicitacao: TFormSolicitacao
  Left = 0
  Top = 0
  Caption = 'Tela de Solicita'#231#227'o'
  ClientHeight = 462
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Labelid: TLabel
    Left = 40
    Top = 32
    Width = 64
    Height = 13
    Caption = 'ID Solicita'#231#227'o'
  end
  object LabelUsuário: TLabel
    Left = 120
    Top = 32
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object LabelDescricao: TLabel
    Left = 40
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object LabelSolicitacao: TLabel
    Left = 40
    Top = 133
    Width = 50
    Height = 13
    Caption = 'Solicita'#231#227'o'
  end
  object Label4: TLabel
    Left = 40
    Top = 372
    Width = 70
    Height = 13
    Caption = 'Arquivo anexo'
  end
  object EditId: TEdit
    Left = 40
    Top = 51
    Width = 75
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object EditUsuário: TEdit
    Left = 120
    Top = 51
    Width = 426
    Height = 21
    TabOrder = 1
  end
  object EditDescricao: TEdit
    Left = 40
    Top = 99
    Width = 506
    Height = 21
    TabOrder = 2
  end
  object MemoSolicitacao: TMemo
    Left = 40
    Top = 149
    Width = 506
    Height = 217
    TabOrder = 3
  end
  object ButtonSalvar: TButton
    Left = 128
    Top = 413
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = ButtonSalvarClick
  end
  object ButtonNovo: TButton
    Left = 40
    Top = 413
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 5
    OnClick = ButtonNovoClick
  end
  object btn_CapturarTela: TButton
    Left = 216
    Top = 413
    Width = 81
    Height = 25
    Caption = 'Capturar Tela'
    TabOrder = 6
    OnClick = btn_CapturarTelaClick
  end
  object edtArquivoAnexo: TEdit
    Left = 40
    Top = 386
    Width = 425
    Height = 21
    TabOrder = 7
  end
  object btnSelecArquivo: TButton
    Left = 471
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Arquivo'
    TabOrder = 8
    OnClick = btnSelecArquivoClick
  end
  object Panel1: TPanel
    Left = 552
    Top = 149
    Width = 285
    Height = 217
    TabOrder = 9
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 289
      Height = 217
    end
  end
  object odArquivo: TOpenDialog
    Left = 464
    Top = 416
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 65528
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Fechar1: TMenuItem
        Caption = '&Fechar'
        OnClick = Fechar1Click
      end
    end
  end
  object Abrir: TOpenPictureDialog
    DefaultExt = 'jpg'
    Filter = 
      'JPEG graphics from DevExpress (*.jpg)|*.jpg|JPEG graphics from D' +
      'evExpress (*.jpeg)|*.jpeg|PNG graphics from DevExpress (*.png)|*' +
      '.png|Portable Network Graphics (*.png)|*.png|JPEG Image File (*.' +
      'jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp' +
      '|JPEG Images (*.jpg)|*.jpg|JPEG Images (*.jpeg)|*.jpeg|PNG Image' +
      's (*.png)|*.png'
    Left = 416
    Top = 416
  end
end

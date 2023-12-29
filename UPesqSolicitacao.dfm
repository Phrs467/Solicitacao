object FormPesqSolicitacao: TFormPesqSolicitacao
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Solicita'#231#245'es'
  ClientHeight = 435
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 607
    object Edit1: TEdit
      Left = 209
      Top = 31
      Width = 161
      Height = 23
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 376
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object Selecionar: TButton
      Left = 457
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = SelecionarClick
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 46
      Caption = 'Pesquisar por:'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Id'
        'Usu'#225'rio')
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 95
    Width = 777
    Height = 314
    DataSource = DmSolicitacao.dsPesqSolicitacao
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDSolicitacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao_Solicitacao'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Texto_Solicitacao'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Imagem'
        Width = 79
        Visible = True
      end>
  end
end

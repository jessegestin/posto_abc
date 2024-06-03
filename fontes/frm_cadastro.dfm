object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmCadastro'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pgMain: TPageControl
    Left = 0
    Top = 41
    Width = 628
    Height = 401
    ActivePage = tsPesquisa
    Align = alClient
    TabHeight = 1
    TabOrder = 0
    TabPosition = tpBottom
    TabWidth = 1
    ExplicitWidth = 624
    ExplicitHeight = 400
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      object pnCadastro: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 392
        Align = alClient
        TabOrder = 0
      end
    end
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      OnShow = tsPesquisaShow
      object pnPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 81
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 616
        object lbPesquisaNome: TLabel
          Left = 12
          Top = 16
          Width = 36
          Height = 15
          Caption = 'Nome:'
        end
        object edPesquisaNome: TEdit
          Left = 54
          Top = 13
          Width = 187
          Height = 23
          TabOrder = 0
        end
        object btFiltrar: TBitBtn
          Left = 536
          Top = 12
          Width = 75
          Height = 25
          Caption = '&Filtrar'
          TabOrder = 1
          OnClick = btFiltrarClick
        end
        object btFechaPesquisa: TBitBtn
          Left = 536
          Top = 43
          Width = 75
          Height = 25
          Caption = 'Fe&char'
          TabOrder = 2
          OnClick = btFechaPesquisaClick
        end
      end
      object dbgPesquisa: TDBGrid
        Left = 0
        Top = 81
        Width = 620
        Height = 311
        Align = alClient
        DataSource = dsPesquisa
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgPesquisaDrawColumnCell
      end
    end
  end
  object pnControle: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 624
    object btInserir: TBitBtn
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btInserirClick
    end
    object btAlterar: TBitBtn
      Left = 97
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btExcluir: TBitBtn
      Left = 178
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btPesquisar: TBitBtn
      Left = 259
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 3
      OnClick = btPesquisarClick
    end
    object btFecharTela: TBitBtn
      Left = 340
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Fecha&r'
      TabOrder = 4
      OnClick = btFecharTelaClick
    end
  end
  object qryPesquisa: TFDQuery
    Connection = DM.Connection
    SQL.Strings = (
      'select *'
      'from usuarios')
    Left = 436
    Top = 131
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 548
    Top = 147
  end
end

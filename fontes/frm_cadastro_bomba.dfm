inherited frmCadastroBomba: TfrmCadastroBomba
  Caption = 'Cadastro de Bombas'
  TextHeight = 15
  inherited pgMain: TPageControl
    ActivePage = tsCadastro
    inherited tsCadastro: TTabSheet
      inherited pnCadastro: TPanel
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 616
        ExplicitHeight = 391
        object lbNome: TLabel
          Left = 20
          Top = 19
          Width = 41
          Height = 15
          Caption = 'Bomba:'
        end
        object lbTanque: TLabel
          Left = 20
          Top = 45
          Width = 41
          Height = 15
          Caption = 'Tanque:'
        end
        object edNome: TDBEdit
          Left = 67
          Top = 16
          Width = 166
          Height = 23
          DataField = 'NOME'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object cbTanque: TDBLookupComboBox
          Left = 67
          Top = 45
          Width = 166
          Height = 23
          DataField = 'TANQUE'
          DataSource = dsCadastro
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsTanques
          TabOrder = 1
        end
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited pnPesquisa: TPanel
        ExplicitWidth = 620
        object lbPesquisaTanque: TLabel [1]
          Left = 14
          Top = 48
          Width = 41
          Height = 15
          Caption = 'Tanque:'
        end
        inherited edPesquisaNome: TEdit
          Left = 61
          ExplicitLeft = 61
        end
        inherited btFiltrar: TBitBtn
          TabOrder = 2
        end
        inherited btFechaPesquisa: TBitBtn
          TabOrder = 3
        end
        object cbPesquisaTanque: TDBLookupComboBox
          Left = 61
          Top = 42
          Width = 145
          Height = 23
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsTanques
          TabOrder = 1
        end
      end
      inherited dbgPesquisa: TDBGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TANQUE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TANQUE_VINCULADO'
            Title.Caption = 'TANQUE'
            Width = 214
            Visible = True
          end>
      end
    end
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'select b.*,'
      '       t.NOME as TANQUE_VINCULADO'
      'from BOMBAS b'
      '  inner join tanques t on (t.ID = b.tanque)'
      'where Upper(b.nome) like Upper(:nome)'
      '  and (:tanque is null or t.nome = :tanque)'
      'order by b.nome')
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'TANQUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryPesquisaTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
      Visible = False
    end
    object qryPesquisaTANQUE_VINCULADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE_VINCULADO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qryTanques: TFDQuery
    Active = True
    Connection = DM.Connection
    SQL.Strings = (
      'select *'
      'from tanques'
      'order by nome')
    Left = 84
    Top = 333
    object qryTanquesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTanquesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryTanquesTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object dsTanques: TDataSource
    DataSet = qryTanques
    Left = 164
    Top = 333
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = DM.Connection
    UpdateObject = Update
    SQL.Strings = (
      'select *'
      'from BOMBAS'
      'where id = :id')
    Left = 436
    Top = 221
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryCadastroTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 516
    Top = 221
  end
  object Update: TFDUpdateSQL
    Connection = DM.Connection
    InsertSQL.Strings = (
      'INSERT INTO BOMBAS'
      '(NOME, TANQUE)'
      'VALUES (:NOME, :TANQUE)'
      '')
    ModifySQL.Strings = (
      'UPDATE BOMBAS'
      'SET NOME = :NOME, TANQUE = :TANQUE'
      'WHERE ID = :ID'
      '')
    DeleteSQL.Strings = (
      'DELETE FROM BOMBAS'
      'WHERE ID = :ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME, TANQUE'
      'FROM BOMBAS'
      'WHERE ID = :OLD_ID')
    Left = 524
    Top = 293
  end
end

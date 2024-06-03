inherited frmCadastroTanque: TfrmCadastroTanque
  Caption = 'Cadastro de Tanques'
  TextHeight = 15
  inherited pgMain: TPageControl
    ActivePage = tsCadastro
    inherited tsCadastro: TTabSheet
      inherited pnCadastro: TPanel
        ExplicitWidth = 616
        ExplicitHeight = 391
        object lbNome: TLabel
          Left = 20
          Top = 19
          Width = 41
          Height = 15
          Caption = 'Tanque:'
        end
        object lbTIpo: TLabel
          Left = 35
          Top = 59
          Width = 26
          Height = 15
          Caption = 'Tipo:'
        end
        object edTanque: TDBEdit
          Left = 67
          Top = 16
          Width = 222
          Height = 23
          DataField = 'NOME'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object cbTipo: TComboBox
          Left = 67
          Top = 56
          Width = 145
          Height = 23
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'Gasolina'
            #211'leo Diesel')
        end
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited pnPesquisa: TPanel
        ExplicitWidth = 620
        object lbPesquisaTipo: TLabel [1]
          Left = 22
          Top = 48
          Width = 26
          Height = 15
          Caption = 'Tipo:'
        end
        inherited btFiltrar: TBitBtn
          TabOrder = 2
        end
        inherited btFechaPesquisa: TBitBtn
          TabOrder = 3
        end
        object cbPesquisaTipo: TComboBox
          Left = 54
          Top = 42
          Width = 145
          Height = 23
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'Gasolina'
            #211'leo Diesel'
            'Todos')
        end
      end
      inherited dbgPesquisa: TDBGrid
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
            FieldName = 'TIPO'
            Width = 136
            Visible = True
          end>
      end
    end
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'select *'
      'from tanques'
      'where Upper(nome) like Upper(:nome)'
      '  and (:Tipo = 2 or Tipo = :Tipo)')
    Left = 492
    Top = 211
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
        ParamType = ptInput
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
    object qryPesquisaTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object qryCadastro: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DM.Connection
    UpdateObject = Update
    SQL.Strings = (
      'select *'
      'from tanques'
      'where id = :id'
      'order by nome')
    Left = 492
    Top = 301
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
    object qryCadastroTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 556
    Top = 261
  end
  object Update: TFDUpdateSQL
    Connection = DM.Connection
    InsertSQL.Strings = (
      'INSERT INTO TANQUES'
      '(NOME, TIPO)'
      'VALUES (:NOME, :TIPO)')
    ModifySQL.Strings = (
      'UPDATE TANQUES'
      'SET NOME = :NOME, TIPO = :TIPO'
      'WHERE ID = :ID')
    DeleteSQL.Strings = (
      'DELETE FROM TANQUES'
      'WHERE ID = :ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME, TIPO'
      'FROM TANQUES'
      'WHERE ID = :OLD_ID')
    Left = 564
    Top = 365
  end
end

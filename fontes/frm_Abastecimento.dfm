inherited frmAbastecimento: TfrmAbastecimento
  Caption = 'Abastecimento'
  ClientWidth = 773
  ExplicitWidth = 785
  TextHeight = 15
  inherited pgMain: TPageControl
    Width = 773
    ExplicitWidth = 753
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 765
      inherited pnCadastro: TPanel
        Width = 765
        ExplicitWidth = 749
        object lbTanque: TLabel
          Left = 20
          Top = 19
          Width = 41
          Height = 15
          Caption = 'Tanque:'
        end
        object lbBomba: TLabel
          Left = 276
          Top = 19
          Width = 41
          Height = 15
          Caption = 'Bomba:'
        end
        object lbData: TLabel
          Left = 516
          Top = 19
          Width = 27
          Height = 15
          Caption = 'Data:'
        end
        object lbLitros: TLabel
          Left = 20
          Top = 51
          Width = 32
          Height = 15
          Caption = 'Litros:'
        end
        object lbValorLitro: TLabel
          Left = 261
          Top = 51
          Width = 56
          Height = 15
          Caption = 'Valor Litro:'
        end
        object lbTotal: TLabel
          Left = 516
          Top = 51
          Width = 28
          Height = 15
          Caption = 'Total:'
        end
        object Label1: TLabel
          Left = 20
          Top = 80
          Width = 66
          Height = 15
          Caption = 'Total + Imp.:'
        end
        object cbTanque: TDBLookupComboBox
          Left = 67
          Top = 19
          Width = 166
          Height = 23
          DataField = 'TANQUE'
          DataSource = dsCadastro
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsTanques
          TabOrder = 0
          OnExit = cbTanqueExit
        end
        object cbBomba: TDBLookupComboBox
          Left = 323
          Top = 19
          Width = 166
          Height = 23
          DataField = 'BOMBA'
          DataSource = dsCadastro
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsBombas
          TabOrder = 1
        end
        object edData: TDateTimePicker
          Left = 563
          Top = 19
          Width = 166
          Height = 23
          Date = 45445.000000000000000000
          Time = 45445.000000000000000000
          TabOrder = 2
        end
        object edLitros: TDBEdit
          Left = 67
          Top = 48
          Width = 88
          Height = 23
          DataField = 'QTD_LITROS'
          DataSource = dsCadastro
          TabOrder = 3
          OnKeyPress = edLitrosKeyPress
        end
        object edTotal: TDBEdit
          Left = 563
          Top = 48
          Width = 102
          Height = 23
          DataField = 'VALOR'
          DataSource = dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtotalImposto: TDBEdit
          Left = 92
          Top = 77
          Width = 141
          Height = 23
          DataField = 'VALOR_COM_IMPOSTO'
          DataSource = dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object edValorLitro: TDBEdit
          Left = 323
          Top = 48
          Width = 121
          Height = 23
          DataField = 'VALOR_LITRO'
          DataSource = dsCadastro
          TabOrder = 4
          OnExit = DBEdit1Exit
          OnKeyPress = DBEdit1KeyPress
        end
      end
    end
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 765
      inherited pnPesquisa: TPanel
        Width = 765
        ExplicitWidth = 745
        inherited lbPesquisaNome: TLabel
          Top = -10000
          ExplicitTop = -10000
        end
        object lbPesquisaTanque: TLabel [1]
          Left = 20
          Top = 13
          Width = 41
          Height = 15
          Caption = 'Tanque:'
        end
        object lbPesquisaBomba: TLabel [2]
          Left = 252
          Top = 14
          Width = 41
          Height = 15
          Caption = 'Bomba:'
        end
        object cbPesquisaDataIni: TLabel [3]
          Left = 44
          Top = 45
          Width = 17
          Height = 15
          Caption = 'De:'
        end
        object lbPesquisaDataFim: TLabel [4]
          Left = 272
          Top = 46
          Width = 21
          Height = 15
          Caption = 'At'#233':'
        end
        inherited edPesquisaNome: TEdit
          Top = -10000
          TabOrder = 6
          ExplicitTop = -10000
        end
        inherited btFiltrar: TBitBtn
          Left = 640
          Top = 10
          TabOrder = 4
          ExplicitLeft = 640
          ExplicitTop = 10
        end
        inherited btFechaPesquisa: TBitBtn
          Left = 640
          Top = 41
          TabOrder = 5
          ExplicitLeft = 640
          ExplicitTop = 41
        end
        object cbPesquisaTanque: TDBLookupComboBox
          Left = 67
          Top = 12
          Width = 166
          Height = 23
          DataField = 'TANQUE'
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsTanques
          TabOrder = 0
        end
        object cbPesquisaBomba: TDBLookupComboBox
          Left = 299
          Top = 13
          Width = 166
          Height = 23
          DataField = 'BOMBA'
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsBombas
          TabOrder = 1
        end
        object edPesquisaDataIni: TDateTimePicker
          Left = 67
          Top = 41
          Width = 166
          Height = 23
          Date = 45445.000000000000000000
          Time = 45445.000000000000000000
          TabOrder = 2
        end
        object edPesquisaDataFim: TDateTimePicker
          Left = 299
          Top = 42
          Width = 166
          Height = 23
          Date = 45445.000000000000000000
          Time = 45445.000000000000000000
          TabOrder = 3
        end
      end
      inherited dbgPesquisa: TDBGrid
        Width = 765
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TANQUE_NOME'
            Title.Caption = 'TANQUE'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOMBA_NOME'
            Title.Caption = 'BOMBA'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_LITROS'
            Title.Caption = 'QTD. LITROS'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_LITRO'
            Title.Caption = 'VALOR LITRO'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COM_IMPOSTO'
            Title.Caption = 'VALOR + IMPOSTO'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOMBA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TANQUE'
            Visible = False
          end>
      end
    end
  end
  inherited pnControle: TPanel
    Width = 773
    ExplicitWidth = 753
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'select a.*,'
      '       t.nome as tanque_nome,'
      '       b.nome as bomba_nome '
      'from abastecimento a'
      '  inner join tanques t on (t.id = a.tanque)'
      '  inner join bombas b on (b.id = a.bomba)'
      'where (:tanque is null or t.nome = :tanque)'
      '  and (:bomba is null or b.nome = :bomba)'
      '  and (a.data >= :dataIni and a.data <= :dataFim)'
      'order by a.tanque, a.bomba, a.data')
    Left = 588
    Top = 155
    ParamData = <
      item
        Name = 'TANQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end
      item
        Name = 'BOMBA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryPesquisaTANQUE_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaBOMBA_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryPesquisaQTD_LITROS: TSingleField
      FieldName = 'QTD_LITROS'
      Origin = 'QTD_LITROS'
    end
    object qryPesquisaVALOR: TSingleField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
    end
    object qryPesquisaVALOR_COM_IMPOSTO: TSingleField
      FieldName = 'VALOR_COM_IMPOSTO'
      Origin = 'VALOR_COM_IMPOSTO'
      currency = True
    end
    object qryPesquisaBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'BOMBA'
      Visible = False
    end
    object qryPesquisaTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
      Visible = False
    end
    object qryPesquisaVALOR_LITRO: TSingleField
      FieldName = 'VALOR_LITRO'
      Origin = 'VALOR_LITRO'
      currency = True
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 700
    Top = 171
  end
  object qryTanques: TFDQuery
    Active = True
    Connection = DM.Connection
    SQL.Strings = (
      'select *'
      'from tanques'
      'order by nome')
    Left = 84
    Top = 301
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
    Top = 301
  end
  object qryCadastro: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DM.Connection
    UpdateObject = Update
    SQL.Strings = (
      'select *'
      'from abastecimento'
      'where id = :id')
    Left = 588
    Top = 245
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
    object qryCadastroTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
    end
    object qryCadastroBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'BOMBA'
    end
    object qryCadastroDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCadastroQTD_LITROS: TSingleField
      FieldName = 'QTD_LITROS'
      Origin = 'QTD_LITROS'
    end
    object qryCadastroVALOR: TSingleField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object qryCadastroVALOR_COM_IMPOSTO: TSingleField
      FieldName = 'VALOR_COM_IMPOSTO'
      Origin = 'VALOR_COM_IMPOSTO'
    end
    object qryCadastroVALOR_LITRO: TSingleField
      FieldName = 'VALOR_LITRO'
      Origin = 'VALOR_LITRO'
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 668
    Top = 245
  end
  object Update: TFDUpdateSQL
    Connection = DM.Connection
    InsertSQL.Strings = (
      'INSERT INTO ABASTECIMENTO'
      '(TANQUE, BOMBA, "DATA", QTD_LITROS, VALOR, '
      '  VALOR_COM_IMPOSTO, VALOR_LITRO)'
      'VALUES (:TANQUE, :BOMBA, :DATA, :QTD_LITROS, :VALOR, '
      '  :VALOR_COM_IMPOSTO, :VALOR_LITRO)')
    ModifySQL.Strings = (
      'UPDATE ABASTECIMENTO'
      'SET TANQUE = :TANQUE, BOMBA = :BOMBA, "DATA" = :DATA, '
      '  QTD_LITROS = :QTD_LITROS, VALOR = :VALOR, '
      
        '  VALOR_COM_IMPOSTO = :VALOR_COM_IMPOSTO, VALOR_LITRO = :VALOR_L' +
        'ITRO'
      'WHERE ID = :ID')
    DeleteSQL.Strings = (
      'DELETE FROM ABASTECIMENTO'
      'WHERE ID = :ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, TANQUE, BOMBA, "DATA" AS "DATA", QTD_LITROS, VALOR, V' +
        'ALOR_COM_IMPOSTO'
      'FROM ABASTECIMENTO'
      'WHERE ID = :OLD_ID')
    Left = 676
    Top = 317
  end
  object qryBombas: TFDQuery
    Connection = DM.Connection
    SQL.Strings = (
      'select b.*'
      'from bombas b'
      'where b.tanque = :tanque')
    Left = 84
    Top = 357
    ParamData = <
      item
        Name = 'TANQUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryBombasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBombasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryBombasTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
    end
  end
  object dsBombas: TDataSource
    DataSet = qryBombas
    Left = 164
    Top = 357
  end
end

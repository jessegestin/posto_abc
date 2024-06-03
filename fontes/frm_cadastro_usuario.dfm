inherited frmCadastroUsuario: TfrmCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  TextHeight = 15
  inherited pgMain: TPageControl
    ActivePage = tsCadastro
    inherited tsCadastro: TTabSheet
      inherited pnCadastro: TPanel
        ExplicitWidth = 616
        ExplicitHeight = 391
        object lbUsuario: TLabel
          Left = 20
          Top = 19
          Width = 43
          Height = 15
          Caption = 'Usu'#225'rio:'
        end
        object lbSenha: TLabel
          Left = 28
          Top = 48
          Width = 35
          Height = 15
          Caption = 'Senha:'
        end
        object edUsuario: TDBEdit
          Left = 69
          Top = 16
          Width = 220
          Height = 23
          DataField = 'USUARIO'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object edSenha: TDBEdit
          Left = 69
          Top = 45
          Width = 164
          Height = 23
          DataField = 'SENHA'
          DataSource = dsCadastro
          PasswordChar = '*'
          TabOrder = 1
        end
      end
    end
    inherited tsPesquisa: TTabSheet
      inherited dbgPesquisa: TDBGrid
        OnDrawColumnCell = dbgPesquisaDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Visible = True
          end>
      end
    end
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'select *'
      'from usuarios'
      'where Upper(usuario) like Upper(:nome)'
      'order by usuario asc')
    Left = 524
    Top = 51
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end>
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qryPesquisaSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 12
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 596
    Top = 51
  end
  object qryCadastro: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DM.Connection
    UpdateObject = Update
    SQL.Strings = (
      'select *'
      'from usuarios'
      'where id = :id'
      'order by usuario')
    Left = 524
    Top = 109
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
    object qryCadastroUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qryCadastroSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 12
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 588
    Top = 117
  end
  object Update: TFDUpdateSQL
    Connection = DM.Connection
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS'
      '(USUARIO, SENHA)'
      'VALUES (:USUARIO, :SENHA)')
    ModifySQL.Strings = (
      'UPDATE USUARIOS'
      'SET USUARIO = :USUARIO, SENHA = :SENHA'
      'WHERE ID = :ID')
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE ID = :ID')
    FetchRowSQL.Strings = (
      'SELECT ID, USUARIO, SENHA'
      'FROM USUARIOS'
      'WHERE ID = :OLD_ID')
    Left = 524
    Top = 189
  end
end

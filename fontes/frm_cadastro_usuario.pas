unit frm_cadastro_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frm_cadastro, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroUsuario = class(TfrmCadastro)
    qryCadastro: TFDQuery;
    qryCadastroID: TIntegerField;
    qryCadastroUSUARIO: TStringField;
    qryCadastroSENHA: TStringField;
    dsCadastro: TDataSource;
    lbUsuario: TLabel;
    edUsuario: TDBEdit;
    lbSenha: TLabel;
    edSenha: TDBEdit;
    Update: TFDUpdateSQL;
    qryPesquisaID: TIntegerField;
    qryPesquisaUSUARIO: TStringField;
    qryPesquisaSENHA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btFechaPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravaRecord;
    procedure CommitRecord;
    procedure FiltraRegistro;
    procedure LimpaCamposCadastro;
  public
    { Public declarations }
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation
uses data_module;

{$R *.dfm}

procedure TfrmCadastroUsuario.btAlterarClick(Sender: TObject);
begin
  FiltraRegistro;

  if qryCadastro.RecordCount = 0 then Exit;

  inherited;

  qryCadastro.Edit;
  edUsuario.SetFocus;
end;

procedure TfrmCadastroUsuario.btExcluirClick(Sender: TObject);
begin
  inherited;

  edUsuario.Clear;
  edSenha.Clear;

  if Excluir then
  begin
    FiltraRegistro;

    qryCadastro.Delete;
    CommitRecord;

    btFiltrar.Click;
  end;
end;

procedure TfrmCadastroUsuario.btFechaPesquisaClick(Sender: TObject);
begin
  inherited;

  LimpaCamposCadastro;
end;

procedure TfrmCadastroUsuario.btFiltrarClick(Sender: TObject);
begin
  qryPesquisa.Close;

  if Trim(edPesquisaNome.Text) <> EmptyStr then
  begin
    qryPesquisa.ParamByName('Nome').AsString := '%' + edPesquisaNome.Text + '%';
  end
  else
  begin
    qryPesquisa.ParamByName('Nome').AsString := '%';
  end;

  qryPesquisa.Open;
  qryPesquisa.First;
end;

procedure TfrmCadastroUsuario.btInserirClick(Sender: TObject);
begin
  if btInserir.Caption = '&Gravar' then
  begin
    GravaRecord;
  end
  else
  begin
    inherited;

    qryCadastro.Open;
    qryCadastro.Append;
  end;

  edUsuario.SetFocus;
end;

procedure TfrmCadastroUsuario.btPesquisarClick(Sender: TObject);
begin
  inherited;

  edPesquisanome.Clear;
  edPesquisaNome.SetFocus;
end;

procedure TfrmCadastroUsuario.CommitRecord;
begin
  qryCadastro.ApplyUpdates;
  qryCadastro.Close;
end;

procedure TfrmCadastroUsuario.FiltraRegistro;
begin
  qryCadastro.Close;
  qryCadastro.ParamByName('id').AsInteger := qryPesquisaID.AsInteger;
  qryCadastro.Open;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  inherited;
  qryCadastro.Close;
end;

procedure TfrmCadastroUsuario.GravaRecord;
begin
  if Trim(edUsuario.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Usuário!', mtWarning, [], 0);
    edUsuario.SetFocus;
    Abort;
  end
  else if Trim(edSenha.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Senha!', mtWarning, [], 0);
    edSenha.SetFocus;
    Abort;
  end;

  qryCadastro.Post;
  CommitRecord;

  SetInicialMode;

  LimpaCamposCadastro;
end;

procedure TfrmCadastroUsuario.LimpaCamposCadastro;
begin
  edUsuario.Clear;
  edSenha.Clear;
end;

end.

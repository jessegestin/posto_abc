unit frm_cadastro_tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frm_cadastro, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadastroTanque = class(TfrmCadastro)
    qryPesquisaID: TIntegerField;
    qryPesquisaNOME: TStringField;
    qryPesquisaTIPO: TIntegerField;
    lbPesquisaTipo: TLabel;
    cbPesquisaTipo: TComboBox;
    lbNome: TLabel;
    lbTIpo: TLabel;
    edTanque: TDBEdit;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    Update: TFDUpdateSQL;
    qryCadastroID: TIntegerField;
    qryCadastroNOME: TStringField;
    qryCadastroTIPO: TIntegerField;
    cbTipo: TComboBox;
    procedure btFiltrarClick(Sender: TObject);
    procedure btFechaPesquisaClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCamposCadastro;
    procedure FiltraRegistro;
    procedure CommitRecord;
    procedure GravaRecord;
  public
    { Public declarations }
  end;

var
  frmCadastroTanque: TfrmCadastroTanque;

implementation
uses data_module;

{$R *.dfm}

procedure TfrmCadastroTanque.btAlterarClick(Sender: TObject);
begin
  FiltraRegistro;

  if qryCadastro.RecordCount = 0 then Exit;

  inherited;

  qryCadastro.Edit;
  edTanque.SetFocus;

  cbTipo.ItemIndex := qryCadastroTipo.AsInteger;
end;

procedure TfrmCadastroTanque.btExcluirClick(Sender: TObject);
begin
  inherited;

  edTanque.Clear;
  cbTipo.ItemIndex := 0;

  if Excluir then
  begin
    FiltraRegistro;

    qryCadastro.Delete;
    CommitRecord;

    btFiltrar.Click;
  end;
end;

procedure TfrmCadastroTanque.btFechaPesquisaClick(Sender: TObject);
begin
  inherited;
  LimpaCamposCadastro;
end;

procedure TfrmCadastroTanque.btFiltrarClick(Sender: TObject);
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

  qryPesquisa.ParamByName('Tipo').AsInteger := cbPesquisaTIpo.ItemIndex;

  qryPesquisa.Open;
  qryPesquisa.First;
end;

procedure TfrmCadastroTanque.btInserirClick(Sender: TObject);
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

    cbTipo.ItemIndex := 0;
  end;

  edTanque.SetFocus;
end;

procedure TfrmCadastroTanque.btPesquisarClick(Sender: TObject);
begin
  inherited;

  edPesquisanome.Clear;
  cbPesquisaTipo.ItemIndex := 2;
  edPesquisaNome.SetFocus;
end;

procedure TfrmCadastroTanque.CommitRecord;
begin
  qryCadastro.ApplyUpdates;
  qryCadastro.Close;
end;

procedure TfrmCadastroTanque.FiltraRegistro;
begin
  qryCadastro.Close;
  qryCadastro.ParamByName('id').AsInteger := qryPesquisaID.AsInteger;
  qryCadastro.Open;
end;

procedure TfrmCadastroTanque.FormShow(Sender: TObject);
begin
  inherited;
   qryCadastro.Close;
end;

procedure TfrmCadastroTanque.GravaRecord;
begin
  if Trim(edTanque.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Nome!', mtWarning, [], 0);
    edTanque.SetFocus;
    Abort;
  end
  else if cbTipo.ItemIndex = 0 then
  begin
    MessageDlg('Atenção Informe o campo Tipo!', mtWarning, [], 0);
    cbTipo.SetFocus;
    Abort;
  end;

  qryCadastroTIPO.AsInteger := cbTipo.ItemIndex;

  qryCadastro.Post;
  CommitRecord;

  SetInicialMode;

  LimpaCamposCadastro;
end;

procedure TfrmCadastroTanque.LimpaCamposCadastro;
begin
  edTanque.clear;
  cbTipo.ItemIndex := 0;
end;

end.

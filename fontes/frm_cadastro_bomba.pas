unit frm_cadastro_bomba;

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
  TfrmCadastroBomba = class(TfrmCadastro)
    qryPesquisaID: TIntegerField;
    qryPesquisaNOME: TStringField;
    qryPesquisaTANQUE: TIntegerField;
    lbPesquisaTanque: TLabel;
    qryTanques: TFDQuery;
    qryTanquesID: TIntegerField;
    qryTanquesNOME: TStringField;
    qryTanquesTIPO: TIntegerField;
    dsTanques: TDataSource;
    qryPesquisaTANQUE_VINCULADO: TStringField;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    Update: TFDUpdateSQL;
    qryCadastroID: TIntegerField;
    qryCadastroNOME: TStringField;
    qryCadastroTANQUE: TIntegerField;
    lbNome: TLabel;
    lbTanque: TLabel;
    edNome: TDBEdit;
    cbTanque: TDBLookupComboBox;
    cbPesquisaTanque: TDBLookupComboBox;
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
    procedure GravaRecord;
    procedure CommitRecord;
  public
    { Public declarations }
  end;

var
  frmCadastroBomba: TfrmCadastroBomba;

implementation
uses data_module;

{$R *.dfm}

procedure TfrmCadastroBomba.btAlterarClick(Sender: TObject);
begin
  FiltraRegistro;

  if qryCadastro.RecordCount = 0 then Exit;

  inherited;

  qryCadastro.Edit;
  edNome.SetFocus;
end;

procedure TfrmCadastroBomba.btExcluirClick(Sender: TObject);
begin
  inherited;

  edNome.Clear;

  if Excluir then
  begin
    FiltraRegistro;

    qryCadastro.Delete;
    CommitRecord;

    btFiltrar.Click;
  end;
end;

procedure TfrmCadastroBomba.btFechaPesquisaClick(Sender: TObject);
begin
  inherited;
  limpaCamposCadastro;
end;

procedure TfrmCadastroBomba.btFiltrarClick(Sender: TObject);
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

  if Trim(cbPesquisaTanque.Text) <> EmptyStr then
    qryPesquisa.ParamByName('Tanque').AsString := cbPesquisaTanque.Text
  else
     qryPesquisa.ParamByName('Tanque').Clear;

  qryPesquisa.Open;
  qryPesquisa.First;
end;

procedure TfrmCadastroBomba.btInserirClick(Sender: TObject);
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

  edNome.SetFocus;
end;

procedure TfrmCadastroBomba.btPesquisarClick(Sender: TObject);
begin
  inherited;

  edPesquisanome.Clear;
  edPesquisaNome.SetFocus;

  qryTanques.Close;
  QryTanques.Open;
  QryTanques.First;
end;

procedure TfrmCadastroBomba.CommitRecord;
begin
  qryCadastro.ApplyUpdates;
  qryCadastro.Close;
end;

procedure TfrmCadastroBomba.FiltraRegistro;
begin
  qryCadastro.Close;
  qryCadastro.ParamByName('id').AsInteger := qryPesquisaID.AsInteger;
  qryCadastro.Open;
end;

procedure TfrmCadastroBomba.FormShow(Sender: TObject);
begin
  inherited;
   qryCadastro.Close;
end;

procedure TfrmCadastroBomba.GravaRecord;
begin
  if Trim(edNome.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Bomba!', mtWarning, [], 0);
    edNome.SetFocus;
    Abort;
  end
  else if cbTanque.ListFieldIndex = 0 then
  begin
    MessageDlg('Atenção Informe o campo Tanque!', mtWarning, [], 0);
    cbTanque.SetFocus;
    Abort;
  end;

  qryCadastro.Post;
  CommitRecord;

  SetInicialMode;

  LimpaCamposCadastro;
end;

procedure TfrmCadastroBomba.LimpaCamposCadastro;
begin
  edNome.Clear;
end;

end.

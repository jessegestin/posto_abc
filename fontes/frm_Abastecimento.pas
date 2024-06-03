unit frm_Abastecimento;

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
  TfrmAbastecimento = class(TfrmCadastro)
    qryTanques: TFDQuery;
    qryTanquesID: TIntegerField;
    qryTanquesNOME: TStringField;
    qryTanquesTIPO: TIntegerField;
    dsTanques: TDataSource;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    Update: TFDUpdateSQL;
    qryBombas: TFDQuery;
    dsBombas: TDataSource;
    qryBombasID: TIntegerField;
    qryBombasNOME: TStringField;
    qryBombasTANQUE: TIntegerField;
    qryCadastroID: TIntegerField;
    qryCadastroTANQUE: TIntegerField;
    qryCadastroBOMBA: TIntegerField;
    qryCadastroDATA: TDateField;
    qryCadastroQTD_LITROS: TSingleField;
    qryCadastroVALOR: TSingleField;
    qryCadastroVALOR_COM_IMPOSTO: TSingleField;
    lbPesquisaTanque: TLabel;
    cbPesquisaTanque: TDBLookupComboBox;
    lbPesquisaBomba: TLabel;
    cbPesquisaBomba: TDBLookupComboBox;
    cbPesquisaDataIni: TLabel;
    edPesquisaDataIni: TDateTimePicker;
    qryPesquisaID: TIntegerField;
    qryPesquisaTANQUE: TIntegerField;
    qryPesquisaBOMBA: TIntegerField;
    qryPesquisaDATA: TDateField;
    qryPesquisaQTD_LITROS: TSingleField;
    qryPesquisaVALOR: TSingleField;
    qryPesquisaVALOR_COM_IMPOSTO: TSingleField;
    qryPesquisaTANQUE_NOME: TStringField;
    qryPesquisaBOMBA_NOME: TStringField;
    lbTanque: TLabel;
    cbTanque: TDBLookupComboBox;
    lbBomba: TLabel;
    cbBomba: TDBLookupComboBox;
    edData: TDateTimePicker;
    lbData: TLabel;
    edLitros: TDBEdit;
    lbLitros: TLabel;
    lbValorLitro: TLabel;
    lbTotal: TLabel;
    edTotal: TDBEdit;
    Label1: TLabel;
    edtotalImposto: TDBEdit;
    qryPesquisaVALOR_LITRO: TSingleField;
    qryCadastroVALOR_LITRO: TSingleField;
    edValorLitro: TDBEdit;
    lbPesquisaDataFim: TLabel;
    edPesquisaDataFim: TDateTimePicker;
    procedure btFiltrarClick(Sender: TObject);
    procedure btFechaPesquisaClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure edLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1Exit(Sender: TObject);
    procedure cbTanqueExit(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCamposCadastro;
    procedure FiltraRegistro;
    procedure GravaRecord;
    procedure CommitRecord;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation
uses data_module;

{$R *.dfm}

procedure TfrmAbastecimento.btAlterarClick(Sender: TObject);
begin
  inherited;

  FiltraRegistro;

  if qryCadastro.RecordCount = 0 then Exit;

  inherited;

  qryCadastro.Edit;
  cbTanque.SetFocus;
end;

procedure TfrmAbastecimento.btExcluirClick(Sender: TObject);
begin
  inherited;

  if Excluir then
  begin
    FiltraRegistro;

    qryCadastro.Delete;
    CommitRecord;

    btFiltrar.Click;
  end;
end;

procedure TfrmAbastecimento.btFechaPesquisaClick(Sender: TObject);
begin
  inherited;
   limpaCamposCadastro;
end;

procedure TfrmAbastecimento.btFiltrarClick(Sender: TObject);
begin
  qryPesquisa.Close;

  if Trim(cbPesquisaTanque.Text) <> EmptyStr then
    qryPesquisa.ParamByName('Tanque').AsString := cbPesquisaTanque.Text
  else
     qryPesquisa.ParamByName('Tanque').Clear;

  if Trim(cbPesquisaBomba.Text) <> EmptyStr then
    qryPesquisa.ParamByName('Bomba').AsString := cbPesquisaBomba.Text
  else
     qryPesquisa.ParamByName('Bomba').Clear;

  qryPesquisa.ParamByName('DataIni').AsdateTime := edPesquisaDataIni.Date;
  qryPesquisa.ParamByName('DataFim').AsdateTime := edPesquisaDataFim.Date;

  qryPesquisa.Open;
  qryPesquisa.First;
end;

procedure TfrmAbastecimento.btInserirClick(Sender: TObject);
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

    qryTanques.open;
    qryBombas.open;

    edData.Date := now;
  end;

  cbTanque.SetFocus;
end;

procedure TfrmAbastecimento.btPesquisarClick(Sender: TObject);
begin
  inherited;

  cbPesquisaTanque.SetFocus;

  qryTanques.Close;
  QryTanques.Open;
  QryTanques.First;

  QryBombas.Close;
  QryBombas.Open;
  QryBombas.First;

  edPesquisaDataIni.Date := Now;
  edPesquisaDataFIm.Date := Now;
end;

procedure TfrmAbastecimento.cbTanqueExit(Sender: TObject);
begin
  inherited;
  qryBombas.Close;
  qryBombas.ParamByName('Tanque').AsInteger := qryTanquesID.AsInteger;
  qryBombas.Open;
end;

procedure TfrmAbastecimento.CommitRecord;
begin
  qryCadastro.ApplyUpdates;
  qryCadastro.Close;
end;

procedure TfrmAbastecimento.DBEdit1Exit(Sender: TObject);
var
  valor, valorImposto: double;
begin
  inherited;

  if Trim(edLitros.Text) <> EmptyStr then
  begin
    valor := StrToFloat(edLitros.text) * StrToFloatDef(edValorLitro.Text, 0);
    valorImposto := valor * (1 + 0.13);

    qryCadastroValor.AsFloat := Valor;
    edtotalImposto.Text := FloatToStr(valorImposto);
  end;
end;

procedure TfrmAbastecimento.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',', '.']) then
    key := #0;
end;

procedure TfrmAbastecimento.edLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',', '.']) then
    key := #0;
end;

procedure TfrmAbastecimento.FiltraRegistro;
begin
  qryCadastro.Close;
  qryCadastro.ParamByName('id').AsInteger := qryPesquisaID.AsInteger;
  qryCadastro.Open;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  inherited;
  qryCadastro.CLose;
end;

procedure TfrmAbastecimento.GravaRecord;
begin
  if cbTanque.ListFieldIndex = 0 then
  begin
    MessageDlg('Atenção Informe o campo Tanque!', mtWarning, [], 0);
    cbTanque.SetFocus;
    Abort;
  end
  else if cbBomba.ListFieldIndex = 0 then
  begin
    MessageDlg('Atenção Informe o campo Bomba!', mtWarning, [], 0);
    cbBomba.SetFocus;
    Abort;
  end
  else if Trim(edLitros.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Litros!', mtWarning, [], 0);
    edLitros.SetFocus;
    Abort;
  end
  else if Trim(edValorLitro.Text) = EmptyStr then
  begin
    MessageDlg('Atenção Informe o campo Valor Litro!', mtWarning, [], 0);
    edValorLitro.SetFocus;
    Abort;
  end;

  qryCadastroDATA.AsDateTime := edData.Date;

  qryCadastro.Post;
  CommitRecord;

  SetInicialMode;

  LimpaCamposCadastro;
end;

procedure TfrmAbastecimento.limpaCamposCadastro;
begin
//
end;

end.

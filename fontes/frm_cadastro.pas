unit frm_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, data_module;

type
  TfrmCadastro = class(TForm)
    pgMain: TPageControl;
    tsCadastro: TTabSheet;
    tsPesquisa: TTabSheet;
    pnControle: TPanel;
    btInserir: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btPesquisar: TBitBtn;
    qryPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    pnPesquisa: TPanel;
    lbPesquisaNome: TLabel;
    edPesquisaNome: TEdit;
    btFiltrar: TBitBtn;
    dbgPesquisa: TDBGrid;
    btFechaPesquisa: TBitBtn;
    pnCadastro: TPanel;
    btFecharTela: TBitBtn;
    procedure btFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btFechaPesquisaClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btFecharTelaClick(Sender: TObject);
    procedure tsPesquisaShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    Gravar, Excluir: boolean;
    procedure SetDefaultCOntrolPage;
    procedure SetModeGravar;
    procedure SetInicialMode;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.btAlterarClick(Sender: TObject);
begin
  SetModeGravar;
end;

procedure TfrmCadastro.btExcluirClick(Sender: TObject);
begin
  if btInserir.Caption = '&Gravar' then
  begin
    SetInicialMode;
  end;

  if pgMain.ActivePage = tsPesquisa then
  begin
    Excluir := MessageDlg('Confirma Excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  end;
end;

procedure TfrmCadastro.btFechaPesquisaClick(Sender: TObject);
begin
  SetDefaultControlPage;

  qrypesquisa.close;
end;

procedure TfrmCadastro.btFecharTelaClick(Sender: TObject);
begin
  Self.close;
end;

procedure TfrmCadastro.btFiltrarClick(Sender: TObject);
begin
  qrypesquisa.close;
  qryPesquisa.Open;
end;

procedure TfrmCadastro.btInserirClick(Sender: TObject);
begin
  SetModeGravar;
end;

procedure TfrmCadastro.btPesquisarClick(Sender: TObject);
begin
  pgMain.Pages[0].TabVisible := False;
  pgMain.Pages[1].TabVisible := True;

  qryPesquisa.CLose;

  btExcluir.Caption := '&Excluir';
end;

procedure TfrmCadastro.dbgPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if Odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
      (Sender as TDBGrid).Canvas.Brush.Color:= clWhite
    else
      (Sender as TDBGrid).Canvas.Brush.Color:= $00F1F2F3;

    (Sender as TDBGrid).Canvas.Font.Color:= clBlack;

    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.DisplayText);
  end;
end;

procedure TfrmCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0)
  else if key = VK_ESCAPE then
    btFecharTela.Click;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  SetDefaultCOntrolPage;
end;

procedure TfrmCadastro.SetDefaultCOntrolPage;
begin
  pgMain.Pages[0].TabVisible := True;
  pgMain.Pages[1].TabVisible := False;

  pgMain.ActivePage  := tsCadastro;
  pnCadastro.Enabled := False;
end;

procedure TfrmCadastro.SetInicialMode;
begin
  Gravar := False;

  btInserir.Caption := '&Inserir';
  btExcluir.Caption := '&Excluir';
end;

procedure TfrmCadastro.SetModeGravar;
begin
  Gravar := True;

  btInserir.Caption := '&Gravar';
  btExcluir.Caption := '&Cancelar';

  pnCadastro.Enabled := True;
  btAlterar.Enabled  := False;

  pgMain.Pages[0].TabVisible := True;
  pgMain.Pages[1].TabVisible := False;

  pgMain.ActivePage  := tsCadastro;
  pnCadastro.Enabled := True;
end;

procedure TfrmCadastro.tsPesquisaShow(Sender: TObject);
begin
  btAlterar.Enabled := True;
end;

end.

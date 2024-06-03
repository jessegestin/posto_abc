unit frm_relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLFilters, RLPDFFilter, RLReport,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.jpeg;

type
  TfrmRelatorio = class(TForm)
    RLReport1: TRLReport;
    rlTitle: TRLBand;
    RLLabel1: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    pnRelatorio: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    lbPesquisaTanque: TLabel;
    cbTanque: TDBLookupComboBox;
    lbPesquisaBomba: TLabel;
    cbBomba: TDBLookupComboBox;
    lbDataIni: TLabel;
    edDataIni: TDateTimePicker;
    lbDataFim: TLabel;
    edDataFIm: TDateTimePicker;
    qryTanques: TFDQuery;
    qryTanquesID: TIntegerField;
    qryTanquesNOME: TStringField;
    qryTanquesTIPO: TIntegerField;
    dsTanques: TDataSource;
    qryBombas: TFDQuery;
    qryBombasID: TIntegerField;
    qryBombasNOME: TStringField;
    qryBombasTANQUE: TIntegerField;
    dsBombas: TDataSource;
    qryRelatorio: TFDQuery;
    dsRelatorio: TDataSource;
    lbData: TRLLabel;
    RLImage1: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand3: TRLBand;
    qryRelatorioID: TIntegerField;
    qryRelatorioTANQUE: TIntegerField;
    qryRelatorioBOMBA: TIntegerField;
    qryRelatorioDATA: TDateField;
    qryRelatorioQTD_LITROS: TSingleField;
    qryRelatorioVALOR: TSingleField;
    qryRelatorioVALOR_COM_IMPOSTO: TSingleField;
    qryRelatorioVALOR_LITRO: TSingleField;
    qryRelatorioTANQUE_NOME: TStringField;
    qryRelatorioBOMBA_NOME: TStringField;
    qryRelatorioVALOR2: TFloatField;
    qryRelatorioQTD_LITROS2: TFloatField;
    qryRelatorioVALOR_COM_IMPOSTO2: TFloatField;
    qryRelatorioVALOR_LITRO2: TFloatField;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLBand4: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    BitBtn1: TBitBtn;
    RLLabel8: TRLLabel;
    procedure btImprimirClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    procedure LimpaFiltros;
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation
uses data_module;

{$R *.dfm}

procedure TfrmRelatorio.BitBtn1Click(Sender: TObject);
begin
  LimpaFiltros;
end;

procedure TfrmRelatorio.btFecharClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRelatorio.btImprimirClick(Sender: TObject);
begin
  qryRelatorio.Close;

  if Trim(cbTanque.Text) <> EmptyStr then
    qryRelatorio.ParamByName('Tanque').AsString := cbTanque.Text
  else
     qryRelatorio.ParamByName('Tanque').Clear;

  if Trim(cbBomba.Text) <> EmptyStr then
    qryRelatorio.ParamByName('Bomba').AsString := cbBomba.Text
  else
     qryRelatorio.ParamByName('Bomba').Clear;

  qryRelatorio.ParamByName('DataIni').AsdateTime := edDataIni.Date;
  qryRelatorio.ParamByName('DataFim').AsdateTime := edDataFim.Date;

  qryRelatorio.Open;
  qryRelatorio.First;

  if qryRelatorio.RecordCount > 0 then
    RLReport1.Preview;
end;

procedure TfrmRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0)
  else if key = VK_ESCAPE then
    btFechar.Click;
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  pnRelatorio.Align := alClient;

  frmRelatorio.Width  := 510;
  frmRelatorio.Height := 161;

  LimpaFiltros;
end;

procedure TfrmRelatorio.LimpaFiltros;
begin
  qryTanques.Close;
  qryTanques.Open;

  qryBombas.Close;
  qryBombas.Open;

  edDataIni.Date := now;
  edDataFIm.Date := Now;
end;

procedure TfrmRelatorio.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand1.Color = clwhite then
    RLBand1.Color := cl3dlight else
    RLBand1.Color := clwhite;
end;

procedure TfrmRelatorio.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbData.Caption := 'Pesquisado de: ' + DateToStr(edDataIni.Date) + ' até: ' + DateToStr(edDataFim.Date);
end;

end.


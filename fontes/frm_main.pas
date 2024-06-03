unit frm_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmMain = class(TForm)
    Menu: TMainMenu;
    Cadastros: TMenuItem;
    Usuarios: TMenuItem;
    Sair: TMenuItem;
    Tanques: TMenuItem;
    Bombas: TMenuItem;
    ControleAbastecimento: TMenuItem;
    abastecimento: TMenuItem;
    Relatorios: TMenuItem;
    RelatorioAbastecimento: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    procedure SairClick(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
    procedure TanquesClick(Sender: TObject);
    procedure BombasClick(Sender: TObject);
    procedure abastecimentoClick(Sender: TObject);
    procedure RelatorioAbastecimentoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  frm_cadastro_usuario,
  frm_cadastro_tanque,
  frm_cadastro_bomba,
  frm_Abastecimento,
  frm_relatorio;

{$R *.dfm}

procedure TfrmMain.abastecimentoClick(Sender: TObject);
begin
  frmAbastecimento.Show;
end;

procedure TfrmMain.BombasClick(Sender: TObject);
begin
  frmCadastroBomba.Show;
end;

procedure TfrmMain.RelatorioAbastecimentoClick(Sender: TObject);
begin
  frmRelatorio.Show;
end;

procedure TfrmMain.SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.TanquesClick(Sender: TObject);
begin
  frmcadastrotanque.Show;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

procedure TfrmMain.UsuariosClick(Sender: TObject);
begin
  frmCadastroUsuario.Show;
end;

end.

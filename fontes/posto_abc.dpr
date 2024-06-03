program posto_abc;

uses
  Vcl.Forms,
  frm_main in 'frm_main.pas' {frmMain},
  data_module in 'data_module.pas' {DM: TDataModule},
  frm_cadastro in 'frm_cadastro.pas' {frmCadastro},
  frm_cadastro_usuario in 'frm_cadastro_usuario.pas' {frmCadastroUsuario},
  frm_cadastro_tanque in 'frm_cadastro_tanque.pas' {frmCadastroTanque},
  frm_cadastro_bomba in 'frm_cadastro_bomba.pas' {frmCadastroBomba},
  frm_Abastecimento in 'frm_Abastecimento.pas' {frmAbastecimento},
  frm_relatorio in 'frm_relatorio.pas' {frmRelatorio},
  frm_Splash_Screen in 'frm_Splash_Screen.pas' {frmSplashScree};

{$R *.res}

begin
  Application.Initialize;
  frmSplashScree := TfrmSplashScree.Create(Application);
  frmSplashScree.Show;
  frmSplashScree.Update;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'POSTO ABC';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmCadastroUsuario, frmCadastroUsuario);
  Application.CreateForm(TfrmCadastroTanque, frmCadastroTanque);
  Application.CreateForm(TfrmCadastroBomba, frmCadastroBomba);
  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.CreateForm(TfrmSplashScree, frmSplashScree);
  frmSplashScree.Close;
  Application.Run;
end.

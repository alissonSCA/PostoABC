program PostoABC;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unDados in 'unDados.pas' {DM: TDataModule},
  unConexao in 'unConexao.pas' {frmConexao},
  unUsuarioTO in 'unUsuarioTO.pas',
  unAtributos in 'unAtributos.pas',
  unUsuarioGUI in 'unUsuarioGUI.pas' {frmUsuario},
  unUsuarioDAO in 'unUsuarioDAO.pas',
  unLogin in 'unLogin.pas' {frmLogin},
  unSistema in 'unSistema.pas',
  unCombustivel in 'unCombustivel.pas' {frmCombustivel},
  unTanques in 'unTanques.pas' {frmTanques},
  unConsulta in 'unConsulta.pas' {frmConsulta},
  unBombas in 'unBombas.pas' {frmBombas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConexao, frmConexao);
  Application.CreateForm(TDM, DM);
  TfrmLogin.Login();

  Application.Run;
end.

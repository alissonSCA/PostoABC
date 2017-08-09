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
  unSistema in 'unSistema.pas';

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
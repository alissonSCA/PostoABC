unit unLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IniFiles,
  unDados, unSistema, unUsuarioTO, unUsuarioDAO;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure login();
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
var
  usuario, uLogSis: TUsuario;
  ini: TIniFile;
begin
  uLogSis := TSistema.UsuarioLogado;
  usuario := TUsuarioDAO.logar(edtUsuario.Text, edtSenha.Text);
  if usuario.Id > 0 then
  begin
    uLogSis.Id := usuario.Id;
    uLogSis.Nome := usuario.Nome;
    uLogSis.Username := usuario.Username;
    uLogSis.Password := usuario.Password;

    ini := TIniFile.Create(StringReplace(ParamStr(0),'.exe','.ini',[]));
    try
      ini.WriteString('LOGIN','Username',edtUsuario.Text);
    finally
      freeAndNil(ini);
    end;

    Close;
  end
  else
    showMessage('N�o foi poss�vel realizar o login no sistema!');
end;

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TSistema.UsuarioLogado.Id <= 0 then
    Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(StringReplace(ParamStr(0),'.exe','.ini',[]));
  try
    edtUsuario.Text := ini.ReadString('LOGIN','Username','');
  finally
    freeAndNil(ini);
  end;
end;

class procedure TfrmLogin.login;
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;
  freeAndNil(frmLogin);
end;

end.

unit unConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, IniFiles;

type
  TfrmConexao = class(TForm)
    Label1: TLabel;
    edtBancoPath: TEdit;
    SpeedButton1: TSpeedButton;
    fodDatabase: TFileOpenDialog;
    Label2: TLabel;
    edtUsuario: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConexao: TfrmConexao;

implementation

{$R *.dfm}

procedure TfrmConexao.BitBtn1Click(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(StringReplace(ParamStr(0),'.exe','.ini',[]));
  try
    ini.WriteString('DATABASE','Path',edtBancoPath.Text);
    ini.WriteString('DATABASE','Username',edtUsuario.Text);
    ini.WriteString('DATABASE','Password',edtSenha.Text);
  finally
    freeAndNil(ini);
  end;
  showMessage('Operação realizada com sucesso!');
  Close;
end;

procedure TfrmConexao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConexao.FormActivate(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(StringReplace(ParamStr(0),'.exe','.ini',[]));
  try
    edtBancoPath.Text := ini.ReadString('DATABASE','Path','');
    edtUsuario.Text := ini.ReadString('DATABASE','Username','');
    edtSenha.Text := ini.ReadString('DATABASE','Password','');
  finally
    freeAndNil(ini);
  end;
end;

procedure TfrmConexao.SpeedButton1Click(Sender: TObject);
begin
  if (fodDatabase.Execute) then
    edtBancoPath.Text := fodDatabase.FileName;
end;

end.

unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    Combustiveis1: TMenuItem;
    anques1: TMenuItem;
    Bombas1: TMenuItem;
    procedure Usurios1Click(Sender: TObject);
    procedure Combustiveis1Click(Sender: TObject);
    procedure anques1Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unUsuarioGUI, unCombustivel, unTanques, unBombas;

procedure TfrmPrincipal.anques1Click(Sender: TObject);
begin
  if frmTanques = nil then
    Application.CreateForm(TfrmTanques, frmTanques);
  frmTanques.Show;
end;

procedure TfrmPrincipal.Bombas1Click(Sender: TObject);
begin
  if frmBombas = nil then
    Application.CreateForm(TfrmBombas, frmBombas);
  frmBombas.Show;
end;

procedure TfrmPrincipal.Combustiveis1Click(Sender: TObject);
begin
  if frmCombustivel = nil then
    Application.CreateForm(TfrmCombustivel, frmCombustivel);
  frmCombustivel.Show;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
  if frmUsuario = nil then
    Application.CreateForm(TfrmUsuario, frmUsuario);
  frmUsuario.Show;
end;

end.

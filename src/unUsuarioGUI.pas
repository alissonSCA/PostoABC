unit unUsuarioGUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unUsuarioDAO, unUsuarioTO, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ButtonGroup, generics.collections;

type
  TfrmUsuario = class(TForm)
    lstUsuarios: TListBox;
    Label1: TLabel;
    lblID: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtUsername: TEdit;
    Label4: TLabel;
    edtPassword: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure lstUsuariosClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    FListaUsuarios: TObjectList<TUsuario>;
    procedure atualizarLista;
    procedure loadFromId(id:integer);
    procedure limparCampos(limpaId:boolean = true);
    procedure habDesabCampos(estado:boolean);
    function getUsuario():TUsuario;
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

procedure TfrmUsuario.atualizarLista;
var
  usuario: TUsuario;
begin
  FListaUsuarios := TUsuarioDAO.listar;
  lstUsuarios.Items.Clear;
  for usuario in FListaUsuarios do
  begin
    lstUsuarios.Items.Add(usuario.toString);
  end;
  if FListaUsuarios.Count > 0 then
    lstUsuarios.ItemIndex := 0;
end;

procedure TfrmUsuario.BitBtn1Click(Sender: TObject);
begin
  limparCampos();
  habDesabCampos(true);
end;

procedure TfrmUsuario.BitBtn2Click(Sender: TObject);
begin
  habDesabCampos(true);
end;

procedure TfrmUsuario.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    TUsuarioDAO.excluir(StrToIntDef(lblID.Caption, -1));
end;

procedure TfrmUsuario.BitBtn4Click(Sender: TObject);
begin
  habDesabCampos(false);
  loadFromId(0);
end;

procedure TfrmUsuario.BitBtn5Click(Sender: TObject);
var
  usuario: TUsuario;
begin
  usuario := getUsuario();
  if usuario.Id > 0 then
    TUsuarioDAO.update(usuario)
  else
    TUsuarioDAO.insert(usuario);
  atualizarLista;
  loadFromId(0);
end;

procedure TfrmUsuario.BitBtn6Click(Sender: TObject);
begin
  atualizarLista;
  loadFromId(0);
end;

procedure TfrmUsuario.FormActivate(Sender: TObject);
begin
  atualizarLista;
  loadFromId(0);
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(frmUsuario);
end;

function TfrmUsuario.getUsuario: TUsuario;
begin
  Result := TUsuario.Create;
  Result.Id := StrToIntDef(lblID.Caption, -1);
  Result.Nome := edtNome.Text;
  Result.Username := edtUsername.Text;
  Result.Password := edtPassword.Text;
end;

procedure TfrmUsuario.habDesabCampos(estado: boolean);
begin
  edtNome.ReadOnly := not estado;
  edtUsername.ReadOnly := not estado;
  edtPassword.ReadOnly := not estado;
end;

procedure TfrmUsuario.limparCampos(limpaId:boolean);
begin
  edtNome.Clear;
  edtUsername.Clear;
  edtPassword.Clear;
  if limpaId then
    lblID.Caption := '';
end;

procedure TfrmUsuario.loadFromId(id: integer);
begin
  if ((id >= FListaUsuarios.Count) or (id < 0)) then
    limparCampos()
  else
  begin
    lblID.Caption := FListaUsuarios.Items[id].Id.ToString;
    edtNome.Text  := FListaUsuarios.Items[id].Nome;
    edtUsername.Text  := FListaUsuarios.Items[id].Username;
    edtPassword.Text  := FListaUsuarios.Items[id].Password;
  end;
end;

procedure TfrmUsuario.lstUsuariosClick(Sender: TObject);
begin
  loadFromId(lstUsuarios.ItemIndex);
end;

end.

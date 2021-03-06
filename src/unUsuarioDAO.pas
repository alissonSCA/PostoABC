unit unUsuarioDAO;

interface

uses
  unDados, unUsuarioTO, generics.collections, Rtti, unAtributos;

type
  TUsuarioDAO = class
    public
      class function  listar():TObjectList<TUsuario>;
      class procedure insert(usuario: TUsuario);
      class procedure update(usuario: TUsuario);
      class procedure excluir(id:integer);
      class function logar(username:String; password: String):TUsuario;
  end;

implementation



{ TUsuarioDAO }

class procedure TUsuarioDAO.excluir(id: integer);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('DELETE FROM USUARIOS WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    ExecSQL;
  end;
end;

class procedure TUsuarioDAO.insert(usuario: TUsuario);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('INSERT INTO USUARIOS (NOME, USERNAME, PASSWORD)');
    Add('VALUES (:NOME, :USERNAME, :PASSWORD)');
    ParamByName('NOME').AsString := usuario.Nome;
    ParamByName('USERNAME').AsString := usuario.Username;
    ParamByName('PASSWORD').AsString := usuario.Password;
    ExecSQL;
  end;
end;

class function TUsuarioDAO.listar: TObjectList<TUsuario>;
var
  usuario: TUsuario;
begin
  result := TObjectList<TUsuario>.Create;
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM USUARIOS');
    Open;
    while not Eof do
    begin
      usuario := TUsuario.Create;
      usuario.Id := FieldByName('ID').AsInteger;
      usuario.Nome := FieldByName('NOME').AsString;
      usuario.Username := FieldByName('USERNAME').AsString;
      usuario.Password := FieldByName('PASSWORD').AsString;
      result.Add(usuario);
      Next;
    end;
  end;
end;

class function TUsuarioDAO.logar(username, password: String): TUsuario;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM USUARIOS');
    Add('WHERE USERNAME = :USERNAME AND PASSWORD = :PASSWORD');
    ParamByName('USERNAME').AsString := username;
    ParamByName('PASSWORD').AsString := password;
    Open;
    if not IsEmpty then
    begin
      usuario.Id := FieldByName('ID').AsInteger;
      usuario.Nome := FieldByName('NOME').AsString;
      usuario.Username := FieldByName('USERNAME').AsString;
      usuario.Password := FieldByName('PASSWORD').AsString;
    end
    else
      usuario.Id := -1;
  end;
  result := usuario;
end;

class procedure TUsuarioDAO.update(usuario: TUsuario);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('UPDATE USUARIOS SET NOME = :NOME, USERNAME = :USERNAME,');
    Add('PASSWORD = :PASSWORD WHERE ID = :ID');
    ParamByName('NOME').AsString := usuario.Nome;
    ParamByName('USERNAME').AsString := usuario.Username;
    ParamByName('PASSWORD').AsString := usuario.Password;
    ParamByName('ID').AsInteger := usuario.Id;
    ExecSQL;
  end;
end;

end.

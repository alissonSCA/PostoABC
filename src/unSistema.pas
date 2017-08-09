unit unSistema;

interface

uses
  unUsuarioTO;

type
  TSistema = class
    private
      class var FUsuarioLogado: TUsuario;
    public
      class function UsuarioLogado:TUsuario;
  end;

implementation

{ TSistema }

class function TSistema.UsuarioLogado: TUsuario;
begin
  if FUsuarioLogado = nil then   {Singleton}
    FUsuarioLogado := TUsuario.Create;
  result := FUsuarioLogado;
end;

end.

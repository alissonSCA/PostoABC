unit unUsuarioTO;

interface
uses
  unAtributos;
type

[TDataTable('USUARIOS')]
TUsuario = class
  private
    FId: integer;
    FNome: String;
    FUserName: String;
    FPassword: String;
  public
    [TDataField('ID')]
    property Id: integer read FId write FId;
    [TDataField('NOME')]
    property Nome: String read FNome write FNome;
    [TDataField('USERNAME')]
    property Username: String read FUserName write FUserName;
    [TDataField('PASSWORD')]
    property Password: String read FPassword write FPassword;
end;

TUsuarioHelper = class helper for TUsuario
  public
    function toString():String;
end;

implementation

{ TUsuarioHelper }

function TUsuarioHelper.toString: String;
begin
  result := nome;
end;

end.

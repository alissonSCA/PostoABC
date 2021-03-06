unit unAbastecimentoTO;

interface

uses unDados;

type

  TCombustivel = class
    private
    FPreco: real;
    FDescricao: String;
    FId: Integer;
    public
      property ID: Integer read FId write FId;
      property Descricao: String read FDescricao write FDescricao;
      property Preco: real read FPreco write FPreco;
  end;

  TCombustivelDAO = class
    public
      class function getCombustivel(id:integer):TCombustivel;
  end;

  TTanque = class
    private
    FDescricao: String;
    FCombustivelID: Integer;
    FId: Integer;
    public
      property ID: Integer read FId write FId;
      property Descricao: String read FDescricao write FDescricao;
      property CombustivelID: Integer read FCombustivelID write FCombustivelID;
  end;

  TTanqueDAO = class
    public
      class function getTanque(id:integer):TTanque;
  end;

  TBomba = class
    private
    FDescricao: String;
    FId: Integer;
    FTanqueID: Integer;
    public
      property ID: Integer read FId write FId;
      property Descricao: String read FDescricao write FDescricao;
      property TanqueID: Integer read FTanqueID write FTanqueID;
  end;

  TBombaDAO = class
    public
      class function getBomba(id:integer):TBomba;
  end;

  TAbastecimento = class
    private
    FPreco: real;
    FCombustivelID: Integer;
    FTotal: real;
    FId: Integer;
    FBombaID: Integer;
    FImposto: real;
    FData: TDateTime;
    FTanqueID: Integer;
    FQuantidade: real;
    public
      property ID: Integer read FId write FId;
      property Data: TDateTime read FData write FData;
      property BombaID: Integer read FBombaID write FBombaID;
      property TanqueID: Integer read FTanqueID write FTanqueID;
      property CombustivelID: Integer read FCombustivelID write FCombustivelID;
      property Preco: real read FPreco write FPreco;
      property Quantidade: real read FQuantidade write FQuantidade;
      property Total: real read FTotal write FTotal;
      property Imposto: real read FImposto write FImposto;
  end;

  TAbastecimentoHelper = class helper for TAbastecimento
    public
      function Combustivel():TCombustivel;
      function Tanque():TTanque;
      function Bomba():TBomba;
  end;

  TAbastecimentoDAO = class
    public
      class procedure insert(abastecimento: TAbastecimento);
  end;

implementation

{ TCombustivelDAO }

class function TCombustivelDAO.getCombustivel(id: integer): TCombustivel;
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM COMBUSTIVEL WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    Open;

    result := TCombustivel.Create;
    if not IsEmpty then
    begin
      Result.ID         := FieldByName('ID').AsInteger;
      Result.Descricao  := FieldByName('DESCRICAO').AsString;
      Result.Preco      := FieldByName('PRECO').AsFloat;
    end
    else
      Result.ID := -1;
  end;
end;

{ TTanqueDAO }

class function TTanqueDAO.getTanque(id: integer): TTanque;
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM TANQUE WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    Open;

    result := TTanque.Create;
    if not IsEmpty then
    begin
      Result.ID             := FieldByName('ID').AsInteger;
      Result.Descricao      := FieldByName('DESCRICAO').AsString;
      Result.CombustivelID  := FieldByName('COMBUSTIVEL').AsInteger;
    end
    else
      Result.ID := -1;
  end;
end;

{ TBombaDAO }

class function TBombaDAO.getBomba(id: integer): TBomba;
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM BOMBAS WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    Open;

    result := TBomba.Create;
    if not IsEmpty then
    begin
      Result.ID             := FieldByName('ID').AsInteger;
      Result.Descricao      := FieldByName('DESCRICAO').AsString;
      Result.TanqueID       := FieldByName('TANQUE').AsInteger;
    end
    else
      Result.ID := -1;
  end;
end;

{ TAbastecimentoHelper }

function TAbastecimentoHelper.Bomba: TBomba;
begin
  result := TBombaDAO.getBomba(BombaID);
end;

function TAbastecimentoHelper.Combustivel: TCombustivel;
begin
  result := TCombustivelDAO.getCombustivel(CombustivelID);
end;

function TAbastecimentoHelper.Tanque: TTanque;
begin
  result := TTanqueDAO.getTanque(TanqueID);
end;

{ TAbastecimentoDAO }

class procedure TAbastecimentoDAO.insert(abastecimento: TAbastecimento);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('INSERT INTO ABASTECIMENTO (  ');
    Add(' DATA,                       ');
    Add(' BOMBA,                      ');
    Add(' TANQUE,                     ');
    Add(' COMBUSTIVEL,                ');
    Add(' QUANTIDADE,                 ');
    Add(' PRECO,                      ');
    Add(' TOTAL,                      ');
    Add(' IMPOSTO                     ');
    Add(') VALUES (                   ');
    Add(' :DATA,                      ');
    Add(' :BOMBA,                     ');
    Add(' :TANQUE,                    ');
    Add(' :COMBUSTIVEL,               ');
    Add(' :QUANTIDADE,                ');
    Add(' :PRECO,                     ');
    Add(' :TOTAL,                     ');
    Add(' :IMPOSTO)                   ');
    ParamByName('DATA'        ).AsDateTime  := abastecimento.Data;
    ParamByName('BOMBA'       ).AsInteger   := abastecimento.BombaID;
    ParamByName('TANQUE'      ).AsInteger   := abastecimento.TanqueID;
    ParamByName('COMBUSTIVEL' ).AsInteger   := abastecimento.CombustivelID;
    ParamByName('QUANTIDADE'  ).AsFloat     := abastecimento.Quantidade;
    ParamByName('PRECO'       ).AsFloat     := abastecimento.Preco;
    ParamByName('TOTAL'       ).AsFloat     := abastecimento.Total;
    ParamByName('IMPOSTO'     ).AsFloat     := abastecimento.Imposto;
    ExecSQL;
  end;
end;

end.

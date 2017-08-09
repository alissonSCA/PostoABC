unit unAttributes;

interface

type

TTableAttribute = class(TCustomAttribute)
  private
    FTableName: string;
  public
    property TableName: string read FTableName;
    constructor Create(ATableName:string);overload;
end;

TFieldAttribute = class(TCustomAttribute)
  private
    FFieldName: string;
  public
    property FieldName: string read FFieldName;
    constructor Create(AFieldName:string);overload;
end;

implementation

{ TTableAttribute }

constructor TTableAttribute.Create(ATableName: string);
begin
  FTableName := ATableName;
end;

{ TFieldAttribute }

constructor TFieldAttribute.Create(AFieldName: string);
begin
  FFieldName := AFieldName;
end;

end.

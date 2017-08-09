unit unHelpers;

interface

uses
  Vcl.StdCtrls;

type
  TListBoxHelper = class helper for TListBox
    function selecionado:String;
  end;

  TIris =  (SETOSA, VERSICOLOR, VIRGINICA);

  TIrisHelper = record helper for TIris
    function vetor:string;
  end;


implementation

{ TListBoxHelper }

function TListBoxHelper.selecionado: String;
begin
  if self.ItemIndex > -1 then
  begin
    result := self.Items[self.ItemIndex];
  end
  else
  begin
    result := '';
  end;
end;

{ TIrisHelper }

function TIrisHelper.vetor: string;
begin
  case self of
    SETOSA: result := '{0,0,1}';
    VERSICOLOR: result := '{0,1,0}';
    VIRGINICA: result := '{1,0,0}';
  end;
end;

end.

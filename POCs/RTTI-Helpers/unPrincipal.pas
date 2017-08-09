unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, unHelpers;

type
  TfrmPrincipal = class(TForm)
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(ListBox1.selecionado);
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
var
  i:integer;
begin
  for i := 1 to 10 do
  begin
    ListBox1.Items.Add('Elemento '+i.ToString);
  end;
end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
var
  iris: TIris;
begin
  for iris := Low(TIris) to High(TIris) do
    ListBox1.Items.Add(iris.vetor);
end;

end.

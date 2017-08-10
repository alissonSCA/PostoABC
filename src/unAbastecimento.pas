unit unAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, unConsulta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, unAbastecimentoTO, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls;

type
  TfrmAbastecimento = class(TForm)
    qryAbastecimento: TFDQuery;
    DBCtrlGrid1: TDBCtrlGrid;
    Panel1: TPanel;
    lblCombustivel: TLabel;
    lblPreco: TLabel;
    qryBomba: TFDQuery;
    dtsBomba: TDataSource;
    lblTanque: TLabel;
    dtsAbastecimento: TDataSource;
    DBGrid1: TDBGrid;
    edtQuantidade: TEdit;
    Label1: TLabel;
    btnGravar: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FAbastecimento: TAbastecimento;
    procedure loadFromBomba();
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnGravarClick(Sender: TObject);
var
  qtd:real;
begin
  qtd := strToFloatDef(edtQuantidade.Text, -1);
  if qtd < 0 then
  begin
    showMessage('Quantidade Inv�lida!');
    exit;
  end;

  FAbastecimento.Data := now;
  FAbastecimento.Quantidade := qtd;
  FAbastecimento.Preco := FAbastecimento.Combustivel.Preco;
  FAbastecimento.Total := FAbastecimento.Preco * FAbastecimento.Quantidade;
  FAbastecimento.Imposto := 0.13*FAbastecimento.Total;

  TAbastecimentoDAO.insert(FAbastecimento);

  qryAbastecimento.Close;
  qryAbastecimento.Open;

  loadFromBomba;
  edtQuantidade.SetFocus;
end;

procedure TfrmAbastecimento.DBCtrlGrid1Click(Sender: TObject);
begin
  loadFromBomba;
  edtQuantidade.SetFocus;
end;

procedure TfrmAbastecimento.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    btnGravar.SetFocus;
    key := #0;
  end;
end;

procedure TfrmAbastecimento.FormActivate(Sender: TObject);
begin
  qryAbastecimento.Open;
  qryBomba.Open;
  loadFromBomba;
  edtQuantidade.SetFocus;
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeAndNil(frmAbastecimento);
end;

procedure TfrmAbastecimento.loadFromBomba;
begin
  freeAndNil(FAbastecimento);
  FAbastecimento := TAbastecimento.Create;
  FAbastecimento.BombaID := qryBomba.FieldByName('ID').AsInteger;
  FAbastecimento.TanqueID := FAbastecimento.Bomba.TanqueID;
  FAbastecimento.CombustivelID := FAbastecimento.Tanque.CombustivelID;

  lblCombustivel.Caption := FAbastecimento.Combustivel.Descricao;
  lblPreco.Caption := FormatFloat('R$ #,##0.000', FAbastecimento.Combustivel.Preco);
  lblTanque.Caption := FAbastecimento.Tanque.Descricao;
end;

end.

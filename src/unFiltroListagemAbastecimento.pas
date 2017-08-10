unit unFiltroListagemAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, unConsulta, unListagemDeAbastecimentos,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, unAbastecimentoTO,
  Vcl.Mask;

type
  TfrmFiltroListagemAbastecimento = class(TForm)
    Label1: TLabel;
    edtCombustivel: TEdit;
    Label2: TLabel;
    lblCombustivel: TLabel;
    edtTanque: TEdit;
    Label3: TLabel;
    lblTanque: TLabel;
    edtBomba: TEdit;
    Label5: TLabel;
    lblBomba: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtDataIni: TMaskEdit;
    edtDataFim: TMaskEdit;
    procedure edtCombustivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTanqueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBombaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtCombustivelChange(Sender: TObject);
    procedure edtTanqueChange(Sender: TObject);
    procedure edtBombaChange(Sender: TObject);
    procedure edtDataFimExit(Sender: TObject);
    procedure edtDataIniExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDateEditHelper = class helper for TMaskEdit
    public
      function getDateTime():TDateTime;
      function getDate():TDate;
      function getTime():TTime;
  end;

var
  frmFiltroListagemAbastecimento: TfrmFiltroListagemAbastecimento;

implementation

{$R *.dfm}

procedure TfrmFiltroListagemAbastecimento.edtTanqueChange(Sender: TObject);
var
  tanqueId: integer;
  tanque: TTanque;
begin
  tanqueId := StrToIntDef(edtTanque.Text, -1);
  tanque := TTanqueDAO.getTanque(tanqueId);
  if tanque.ID > 0 then
    lblTanque.Caption := tanque.Descricao
  else
    lblTanque.Caption := '...';
end;

procedure TfrmFiltroListagemAbastecimento.edtTanqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    edtTanque.Text := TfrmConsulta.consultarBanco(
                                procedure (qry: TFDQuery; par:String)
                                begin
                                  with qry, qry.SQL do
                                  begin
                                    Close;
                                    Clear;
                                    Add('SELECT ID, DESCRICAO FROM TANQUE');
                                    if par.Trim <> '' then
                                    begin
                                      Add('WHERE ID = :ID');
                                      ParamByName('ID').AsInteger := strToIntDef(par, -1);
                                    end;
                                    Open;
                                  end;
                                end,
                                'ID');
  end;
end;

procedure TfrmFiltroListagemAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeAndNil(frmFiltroListagemAbastecimento);
end;

procedure TfrmFiltroListagemAbastecimento.BitBtn1Click(Sender: TObject);
begin
  with frmListagemAbastecimento.qryListagemAbastecimento, frmListagemAbastecimento.qryListagemAbastecimento.SQL do
  begin
    Close;
    Clear;

    Add('SELECT                                    ');
    aDD('   A.DATA,                                ');
    aDD('   A.BOMBA,                               ');
    aDD('   T.DESCRICAO AS "TANQUE",               ');
    Add('   C.DESCRICAO AS "COMBUSTIVEL",          ');
    Add('   A.QUANTIDADE,                          ');
    Add('   A.PRECO,                               ');
    aDD('   A.TOTAL,                               ');
    aDD('   A.IMPOSTO                              ');
    aDD('FROM                                      ');
    aDD('   abaSTECIMENTO A INNER JOIN BOMBAS B ON ');
    Add('       A.BOMBA = B.ID                     ');
    Add('   INNER JOIN TANQUE T ON                 ');
    Add('       A.TANQUE = T.ID                    ');
    Add('   INNER JOIN COMBUSTIVEL C ON            ');
    Add('       A.COMBUSTIVEL = C.ID               ');
    Add('WHERE                                     ');
    Add('   1 = 1                                  ');

    if edtDataIni.getDateTime > 0 then
    begin
      Add('AND DATA >= :DATAINI');
      ParamByName('DATAINI').AsDateTime := edtDataIni.getDateTime;
    end;
    if edtDataFim.getDateTime > 0 then
    begin
      Add('AND DATA <= :DATAFIM');
      ParamByName('DATAFIM').AsDateTime := edtDataFim.getDateTime;
    end;
    if strToIntDef(edtTanque.Text, -1) > 0 then
    begin
      Add('AND T.ID = :TANQUE');
      ParamByName('TANQUE').AsInteger := strToIntDef(edtTanque.Text, -1);
    end;
    if strToIntDef(edtBomba.Text, -1) > 0 then
    begin
      Add('AND B.ID = :BOMBA');
      ParamByName('BOMBA').AsInteger := strToIntDef(edtBomba.Text, -1);
    end;
    if strToIntDef(edtCombustivel.Text, -1) > 0 then
    begin
      Add('AND C.ID = :COMB');
      ParamByName('COMB').AsInteger := strToIntDef(edtCombustivel.Text, -1);
    end;

    Add('ORDER BY                                  ');
    Add('  A.DATA DESC                             ');
    Open;
  end;
  frmListagemAbastecimento.RLReport1.Preview();
end;

procedure TfrmFiltroListagemAbastecimento.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltroListagemAbastecimento.edtBombaChange(Sender: TObject);
var
  bombId: integer;
  bomba: TBomba;
begin
  bombId := StrToIntDef(edtBomba.Text, -1);
  bomba := TBombaDAO.getBomba(bombId);
  if bomba.ID > 0 then
    lblBomba.Caption := bomba.Descricao
  else
    lblBomba.Caption := '...';
end;

procedure TfrmFiltroListagemAbastecimento.edtBombaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    edtBomba.Text := TfrmConsulta.consultarBanco(
                                procedure (qry: TFDQuery; par:String)
                                begin
                                  with qry, qry.SQL do
                                  begin
                                    Close;
                                    Clear;
                                    Add('SELECT ID, DESCRICAO FROM BOMBAS');
                                    if par.Trim <> '' then
                                    begin
                                      Add('WHERE ID = :ID');
                                      ParamByName('ID').AsInteger := strToIntDef(par, -1);
                                    end;
                                    Open;
                                  end;
                                end,
                                'ID');
  end;
end;

procedure TfrmFiltroListagemAbastecimento.edtCombustivelChange(Sender: TObject);
var
  combId: integer;
  combustivel: TCombustivel;
begin
  combId := StrToIntDef(edtCombustivel.Text, -1);
  combustivel := TCombustivelDAO.getCombustivel(combId);
  if combustivel.ID > 0 then
    lblCombustivel.Caption := combustivel.Descricao
  else
    lblCombustivel.Caption := '...';
end;

procedure TfrmFiltroListagemAbastecimento.edtCombustivelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    edtCombustivel.Text := TfrmConsulta.consultarBanco(
                                procedure (qry: TFDQuery; par:String)
                                begin
                                  with qry, qry.SQL do
                                  begin
                                    Close;
                                    Clear;
                                    Add('SELECT ID, DESCRICAO FROM COMBUSTIVEL');
                                    if par.Trim <> '' then
                                    begin
                                      Add('WHERE ID = :ID');
                                      ParamByName('ID').AsInteger := strToIntDef(par, -1);
                                    end;
                                    Open;
                                  end;
                                end,
                                'ID');
  end;
end;

procedure TfrmFiltroListagemAbastecimento.edtDataFimExit(Sender: TObject);
begin
  if (edtDataFim.getDateTime = edtDataFim.getDate) and (edtDataFim.getDateTime > 0) then
    edtDataFim.Text := FormatDateTime('DD/MM/YYYY',edtDataFim.getDate)+' 23:59:59';
end;

procedure TfrmFiltroListagemAbastecimento.edtDataIniExit(Sender: TObject);
begin
  if (edtDataIni.getDateTime = edtDataIni.getDate) and (edtDataIni.getDateTime > 0) then
    edtDataIni.Text := FormatDateTime('DD/MM/YYYY HH:mm:SS', edtDataIni.getDateTime);
end;

{ TDateEditHelper }

function TDateEditHelper.getDate: TDate;
var
  data: TDateTime;
begin
  data := StrToDateTimeDef(self.Text,0);
  result := trunc(data);
end;

function TDateEditHelper.getDateTime: TDateTime;
var
  data: TDateTime;
begin
  data := StrToDateTimeDef(self.Text,0);
  result := data;
end;

function TDateEditHelper.getTime: TTime;
var
  data: TDateTime;
begin
  data := StrToDateTimeDef(self.Text,0);
  result := data - trunc(data);
end;

end.

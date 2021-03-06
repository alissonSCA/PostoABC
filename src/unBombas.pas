unit unBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, unConsulta, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Mask, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmBombas = class(TForm)
    qryBombas: TFDQuery;
    qryBombasID: TIntegerField;
    qryBombasDESCRICAO: TStringField;
    qryBombasTANQUE: TIntegerField;
    Label1: TLabel;
    dtsBombas: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lblTanque: TLabel;
    Label5: TLabel;
    lblCombustivel: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    procedure DBEdit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure preencheDescDet(id:integer);
  public
    { Public declarations }
  end;

var
  frmBombas: TfrmBombas;

implementation

{$R *.dfm}

{ TfrmBombas }

procedure TfrmBombas.DBEdit3Change(Sender: TObject);
begin
  preencheDescDet(strToIntDef(DBEdit3.Text, -1));
end;

procedure TfrmBombas.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
  begin
    DBEdit3.Text := TfrmConsulta.consultarBanco(
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

procedure TfrmBombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(frmBombas);
end;

procedure TfrmBombas.FormCreate(Sender: TObject);
begin
  qryBombas.Open;
end;

procedure TfrmBombas.preencheDescDet(id: integer);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('select                                   ');
    Add('   T.descricao AS "DESC_TANQUE",         ');
    Add('   C.descricao AS "DESC_COMB"            ');
    Add('from                                     ');
    Add('   TANQUE T INNER JOIN combustivel C ON  ');
    Add('       T.combustivel = C.id              ');
    Add('where                                    ');
    Add('   t.id = :id                            ');
    ParamByName('ID').AsInteger := id;
    Open;
    if not IsEmpty then
    begin
      lblTanque.Caption := Fields[0].DisplayText;
      lblCombustivel.Caption := Fields[1].DisplayText;
    end
    else
    begin
      lblTanque.Caption := '...';
      lblCombustivel.Caption := '...';
    end;
  end;
end;

end.

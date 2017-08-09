unit unTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, unConsulta;

type
  TfrmTanques = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    qryTanques: TFDQuery;
    qryTanquesID: TIntegerField;
    qryTanquesDESCRICAO: TStringField;
    qryTanquesCOMBUSTIVEL: TIntegerField;
    qryTanquesCOMB_DESC: TStringField;
    Label1: TLabel;
    dtsTanques: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    lblDescComb: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Change(Sender: TObject);
  private
    { Private declarations }
    procedure preencheDescComb(id:integer);
  public
    { Public declarations }
  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

procedure TfrmTanques.DBEdit3Change(Sender: TObject);
begin
  preencheDescComb(strToIntDef(DBEdit3.Text, -1));
end;

procedure TfrmTanques.DBEdit3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(frmTanques);
end;

procedure TfrmTanques.FormCreate(Sender: TObject);
begin
  qryTanques.Open;
end;

procedure TfrmTanques.preencheDescComb(id: integer);
begin
  with DM.myQry, DM.myQry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT DESCRICAO FROM COMBUSTIVEL WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    Open;
    if not IsEmpty then
      lblDescComb.Caption := Fields[0].DisplayText
    else
      lblDescComb.Caption := '...';
  end;
end;

end.

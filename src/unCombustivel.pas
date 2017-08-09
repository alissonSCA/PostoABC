unit unCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCombustivel = class(TForm)
    qryCombustiveis: TFDQuery;
    qryCombustiveisID: TIntegerField;
    qryCombustiveisDESCRICAO: TStringField;
    qryCombustiveisPRECO: TBCDField;
    Label1: TLabel;
    dtsCombustiveis: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCombustivel: TfrmCombustivel;

implementation

{$R *.dfm}

procedure TfrmCombustivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(frmCombustivel);
end;

procedure TfrmCombustivel.FormCreate(Sender: TObject);
begin
  with qryCombustiveis, qryCombustiveis.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM COMBUSTIVEL');
    Open;
  end;
end;

end.

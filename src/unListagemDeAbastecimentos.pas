unit unListagemDeAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, RLReport, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLParser;

type
  TfrmListagemAbastecimento = class(TForm)
    RLReport1: TRLReport;
    qryListagemAbastecimento: TFDQuery;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    dtsListagemAbastecimento: TDataSource;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLExpressionParser1: TRLExpressionParser;
    RLDBResult2: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemAbastecimento: TfrmListagemAbastecimento;

implementation

{$R *.dfm}

end.

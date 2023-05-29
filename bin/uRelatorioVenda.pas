unit uRelatorioVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TfrmRelatorioVenda = class(TForm)
    rlRelatorioVenda: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    lblDataVenda: TRLLabel;
    RLBand3: TRLBand;
    dbtxtDataVenda: TRLDBText;
    lblTanque: TRLLabel;
    lblBomba: TRLLabel;
    lblValorTotalBomba: TRLLabel;
    dbtxtTanque: TRLDBText;
    dbtxtBomba: TRLDBText;
    dbtxtValorBomba: TRLDBText;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    dbResultTotal: TRLDBResult;
    lblPosto: TRLLabel;
    dbtxtPosto: TRLDBText;
    lblCNPJ: TRLLabel;
    dbtxtCNPJ: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioVenda: TfrmRelatorioVenda;

implementation

uses
  uRelatorioGrid;

{$R *.dfm}

end.

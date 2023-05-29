unit uRelatorioGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDataModule, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmRelatorioGrid = class(TForm)
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    grdRelatorioVenda: TDBGrid;
    qryRelatorioVenda: TFDQuery;
    dsRelatorioVenda: TDataSource;
    qryRelatorioVendaDATAVENDA: TDateTimeField;
    qryRelatorioVendaNOME: TWideStringField;
    qryRelatorioVendaNOME_1: TWideStringField;
    btnSair: TButton;
    btnImprimir: TButton;
    qryRelatorioVendaVALORTOTAL: TFloatField;
    qryPosto: TFDQuery;
    dsPosto: TDataSource;
    qryPostoID: TFDAutoIncField;
    qryPostoNOMEPOSTO: TWideStringField;
    qryPostoCNPJ: TLargeintField;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  frmRelatorioGrid: TfrmRelatorioGrid;

implementation

uses
  uRelatorioVenda;

{$R *.dfm}

procedure TfrmRelatorioGrid.btnImprimirClick(Sender: TObject);
begin
  frmRelatorioVenda.rlRelatorioVenda.Preview;
end;

procedure TfrmRelatorioGrid.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryRelatorioVenda.Close;
end;

procedure TfrmRelatorioGrid.FormShow(Sender: TObject);
begin
  qryRelatorioVenda.Open;
end;

end.

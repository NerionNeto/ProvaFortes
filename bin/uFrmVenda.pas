unit uFrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uDataModule, FireDAC.Stan.Intf, System.UITypes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmVenda = class(TForm)
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    grdVenda: TDBGrid;
    btnSair: TButton;
    dsVenda: TDataSource;
    qryVenda: TFDQuery;
    lblLitro: TLabel;
    lblTipoCombustivel: TLabel;
    lblDataVenda: TLabel;
    qryVendaVALORLITRO: TBCDField;
    qryVendaTIPOCOMBUSTIVEL: TWideStringField;
    qryVendaIMPOSTO: TBCDField;
    qryVendaLITRO: TIntegerField;
    qryVendaDATAVENDA: TDateTimeField;
    qryVendaVALORTOTAL: TBCDField;
    qryBomba: TFDQuery;
    dsBomba: TDataSource;
    lblBomba: TLabel;
    qryBombaID: TFDAutoIncField;
    qryBombaNOME: TWideStringField;
    qryBombaTIPOCOMBUSTIVEL: TWideStringField;
    qryBombaVALORLITRO: TBCDField;
    qryVendaNOME: TWideStringField;
    cbBomba: TDBLookupComboBox;
    qryVendaIDBOMBA: TIntegerField;
    btnInserir: TButton;
    btnDeletar: TButton;
    edtLitro: TEdit;
    dtpDataVenda: TDateTimePicker;
    cbTipoCombustivel: TComboBox;
    qryVendaID: TFDAutoIncField;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure cbTipoCombustivelChange(Sender: TObject);
    procedure cbTipoCombustivelExit(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure grdVendaCellClick(Column: TColumn);
  private
    FID: Integer;

    procedure BuscaBomba;
    function BuscarValorLitro: Currency;
  public

  end;

var
  frmVenda: TfrmVenda;

implementation

uses
  uClasseVenda;

{$R *.dfm}

procedure TfrmVenda.btnDeletarClick(Sender: TObject);
var
  ClasseVenda: TVendaClass;
begin
  if (FID = 0) or
     (MessageDlg('Você deseja excluir o registro ID Venda: ' + IntToStr(FID) + '?',mtConfirmation,[mbyes,mbno],0) = mrno) then
    Exit;

  ClasseVenda := TVendaClass.Create;
  try
    ClasseVenda.ID := FID;
    ClasseVenda.DeletaVenda;
  finally
    FreeAndNil(ClasseVenda);
    qryVenda.Refresh
  end;
end;

procedure TfrmVenda.btnInserirClick(Sender: TObject);
var
  ClasseVenda: TVendaClass;
begin
  ClasseVenda := TVendaClass.Create;
  try
    ClasseVenda.ValorLitro      := BuscarValorLitro;
    ClasseVenda.TipoCombustivel := cbTipoCombustivel.Text;
    ClasseVenda.Imposto         := ClasseVenda.ValorLitro * 0.15;
    ClasseVenda.Litro           := StrToInt(edtLitro.Text);
    ClasseVenda.DataVenda       := dtpDataVenda.Date;
    ClasseVenda.ValorTotal      := (ClasseVenda.ValorLitro + ClasseVenda.Imposto) * ClasseVenda.Litro;
    ClasseVenda.IDBomba         := cbBomba.KeyValue;

    ClasseVenda.InsereVenda;
  finally
    FreeAndNil(ClasseVenda);
    qryVenda.Refresh;
  end;
end;

procedure TfrmVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVenda.BuscaBomba;
begin
  qryBomba.Close;
  qryBomba.ParamByName('PTIPOCOMBUSTIVEL').AsString := cbTipoCombustivel.Text;
  qryBomba.Open;
end;

function TfrmVenda.BuscarValorLitro: Currency;
var
  FDataModuleBanco: TDataModuleBanco;
begin
  FDataModuleBanco := TDataModuleBanco.Create(nil);

  try
    FDataModuleBanco.qrySelect.Close;
    FDataModuleBanco.qrySelect.SQL.Clear;
    FDataModuleBanco.qrySelect.SQL.Text := 'SELECT VALORLITRO FROM BOMBA ' +
                                           ' WHERE NOME = :PNOME ';

    FDataModuleBanco.qrySelect.ParamByName('PNOME').AsString := cbBomba.Text;
    FDataModuleBanco.qrySelect.Open;

    Result := FDataModuleBanco.qrySelect.FieldByName('VALORLITRO').AsCurrency;
  finally
    FreeAndNil(FDataModuleBanco);
  end;
end;

procedure TfrmVenda.cbTipoCombustivelChange(Sender: TObject);
begin
  BuscaBomba;
end;

procedure TfrmVenda.cbTipoCombustivelExit(Sender: TObject);
begin
  BuscaBomba;
end;

procedure TfrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryVenda.Close;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin
  dtpDataVenda.Date := Now;

  qryVenda.Open;
end;

procedure TfrmVenda.grdVendaCellClick(Column: TColumn);
begin
  FID := grdVenda.Fields[0].AsInteger;
end;

end.

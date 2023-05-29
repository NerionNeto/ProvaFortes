unit uClasseVenda;

interface

type
  TVendaClass = Class

  private
    FID: Integer;
    FValorLitro: Currency;
    FTipoCombustivel: string;
    FImposto: Currency;
    FLitro: Integer;
    FDataVenda: TDateTime;
    FValorTotal: Currency;
    FIDBomba: Integer;
    FDeleteTeste: Boolean;

    function GetDataVenda: TDateTime;
    function GetImposto: Currency;
    function GetLitro: Integer;
    function GetTipoCombustivel: string;
    function GetValorLitro: Currency;
    function GetValorTotal: Currency;
    procedure SetDataVenda(const Value: TDateTime);
    procedure SetImposto(const Value: Currency);
    procedure SetLitro(const Value: Integer);
    procedure SetTipoCombustivel(const Value: string);
    procedure SetValorLitro(const Value: Currency);
    procedure SetValorTotal(const Value: Currency);
    function GetID: Integer;
    procedure SetID(const Value: Integer);
    function GetIDBomba: Integer;
    procedure SetIDBomba(const Value: Integer);
    function GetDeletaTeste: Boolean;
    procedure SetDeletaTeste(const Value: Boolean);
  public
    procedure InsereVenda;
    procedure DeletaVenda;
    function VerificaInsertTeste: boolean;

    property ValorLitro: Currency read GetValorLitro write SetValorLitro;
    property TipoCombustivel: string read GetTipoCombustivel write SetTipoCombustivel;
    property Imposto: Currency read GetImposto write SetImposto;
    property Litro: Integer read GetLitro write SetLitro;
    property DataVenda: TDateTime read GetDataVenda write SetDataVenda;
    property ValorTotal: Currency read GetValorTotal write SetValorTotal;
    property ID: Integer read GetID write SetID;
    property IDBomba: Integer read GetIDBomba write SetIDBomba;
    property DeletaTeste: Boolean read GetDeletaTeste write SetDeletaTeste default False;
  End;
implementation

uses
  uDataModule, System.SysUtils, FireDac.Stan.Param, Data.DB;

{ TVendaClass }

procedure TVendaClass.DeletaVenda;
var
  FDataModuleBanco: TDataModuleBanco;
begin
  FDataModuleBanco := TDataModuleBanco.Create(nil);

  try
    FDataModuleBanco.qryDelete.Close;
    FDataModuleBanco.qryDelete.SQL.Clear;
    FDataModuleBanco.qryDelete.SQL.Add('DELETE FROM VENDA ');

    if not(FDeleteTeste) then
    begin
      FDataModuleBanco.qryDelete.SQL.Add(' WHERE ID = :PID ');
      FDataModuleBanco.qryDelete.ParamByName('PID').AsInteger := FID;
    end;

    FDataModuleBanco.qryDelete.ExecSQL;
  finally
    FreeAndNil(FDataModuleBanco);
  end;
end;

function TVendaClass.GetDataVenda: TDateTime;
begin
  Result := FDataVenda;
end;

function TVendaClass.GetDeletaTeste: Boolean;
begin
  Result := FDeleteTeste;
end;

function TVendaClass.GetID: Integer;
begin
  Result := FID;
end;

function TVendaClass.GetIDBomba: Integer;
begin
  Result := FIDBomba;
end;

function TVendaClass.GetImposto: Currency;
begin
  Result := FImposto;
end;

function TVendaClass.GetLitro: Integer;
begin
  Result := FLitro;
end;

function TVendaClass.GetTipoCombustivel: string;
begin
  Result := FTipoCombustivel;
end;

function TVendaClass.GetValorLitro: Currency;
begin
  Result := FValorLitro;
end;

function TVendaClass.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

procedure TVendaClass.InsereVenda;
var
  FDataModuleBanco: TDataModuleBanco;
begin
  FDataModuleBanco := TDataModuleBanco.Create(nil);

  try
    FDataModuleBanco.qryInsert.Close;
    FDataModuleBanco.qryInsert.SQL.Clear;
    FDataModuleBanco.qryInsert.SQL.Text := 'INSERT INTO VENDA (VALORLITRO, TIPOCOMBUSTIVEL, IMPOSTO, LITRO, DATAVENDA, VALORTOTAL, IDBOMBA) ' +
                                           ' VALUES (:PVALORLITRO, :PTIPOCOMBUSTIVEL, :PIMPOSTO, :PLITRO, :PDATAVENDA, :PVALORTOTAL, :PIDBOMBA)';
    FDataModuleBanco.qryInsert.ParamByName('PVALORLITRO').AsCurrency    := FValorLitro;
    FDataModuleBanco.qryInsert.ParamByName('PTIPOCOMBUSTIVEL').AsString := FTipoCombustivel;
    FDataModuleBanco.qryInsert.ParamByName('PIMPOSTO').AsCurrency       := FImposto;
    FDataModuleBanco.qryInsert.ParamByName('PLITRO').AsInteger          := FLitro;
    FDataModuleBanco.qryInsert.ParamByName('PDATAVENDA').AsDateTime     := FDataVenda;
    FDataModuleBanco.qryInsert.ParamByName('PVALORTOTAL').AsCurrency    := FValorTotal;
    FDataModuleBanco.qryInsert.ParamByName('PIDBOMBA').AsInteger        := FIDBOMBA;

    FDataModuleBanco.qryInsert.ExecSQL;
  finally
    FreeAndNil(FDataModuleBanco);
  end;
end;

procedure TVendaClass.SetDataVenda(const Value: TDateTime);
begin
  FDataVenda := Value;
end;

procedure TVendaClass.SetDeletaTeste(const Value: Boolean);
begin
  FDeleteTeste := Value;
end;

procedure TVendaClass.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TVendaClass.SetIDBomba(const Value: Integer);
begin
  FIDBomba := Value;
end;

procedure TVendaClass.SetImposto(const Value: Currency);
begin
  FImposto := Value;
end;

procedure TVendaClass.SetLitro(const Value: Integer);
begin
  FLitro := Value;
end;

procedure TVendaClass.SetTipoCombustivel(const Value: string);
begin
  FTipoCombustivel := Value;
end;

procedure TVendaClass.SetValorLitro(const Value: Currency);
begin
  FValorLitro := Value;
end;

procedure TVendaClass.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

function TVendaClass.VerificaInsertTeste: boolean;
var
  FDataModuleBanco: TDataModuleBanco;
begin
  FDataModuleBanco := TDataModuleBanco.Create(nil);

  try
    FDataModuleBanco.qrySelect.Close;
    FDataModuleBanco.qrySelect.SQL.Clear;
    FDataModuleBanco.qrySelect.SQL.Text := 'SELECT * FROM VENDA';
    FDataModuleBanco.qrySelect.Open;

    Result := not(FDataModuleBanco.qrySelect.IsEmpty);
  finally
    FreeAndNil(FDataModuleBanco);
  end;
end;

end.

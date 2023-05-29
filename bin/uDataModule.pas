unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModuleBanco = class(TDataModule)
    ConnDFPBanco: TFDConnection;
    qryInsert: TFDQuery;
    qrySelect: TFDQuery;
    qryDelete: TFDQuery;
    dsInsert: TDataSource;
    dsSelect: TDataSource;
    dsDelete: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleBanco: TDataModuleBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

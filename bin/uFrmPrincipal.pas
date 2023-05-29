unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    btnVenda: TSpeedButton;
    btnGerenciamento: TSpeedButton;
    procedure btnVendaClick(Sender: TObject);
    procedure btnGerenciamentoClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFrmVenda, uRelatorioGrid;

{$R *.dfm}

procedure TfrmPrincipal.btnGerenciamentoClick(Sender: TObject);
var
  frmRelatorioGrid: TFrmRelatorioGrid;
begin
  frmRelatorioGrid := TFrmRelatorioGrid.Create(nil);

  try
    frmRelatorioGrid.ShowModal;
  finally
    FreeAndNil(frmRelatorioGrid);
  end;

end;

procedure TfrmPrincipal.btnVendaClick(Sender: TObject);
var
  frmVenda: TFrmVenda;
begin
  frmVenda := TFrmVenda.Create(nil);

  try
    frmVenda.ShowModal;
  finally
    FreeAndNil(frmVenda);
  end;

end;

end.

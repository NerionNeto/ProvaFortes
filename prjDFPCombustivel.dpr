program prjDFPCombustivel;

uses
  Vcl.Forms,
  uFrmPrincipal in 'bin\uFrmPrincipal.pas' {frmPrincipal},
  uDataModule in 'bin\uDataModule.pas' {DataModuleBanco: TDataModule},
  uFrmVenda in 'bin\uFrmVenda.pas' {frmVenda},
  uRelatorioGrid in 'bin\uRelatorioGrid.pas' {frmRelatorioGrid},
  uRelatorioVenda in 'bin\uRelatorioVenda.pas' {frmRelatorioVenda},
  uClasseVenda in 'bin\uClasseVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DFPCombustivel';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModuleBanco, DataModuleBanco);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(TfrmRelatorioGrid, frmRelatorioGrid);
  Application.CreateForm(TfrmRelatorioVenda, frmRelatorioVenda);
  Application.Run;

end.

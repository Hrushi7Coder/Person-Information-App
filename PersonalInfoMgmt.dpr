program PersonalInfoMgmt;

uses
  Vcl.Forms,
  frm_MainForm in 'frm_MainForm.pas' {frmMainForm},
  dm_General in 'dm_General.pas' {dmGeneral: TDataModule},
  U_DbLogic in 'U_DbLogic.pas',
  U_Constants in 'U_Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.

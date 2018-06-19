unit dm_General;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB, Vcl.Forms, vcl.dialogs;

type
  TdmGeneral = class(TDataModule)
    adMainConnection: TADOConnection;
    tblGeneral: TADOTable;
    qryGeneral: TADOQuery;
    dsPersonalInfo: TDataSource;
    qryGeneralIdentNr: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGeneral: TdmGeneral;

implementation
  uses inifiles;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmGeneral.DataModuleCreate(Sender: TObject);
var
 lDbIni: TINIFile;
 lConnectionString: string;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Db.ini') then
  begin
    Messagedlg('Database Connection File Missing',mtError,[mbok],0);
    Application.Terminate;
    exit;
  end;
  try
    lDbIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Db.ini');
    lConnectionString := lDbIni.ReadString('Db','connectionstring','');
  finally
    lDbIni.Free;
  end;
  adMainConnection.LoginPrompt:= False;
  adMainConnection.ConnectionString := lConnectionString;
  {
  'DSN=PostgreSQL35W;DATABASE=personalinfo;'
  +'SERVER=localhost;PORT=5432;UID=postgres;SSLmode=disable;ReadOnly=0;'+
  'Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;RowVersioning=0;'+
  'ShowSystemTables=0;ConnSettings=;Fetch=100;Socket=4096;UnknownSizes=0;'+
  'MaxVarcharSize=255;MaxLongVarcharSize=8190;Debug=0;CommLog=0;Optimizer=0;'+
  'Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;UnknownsAsLongVarchar=0;'+
  'BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;ExtraSysTablePrefixes=dd_;;'+
  'LFConversion=1;UpdatableCursors=1;DisallowPremature=0;TrueIsMinus1=0;BI=0;'+
  'ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;GssAuthUseGSS=0;XaOpt=1';   }
  adMainConnection.Connected := True;
  tblGeneral.Active := true;
end;

end.

unit frm_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, U_DbLogic, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMainForm = class(TForm)
    pnlMain: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    spltMain: TSplitter;
    tbcMain: TTabControl;
    lblIdentNr: TLabel;
    edtIdentNr: TEdit;
    gbxPersonType: TGroupBox;
    ckbClient: TCheckBox;
    ckbEmployee: TCheckBox;
    ckbSupplier: TCheckBox;
    ckbTraveler: TCheckBox;
    gbxNames: TGroupBox;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblName: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtName: TEdit;
    lblDepartment: TLabel;
    cbxDepartments: TComboBox;
    lblCountryCode: TLabel;
    edtCountryCode: TEdit;
    btnAdd: TBitBtn;
    btnClear: TBitBtn;
    grdPersonalDetails: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbClientClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    vDbLogic: TDbLogic;
  public
    { Public declarations }
    procedure clearAll;
  end;

var
  frmMainForm: TfrmMainForm;

implementation
  uses dm_General, U_Constants;
{$R *.dfm}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  vDbLogic := TDbLogic.Create;
  clearAll;
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
 if Assigned(vDbLogic) then
 begin
   vDbLogic.Free;
 end;
end;

procedure TfrmMainForm.btnAddClick(Sender: TObject);
var
  lList: TstringList;
  lPersonDetailsRecord: TPersonDetails;
begin
  if trim(edtIdentNr.text) = '' then
  begin
    Messagedlg('Please enter IdentNr field',mtwarning,[mbok],0);
    exit;
  end;
  lList := TstringList.Create;
  try
    if ckbClient.Checked then
    begin
      lList.Add(CPersonType_Client);
    end;
    if ckbClient.Checked then
    begin
      lList.Add(CPersonType_Supplier);
    end;
    if ckbClient.Checked then
    begin
      lList.Add(CPersonType_Employee);
    end;
    if ckbClient.Checked then
    begin
      lList.Add(CPersonType_Traveller);
    end;
    lPersonDetailsRecord.PDIdentNr := trim(edtIdentNr.text);
    lPersonDetailsRecord.PDFirstName := trim(edtFirstName.Text);
    lPersonDetailsRecord.PDLastName := trim(edtLastName.Text);
    lPersonDetailsRecord.PDName := trim(edtName.Text);
    lPersonDetailsRecord.PDDepartment := trim(cbxDepartments.Text);
    lPersonDetailsRecord.PDCountryCode := trim(edtCountryCode.Text);
    if vDbLogic.AddPersonDetails(lPersonDetailsRecord, lList) then
    begin
      Messagedlg('New Perosn Added!!',mtInformation,[mbok],0);
      clearAll;
    end else
    begin
      Messagedlg('There was an error while processing your request,Please '+
      'try again',mtWarning,[mbok],0);
    end;
  finally
    lList.Free;
  end;
end;

procedure TfrmMainForm.btnClearClick(Sender: TObject);
begin
  clearAll;
end;

procedure TfrmMainForm.ckbClientClick(Sender: TObject);
begin
  if ((ckbEmployee.checked) or (ckbTraveler.checked)) then
  begin
    //enable first name,last name and disable name fields
    edtFirstName.enabled := True;
    edtLastName.enabled := True;
    edtName.enabled := False;
  end else
  begin
    //disable first name,last name and enable  name fields
    edtFirstName.enabled := False;
    edtLastName.enabled := False;
    edtName.enabled := True;
  end;

  if ((ckbClient.checked) or (ckbSupplier.checked)) then
  begin
    //enable name field
    edtName.enabled := True;
  end else
  begin
    //disable name field
    edtName.enabled := False;
  end;
  if (ckbEmployee.checked) then
  begin
    //enable depatment dropdown
    cbxDepartments.enabled := True;
  end else begin
    //disable depatment dropdown
    cbxDepartments.enabled := False;
  end;

  if (ckbTraveler.checked) then
  begin
    //enable country code field
    edtCountryCode.enabled := True;
  end else begin
    //disable country code field
    edtCountryCode.enabled := False;
  end;
end;

procedure TfrmMainForm.clearAll;
begin
  ckbClient.Checked := False;
  ckbEmployee.Checked := False;
  ckbSupplier.Checked := False;
  ckbTraveler.Checked := False;
  edtIdentNr.Clear;
  edtFirstName.Clear;
  edtLastName.Clear;
  edtName.Clear;
  edtCountryCode.Clear;
  cbxDepartments.ItemIndex := 0;
end;

end.

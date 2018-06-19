{**********************************************************************************************}
{  Description:                                                                                }
{    - This unit will have some important and useful procedures/functions that will            }
{      be required throughout the application                                                  }
{                                                                                              }
{  Reason for this unit:                                                                       }
{                  - To seggregate the code from the main unit and prevent too                 }
{                   much code clutter in the main unit                                         }
{  Author : Hrushikesh                                                                         }
{                                                                                              }
{  Date   : 18th June 2018                                                                      }
{                                                                                              }
{  Note : ONLY DATABASE CODE HERE                                                              }
{                                                                                              }
{  NAME: U_DbLogic.                                                                            }
{**********************************************************************************************}

unit U_DbLogic;

interface
  uses System.Classes, SysUtils, Dialogs, windows,Vcl.Controls,StdCtrls;

Type
    TPersonDetails  = record
    PDIdentNr,PDType,PDFirstName,PDLastName,PDName,PDDepartment,PDCountryCode: string;
  end;

type
  TDbLogic = class

  private
    procedure InsertDetailsIntoDb(_PersonDetailsRecord: TPersonDetails;_Type: string);
  public
    constructor create;
    function AddPersonDetails(const _PersonDetailsRecord: TPersonDetails; _List: TstringList): boolean;
  end;

implementation
  uses U_Constants, dm_General;

constructor TDbLogic.create;
begin
  //Code to initalize some things
end;

function TDbLogic.AddPersonDetails(const _PersonDetailsRecord: TPersonDetails; _List: TstringList): boolean;
var
  i: integer;
begin
  Result := False;
  try
    for I := 0 to _List.Count - 1 do
    begin
      InsertDetailsIntoDb(_PersonDetailsRecord,_List[i]);
    end;
  except
   on E : Exception do
   begin
     ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
     exit;
   end;
  end;
  Result := True;
end;

procedure TDbLogic. InsertDetailsIntoDb(_PersonDetailsRecord: TPersonDetails;_Type: string);
var
  lQuery: string;
begin
  lQuery := '';
  dmGeneral.qryGeneral.SQL.Clear;
  if ((_Type = CPersonType_Client) or (_Type = CPersonType_Supplier)) then
  begin
    lQuery := 'Insert into persondata(IdentNr,Name) values (:IdentNr,:Name)';
    dmGeneral.qryGeneral.SQL.Add(lQuery);
    dmGeneral.qryGeneral.Fields.FieldByName('IdentNr').asstring := _PersonDetailsRecord.PDIdentNr;
    dmGeneral.qryGeneral.Fields.FieldByName('Name').asstring := _PersonDetailsRecord.PDName;
    dmGeneral.qryGeneral.ExecSQL;
    //Next insert calculated fields known as KnotoNr into new table for accounting purpose
    dmGeneral.qryGeneral.SQL.Clear;
    lQuery := 'Insert into persondatadetails(KontoNr) values (:KontoNr)';
    dmGeneral.qryGeneral.SQL.Add(lQuery);
    dmGeneral.qryGeneral.Fields.FieldByName('KontoNr').asstring :=
      _Type + _PersonDetailsRecord.PDIdentNr;
    dmGeneral.qryGeneral.ExecSQL;
  end
  else if _Type = CPersonType_Employee then
  begin
    lQuery := 'Insert into persondata(IdentNr,FirstName,LastName,Name,DepartmentCode)'+
      ' values (:IdentNr,:FirstName,:LastName,:Name,:DepartmentCode)';
    dmGeneral.qryGeneral.SQL.Add(lQuery);
    dmGeneral.qryGeneral.Fields.FieldByName('IdentNr').asstring := _PersonDetailsRecord.PDIdentNr;
    dmGeneral.qryGeneral.Fields.FieldByName('FirstName').asstring := _PersonDetailsRecord.PDFirstName;
    dmGeneral.qryGeneral.Fields.FieldByName('LastName').asstring := _PersonDetailsRecord.PDLastName;
    dmGeneral.qryGeneral.Fields.FieldByName('Name').asstring :=
      _PersonDetailsRecord.PDFirstName + _PersonDetailsRecord.PDLastName;
    dmGeneral.qryGeneral.Fields.FieldByName('DepartmentCode').asstring := _PersonDetailsRecord.PDDepartment;
    dmGeneral.qryGeneral.ExecSQL;
  end
  else
  if _Type = CPersonType_Traveller then
  begin
    lQuery := 'Insert into persondata(IdentNr,FirstName,LastName,Name,DepartmentCode)'+
      ' values (:IdentNr,:FirstName,:LastName,:Name,:DepartmentCode)';
    dmGeneral.qryGeneral.SQL.Add(lQuery);
    dmGeneral.qryGeneral.Fields.FieldByName('IdentNr').asstring := _PersonDetailsRecord.PDIdentNr;
    dmGeneral.qryGeneral.Fields.FieldByName('FirstName').asstring := _PersonDetailsRecord.PDFirstName;
    dmGeneral.qryGeneral.Fields.FieldByName('LastName').asstring := _PersonDetailsRecord.PDLastName;
    dmGeneral.qryGeneral.Fields.FieldByName('Name').asstring :=
      _PersonDetailsRecord.PDFirstName + _PersonDetailsRecord.PDLastName;
    dmGeneral.qryGeneral.Fields.FieldByName('CountryCode').asstring := _PersonDetailsRecord.PDCountryCode;
    dmGeneral.qryGeneral.ExecSQL;
  end;
end;

end.

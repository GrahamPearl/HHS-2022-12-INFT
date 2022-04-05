unit dm2022;

interface

uses
  SysUtils, Classes, DB, ADODB, StdCtrls;

type
  TDM = class(TDataModule)
    conn: TADOConnection;
    items1: TADOTable;
    query: TADOQuery;
    items2: TADOTable;
    dsItem1: TDataSource;
    dsItem2: TDataSource;
    dsQuery: TDataSource;
    qryStudentSubjects: TADOQuery;
    dsStudentSubjects: TDataSource;
  private
    { Private declarations }

   function calc6(filter : String): Real;

  public
    { Public declarations }
    function connectTo(path: String): Boolean;
    function doSortBy(info : String): Boolean;
    function doSearch(info : String): Boolean;

    function doInsert(info : String): Boolean;
    function doUpdate(info : String): Boolean;
    function doDelete(info : String): Boolean;
    function doSelect(info : String): Boolean;

    function doTables(info : String): Boolean;
    function doDynamic(info : String): Boolean;

    procedure fillComboBoxWithFieldData(var comboBox : TComboBox; field1, field2 : String);
    function calc1(var table : TADOTable; fieldName, match : String): Real;
    function calc2(var table : TADOTable; fieldName, match : String): Real;
    function calc3(var table : TADOTable; fieldName, match : String): Real;
    function calc4(var table : TADOTable; fieldName : String; adjustBy: Integer) : Boolean;
    function calc5(var table : TADOTable; fieldName, cipher : String): Integer;

    procedure refreshStudentSubjects(ID_student: String);

  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }



function TDM.calc1(var table : TADOTable; fieldName, match : String): Real;
//==============================================================================
// Purpose: Counts the number of matches that a field has over all records
var total : Integer;
begin
  total := 0;

  table.First;
  while NOT(table.Eof) do
  begin
    if table.FieldByName(fieldName).AsString = match
    then INC(total);

    table.Next;
  end;

  result := total;
end;

function TDM.calc2(var table : TADOTable; fieldName, match : String): Real;
//==============================================================================
// Purpose: Determines the percentage of matches that a field has over all records
var count,total : Integer;
begin
  count := 0;
  total := 0;

  table.First;
  while NOT(table.Eof) do
  begin
    if table.FieldByName(fieldName).AsString = match
    then INC(count);
         INC(total);
    table.Next;
  end;

  if (total > 0)
  then result := count/total
  else result := -1;
end;

function TDM.calc3(var table : TADOTable; fieldName, match : String): Real;
//==============================================================================
// Purpose: Determines the distance (number of records) until the next match.
var count : Integer;
begin
  count := 0;

  while NOT(table.Eof) AND (table.FieldByName(fieldName).AsString <> match)  do
  begin
    if table.FieldByName(fieldName).AsString <> match
    then INC(count);

    table.Next;
  end;
  result := count;
end;

function TDM.calc4(var table : TADOTable; fieldName : String; adjustBy: Integer): Boolean;
//==============================================================================
// Purpose: Determines if a field value can be reduced successfully by an amount, greater than negative.
var newAmount : Integer;
    success : Boolean;
begin
  newAmount := table.FieldByName(fieldName).AsInteger + adjustBy;
  success := (newAmount >= 0);
  if success then
  begin
    table.Edit;
    table[fieldName] := newAmount;
    table.Post;
  end;
  result := success;
end;

function TDM.calc5(var table : TADOTable; fieldName, cipher : String): Integer;
//==============================================================================
// Purpose: UN/Encrypts field in the table given a TRANSFORMATION CIPHER
begin

end;

function TDM.calc6(filter: String): Real;
//==============================================================================
begin

end;

function TDM.connectTo(path: String): Boolean;
begin

try
  self.conn.Connected := FALSE;
  self.conn.LoginPrompt := FALSE;
  self.conn.ConnectionString := path;
  self.conn.Connected := TRUE;

  self.items1.Connection := self.conn;
  self.items2.Connection := self.conn;
  self.items1.TableName := 'students';
  self.items2.TableName := 'subjects';
  self.items1.Active := True;
  self.items2.Active := True;
except
  self.conn.Connected := False;
end;

  result := self.conn.Connected;
end;

function TDM.doDelete(info: String): Boolean;
begin

end;

function TDM.doDynamic(info: String): Boolean;
begin

end;

function TDM.doInsert(info: String): Boolean;
begin

end;

function TDM.doSearch(info: String): Boolean;
begin
 DM.items1.Filtered := FALSE;
 DM.items1.Filter := info;
 DM.items1.Filtered := TRUE;
end;

function TDM.doSelect(info: String): Boolean;
var sSQL : String;
begin
 sSQL := info;

 DM.query.Active := FALSE;
 DM.query.SQL.Clear;
 DM.query.SQL.Add(sSQL);
 DM.query.Active := TRUE;
end;

function TDM.doSortBy(info: String): Boolean;
begin
  DM.items1.Sort := info;
end;

function TDM.doTables(info: String): Boolean;
begin

end;

function TDM.doUpdate(info: String): Boolean;
begin

end;

procedure TDM.fillComboBoxWithFieldData(var comboBox: TComboBox; field1, field2 : String);
begin
comboBox.Clear;

  WITH DM2022.DM DO BEGIN
       items1.First;
       while NOT items1.Eof do
       begin
         comboBox.Items.Add(items1.FieldByName(field1).AsString+', '+items1.FieldByName(field2).AsString);
         items1.Next;
       end;
  END;
end;

procedure TDM.refreshStudentSubjects(ID_student: String);
var sSQL : String;
begin
  sSQL := 'SELECT subjects.* '+
          'FROM subjects '+
          'INNER JOIN (students INNER JOIN link_subjects_to_students ON students.id = link_subjects_to_students.IDStudent) '+
          'ON subjects.ID = link_subjects_to_students.IDSubject '+
          'WHERE (((students.id)='+ID_student+'));';

  self.qryStudentSubjects.Active := False;
  self.qryStudentSubjects.SQL.Clear;
  self.qryStudentSubjects.SQL.Add(sSQL);
  self.qryStudentSubjects.Active := True;
end;

end.

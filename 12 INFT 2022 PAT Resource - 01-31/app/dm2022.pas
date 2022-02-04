unit dm2022;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    conn: TADOConnection;
    items1: TADOTable;
    query: TADOQuery;
    items2: TADOTable;
    dsItem1: TDataSource;
    dsItem2: TDataSource;
    dsQuery: TDataSource;
  private
    { Private declarations }

    function calc1(filter : String): Real;
    function calc2(filter : String): Real;
    function calc3(filter : String): Real;
    function calc4(filter : String): Real;
    function calc5(filter : String): Real;
    function calc6(filter : String): Real;
    function doInsert(info : String): Boolean;
    function doUpdate(info : String): Boolean;
    function doDelete(info : String): Boolean;
    function doSelect(info : String): Boolean;

    function doTables(info : String): Boolean;
    function doDynamic(info : String): Boolean;
  public
    { Public declarations }
    function connectTo(path: String): Boolean;
    function doSortBy(info : String): Boolean;
    function doSearch(info : String): Boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }



function TDM.calc1(filter: String): Real;
begin

end;

function TDM.calc2(filter: String): Real;
begin

end;

function TDM.calc3(filter: String): Real;
begin

end;

function TDM.calc4(filter: String): Real;
begin

end;

function TDM.calc5(filter: String): Real;
begin

end;

function TDM.calc6(filter: String): Real;
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
  self.items1.Active := True;

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
begin

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

end.

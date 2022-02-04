unit main;
{ CREATED BY: MR Pearl (2022-JAN-22,
  Original template by Mr Pearl (PearlG@hhs.co.za)

  This is Online E-Learning Student Registration System for:

    Registering Students,
    Registering Students for courses,
    Recording Fees and Subscriptions (expired accounts)
    ===================================================
    Printing of Accounts
    Printing of Student Cards
    Printing of Course Performances
    Printing of Certificates

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ButtonGroup, Grids, DBGrids, OleCtrls, SHDocVw, ComCtrls, StdCtrls,
  ImgList, ToolWin, Menus, CheckLst, ExtCtrls;

type
  TfrmMain = class(TForm)
    menu: TMainMenu;
    toolbar: TToolBar;
    icons32: TImageList;
    status: TStatusBar;
    progress: TProgressBar;
    pages: TPageControl;
    TabSheet1: TTabSheet;
    item1: TTabSheet;
    Browser: TTabSheet;
    webbrowser: TWebBrowser;
    dbgrid: TDBGrid;
    item2: TTabSheet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    File1: TMenuItem;
    New1: TMenuItem;
    Login1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ExecuteSQL1: TMenuItem;
    Help1: TMenuItem;
    Search1: TMenuItem;
    Search2: TMenuItem;
    N2: TMenuItem;
    About1: TMenuItem;
    ools1: TMenuItem;
    Settings1: TMenuItem;
    ToolButton4: TToolButton;
    gbSQLQuery: TGroupBox;
    sql: TRichEdit;
    btnGroupSQL: TButtonGroup;
    icons24: TImageList;
    open: TOpenDialog;
    save: TSaveDialog;
    pnlVisiblePanel: TPanel;
    pnlQuickDo: TPanel;
    btnGroupRHS: TButtonGroup;
    pnlToDo: TPanel;
    todo: TCheckListBox;
    btnUpdateToDoList: TButton;
    popupDBGrid: TPopupMenu;
    SortBY1: TMenuItem;
    ID1: TMenuItem;
    LastName1: TMenuItem;
    FirstName1: TMenuItem;
    FilterBy1: TMenuItem;
    procedure btnGroupRHSClick(Sender: TObject);
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonGroup2Items0Click(Sender: TObject);
    procedure ButtonGroup2Items1Click(Sender: TObject);
    procedure ExecuteSQL1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure btnGroupSQLItems2Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure ID1Click(Sender: TObject);
    procedure LastName1Click(Sender: TObject);
    procedure FirstName1Click(Sender: TObject);
    procedure dbgridTitleClick(Column: TColumn);
    procedure FilterBy1Click(Sender: TObject);
    procedure dbgridCellClick(Column: TColumn);
  private
    { Private declarations }
    function loadHints: Boolean;
    function toggleExecuteSQL(): Boolean;
    function showSettings(): Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses arrays, dm2022, oop, settings, student;
{$R *.dfm}

procedure TfrmMain.btnGroupRHSClick(Sender: TObject);
begin
  showMessage('Button Group Clicked')
end;

procedure TfrmMain.btnGroupSQLItems2Click(Sender: TObject);
var recordsAffected : Integer;
    hasSelect : Boolean;
    hasAction : Boolean;
    lines : Integer;
    aLine : String;

procedure doAction();
Begin
 try
  recordsAffected := DM2022.DM.query.ExecSQL;
  showMessage('Records Affected:'+IntToStr(recordsAffected));
 except
  showMessage('Error, Unable to execute SQL statement');
 end;
End;

begin
  hasSelect := (POS('SELECT',UpperCase(sql.Lines.Text)) > 0);
  hasAction := (POS('INSERT',UpperCase(sql.Lines.Text)) > 0)
            OR (POS('UPDATE',UpperCase(sql.Lines.Text)) > 0)
            OR (POS('DELETE',UpperCase(sql.Lines.Text)) > 0);

  DM2022.DM.query.Active := False;
  DM2022.DM.query.SQL.Clear;

  for lines := 0 to sql.Lines.Count - 1 do
      DM2022.DM.query.SQL.Add(sql.Lines[lines]);

  if (hasSelect) AND (hasAction)
  then showMessage('Error: Both Select and DML SQL statements not supported at pressent');

  if (hasSelect)
  then DM2022.DM.query.Active := True;

  if (hasAction)
  then doAction();


end;

procedure TfrmMain.ButtonGroup1Items0Click(Sender: TObject);
begin
  showMessage('Button 1 Clicked')
end;

procedure TfrmMain.ButtonGroup2Items0Click(Sender: TObject);
begin
  if open.Execute then sql.Lines.LoadFromFile(open.FileName);
end;

procedure TfrmMain.ButtonGroup2Items1Click(Sender: TObject);
begin
  if save.Execute then sql.Lines.SaveToFile(save.FileName);
end;


procedure TfrmMain.dbgridCellClick(Column: TColumn);
begin
  frmStudent.ShowModal;
end;

procedure TfrmMain.dbgridTitleClick(Column: TColumn);
begin
  DM.doSortBy( Column.FieldName );
end;

procedure TfrmMain.ExecuteSQL1Click(Sender: TObject);
begin
  toggleExecuteSQL;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  if FileExists('.\app\hints.txt') then toolbar.ShowHint := loadHints;
  gbSQLQuery.Visible := FALSE;
  self.WindowState := wsMaximized;
end;

procedure TfrmMain.ID1Click(Sender: TObject);
begin
  DM.doSortBy('ID');
end;

procedure TfrmMain.LastName1Click(Sender: TObject);
begin
  DM.doSortBy('last_name');
end;

procedure TfrmMain.FilterBy1Click(Sender: TObject);
var data : String;
begin
  data := InputBox('Filter By','Filter: ','');

  if (data = '')
  then DM.doSearch('')
  else DM.doSearch('first_name LIKE '+QuotedStr(data));
end;

procedure TfrmMain.FirstName1Click(Sender: TObject);
begin
  DM.doSortBy('first_name');
end;


{===============================================================================
  Created by: Mr Pearl
  Email: PearlG@hhs.co.za
  Purpose:
  Loads from a textfile the associated hints
}
function TfrmMain.loadHints: Boolean;
var tf : Textfile;
  aLine: String;
  iIcon: Integer;
 isOkay: Boolean;
begin
  isOkay := True;
    AssignFile(tf,'.\app\hints.txt');
    Reset(tf);
    iIcon := 0;
    while Not Eof(tf) and (iIcon < toolbar.ButtonCount) do
      Begin
        ReadLN(tf,aLine);
        toolbar.Buttons[iIcon].Hint := aLine;
        INC(iIcon);
      End;

    CloseFile(tf);
    result := isOkay;
end;

procedure TfrmMain.New1Click(Sender: TObject);

function countOfRecords(): Integer;
var total : Integer;
begin
  total := 0;

  DM2022.DM.items1.First;
  while NOT(DM2022.DM.items1.Eof) do
  begin
    INC(total);
    DM2022.DM.items1.Next;
  end;

  result := total;
end;

function countOfRecordsByCriteria(fieldName, match : String): Integer;
var total : Integer;
begin
  total := 0;

  DM2022.DM.items1.First;
  while NOT(DM2022.DM.items1.Eof) do
  begin
    if DM2022.DM.items1.FieldByName(fieldName).AsString = match
    then INC(total);

    DM2022.DM.items1.Next;
  end;

  result := total;
end;


begin
 if NOT DM.connectTo('Provider=Microsoft.ACE.OLEDB.12.0;Data Source=.\data\data.accdb;Persist Security Info=False;')
 then showMessage('Unable to connect to database')
 else BEGIN

     dbgrid.DataSource := DM.dsItem1;
     showMessage('Records in Table: '
       + IntToStr(countOfRecordsByCriteria('gender','Male')))

 END;

end;

procedure TfrmMain.Settings1Click(Sender: TObject);
begin
  self.showSettings;
end;

function TfrmMain.showSettings: Boolean;
begin
  frmSettings.showModal;
end;

function TfrmMain.toggleExecuteSQL: Boolean;
begin
  gbSQLQuery.Visible := NOT gbSQLQuery.Visible;
  result := TRUE;
end;

end.
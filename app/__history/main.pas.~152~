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
  ImgList, ToolWin, Menus, CheckLst, ExtCtrls, Buttons, DBCtrls, Mask;

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
    tbarConnect: TToolButton;
    tbarLogin: TToolButton;
    tbarExecute: TToolButton;
    File1: TMenuItem;
    menuConnect: TMenuItem;
    menuLogin: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    menuExecute: TMenuItem;
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
    pnlHeader: TPanel;
    cboFullname: TComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtStudent_Last_Name: TEdit;
    edtStudent_First_Name: TEdit;
    edtStudent_Email: TEdit;
    edtStudent_Mobile: TEdit;
    cboStudent_Gender: TComboBox;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    lblMessage: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    cboLookupSubjects: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    DBEdtSubject: TDBEdit;
    DBEdtCode: TDBEdit;
    DBChkAvailable: TDBCheckBox;
    Queries1: TMenuItem;
    Viewallsubjects1: TMenuItem;
    Actions1: TMenuItem;
    Student1: TMenuItem;
    Lecturer1: TMenuItem;
    Subjects1: TMenuItem;
    Insert1: TMenuItem;
    Update1: TMenuItem;
    Detele1: TMenuItem;
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonGroup2Items0Click(Sender: TObject);
    procedure ButtonGroup2Items1Click(Sender: TObject);
    procedure menuExecuteClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure btnGroupSQLItems2Click(Sender: TObject);
    procedure menuConnectClick(Sender: TObject);
    procedure ID1Click(Sender: TObject);
    procedure LastName1Click(Sender: TObject);
    procedure FirstName1Click(Sender: TObject);
    procedure dbgridTitleClick(Column: TColumn);
    procedure FilterBy1Click(Sender: TObject);
    procedure menuLoginClick(Sender: TObject);
    procedure cboFullnameClick(Sender: TObject);
    procedure Viewallsubjects1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
  private
    { Private declarations }
    function loadHints: Boolean;
    function toggleExecuteSQL(): Boolean;
    function showSettings(): Boolean;
    procedure enableButtonsByMenu();
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  password, fontsize, language, winstyle, fontstyle: String;

implementation

uses arrays, dm2022, oop, settings, student,
  dlgSelect;
{$R *.dfm}

procedure TfrmMain.btnGroupSQLItems2Click(Sender: TObject);
var
  recordsAffected: Integer;
  hasSelect: Boolean;
  hasAction: Boolean;
  lines: Integer;
  aLine: String;

  procedure doAction();
  Begin
    try
      recordsAffected := dm2022.DM.query.ExecSQL;
      showMessage('Records Affected:' + IntToStr(recordsAffected));
    except
      showMessage('Error, Unable to execute SQL statement');
    end;
  End;

  procedure fillSQLStatement();
  var
    lines: Integer;
  Begin
    dm2022.DM.query.Active := False;
    dm2022.DM.query.sql.Clear;

    for lines := 0 to sql.lines.Count - 1 do
      dm2022.DM.query.sql.Add(sql.lines[lines]);
  End;

begin
  fillSQLStatement;

  hasSelect := (POS('SELECT ', UpperCase(sql.lines.Text)) > 0);
  hasAction := (POS('INSERT ', UpperCase(sql.lines.Text)) > 0) OR
    (POS('UPDATE ', UpperCase(sql.lines.Text)) > 0) OR
    (POS('DELETE ', UpperCase(sql.lines.Text)) > 0);

  if (hasSelect) AND (hasAction) then
    showMessage(
      'Error: Both Select and DML SQL statements not supported at pressent');

  if (hasSelect) then
    dm2022.DM.query.Active := True;

  if (hasAction) then
    doAction();
end;

procedure TfrmMain.ButtonGroup1Items0Click(Sender: TObject);
begin
  showMessage('Button 1 Clicked')
end;

procedure TfrmMain.ButtonGroup2Items0Click(Sender: TObject);
var
  fin: Textfile;
  aLine: String;
begin
  if open.Execute then
  BEGIN

    sql.lines.Clear;
    AssignFile(fin, open.FileName);
    Reset(fin);
    while NOT Eof(fin) do
    begin
      ReadLN(fin, aLine);
      sql.lines.Add(aLine);
    end;
    CloseFile(fin);
    // sql.Lines.LoadFromFile(open.FileName);
  END;
end;

procedure TfrmMain.ButtonGroup2Items1Click(Sender: TObject);
var
  fout: Textfile;
  aLine: String;
  iLoop: Integer;
begin
  if save.Execute then
  BEGIN
    AssignFile(fout, save.FileName);
    ReWrite(fout);
    for iLoop := 0 to sql.lines.Count - 1 do
    begin
      aLine := sql.lines[iLoop];
      WriteLN(fout, aLine);
    end;
    CloseFile(fout);
    // sql.Lines.SaveToFile(save.FileName);
  END;
end;

procedure TfrmMain.cboFullnameClick(Sender: TObject);
// QUESTION 3 -  Please complete the loading of the components here...
var
  index: Integer;
  loop: Integer;
begin
  index := cboFullname.ItemIndex;

  WITH dm2022.DM DO
  begin
    items1.First;

    for loop := 0 to index - 1 do
      items1.Next;

    edtStudent_Last_Name.Text := items1.FieldByName('last_name').AsString;
    edtStudent_First_Name.Text := items1.FieldByName('first_name').AsString;
    edtStudent_Email.Text := items1.FieldByName('email').AsString;
    edtStudent_Mobile.Text := items1.FieldByName('mobile').AsString;
    cboStudent_Gender.Text := items1.FieldByName('gender').AsString;

    refreshStudentSubjects(items1.FieldByName('id').AsString);
  end;

end;

procedure TfrmMain.dbgridTitleClick(Column: TColumn);
begin
  DM.doSortBy(Column.FieldName);
end;

procedure TfrmMain.enableButtonsByMenu;
begin
  self.btnGroupSQL.Enabled := menuConnect.Enabled;
  self.btnGroupRHS.Enabled := menuConnect.Enabled;
  self.tbarConnect.Enabled := menuConnect.Enabled;
  self.tbarExecute.Enabled := menuExecute.Enabled;
end;

procedure TfrmMain.menuExecuteClick(Sender: TObject);
begin
  toggleExecuteSQL;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure loadUserProfile(username: String);
var
  tf: Textfile;
begin
  if FileExists(username + '.txt') then
  BEGIN
    AssignFile(tf, username + '.txt');
    Reset(tf);

    ReadLN(tf, password);
    ReadLN(tf, fontsize);
    ReadLN(tf, language);
    ReadLN(tf, winstyle);
    ReadLN(tf, fontstyle);

    CloseFile(tf);
  END;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  if FileExists('.\app\hints.txt') then
    toolbar.ShowHint := loadHints;
  gbSQLQuery.Visible := False;
  self.WindowState := wsMaximized;

  loadUserProfile('PearlG');

  // Setup of the Menu Items (Enables Actions)
  // menuConnect.Enabled := False;
  // menuExecute.Enabled := False;
  enableButtonsByMenu;
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
var
  data: String;
begin
  data := InputBox('Filter By', 'Filter: ', '');

  if (data = '') then
    DM.doSearch('')
  else
    DM.doSearch('first_name LIKE ' + QuotedStr(data));
end;

procedure TfrmMain.FirstName1Click(Sender: TObject);
begin
  DM.doSortBy('first_name');
end;

{ ===============================================================================
  Created by: Mr Pearl
  Email: PearlG@hhs.co.za
  Purpose:
  Loads from a textfile the associated hints
}
function TfrmMain.loadHints: Boolean;
var
  tf: Textfile;
  aLine: String;
  iIcon: Integer;
  isOkay: Boolean;
begin
  isOkay := True;
  AssignFile(tf, '.\app\hints.txt');
  Reset(tf);
  iIcon := 0;
  while Not Eof(tf) and (iIcon < toolbar.ButtonCount) do
  Begin
    ReadLN(tf, aLine);
    toolbar.Buttons[iIcon].Hint := aLine;
    INC(iIcon);
  End;

  CloseFile(tf);
  result := isOkay;
end;

procedure TfrmMain.menuLoginClick(Sender: TObject);
var
  username, attempt: String;
  fails: Integer;

  procedure loginSuccess();
  begin
    self.menuConnect.Enabled := True;
    self.menuExecute.Enabled := False;
    self.enableButtonsByMenu;
  end;

begin
  username := Dialogs.InputBox('Username', 'Enter Username:', '');
  loadUserProfile(username);

  fails := 0;

  while (fails < 3) and (attempt <> password) do
  begin
    attempt := Dialogs.InputBox('Password', 'Enter Password:', '');
    INC(fails);
  end;

  if (fails = 3) then
  Begin
    Dialogs.showMessage('Unsuccessfull Login Attempt, Application Terminating');
    Application.Terminate;
  End
  else
    loginSuccess;
end;

procedure TfrmMain.menuConnectClick(Sender: TObject);
// ==============================================================================
  procedure connectComponents();
  Begin
    self.cboLookupSubjects.ListSource := dm2022.DM.dsItem2;
    self.cboLookupSubjects.ListField := 'Code;Subject;Available';
    self.cboLookupSubjects.KeyField := 'id';

    self.DBEdtSubject.DataField := 'Subject';
    self.DBEdtCode.DataField := 'Code';
    self.DBChkAvailable.DataField := 'Available';
    {
      self.cboLookupStudentFullname.ListSource := DM2022.DM.dsItem1;

      self.cboLookupStudentFullname.KeyField := 'ID';
      }
  End;

// ==============================================================================
var
  Count, percent: Real;
  output: String;
begin
  if NOT DM.connectTo(
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\data\data.mdb;Persist Security Info=False;') then
    showMessage('Unable to connect to database')
  else
  BEGIN
    dm2022.DM.fillComboBoxWithFieldData(self.cboFullname, 'last_name',
      'first_name');
    connectComponents();

    dbgrid.DataSource := DM.dsQuery;

    self.menuExecute.Enabled := True;
    self.enableButtonsByMenu;
  END;

end;

procedure TfrmMain.Settings1Click(Sender: TObject);
begin
  self.showSettings;
end;

function TfrmMain.showSettings: Boolean;
begin
  frmSettings.ShowModal;
end;

function TfrmMain.toggleExecuteSQL: Boolean;
begin
  gbSQLQuery.Visible := NOT gbSQLQuery.Visible;
  result := True;
end;

procedure TfrmMain.Update1Click(Sender: TObject);
var toFind : String;
begin
  toFind := Dialogs.InputBox('Admin No','Enter 5 digits','');
  frmStudent.ShowModal;
end;

procedure TfrmMain.Viewallsubjects1Click(Sender: TObject);
var
  answer: Integer;
begin
  answer := dialogSelect.ShowModal;

  if answer = mrOk then
    dm2022.DM.doSelect(dialogSelect.sSQL);
end;

end.

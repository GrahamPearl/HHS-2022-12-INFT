unit dlgSelect;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TdialogSelect = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    cboTable: TComboBox;
    Label1: TLabel;
    gbSubjects: TGroupBox;
    Available: TLabel;
    chkAvailableTRUE: TCheckBox;
    chkAvailableFALSE: TCheckBox;
    gbStudents: TGroupBox;
    Label2: TLabel;
    chkFilterFemale: TCheckBox;
    chkFilterMale: TCheckBox;
    cboOrderBy: TComboBox;
    btnAdd: TButton;
    lstOrderBy: TListBox;
    btnDelete: TButton;
    Label3: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure cboTableClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQL : String;
    procedure fillOrderBy(filter : String);
     function addOrderBy(): String;
  end;

var
  dialogSelect : TdialogSelect;

const
  arrOrderBy : Array[1..10, 1..2] of String =
  (('Subjects','ID'),
   ('Subjects','Code'),
   ('Subjects','Subject'),
   ('Subjects','Available'),
   ('Students','id'),
   ('Students','first_name'),
   ('Students','last_name'),
   ('Students','gender'),
   ('Students','mobile'),
   ('Students','email'));

implementation

{$R *.dfm}

function TdialogSelect.addOrderBy: String;
var iLoop : Integer;
   answer : String;
begin
  answer := '';

  if (lstOrderBy.Items.Count > 0) then
  begin
  for iLoop := 0 to lstOrderBy.Items.Count - 1 do
      answer := answer +lstOrderBy.Items[iLoop]+ ',';
      Delete(answer,Length(answer),1);
  end;

  result := answer;
end;

procedure TdialogSelect.btnAddClick(Sender: TObject);
begin
  lstOrderBy.Items.Add(cboOrderBy.Text);
end;

procedure TdialogSelect.btnDeleteClick(Sender: TObject);
begin
  lstOrderBy.Items.Delete(lstOrderBy.ItemIndex);
end;

procedure TdialogSelect.cboTableClick(Sender: TObject);
begin
  gbSubjects.Visible := FALSE;
  gbStudents.Visible := FALSE;

  fillOrderBy(cboTable.Text);

  case cboTable.ItemIndex of
   0 :  gbSubjects.Visible := TRUE;
   1 :  gbStudents.Visible := TRUE;
  end;
end;

procedure TdialogSelect.fillOrderBy(filter: String);
var iLoop : Integer;
begin
  cboOrderBy.Text := '- Please select -';
  cboOrderBy.Items.Clear;

  for iLoop := 1 to 10 do
    if (arrOrderBy[iLoop,1] = filter) then
    cboOrderBy.Items.Add(arrOrderBy[iLoop,2]);

  lstOrderBy.Items.Clear;
end;

procedure TdialogSelect.OKBtnClick(Sender: TObject);
var orderBy : String;
begin
  case cboTable.ItemIndex of
   0 : begin
        sSQL := 'SELECT * from subjects';
        if chkAvailableTRUE.Checked and NOT chkAvailableFALSE.Checked then sSQL := sSQL + ' WHERE available = TRUE';
        if NOT chkAvailableTRUE.Checked and chkAvailableFALSE.Checked then sSQL := sSQL + ' WHERE available = FALSE';
       end;

   1 : begin
        sSQL := 'SELECT * from students';

          if chkFilterFemale.Checked and
         NOT chkFilterMale.Checked
        then sSQL := sSQL + ' WHERE gender Like "Female"';


          if chkFilterMale.Checked and
         NOT chkFilterFemale.Checked
        then sSQL := sSQL + ' WHERE gender Like "Male"';
       end;

   2 : sSQL := 'SELECT * from lecturers';
  end;
  orderBY := addOrderBy();

  if (Length(orderBY) > 0)
  then sSQL := sSQL + ' ORDER BY '+orderBY;
end;

end.

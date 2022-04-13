unit student;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, oop, jpeg, Mask,
  DBCtrls;

type
  TfrmStudent = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtEmail: TEdit;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    cboGender: TComboBox;
    picture: TImage;
    btnBrowse: TButton;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Image1: TImage;
    edtAdmin: TEdit;
    edtSurname: TEdit;
    edtFirstName: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function checksForEdit(item: String; editName: String): String;
  end;

var
  frmStudent: TfrmStudent;
  aValidator: TValidator;
  aStudent: TStudent;

implementation

uses DM2022;
{$R *.dfm}

function TfrmStudent.checksForEdit(item: String; editName: String): String;
var
  errors: String;
begin
  // Check that the validator is not NULL
  errors := '';
  if Assigned(aValidator) then
  begin
    // Check that the ADMIN No contains only digits - else show error messages
    if aValidator.checkNotEmpty(item) then
      errors := ' is Empty';
    if not aValidator.checkOnlyDigits(item) then
      errors := ' contains non-digit symbols';
  end
  else
    errors := 'Validator not initialized';
  result := editName + ' ' + errors;
end;

procedure TfrmStudent.BitBtn2Click(Sender: TObject);
var
  msg: String;
begin
  msg := checksForEdit(self.edtAdmin.Text, 'Admin NO');
  if msg <> '' then showMessage(msg);

  msg := checksForEdit(self.edtSurname.Text, 'Surname');
  if msg <> '' then showMessage(msg);
end;

procedure TfrmStudent.FormActivate(Sender: TObject);
begin
  aValidator := TValidator.Create;
end;

end.

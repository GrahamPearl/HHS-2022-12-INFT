unit student;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, oop;

type
  TfrmStudent = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtAdminNo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtSurname: TEdit;
    edtFirstname: TEdit;
    edtEmail: TEdit;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    cboGender: TComboBox;
    picture: TImage;
    btnBrowse: TButton;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudent: TfrmStudent;
  aStudent : TStudent;

implementation

{$R *.dfm}

procedure TfrmStudent.FormActivate(Sender: TObject);
begin
  aStudent := TStudent.Create('12345');
  aStudent.setAdminNO('133');

  if (aStudent.getErrors <> '')
  then
    begin
       showMessage(aStudent.getErrors);
       aStudent.clearErrors;
    end;

  self.edtAdminNo.Text := aStudent.getAdminNO;
end;

end.
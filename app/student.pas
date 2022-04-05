unit student;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, oop, jpeg, Mask, DBCtrls;

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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
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
uses DM2022;
{$R *.dfm}

procedure TfrmStudent.FormActivate(Sender: TObject);
begin
  DBEdit1.DataSource := DM2022.DM.dsItem1;
  DBEdit1.DataField := 'ID';
  DBEdit2.DataSource := DM2022.DM.dsItem1;
  DBEdit2.DataField := 'last_name';
  DBEdit3.DataSource := DM2022.DM.dsItem1;
  DBEdit3.DataField := 'first_name';
end;

end.

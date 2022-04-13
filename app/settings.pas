unit settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, CheckLst;

type
  TfrmSettings = class(TForm)
    PageControl1: TPageControl;
    pnlAction: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    checkVisualPanels: TCheckListBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function loadVisualPanels(): Boolean;
    function saveVisualPanels(): Boolean;
    function execVisualPanels(): Boolean;
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation
Uses main;
{$R *.dfm}

{ TfrmSettings }

procedure TfrmSettings.BitBtn1Click(Sender: TObject);
begin
 execVisualPanels;
end;

function TfrmSettings.execVisualPanels: Boolean;
var checked : Integer;
    loop : Integer;
begin
  checked := 0;
  for loop := 0 to checkVisualPanels.Items.Count - 1 do
      if checkVisualPanels.Checked[loop] then INC(checked);

  frmMain.pnlQuickDo.Visible := checkVisualPanels.Checked[0];
  frmMain.pnlToDo.Visible := checkVisualPanels.Checked[1];

  frmMain.pnlVisiblePanel.Visible := (checked > 0);
end;

function TfrmSettings.loadVisualPanels: Boolean;
begin

end;

function TfrmSettings.saveVisualPanels: Boolean;
begin

end;

end.

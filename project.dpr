program project;

uses
  Forms,
  main in 'app\main.pas' {frmMain},
  dm2022 in 'app\dm2022.pas' {DM: TDataModule},
  oop in 'app\oop.pas',
  arrays in 'app\arrays.pas',
  settings in 'app\settings.pas' {frmSetting},
  student in 'app\student.pas' {frmStudent},
  dlgSelect in 'app\dlgSelect.pas' {dialogSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmStudent, frmStudent);
  Application.CreateForm(TdialogSelect, dialogSelect);
  Application.Run;
end.

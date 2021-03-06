object dialogSelect: TdialogSelect
  Left = 227
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 278
  ClientWidth = 384
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 262
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 27
    Width = 66
    Height = 13
    Caption = 'Table Source:'
  end
  object Label3: TLabel
    Left = 24
    Top = 148
    Width = 47
    Height = 13
    Caption = 'Order By:'
  end
  object OKBtn: TButton
    Left = 300
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 300
    Top = 38
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object cboTable: TComboBox
    Left = 136
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 2
    Text = '- Please select -'
    OnClick = cboTableClick
    Items.Strings = (
      'Subjects'
      'Students'
      'Lecturers')
  end
  object gbSubjects: TGroupBox
    Left = 8
    Top = 51
    Width = 281
    Height = 80
    Align = alCustom
    Caption = 'Apply Filters: Subjects'
    TabOrder = 3
    Visible = False
    object Available: TLabel
      Left = 21
      Top = 25
      Width = 43
      Height = 13
      Caption = 'Available'
    end
    object chkAvailableTRUE: TCheckBox
      Left = 85
      Top = 23
      Width = 97
      Height = 17
      Caption = 'Is Available'
      TabOrder = 0
    end
    object chkAvailableFALSE: TCheckBox
      Left = 85
      Top = 46
      Width = 97
      Height = 17
      Caption = 'Is NOT Available'
      TabOrder = 1
    end
  end
  object gbStudents: TGroupBox
    Left = 8
    Top = 51
    Width = 281
    Height = 80
    Caption = 'Apply Filters: Student'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    object Label2: TLabel
      Left = 21
      Top = 25
      Width = 35
      Height = 13
      Caption = 'Gender'
    end
    object chkFilterFemale: TCheckBox
      Left = 85
      Top = 23
      Width = 97
      Height = 17
      Caption = 'Female'
      TabOrder = 0
    end
    object chkFilterMale: TCheckBox
      Left = 85
      Top = 46
      Width = 97
      Height = 17
      Caption = 'Male'
      TabOrder = 1
    end
  end
  object cboOrderBy: TComboBox
    Left = 136
    Top = 145
    Width = 144
    Height = 21
    TabOrder = 5
    Text = '- Please select -'
  end
  object btnAdd: TButton
    Left = 93
    Top = 172
    Width = 22
    Height = 25
    Caption = '+'
    TabOrder = 6
    OnClick = btnAddClick
  end
  object lstOrderBy: TListBox
    Left = 136
    Top = 172
    Width = 145
    Height = 87
    ItemHeight = 13
    TabOrder = 7
  end
  object btnDelete: TButton
    Left = 93
    Top = 203
    Width = 22
    Height = 25
    Caption = '-'
    TabOrder = 8
    OnClick = btnDeleteClick
  end
end

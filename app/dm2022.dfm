object DM: TDM
  OldCreateOrder = False
  Height = 360
  Width = 315
  object conn: TADOConnection
    Left = 48
    Top = 24
  end
  object items1: TADOTable
    Connection = conn
    Left = 128
    Top = 24
  end
  object query: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 128
    Top = 152
  end
  object items2: TADOTable
    Connection = conn
    Left = 128
    Top = 88
  end
  object dsItem1: TDataSource
    DataSet = items1
    Left = 216
    Top = 32
  end
  object dsItem2: TDataSource
    DataSet = items2
    Left = 216
    Top = 88
  end
  object dsQuery: TDataSource
    DataSet = query
    Left = 216
    Top = 152
  end
  object qryStudentSubjects: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 72
    Top = 216
  end
  object dsStudentSubjects: TDataSource
    DataSet = qryStudentSubjects
    Left = 216
    Top = 216
  end
end

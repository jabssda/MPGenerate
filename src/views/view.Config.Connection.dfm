object frmConfigConnection: TfrmConfigConnection
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmConfigConnection'
  ClientHeight = 108
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 647
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 625
    object rbMySQL: TRadioButton
      Left = 16
      Top = 8
      Width = 65
      Height = 17
      Caption = 'MySQL'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbMySQLClick
    end
    object rbSQLite: TRadioButton
      Left = 104
      Top = 8
      Width = 65
      Height = 17
      Caption = 'SQLite'
      TabOrder = 1
      OnClick = rbSQLiteClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 647
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 570
    object pageLIst: TJvPageList
      Left = 0
      Top = 0
      Width = 647
      Height = 75
      ActivePage = pageSQLite
      PropagateEnable = False
      Align = alClient
      ExplicitLeft = 16
      ExplicitTop = 24
      ExplicitWidth = 300
      ExplicitHeight = 200
      object pageMySQL: TJvStandardPage
        Left = 0
        Top = 0
        Width = 647
        Height = 75
        Caption = 'pageMySQL'
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          647
          75)
        object edDatabase: TLabeledEdit
          Left = 16
          Top = 27
          Width = 199
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 51
          EditLabel.Height = 15
          EditLabel.Caption = 'Database'
          TabOrder = 0
          ExplicitWidth = 122
        end
        object edServer: TLabeledEdit
          Left = 221
          Top = 27
          Width = 121
          Height = 23
          Anchors = [akTop, akRight]
          EditLabel.Width = 38
          EditLabel.Height = 15
          EditLabel.Caption = 'Server'
          TabOrder = 1
          ExplicitLeft = 144
        end
        object edPort: TLabeledEdit
          Left = 348
          Top = 27
          Width = 35
          Height = 23
          Anchors = [akTop, akRight]
          EditLabel.Width = 24
          EditLabel.Height = 15
          EditLabel.Caption = 'Port'
          TabOrder = 2
          ExplicitLeft = 271
        end
        object edUser: TLabeledEdit
          Left = 389
          Top = 27
          Width = 122
          Height = 23
          Anchors = [akTop, akRight]
          EditLabel.Width = 59
          EditLabel.Height = 15
          EditLabel.Caption = 'UserName'
          TabOrder = 3
          ExplicitLeft = 312
        end
        object edPass: TLabeledEdit
          Left = 517
          Top = 27
          Width = 122
          Height = 23
          Anchors = [akTop, akRight]
          EditLabel.Width = 52
          EditLabel.Height = 15
          EditLabel.Caption = 'Password'
          PasswordChar = '*'
          TabOrder = 4
          ExplicitLeft = 440
        end
      end
      object pageSQLite: TJvStandardPage
        Left = 0
        Top = 0
        Width = 647
        Height = 75
        Caption = 'pageSQLite'
        ExplicitLeft = -3
        ExplicitTop = -3
        ExplicitWidth = 570
        DesignSize = (
          647
          75)
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 51
          Height = 15
          Caption = 'Database'
        end
        object edDatabaseDir: TJvComboEdit
          Left = 16
          Top = 27
          Width = 495
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = ''
          OnButtonClick = edDatabaseDirButtonClick
        end
        object edPassSQlite: TLabeledEdit
          Left = 517
          Top = 27
          Width = 122
          Height = 23
          Anchors = [akTop, akRight]
          EditLabel.Width = 52
          EditLabel.Height = 15
          EditLabel.Caption = 'Password'
          PasswordChar = '*'
          TabOrder = 1
          ExplicitLeft = 440
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Database|*.db'
    Left = 312
    Top = 16
  end
end

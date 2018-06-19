object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Home'
  ClientHeight = 534
  ClientWidth = 1021
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1021
    Height = 534
    Align = alClient
    TabOrder = 0
    object spltMain: TSplitter
      Left = 457
      Top = 1
      Height = 532
      ExplicitLeft = 432
      ExplicitTop = 232
      ExplicitHeight = 100
    end
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 456
      Height = 532
      Align = alLeft
      TabOrder = 0
      object tbcMain: TTabControl
        Left = 16
        Top = 16
        Width = 425
        Height = 497
        TabOrder = 0
        Tabs.Strings = (
          'Info')
        TabIndex = 0
        object lblIdentNr: TLabel
          Left = 16
          Top = 51
          Width = 37
          Height = 13
          Caption = 'IdentNr'
        end
        object lblDepartment: TLabel
          Left = 16
          Top = 352
          Width = 57
          Height = 13
          Caption = 'Department'
        end
        object lblCountryCode: TLabel
          Left = 16
          Top = 392
          Width = 67
          Height = 13
          Caption = 'Country Code'
        end
        object edtIdentNr: TEdit
          Left = 72
          Top = 48
          Width = 329
          Height = 21
          TabOrder = 0
        end
        object gbxPersonType: TGroupBox
          Left = 16
          Top = 88
          Width = 385
          Height = 105
          Caption = 'Select Person Type'
          TabOrder = 1
          object ckbClient: TCheckBox
            Left = 24
            Top = 32
            Width = 97
            Height = 17
            Caption = 'Client'
            TabOrder = 0
            OnClick = ckbClientClick
          end
          object ckbEmployee: TCheckBox
            Left = 24
            Top = 64
            Width = 97
            Height = 17
            Caption = 'Employee'
            TabOrder = 1
            OnClick = ckbClientClick
          end
          object ckbSupplier: TCheckBox
            Left = 200
            Top = 32
            Width = 97
            Height = 17
            Caption = 'Supplier'
            TabOrder = 2
            OnClick = ckbClientClick
          end
          object ckbTraveler: TCheckBox
            Left = 200
            Top = 64
            Width = 97
            Height = 17
            Caption = 'Traveler'
            TabOrder = 3
            OnClick = ckbClientClick
          end
        end
        object gbxNames: TGroupBox
          Left = 16
          Top = 199
          Width = 385
          Height = 130
          Caption = 'Names'
          TabOrder = 2
          object lblFirstName: TLabel
            Left = 24
            Top = 24
            Width = 51
            Height = 13
            Caption = 'First Name'
          end
          object lblLastName: TLabel
            Left = 24
            Top = 56
            Width = 50
            Height = 13
            Caption = 'Last Name'
          end
          object lblName: TLabel
            Left = 24
            Top = 88
            Width = 27
            Height = 13
            Caption = 'Name'
          end
          object edtFirstName: TEdit
            Left = 88
            Top = 21
            Width = 281
            Height = 21
            TabOrder = 0
          end
          object edtLastName: TEdit
            Left = 88
            Top = 53
            Width = 281
            Height = 21
            TabOrder = 1
          end
          object edtName: TEdit
            Left = 88
            Top = 85
            Width = 281
            Height = 21
            TabOrder = 2
          end
        end
        object cbxDepartments: TComboBox
          Left = 104
          Top = 349
          Width = 281
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'Dept A'
          Items.Strings = (
            'Dept A'
            'Dept B'
            'Dept C'
            'Dept D'
            'Dept E'
            'Dept F')
        end
        object edtCountryCode: TEdit
          Left = 104
          Top = 389
          Width = 281
          Height = 21
          TabOrder = 4
        end
        object btnAdd: TBitBtn
          Left = 229
          Top = 448
          Width = 75
          Height = 25
          Caption = 'Add'
          Kind = bkOK
          NumGlyphs = 2
          TabOrder = 5
          OnClick = btnAddClick
        end
        object btnClear: TBitBtn
          Left = 310
          Top = 448
          Width = 75
          Height = 25
          Caption = 'Clear'
          Kind = bkClose
          NumGlyphs = 2
          TabOrder = 6
          OnClick = btnClearClick
        end
      end
    end
    object pnlRight: TPanel
      Left = 460
      Top = 1
      Width = 560
      Height = 532
      Align = alClient
      TabOrder = 1
      object grdPersonalDetails: TDBGrid
        Left = 1
        Top = 1
        Width = 558
        Height = 530
        Align = alClient
        DataSource = dmGeneral.dsPersonalInfo
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end

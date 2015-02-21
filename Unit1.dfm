object Form1: TForm1
  Left = 265
  Top = 42
  Width = 962
  Height = 632
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 574
    Align = alClient
    TabOrder = 0
    object img1: TImage
      Left = 1
      Top = 1
      Width = 104
      Height = 88
      Stretch = True
    end
    object img2: TImage
      Left = 152
      Top = 152
      Width = 105
      Height = 105
      Stretch = True
      Visible = False
    end
  end
  object pnl2: TPanel
    Left = 761
    Top = 0
    Width = 185
    Height = 574
    Align = alRight
    TabOrder = 1
    object grp1: TGroupBox
      Left = 16
      Top = 440
      Width = 153
      Height = 121
      Caption = 'Sheet'
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 42
        Width = 56
        Height = 13
        Caption = 'Scale Width'
      end
      object Label5: TLabel
        Left = 9
        Top = 75
        Width = 58
        Height = 13
        Caption = 'Scale height'
      end
      object chk1: TCheckBox
        Left = 33
        Top = 18
        Width = 97
        Height = 17
        Caption = 'Stretch'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chk1Click
      end
      object scrlbr1: TScrollBar
        Left = 8
        Top = 58
        Width = 121
        Height = 12
        Max = 1000
        Min = 1
        PageSize = 0
        Position = 1
        TabOrder = 1
        OnChange = scrlbr1Change
      end
      object scrlbr2: TScrollBar
        Left = 6
        Top = 94
        Width = 121
        Height = 12
        Max = 1000
        Min = 1
        PageSize = 0
        Position = 1
        TabOrder = 2
        OnChange = scrlbr2Change
      end
    end
    object grp2: TGroupBox
      Left = 16
      Top = 16
      Width = 153
      Height = 97
      Caption = 'Frame'
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 27
        Width = 32
        Height = 13
        Caption = 'Width:'
      end
      object Label2: TLabel
        Left = 12
        Top = 50
        Width = 31
        Height = 13
        Caption = 'Height'
      end
      object edt1: TEdit
        Left = 52
        Top = 27
        Width = 50
        Height = 21
        TabOrder = 0
        Text = '128'
      end
      object edt2: TEdit
        Left = 52
        Top = 46
        Width = 50
        Height = 21
        TabOrder = 1
        Text = '128'
      end
      object btn2: TButton
        Left = 112
        Top = 24
        Width = 33
        Height = 41
        Caption = 'Ok'
        TabOrder = 2
        OnClick = btn2Click
      end
    end
    object grp3: TGroupBox
      Left = 8
      Top = 120
      Width = 169
      Height = 305
      Caption = 'Animation'
      TabOrder = 2
      object Label6: TLabel
        Left = 8
        Top = 169
        Width = 207
        Height = 13
        Caption = 'Start Frame   Delay   End Frame                  '
      end
      object edt3: TEdit
        Left = 8
        Top = 193
        Width = 49
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object edt4: TEdit
        Left = 120
        Top = 193
        Width = 42
        Height = 21
        TabOrder = 1
        Text = 'edt4'
      end
      object chk2: TCheckBox
        Left = 8
        Top = 248
        Width = 97
        Height = 17
        Caption = 'Manual'
        TabOrder = 2
        OnClick = chk2Click
      end
      object scrlbr3: TScrollBar
        Left = 8
        Top = 272
        Width = 145
        Height = 17
        Enabled = False
        PageSize = 0
        TabOrder = 3
      end
      object btn1: TButton
        Left = 16
        Top = 219
        Width = 137
        Height = 21
        Caption = 'Set'
        TabOrder = 4
        OnClick = btn1Click
      end
      object scrlbr4: TScrollBar
        Left = 24
        Top = 40
        Width = 17
        Height = 121
        Kind = sbVertical
        PageSize = 0
        TabOrder = 5
        OnChange = scrlbr4Change
      end
      object scrlbr5: TScrollBar
        Left = 120
        Top = 40
        Width = 17
        Height = 121
        Kind = sbVertical
        PageSize = 0
        TabOrder = 6
        OnChange = scrlbr5Change
      end
      object scrlbr6: TScrollBar
        Left = 80
        Top = 40
        Width = 17
        Height = 121
        Kind = sbVertical
        Max = 500
        Min = 1
        PageSize = 0
        Position = 60
        TabOrder = 7
        OnChange = scrlbr6Change
      end
      object edt5: TEdit
        Left = 72
        Top = 192
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 8
        Text = '60'
      end
    end
  end
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
    Left = 176
    Top = 72
  end
  object dlgOpenPic1: TOpenPictureDialog
    Filter = 
      'All (*.pcx;*.jpg;*.jpeg;*.bmp;*.tga;*.png)|*.pcx;*.jpg;*.jpeg;*.' +
      'bmp;*.tga;*.png;|PCX Image (*.pcx)|*.pcx|JPEG Image File (*.jpg)' +
      '|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Tar' +
      'ga(*.tga)|*.tga|Portable (*.png)|*.png'
    Left = 312
    Top = 53
  end
  object XPManifest1: TXPManifest
    Left = 655
    Top = 48
  end
  object mm1: TMainMenu
    Left = 120
    Top = 48
    object Image1: TMenuItem
      Caption = 'Image'
      object Load1: TMenuItem
        Caption = 'Load'
        OnClick = Load1Click
      end
      object ShowImage1: TMenuItem
        Caption = 'Show Image'
        OnClick = ShowImage1Click
      end
    end
  end
end

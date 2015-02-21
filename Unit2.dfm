object Form2: TForm2
  Left = 297
  Top = 136
  Width = 796
  Height = 580
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 105
    IncrementalDisplay = True
    Proportional = True
    OnMouseDown = img1MouseDown
    OnMouseMove = img1MouseMove
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmr1Timer
    Left = 176
    Top = 48
  end
end

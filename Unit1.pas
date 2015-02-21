unit Unit1;

interface

uses
Windows, Messages, SysUtils, GraphicEx, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ExtDlgs, StdCtrls, JPEG, Menus, ComCtrls, ToolWin,XPMan;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    img1: TImage;
    tmr1: TTimer;
    dlgOpenPic1: TOpenPictureDialog;
    XPManifest1: TXPManifest;
    mm1: TMainMenu;
    Image1: TMenuItem;
    Load1: TMenuItem;
    grp1: TGroupBox;
    chk1: TCheckBox;
    scrlbr1: TScrollBar;
    Label4: TLabel;
    scrlbr2: TScrollBar;
    Label5: TLabel;
    grp2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    grp3: TGroupBox;
    edt3: TEdit;
    edt4: TEdit;
    Label6: TLabel;
    chk2: TCheckBox;
    scrlbr3: TScrollBar;
    btn1: TButton;
    scrlbr4: TScrollBar;
    scrlbr5: TScrollBar;
    scrlbr6: TScrollBar;
    edt5: TEdit;
    btn2: TButton;
    ShowImage1: TMenuItem;
    img2: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
    procedure scrlbr2Change(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure scrlbr6Change(Sender: TObject);
    procedure scrlbr4Change(Sender: TObject);
    procedure scrlbr5Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure ShowImage1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sprite:TBitmap;

  frameBegin:Integer;
  frameEnd:Integer;

   framew:Integer=1;
   frameh:Integer=1;

  imagew:Integer;
  imageh:Integer;
  countx:Integer;
  county:Integer;
  frame, thisTickCount,lastTickCount,delay ,numframes:Integer;
  clip:TRect;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.tmr1Timer(Sender: TObject);
var
  left,top:Integer;
begin

if (countx<=0) then Exit;
if (county<=0) then Exit;


if(chk2.Checked) then
begin

Frame :=scrlbr3.Position;

end else
begin

    thisTickCount := GetTickCount();
    if((thisTickCount - lastTickCount) > delay) then
    begin
        lastTickCount := thisTickCount;
        Inc(frame);
        if(Frame > frameEnd)  then
        begin
            Frame := framebegin;
        end;
   end;

   scrlbr3.Position:=frame;
end;

   Caption:='Sprite Sheet Preview by DJOKER  -- Frame['+inttostr(frame)+']';
                  {
form1.img1.Canvas.Brush.Color:=clBlue;
form1.img1.Canvas.Pen.Color:=clBlue;
form1.img1.Canvas.FillRect(Rect(0, 0, img1.Width, img1.Height));
                }

      Left := ( frame mod countx) *framew ;
      Top :=  ( frame div county) *frameh;


         img1.Canvas.CopyRect(img1.Canvas.ClipRect,img2.Canvas,Rect(left,top,left+framew,top+frameh));


end;

procedure TForm1.Load1Click(Sender: TObject);
var
   Graphic: TGraphicExGraphic;

begin

if dlgOpenPic1.Execute then
begin
 img2.Picture.LoadFromFile(dlgOpenPic1.FileName);



 Sleep(100);


   framew:=StrToInt(edt1.Text);
   frameh:=StrToInt(edt2.Text);

//   ShowMessage(IntToStr(framew)+'<>'+inttostr(frameh));

     imagew:=img2.Picture.Width;
     imageh:=img2.Picture.Height;

 form2.img1.Width:= imagew;
 form2.img1.Height:=imageh;

 img1.Width:=framew;
 img1.Height:=frameh;


     countx:=imagew div framew;
     county:=imageh div frameh;
     numframes:=countx*county;

     lastTickCount:= GetTickCount;

     frameBegin:=0;
     frameEnd:=numframes;
     delay:=scrlbr6.Position;
     frame:=0;

     edt4.Text:=IntToStr(numframes);

      scrlbr3.Enabled:=chk2.Enabled;
      scrlbr3.Max:=frameEnd;
      scrlbr3.Min:=frameBegin;

      scrlbr4.Max:=numframes;
      scrlbr5.Max:=numframes;
      scrlbr5.Position:=numframes;

end;

end;

procedure TForm1.chk1Click(Sender: TObject);
begin
img1.Stretch:=chk1.Checked;
end;

procedure TForm1.scrlbr1Change(Sender: TObject);
begin
img1.Width:=scrlbr1.Position;
end;

procedure TForm1.scrlbr2Change(Sender: TObject);
begin
img1.Height:=scrlbr2.Position;
end;

procedure TForm1.chk2Click(Sender: TObject);
begin


scrlbr3.Enabled:=chk2.Enabled;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin




     frameBegin:=StrToInt(edt3.Text);
     frameEnd:=StrToInt(edt4.Text);
     frame:=frameBegin;
     scrlbr3.Enabled:=chk2.Enabled;
     scrlbr3.Max:=frameEnd;
     scrlbr3.Min:=frameBegin;

    // scrlbr3.Position:=frameBegin;
   //  scrlbr4.Position:=frameend;

end;

procedure TForm1.scrlbr6Change(Sender: TObject);
begin
delay:=scrlbr6.Position;
edt5.Text:=IntToStr(delay);
end;

procedure TForm1.scrlbr4Change(Sender: TObject);
begin
 edt3.Text:=IntToStr(scrlbr4.Position);



 if (scrlbr4.Position>scrlbr5.Position) then
 scrlbr5.Position:=scrlbr4.Position+1;

   //  frameBegin:=scrlbr4.Position;
  btn1Click(Self);

end;

procedure TForm1.scrlbr5Change(Sender: TObject);
begin
   if (scrlbr5.Position<scrlbr4.Position) then
 scrlbr4.Position:=scrlbr5.Position-1;


 edt4.Text:=IntToStr(scrlbr5.Position);

 btn1Click(Self);
   //   frameEnd:=scrlbr4.Position;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
   framew:=StrToInt(edt1.Text);
   frameh:=StrToInt(edt2.Text);


end;

procedure TForm1.ShowImage1Click(Sender: TObject);
begin
Form2.Show;
end;

end.

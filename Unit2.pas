unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm2 = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
 mousex,mousey:Integer;

 startx,starty:Integer;
 endx,endy:Integer;



implementation

{$R *.dfm}
   uses Unit1;

var
 posx,posy, coll,row,index:Integer;

procedure line(x,y,x2,y2:Integer) ;
begin


form2.img1.Canvas.MoveTo(x,y);
form2.img1.Canvas.LineTo(x2,y2);

//Form2.Canvas.MoveTo(x,y);
//Form2.Canvas.LineTo(x2,y2);


end;

procedure TForm2.tmr1Timer(Sender: TObject);
var
  left,top:Integer;
begin



 if(img1.Width<=framew) then Exit;
 if(img1.Height<=frameh) then Exit;



   coll:=mousex  div framew;
   row :=mousey  div frameh;

   posx:=coll  * framew;
   posy:=row  * frameh;


  index:= (coll  + (row*countx) )  ;



      img1.Canvas.Brush.Style:=bsClear;
      img1.Canvas.Pen.Color:=clblack;
      img1.Canvas.Brush.Color:=clblack;
      img1.Canvas.FillRect(ClientRect);
      img1.Canvas.Pen.Style:=psDot;


   img1.Canvas.CopyRect(img1.Canvas.ClipRect,form1.img2.Canvas,Rect(0,0,form1.img2.Picture.Width,form1.img2.Picture.Height));

 // Canvas.CopyRect(Canvas.ClipRect,form1.img2.Canvas,Rect(0,0,form1.img2.Picture.Width,form1.img2.Picture.Height));


       img1.Canvas.Pen.Color:=cllime;
       line(startx,starty,startx+framew,starty);
       line(startx,starty+frameh,startx+framew,starty+frameh);
       line(startx+framew,starty,startx+framew,starty+frameh);
       line(startx,starty,startx,starty+frameh);

       img1.Canvas.Pen.Color:=clYellow;
       line(endx,endy,endx+framew,endy);
       line(endx,endy+frameh,endx+framew,endy+frameh);
       line(endx+framew,endy,endx+framew,endy+frameh);
       line(endx,endy,endx,endy+frameh);


         Left := ( frame mod countx) *framew ;
         Top :=  ( frame div county) *frameh;


       img1.Canvas.Pen.Color:=clred;
       img1.Canvas.Brush.Color:=clRed;

       img1.Canvas.Rectangle(left,top,left+framew,top+frameh);

       img1.Canvas.Pen.Color:=clred;
       line(posx,posy,posx+framew,posy);
       line(posx,posy+frameh,posx+framew,posy+frameh);
       line(posx+framew,posy,posx+framew,posy+frameh);
       line(posx,posy,posx,posy+frameh);


Caption:=Format('Image sheet width:%d height:%d  coll:%d  row:%d index:%d',[img1.Picture.Width,img1.Picture.Height,coll,row,index])
end;

procedure TForm2.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 mousex:=x;
 mousey:=y;
end;

procedure TForm2.FormHide(Sender: TObject);
begin
   tmr1.Enabled:=false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  tmr1.Enabled:=True;
end;

procedure TForm2.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ( Button=mbLeft) then
begin
 // if (posx>=endx) then Exit;
 // if (posy>=endy) then Exit;



  startx:=posx;
  starty:=posy;
  if (ssShift in Shift) then
  begin
  unit1.Form1.edt3.Text :=inttostr(index);
  unit1.Form1.btn1Click(unit1.Form1);
  end;
end;

if ( Button=mbRight) then
begin

//if (posx<=startx) then Exit;
//if (posy<=starty) then Exit;

 endx:=posx;
 endy:=posy;
  if (ssShift in Shift) then
  begin
   unit1.Form1.edt4.Text :=inttostr(index);
    unit1.Form1.btn1Click(unit1.Form1);
 end;
end;

end;

end.

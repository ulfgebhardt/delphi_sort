unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls;

type
  SortElement = record
    Text: string;
    Hoehe: integer;
  end;

type
  TForm1 = class(TForm)
    munsorted: TMemo;
    msorted: TMemo;
    GroupBox1: TGroupBox;
    bBubble: TButton;
    blinear: TButton;
    bquick: TButton;
    GroupBox2: TGroupBox;
    lTime: TLabel;
    lRounds: TLabel;
    lChanges: TLabel;
    GroupBox3: TGroupBox;
    bfortune: TButton;
    bloadfile: TButton;
    bclear: TButton;
    OpenDialog1: TOpenDialog;
    Animate1: TAnimate;
    lSort: TLabel;
    litemcount: TLabel;
    sfortune: TSpinEdit;
    ladded: TLabel;
    pb: TPaintBox;
    procedure bBubbleClick(Sender: TObject);
    procedure bquickClick(Sender: TObject);
    procedure BubbleSort;
    procedure Quicksort(links,rechts : integer);
    function  Divide(links, rechts:integer) : integer;
    procedure Change(a, b:integer);
    procedure bfortuneClick(Sender: TObject);
    procedure bloadfileClick(Sender: TObject);
    procedure bclearClick(Sender: TObject);

  private
    { Private-Deklarationen }
    //SortArray : array of string;
    SortArray: array of SortElement; 
    Changes,Round, AnzeigeRatio : integer;
    function SucheMaximum: integer;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm  ;

implementation

{$R *.dfm}

{*************************************************
 *************    Programmsteuerung  *************
 *************************************************}

//Bubblesort

procedure TForm1.bBubbleClick(Sender: TObject);
begin
Animate1.Play(1,Animate1.FrameCount,0);
lSort.Caption := 'Bubblesorting...';
Form1.Refresh;
BubbleSort;
lSort.Caption := 'Bubblesort';
Animate1.Stop;
end;

//Quicksort

procedure TForm1.bquickClick(Sender: TObject);
var Frequency,Time1,Time2 : int64;
    StrCount,i : Integer;
    buchstabe: char;
begin
lSort.Caption := 'Quicksorting...';
Form1.Refresh;
Animate1.Play(1,Animate1.FrameCount,0);
QueryPerformanceFrequency(Frequency);
QueryPerformanceCounter(Time1);
Changes := 0;
StrCount := mUnSorted.Lines.Count;
SetLength(SortArray,StrCount);
for i := 0 to StrCount - 1 do begin
 SortArray[i].Text := mUnSorted.Lines[i];
 SortArray[i].Hoehe := ord(SortArray[i].Text[1]) * 256 + ord(SortArray[i].Text[2]);
end;
AnzeigeRatio := SucheMaximum div pb.Height;
with pb.Canvas do
begin
  Brush.Color := clWhite;
  Brush.Style := bsSolid;
  Pen.Style := psClear;
  Rect(0, 0, pb.Height, pb.Width);
end;
Form1.Refresh;

for i := 0 to Length(SortArray) - 1 do
begin

end;

litemcount.Caption := 'Anzahl: ' + inttostr(StrCount);

Quicksort(0,StrCount-1);
mSorted.Clear;
mSorted.Visible := false;
for i := 0 to StrCount - 1 do begin
  mSorted.lines.Add(SortArray[i].Text);
end;
mSorted.Visible := true;


QueryPerformanceCounter(Time2);
Animate1.Stop;
lSort.Caption := 'Quicksort';
lTime.Caption := 'Zeit: ' + floattostr((Time2-Time1) * 1000 div Frequency) + ' ms';
lRounds.Caption := 'Durchläufe: --';
lchanges.Caption := 'Tauschvorgänge: ' + inttostr(Changes);

end;

//Erstellen von zufälligen Buchstabenkombinationen

procedure TForm1.bfortuneClick(Sender: TObject);
var i : integer;
begin
randomize;
mUnsorted.Visible := false;
for i := 0 to sfortune.Value do begin
 munsorted.Lines.Add(chr(65 + Random(27)) + chr(65 + Random(27)));
end;
mUnsorted.Visible := true;

ladded.Caption := 'Hinzugefügt: ' + inttostr(i);

//Liste aus Datei laden

end;

procedure TForm1.bloadfileClick(Sender: TObject);
begin
if Opendialog1.Execute then mUnSorted.Lines.LoadFromFile(Opendialog1.FileName);

end;

procedure TForm1.bclearClick(Sender: TObject);
begin
mSorted.Clear;
mUnsorted.Clear;
end;


{*************************************************
 ****************    Algorithmen    **************
 *************************************************}

procedure TForm1.BubbleSort;
var changed :  boolean;
    StrCount,i: integer;
    Frequency,Time1,Time2 : int64;
begin
Changes := 0;
Round := 0;

QueryPerformanceFrequency(Frequency);
QueryPerformanceCounter(Time1);

StrCount := mUnSorted.Lines.Count;
SetLength(SortArray,StrCount);
for i := 0 to StrCount - 1 do begin
 SortArray[i].Text := mUnSorted.Lines[i];
end;
litemcount.Caption := 'Anzahl: ' + inttostr(StrCount);

repeat
changed := false;
for i := 0 to StrCount-2 do begin
 if Sortarray[i].Text > Sortarray[i+1].Text then
   begin
    changed := true;
    Change(i,i+1);
   end;
end;
inc(Round);
until not changed;

mSorted.Visible := false;
for i := 0 to StrCount - 1 do begin
  mSorted.lines.Add(SortArray[i].Text);
end;
mSorted.Visible := true;

QueryPerformanceCounter(Time2);

lTime.Caption := 'Zeit: ' + inttostr((Time2-Time1) * 1000 div Frequency) + ' ms';
lRounds.Caption := 'Durchläufe: ' + inttostr(round);
lchanges.Caption := 'Tauschvorgänge: ' + inttostr(changes);

end; //procedure

procedure TForm1.Quicksort(links,rechts : integer);
var teiler : integer;
begin
   if rechts > links then begin
     teiler := Divide(links, rechts);
     quicksort(links, teiler-1);
     quicksort(teiler+1, rechts);
   end;
end;

function TForm1.Divide(links, rechts : integer) : integer;
var i,j,pivot: integer;
begin
   i := links-1;
   j := rechts ;
   pivot := rechts;
   while true do begin
     inc(i);
     while SortArray[i].Text < SortArray[pivot].Text do inc(i);
     dec(j);
     while (SortArray[pivot].Text < SortArray[j].Text) and (j > links) do dec(j);
     if i >= j then break;
     Change(i, j);
   end;
   Change(i, pivot);
   result :=  i;
end;

procedure TForm1.Change(a, b : integer);
var Dummy : string;
begin
   Dummy := SortArray[a].Text;
   SortArray[a] := SortArray[b];
   SortArray[b].Text := Dummy;
   inc(Changes);
end;

function TForm1.SucheMaximum: integer;
var i, x: integer;
begin
  x := 0;
  for i := 0 to Length(SortArray) - 1 do
  begin
    if SortArray[i].Hoehe > x then x := SortArray[i].Hoehe;
  end;

  result := x;
end;

end.

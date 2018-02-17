unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,sort;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i,m,n:integer;
    k:array of boolean;
begin

  memo2.Clear;

  setlength(k,memo1.lines.count);
  for i:=0 to length(k)-1 do k[i]:=false;

  m:=0;
  while m<length(k) do
    begin
    n:=random(memo1.Lines.count);
    if not k[n] then
      begin
      memo2.Lines.Add(memo1.Lines.Strings[n]);
      k[n]:=true;
      inc(m);
      end;
    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  randomize;

end;

procedure TForm1.Button2Click(Sender: TObject);
var durchlaufe,tauschs,i:integer;
    sortlist:TSortList;
begin

  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  BubbleDesc(tauschs,durchlaufe,sortlist);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin

  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  QuickSortDesc(0,length(sortlist)-1,sortlist);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button4Click(Sender: TObject);
var i,tauschs,durchlaufe:integer;
    sortlist:TSortList;
begin

  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  BubbleAsc(tauschs,durchlaufe,sortlist);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];
  
end;

procedure TForm1.Button5Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin

  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  QuickSortAsc(0,length(sortlist)-1,sortlist);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button6Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  ShellSortAsc(sortList);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button7Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  ShellSortDesc(sortList);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button8Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  MinSortAsc(sortList);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button9Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  MinSortDesc(sortList);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button10Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  HeapSortAsc(sortList);

  for i:=0 to length(sortlist)-1 do memo2.lines.Strings[i]:=sortlist[i];

end;

procedure TForm1.Button11Click(Sender: TObject);
var i:integer;
    sortlist:TSortList;
begin
  setlength(sortlist,memo2.Lines.Count);
  for i:=0 to memo2.Lines.Count-1 do sortlist[i]:=memo2.lines.Strings[i];

  HeapSortAsc(sortList);

  for i:=length(sortlist)-1 downto 0 do memo2.lines.Strings[length(sortlist)-1-i]:=sortlist[i];

end;

end.

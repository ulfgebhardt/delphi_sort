unit usort;

interface

uses forms;

type TSortList = array of string;

procedure BubbleAsc(var tauschs,durchlaufe:integer;var SortList:TSortList);
procedure BubbleDesc(var tauschs,durchlaufe:integer;var SortList:TSortList);
procedure QuickSortAsc(erstes,letztes : integer;var SortList:TSortList);
procedure QuickSortDesc(erstes,letztes : integer;var SortList:TSortList);
procedure ShellSortAsc(var SortList:array of string);
procedure ShellSortDesc(var SortList:array of string);
procedure MinSortAsc(var SortList: array of string);
procedure MinSortDesc(var SortList: array of string);
procedure HeapSortAsc(var SortList:array of string);

implementation

procedure BubbleAsc(var tauschs,durchlaufe:integer;var SortList:TSortList);
var i,j:integer;
    zwischen:string;
begin
  durchlaufe:=0;
  tauschs:=0;
  for i := length(SortList)-1 downto 1 do
    begin
    for j := 0 to i-1 do
      begin
      if (SortList[j]) >(SortList[j+1]) then
        begin
        zwischen := SortList[j];
        SortList[j] := SortList[j+1];
        SortList[j+1] := zwischen;
        inc(tauschs);
        Application.ProcessMessages;
        end;
      end;
    inc(durchlaufe);
    Application.ProcessMessages;
    end;

end;

procedure BubbleDesc(var tauschs,durchlaufe:integer;var SortList:TSortList);
var i,j:integer;
    zwischen:string;
begin
  durchlaufe:=0;
  tauschs:=0;
  for i := length(SortList)-1 downto 1 do
    begin
    for j := 0 to i-1 do
      begin
      if (SortList[j]) < (SortList[j+1]) then
        begin
        zwischen := SortList[j];
        SortList[j] := SortList[j+1];
        SortList[j+1] := zwischen;
        inc(tauschs);
        Application.ProcessMessages;
        end;
      end;
    inc(durchlaufe);
    Application.ProcessMessages;
    end;

end;

procedure QuickSortDesc(erstes,letztes : integer;var SortList:TSortList);
function Divide(erstes, letztes : integer;var SortList:TSortList) : integer;
procedure Change(a, b : integer;var SortList:TSortList);
var Dummy : string;
begin
   Dummy := SortList[a];
   SortList[a] := SortList[b];
   SortList[b] := Dummy;
//   inc(Changes);
end;
var i,j,pivot: integer;
begin
   i := erstes-1;
   j := letztes ;
   pivot := letztes;
   while true do begin
     inc(i);
     while SortList[i] > SortList[pivot] do inc(i);
     dec(j);
     while (SortList[pivot] > SortList[j]) and (j > erstes) do dec(j);
     if i >= j then break;
     Change(i, j,sortlist);
   end;
   Change(i, pivot,sortlist);
   result :=  i;
end;

var teiler : integer;
begin

   if letztes > erstes then
     begin
     teiler := Divide(erstes, letztes,SortList);
     quicksortdesc(erstes, teiler-1,SortList);
     quicksortdesc(teiler+1, letztes,SortList);
     end;

end;

procedure QuickSortAsc(erstes,letztes : integer;var SortList:TSortList);
function Divide(erstes, letztes : integer;var SortList:TSortList) : integer;
procedure Change(a, b : integer;var SortList:TSortList);
var Dummy : string;
begin
   Dummy := SortList[a];
   SortList[a] := SortList[b];
   SortList[b] := Dummy;
//   inc(Changes);
end;
var i,j,pivot: integer;
begin
   i := erstes-1;
   j := letztes ;
   pivot := letztes;
   while true do begin
     inc(i);
     while SortList[i] < SortList[pivot] do inc(i);
     dec(j);
     while (SortList[pivot] < SortList[j]) and (j > erstes) do dec(j);
     if i >= j then break;
     Change(i, j,sortlist);
   end;
   Change(i, pivot,sortlist);
   result :=  i;
end;

var teiler : integer;
begin

   if letztes > erstes then
     begin
     teiler := Divide(erstes, letztes,SortList);
     quicksortasc(erstes, teiler-1,SortList);
     quicksortasc(teiler+1, letztes,SortList);
     end;

end;

procedure ShellSortAsc(var SortList:array of string);
var
  i, j, h, N: integer;
  v: string;
begin
  N := length(SortList)-1;
  h := 0;
  repeat
    h := ( 3 * h ) + 1;
  until h > N;
  repeat
    h := ( h div 3 );
    for i := ( h + 1) to N do begin
      v := SortList[i];
      j := i;
      while ( ( j >= h ) and ( SortList[j-h] > v ) ) do begin
        SortList[j] := SortList[j - h];
        dec( j, h );
      end;
      SortList[j] := v;
    end;
  until
    h = 1;
end;

procedure ShellSortDesc(var SortList:array of string);
var
  i, j, h, N: integer;
  v: string;
begin
  N := length(SortList)-1;
  h := 0;
  repeat
    h := ( 3 * h ) + 1;
  until h > N;
  repeat
    h := ( h div 3 );
    for i := ( h + 1 ) to N do begin
      v := SortList[i];
      j := i;
      while ( ( j >=     h ) and ( SortList[j-h] < v ) ) do begin
        SortList[j] := SortList[j - h];
        dec( j, h );
      end;
      SortList[j] := v;
    end;
  until
    h = 1;
end;

procedure MinSortAsc(var SortList: array of string);
var
  i, j     : LongInt;  { Zaehlvariablen }
  Min: LongInt;  { Zwischenspeicher, Minimum }
  Temp:string;
begin
  for i := 0 to High(SortList) - 1 do
    begin
    Min := i;
    for j := i + 1 to High(SortList) do
      if SortList[j] < SortList[Min] then Min := j;
    Temp := SortList[Min];
    SortList[Min] := SortList[i];
    SortList[i] := Temp;
    end;
end;

procedure MinSortDesc(var SortList: array of string);
var
  i, j     : LongInt;  { Zaehlvariablen }
  Min: LongInt;  { Zwischenspeicher, Minimum }
  Temp:string;
begin
  for i := 0 to High(SortList) - 1 do
    begin
    Min := i;
    for j := i + 1 to High(SortList) do
      if SortList[j] > SortList[Min] then Min := j;
    Temp := SortList[Min];
    SortList[Min] := SortList[i];
    SortList[i] := Temp;
    end;
end;

procedure HeapSortAsc(var SortList:array of string);

    procedure genheap(var f:array of string; var heapsize:integer);             { Heap (mit linearem Aufwand) aufbauen }
    var i,j,max:integer;
    var temp:String;
    begin
        for i := (heapsize div 2) downto 0 do begin   { zweite Hälfte des Feldes braucht nicht betrachtet werden }
            j:=i;
            while j <= (heapsize div 2) do begin
                max := j * 2 + 1;               { finde Maximum der (beiden) Söhne }
                if max > heapsize then dec(max)
                else if f[max-1] > f[max] then dec(max);
                if f[j] < f[max] then begin     { ggf. tauschen }
                    temp := f[j];
                    f[j] := f[max];
                    f[max] := temp;
                end;
                j := max;
            end;
        end;
    end;

    function popmax(var f:array of string;heapsize:integer):String;
    var i,max:integer;
    var temp:String;
    begin
        popmax := f[1];
        f[1] := f[heapsize];
        i := 1;
        while i <= (heapsize div 2) do begin { letztes Element an Anfang setzen und versickern lassen }
            max := i * 2 + 1;               { finde Maximum der (beiden) Söhne }
            if max > heapsize then dec(max)
            else if f[max-1] > f[max] then dec(max);
            if f[i] < f[max] then begin     { ggf. tauschen }
                temp := f[i];
                f[i] := f[max];
                f[max] := temp;
            end;
            i := max;
        end;
    end;
   var i,SIZE:integer;
begin
    SIZE := Length(SortList)-1;
    genheap(SortList,SIZE);
    for i:=SIZE downto 0 do SortList[i] := popmax(SortList,i);
end;

end.

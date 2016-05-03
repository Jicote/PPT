
uses
    math;
var
   i,j,ii,jj,m,n,k,d,a,b,c,casos:longint;
   papa,g:array[0..200] of longint;
   arb:array[1..100,1..10,1..2] of longint;
   doc:array[1..10,1..2] of longint;
   bol:boolean;
function nemo(x:longint):longint;
begin
   if papa[x]<>x then
      papa[x]:=nemo(papa[x]);
   nemo:=papa[x];
end;
function dis(i,ii,j,jj:longint):longint;
begin
   dis:=(arb[i][ii][1]-arb[j][jj][1])*(arb[i][ii][1]-arb[j][jj][1])+
        (arb[i][ii][2]-arb[j][jj][2])*(arb[i][ii][2]-arb[j][jj][2]);
end;
function disdoc(i,ii,j:longint):longint;
begin
   disdoc:=(arb[i][ii][1]-doc[j][1])*(arb[i][ii][1]-doc[j][1])+
           (arb[i][ii][2]-doc[j][2])*(arb[i][ii][2]-doc[j][2]);
end;
begin
   readln (casos);
   for c:=1 to casos do
   begin
      readln(n,m,k,d);
      k:=k*k;
      d:=d*d;
      for i:=1 to m do
         for j:=1 to 2 do
            read(doc[i][j]);
      for i:=1 to n do
      begin
         read(g[i]);
         papa[i]:=i;
         for j:=1 to g[i] do
            read(arb[i][j][1],arb[i][j][2]);
      end;
      for i:=1 to n do
      begin
         a:=nemo(i);
         for j:=i+1 to n do
         begin
            bol:=false;
            for ii:=1 to g[i] do
            begin
               if not bol then
               begin
                  for jj:=1 to g[j] do
                     if dis(i,ii,j,jj)<=k then
                     begin
                        bol:=true;
                        break;
                     end;
                end
                else
                break;
            end;
            if bol then
            begin
               b:=nemo(j);
               papa[b]:=a;
            end;
         end;
      end;
      bol:=false;
      a:=nemo(1);
      for j:=1 to n do
      begin
         b:=nemo(j);
         if (a=b) then
             for i:=1 to m do
                if not bol then
                begin
                   for jj:=1 to g[j] do
                      if (disdoc(j,jj,i)<=d) then
                      begin
                         bol:=true;
                         break;
                      end;
                end
                else
                   break;
         if bol then
            break;
      end;
      if bol then
         writeln('Tree can be saved :)')
      else
         writeln('Tree can''t be saved :(');
   end;
end.

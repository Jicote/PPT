var
   i,j,m,n,t,a,b:longint;
   papa,suma,cant:array[0..200000] of longint;
function nemo(x:longint):longint;
begin
   if papa[x]<>x then
      papa[x]:=nemo(papa[x]);
   nemo:=papa[x];
end;
begin
   repeat
       readln(n,m);
       for i:=1 to n do
       begin
          papa[i]:=i+n;
          papa[i+n]:=i+n;
          cant[i+n]:=1;
          suma[i+n]:=i;
       end;
       for i:=1 to m do
       begin
          read(t);
          if t=1 then
          begin
             readln(a,b);
             a:=nemo(a);
             b:=nemo(b);
             if a<>b then
             begin
                cant[a]:=cant[a]+cant[b];
                suma[a]:=suma[a]+suma[b];
                papa[b]:=a;
             end;
          end
          else
          if t=2 then
          begin
             readln(a,b);
             t:=nemo(a);
             cant[t]:=cant[t]-1;
             suma[t]:=suma[t]-a;
             t:=nemo(b);
             papa[a]:=t;
             cant[t]:=cant[t]+1;
             suma[t]:=suma[t]+a;
          end
          else
          begin
             readln(a);
             a:=nemo(a);
             writeln(cant[a],' ',suma[a]);
          end;
       end;
   until eof;
end.

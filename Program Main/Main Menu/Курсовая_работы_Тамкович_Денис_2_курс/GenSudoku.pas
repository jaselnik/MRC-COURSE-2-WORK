// ����������� "������������� ������"
// �����������: �������� �.�., ��. 62492

// Unit ��� ��������� ���������� ����
unit GenSudoku;

interface
Type
  tgrid=array[1..9,1..9]of integer;

Procedure GenSetka(Var arr:tgrid; Var lake_grid:tgrid; Colrow:integer; filename:string);
// ��������� ������ �������� ������ �������� ���� �� �������� ������

implementation

uses SysUtils;

Const
  allnumbers = '123456789';

Var
  n,p:integer;
  Numbers, letters: string;
  result: string;

function GenShablon(AvailNum:string):string;
// ��������� ������ ����������� ����� ��� �������� ����
Var
  index:integer;
Begin
  randomize;
  While AvailNum<>'' do
  begin
    index:=random(Length(AvailNum))+1;
    result:=result+AvailNum[index];
    delete(AvailNum,index,1);
  end;
  GenShablon:=result;
end;

// ��������� ������ �������� ������ �������� ���� �� �������� ������
Procedure GenSetka(Var arr:tgrid; Var lake_grid:tgrid; Colrow:integer; filename:string);
Var
  i,j,p,k,tit:integer;
  fin:textfile;
  turnkol:integer;
  s,num:string;
  ShablonLine:string;
Begin
  n:=ColRow;
  Numbers:=copy(allnumbers,1,n);
  ShablonLine:=GenShablon(Numbers);
  assignfile(fin,filename); reset(fin);
  readln(fin,letters);
  readln(fin);
  p:=n div 2;
  // 0
    // setka
  for i:=1 to n do
  begin
    readln(fin,s);
    for j:=1 to n do
    begin
      if s[j]='.' then
        arr[i,j]:=0
      else
      begin
        num:=ShablonLine[pos(s[j],letters)];
        arr[i,j]:=StrToInt(ShablonLine[pos(s[j],letters)]);
      end;
    end;
  end;
  readln(fin);
  ShablonLine:=GenShablon(Numbers);
    // lake_grid
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(fin,lake_grid[i,j]);
      lake_grid[i,j]:=strtoint(ShablonLine[lake_grid[i,j]]);
    end;
    readln(fin);
  end;
  randomize;
  turnkol:=random(4);
  while turnkol>0 do
  begin
    for i:=1 to p do
      for k:=i to n-i do
      begin
        { arr[] }
        tit:=arr[i,k];
        arr[i,k]:=arr[n-k+1,i];
        arr[n-k+1,i]:=arr[n-i+1,n-k+1];
        arr[n-i+1,n-k+1]:=arr[k,n-i+1];
        arr[k,n-i+1]:=tit;
        { lake_grid[] }
        tit:=lake_grid[i,k];
        lake_grid[i,k]:=lake_grid[n-k+1,i];
        lake_grid[n-k+1,i]:=lake_grid[n-i+1,n-k+1];
        lake_grid[n-i+1,n-k+1]:=lake_grid[k,n-i+1];
        lake_grid[k,n-i+1]:=tit;
      end;
    dec(turnkol);
  end;
End;

end.
 
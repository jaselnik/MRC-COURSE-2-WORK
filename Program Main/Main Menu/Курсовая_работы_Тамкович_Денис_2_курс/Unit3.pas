// ����������� "������������� ������"
// �����������: �������� �.�., ��. 62492

// Unit ��� ����/�������� ����
unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Menus, BACTREKING, Buttons, DBGrids,
  DB, ADODB, SaveResult, JPEG;

Const
  koordij:array[1..9]of real=(37.25,74.50,111.75,
                              149.00,186.25,223.50,
                              260.75,298.00,335.00);

type
  TForm3 = class(TForm)
    Button3: TButton;
    Button1: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Timer1: TTimer;
    Panel10: TPanel;
    One: TButton;
    Two: TButton;
    Three: TButton;
    Four: TButton;
    Five: TButton;
    Six: TButton;
    Seven: TButton;
    Eight: TButton;
    Nine: TButton;
    RollUp: TBitBtn;
    Clear: TButton;
    N4: TMenuItem;
    HelpPanel: TPanel;
    Help1: TPanel;
    Help2: TPanel;
    Help3: TPanel;
    Help4: TPanel;
    Help5: TPanel;
    Help6: TPanel;
    Help7: TPanel;
    Help8: TPanel;
    Help9: TPanel;
    procedure FormCreate(Sender: TObject); // ���������� ����� ��� � ��������
    procedure FormShow(Sender: TObject); // ���������� ����� ��� � �����������
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // �������� �����
    procedure Button1Click(Sender: TObject); // ������ ������
    procedure Button3Click(Sender: TObject); // ������ ������� ����
    procedure N2Click(Sender: TObject); // ������ � ���� ����/�����
    procedure N4Click(Sender: TObject); // ������ � ���� ����/������
    procedure N3Click(Sender: TObject); // ������ � ���� ����/��������� ����������
    procedure Timer1Timer(Sender: TObject); // ������������ ������� �� ����
    procedure RollUpClick(Sender: TObject); // ������������ ������ ��� ���������� ����� �������
    procedure OneClick(Sender: TObject); // ���������� ������ ������ 1
    procedure TwoClick(Sender: TObject); // ���������� ������ ������ 2
    procedure ThreeClick(Sender: TObject); // ���������� ������ ������ 3
    procedure FourClick(Sender: TObject); // ���������� ������ ������ 4
    procedure FiveClick(Sender: TObject); // ���������� ������ ������ 5
    procedure SixClick(Sender: TObject); // ���������� ������ ������ 6
    procedure SevenClick(Sender: TObject); // ���������� ������ ������ 7
    procedure EightClick(Sender: TObject); // ���������� ������ ������ 8
    procedure NineClick(Sender: TObject);  // ���������� ������ ������ 9
    procedure ClearClick(Sender: TObject); // �������� ����������� ������ � ������
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean); // ����������� ������ ������ �������(�������� ����)
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char); // ������������ ����� �������� � ���������� � ������
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); // ������������ �������� ���� �� �������� ����
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState); // ���������� �������(������� ����) ����������
      // � ����������� �������������� ������ ��� ����
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); // ������������ �������� ���� �� ����� �����
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  n:integer;
  f:textfile;
  a,arr2,resha,lake_grid:tgrid;
  nachali,solve:boolean;
  h,m,s,gg,freegrids:integer;
  Username:string;
  
  available_numbers:array[1..9,1..9]of string;
  didpaint:boolean;

  levelnames:array[0..2]of string;
  lvl:integer;

implementation

uses Unit1, Unit2;

{$R *.dfm}



procedure DrawImage(chis:string; tip,pause: integer; var Img: TImage);
begin
  Img.Picture:=nil;
  case tip of
    1:  Img.Canvas.Pen.Color:=clBlack;
    2:  Img.Canvas.Pen.Color:=clRed;
    3:  Img.Canvas.Pen.Color:=clGreen;
    4:  Img.Canvas.Pen.Color:=clYellow;
    5:  Img.Canvas.Pen.Color:=clBlue;
    6:  Img.Canvas.Pen.Color:=clMaroon;
    7:  Img.Canvas.Pen.Color:=clSilver;
    8:  Img.Canvas.Pen.Color:=clOlive;
    9:  Img.Canvas.Pen.Color:=clAqua;
  end;
  Img.Canvas.Brush.Color:=clWhite;
  Img.Canvas.Pen.Width:=7;
  Img.Canvas.Rectangle(1,1,50,50);
  Img.Canvas.Font.Size:=12;
  Img.Canvas.TextOut(10,15,chis);
  Img.Repaint;
  Sleep(pause);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Username:='noname';
  nachali:=false;
  h:=0;
  m:=0;
  s:=0;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  nachali:=False;
  h:=0;
  m:=0;
  s:=0;
  Edit1.Text:='00:00:00';
  FormHome.Show;
  Form3.Hide;
end;


procedure TForm3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if arr2[ARow+1,ACol+1]>0 then
    StringGrid1.Canvas.Font.Style:=[fsBold];
  case lake_grid[ARow+1,ACol+1] of
    1:  StringGrid1.Canvas.Brush.Color:=clWindow;
    2:  StringGrid1.Canvas.Brush.Color:=rgb(239, 122, 157);
    3:  StringGrid1.Canvas.Brush.Color:=clGreen;
    4:  StringGrid1.Canvas.Brush.Color:=clYellow;
    5:  StringGrid1.Canvas.Brush.Color:=clBlue;
    6:  StringGrid1.Canvas.Brush.Color:=clMoneyGreen;
    7:  StringGrid1.Canvas.Brush.Color:=clGray;
    8:  StringGrid1.Canvas.Brush.Color:=rgb(244, 176, 66);
    9:  StringGrid1.Canvas.Brush.Color:=clAqua;
  end;

  StringGrid1.Canvas.FillRect(Rect);
  if not nachali then
    if (a[ARow+1,ACol+1]<>resha[ARow+1,ACol+1]) and (a[ARow+1,ACol+1]>0) then
      StringGrid1.Canvas.Font.Color:=clRed
    else
      StringGrid1.Canvas.Font.Color:=clWindowText
  else
    StringGrid1.Canvas.Font.Color:=clWindowText;
  StringGrid1.Canvas.TextOut(Rect.Left+10, Rect.Top+8, StringGrid1.Cells[ACol, ARow]);
end;

procedure TForm3.N3Click(Sender: TObject);
Var
  i,j:integer;
begin
  Button1.Enabled:=False; { ������ }
  N3.Enabled:=False;      { ������}
  Panel10.Hide;
  if solve then
  begin
    nachali:=False;
  for i:=1 to n do
    for j:=1 to n do
      StringGrid1.Cells[j-1,i-1]:=inttostr(resha[i,j]);
    Edit1.Text:='������';
  end
  else
    Edit1.Text:='��� �������';
end;

procedure TForm3.StringGrid1KeyPress(Sender: TObject; var Key: Char);
Var
  i,j:integer;
begin
  key:=#0;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
Var
  sh,sm,ss:string;
  i,j:integer;
  cl,numbers:string;
  neresheno, noanyfree:boolean;
  bly:array[1..9]of string;
begin
 if nachali then
 begin
  if freegrids=0 then
  Begin
    neresheno:=False;
    numbers:='12345678';
    if n=9 then
      numbers:=numbers+'9';
    for i:=1 to n do
      bly[i]:=numbers;
    for i:=1 to n do
    begin
      cl:=numbers;
      for j:=1 to n do
      begin
        if i>1 then
        begin
          if j>1 then
            if a[i-1,j-1]=a[i,j] then
            begin
              neresheno:=True;
              break;
            end;
          if j<n then
            if a[i-1,j+1]=a[i,j] then
            begin
              neresheno:=True;
              break;
            end;
        end;
        if i<n then
        begin
          if j>1 then
            if a[i+1,j-1]=a[i,j] then
            begin
              neresheno:=True;
              break;
            end;
          if j<n then
            if a[i+1,j+1]=a[i,j] then
            begin
              neresheno:=True;
              break;
            end;
        end;
        if pos(inttostr(a[i,j]),cl)>0 then
          delete(cl,pos(inttostr(a[i,j]),cl),1)
        else
        begin
          neresheno:=True;
          break;
        end;
        if pos(inttostr(a[i,j]),bly[lake_grid[i,j]])>0 then
          delete(bly[lake_grid[i,j]],pos(inttostr(a[i,j]),bly[lake_grid[i,j]]),1)
        else
        begin
          neresheno:=True;
          break;
        end;
      end;
      if neresheno then
        break;
    end;
    if not neresheno then
    begin
      Username:=Unit2.Form2.Username.Text;
      nachali:=false;
      N4.Enabled:=True;
      ShowMessage('����������� ���, '+Username+'! �� ��������� ������ �� �����: '+Edit1.Text);
    end;
  end;
  inc(s);
  if s=60 then
  begin
    s:=0;
    inc(m);
    if m=60 then
    begin
      m:=0;
      inc(h);
    end;
  end;
  sh:='';
  sm:='';
  ss:='';
  if h<10 then
    sh:='0';
  if m<10 then
    sm:='0';
  if s<10 then
    ss:='0';
  sh:=sh+inttostr(h);
  sm:=sm+inttostr(m);
  ss:=ss+inttostr(s);
  Edit1.Text:=sh+':'+sm+':'+ss;
 end;
end;

{ ��������� �������� � ������ }
Procedure cut_in_row(i:integer; num:string);
Var
  j,position:integer;
Begin
  for j:=1 to n do
  begin
    position:=pos(num,available_numbers[i,j]);
    if available_numbers[i,j]<>num then
      if position>0 then
        delete(available_numbers[i,j],position,1);
  end;
End;

{ ��������� �������� � ������� }
Procedure cut_in_col(j:integer; num:string);
Var
  i,position:integer;
Begin
  for i:=1 to n do
  begin
    position:=pos(num,available_numbers[i,j]);
    if available_numbers[i,j]<>num then
      if position>0 then
        delete(available_numbers[i,j],position,1);
  end;
End;

{ ��������� �������� � ����� }
Procedure cut_in_shape(color_id:integer; num:string);
Var
  i,j,position:integer;
Begin
  for j:=1 to n do
  begin
    position:=pos(num,available_numbers[i,j]);
    if lake_grid[i,j]=color_id then
      if available_numbers[i,j]<>num then
        if position>0 then
          delete(available_numbers[i,j],position,1);
  end;
End;

{ ��������� �������� ����� }
Procedure cut_everywhere(x,y,color_id:integer; num:string);
Var
  i,j,position:integer;
Begin
  // ������ ������ �������� �������� � ���������� �������
  if x>1 then
  begin
    if y>1 then                                       {?..}
    begin                                             {.X.}
      position:=pos(num,available_numbers[x-1,y-1]);  {...}
      if position>0 then
        delete(available_numbers[x-1,y-1],position,1)
    end;
    if y<n then                                       {..?}
    begin                                             {.X.}
      position:=pos(num,available_numbers[x-1,y+1]);  {...}
      if position>0 then
        delete(available_numbers[x-1,y+1],position,1)
    end;
  end;
  if x<n then
  begin
    if y>1 then                                       {...}
    begin                                             {.X.}
      position:=pos(num,available_numbers[x+1,y-1]);  {?..}
      if position>0 then
        delete(available_numbers[x+1,y-1],position,1)
    end;
    if y<n then                                       {...}
    begin                                             {.X.}
      position:=pos(num,available_numbers[x+1,y+1]);  {..?}
      if position>0 then
        delete(available_numbers[x+1,y+1],position,1)
    end;
  end;
  for i:=1 to n do
    for j:=1 to n do
    begin
      position:=pos(num,available_numbers[i,j]);
      if(x<>i)or(y<>j)then
        if position>0 then
          if lake_grid[i,j]=color_id then // ���� ��������� �����
            delete(available_numbers[i,j],position,1)
          else
          if(x=i)and(y<>j)then // ���� ��������� ������
            delete(available_numbers[i,j],position,1)
          else
          if(y=j)and(x<>i)then // ���� ��������� �������
            delete(available_numbers[i,j],position,1);
    end;
End;

{ ��������� �������� }
Procedure make_help;
Var
  i,j,x:integer;
  chisla:string;
Begin
  if n=8 then
    chisla:='12345678'
  else if n=9 then
    chisla:='123456789';
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j]>0 then
        available_numbers[i,j]:=IntToStr(a[i,j])
      else
        available_numbers[i,j]:=chisla;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      if a[i,j]>0 then
        cut_everywhere(i,j,lake_grid[i,j],available_numbers[i,j]); //  ��������� �����
    end;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
Var
  i,j:integer;
  f1:textfile;
begin
  Button1.Enabled:=False;   { ������ }
  N3.Enabled:=True;         { ������ }
 if not nachali then
 begin
  gg:=0;
  StringGrid1.Height:=337;
  StringGrid1.Width:=337;
  StringGrid1.ColCount:=n;
  StringGrid1.RowCount:=n;
  if n=8 then
  begin
    StringGrid1.Height:=300;
    StringGrid1.Width:=300;
  end;
  for i:=1 to n do
    for j:=1 to n do
    begin
      a[i,j]:=Unit2.arr[i,j];
      lake_grid[i,j]:=Unit2.lake_grid[i,j];
      arr2[i,j]:=a[i,j];
      resha[i,j]:=a[i,j];
      if a[i,j]>0 then
        StringGrid1.Cells[j-1,i-1]:=inttostr(a[i,j])
      else
      begin
        StringGrid1.Cells[j-1,i-1]:='';
        inc(gg);
      end;
    end;
  get_resh(resha,lake_grid,n,solve);
  nachali:=True;
  make_help;
 end;
 freegrids:=gg;
 assignfile(f1,'helpara.txt'); rewrite(f1);
 for i:=1 to n do
 begin
  for j:=1 to n do
    write(f1,a[i,j],' ');
  writeln(f1);
 end;
 for i:=1 to n do
 begin
  for j:=1 to n do
    write(f1,lake_grid[i,j],' ');
  writeln(f1);
 end;
 for i:=1 to n do
 begin
  for j:=1 to n do
    write(f1,available_numbers[i,j],' ');
  writeln(f1);
 end;
 closefile(f1);
end;

procedure TForm3.FormShow(Sender: TObject);
var
  i,j: integer;

begin
  HelpPanel.Hide;
  N4.Enabled:=False;
  levelnames[0]:='�������';
  levelnames[1]:='��������';
  levelnames[2]:='���������';
  lvl:=Unit2.level;
  nachali:=False;
  Button1.Enabled:=True;   // ������
  N3.Enabled:=False;       // ������
  Panel10.Hide;
  StringGrid1.Height:=337;
  StringGrid1.Width:=337;
  try
    n:=Unit2.n;
  except
    n:=9;
  end;
  StringGrid1.ColCount:=n;
  StringGrid1.RowCount:=n;
  if n=8 then
  begin
    StringGrid1.Height:=300;
    StringGrid1.Width:=300;
    Nine.Enabled:=False;
  end;
  for i:=1 to n do
    for j:=1 to n do
    begin
      a[i,j]:=0;
      arr2[i,j]:=0;
      resha[i,j]:=0;
      lake_grid[i,j]:=0;
      StringGrid1.Cells[j-1,i-1]:='';
    end;
  didpaint:=False;
  nachali:=False;
  h:=0;
  m:=0;
  s:=0;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form2.Show;
  nachali:=False;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if nachali then
  begin
    Panel10.Left:=0+32*Acol+8*(Acol div 2);
    Panel10.Top:=72+38*Arow-2*(Arow div 2);
    Panel10.Show;
  end
  else
    Panel10.Hide;
end;

Procedure GetPutKoordGrid(Left, Top:integer; Var ACol:integer; Var ARow:integer);
begin
  ACol:=round((Left/33)-0.25);
  ARow:=round((Top+2-72)/38);
End;

Procedure checkifsolve;
Var
  i,j:integer;
  cl,numbers:string;
  neresheno:boolean;
  bly:array[1..9]of string;
Begin
  neresheno:=False;
  numbers:='12345678';
  if n=9 then
    numbers:=numbers+'9';
  for i:=1 to n do
    bly[i]:=numbers;
  for i:=1 to n do
  begin
    cl:=numbers;
    for j:=1 to n do
    begin
      if pos(inttostr(a[i,j]),cl)>0 then
        delete(cl,pos(inttostr(a[i,j]),cl),1)
      else
      begin
        neresheno:=True;
        break;
      end;
      if pos(inttostr(a[i,j]),bly[lake_grid[i,j]])>0 then
        delete(bly[lake_grid[i,j]],pos(inttostr(a[i,j]),bly[lake_grid[i,j]]),1)
      else
      begin
        neresheno:=True;
        break;
      end;
    end;
    if neresheno then
      break;
  end;
  if not neresheno then
  begin
    Username:=Unit2.Form2.Username.Text;
    nachali:=false;
    ShowMessage('����������� ���, '+Username+'! �� ��������� ������ �� �����: '+Form3.Edit1.Text);
  end;
end;

procedure TForm3.RollUpClick(Sender: TObject);
begin
  Panel10.Hide;
end;

{ ������/������� ����� �/�� ������� }
procedure put_number(ACol,ARow:integer; num:string);
Begin
  if arr2[ARow+1,ACol+1]=0 then
  begin
    if num='' then
    begin
      if a[ARow+1,ACol+1]>0 then
        inc(freegrids);
      a[ARow+1,ACol+1]:=0;
      Form3.StringGrid1.Cells[ACol,Arow]:='';
      make_help;
    end
    else
    begin
      a[ARow+1,ACol+1]:=StrToInt(num);
      if Form3.StringGrid1.Cells[ACol,ARow]='' then
      begin
        dec(freegrids);
        available_numbers[ARow+1,ACol+1]:=num;
        cut_everywhere(ARow+1,ACol+1,lake_grid[ARow+1,ACol+1],num);
      end
      else
        make_help;
      Form3.StringGrid1.Cells[ACol,Arow]:=num;
    end;
  end;
End;

// ��������� ��� ������ �����, ������� ������� ���������
{
  [TForm3.OneClick ... TForm3.NineClick] + TForm3.ClearClick
}
procedure TForm3.OneClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '1');
end;

procedure TForm3.TwoClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '2');
end;

procedure TForm3.ThreeClick(Sender: TObject);
Var
  ACol, ARow:integer;
begiN
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '3');
end;

procedure TForm3.FourClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '4');
end;

procedure TForm3.FiveClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '5');
end;

procedure TForm3.SixClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '6');
end;

procedure TForm3.SevenClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '7');
end;

procedure TForm3.EightClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '8');
end;

procedure TForm3.NineClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '9');
end;

procedure TForm3.ClearClick(Sender: TObject);
Var
  ACol, ARow:integer;
begin
  GetPutKoordGrid(Panel10.Left, Panel10.Top, ACol, ARow);
  put_number(ACol, ARow, '');
end;

procedure TForm3.N4Click(Sender: TObject);
begin
  Form6.Show;
end;

// ��������� ����������� ����, ������� ����� ��������� � ���������� ������
procedure TForm3.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
Var
  i,j:integer;
  s:string;
begin
  if nachali then
  begin
    Help1.Color:=cl3DDkShadow;
    Help2.Color:=cl3DDkShadow;
    Help3.Color:=cl3DDkShadow;
    Help4.Color:=cl3DDkShadow;
    Help5.Color:=cl3DDkShadow;
    Help6.Color:=cl3DDkShadow;
    Help7.Color:=cl3DDkShadow;
    Help8.Color:=cl3DDkShadow;
    Help9.Color:=cl3DDkShadow;
    for i:=1 to n do
      if y<koordij[i] then
        break;
    for j:=1 to n do
      if x<koordij[j] then
        break;
    s:=available_numbers[i,j];
    for i:=1 to length(s) do
    begin
      case StrToInt(s[i]) of
        1: Help1.Color:=clBtnFace;
        2: Help2.Color:=clBtnFace;
        3: Help3.Color:=clBtnFace;
        4: Help4.Color:=clBtnFace;
        5: Help5.Color:=clBtnFace;
        6: Help6.Color:=clBtnFace;
        7: Help7.Color:=clBtnFace;
        8: Help8.Color:=clBtnFace;
        9: Help9.Color:=clBtnFace;
      end;
    end;
    HelpPanel.Show;
  end;
end;

//  ������������ �������� ����
//  ���� ������������� ������� �� ������, �� ������������ ��� �����
// ������ �� ������������� �������, �������� ����� � ������ ������
// ��������� � ������ ������.
procedure TForm3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  HelpPanel.Hide;
end;

end.

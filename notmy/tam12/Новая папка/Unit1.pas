// ����������� "������������� ������"
// �����������: �������� �.�., ��. 62492

// ������������� ����
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, BestePlayers, HelpPage;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������ ������
procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
  Form1.Hide;
end;

// ������ �����
procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

// ������ �������
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form5.Show;
  Form1.Hide;
end;

// ������ �������
procedure TForm1.Button4Click(Sender: TObject);
begin
  Form7.Show;
  Form1.Hide;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  exit;
end;

end.

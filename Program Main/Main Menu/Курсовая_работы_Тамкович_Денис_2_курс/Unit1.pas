// ����������� "������������� ������"
// �����������: �������� �.�., ��. 62492

// ������������� ����
unit Unit1;

interface

// � uses ������� ���������� ������ ShellAPI ��� ����,
// ����� �������� ���� ������������ ��������� ��� �����������
// ������� ������ � ����������� ".chm"
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, BestePlayers, HelpPage, jpeg, ExtCtrls, ShellAPI;

type
  TFormHome = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    NameGamePanel: TPanel;
    NameGameLabel: TLabel;
    procedure Button1Click(Sender: TObject); // ������ ������
    procedure Button2Click(Sender: TObject); // ������ ������
    procedure Button3Click(Sender: TObject); // ������ �����
    procedure Button4Click(Sender: TObject); // ������ �������
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // �������� �����
    procedure FormKeyDown(Sender: TObject; var Key: Word; // ������������ ������� �������
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

// ������ ������
procedure TFormHome.Button1Click(Sender: TObject);
begin
  Form2.Show;
  FormHome.Hide;
end;

// ������ �����
procedure TFormHome.Button3Click(Sender: TObject);
begin
  close;
end;

// ������ �������
procedure TFormHome.Button2Click(Sender: TObject);
begin
  Form5.Show;
  FormHome.Hide;
end;

// ������ �������
procedure TFormHome.Button4Click(Sender: TObject);
begin
  // ������� - 'static\helpDoc.chm'
  ShellExecute(Handle, 'Open', 'static\helpDoc.chm', nil, nil,SW_SHOW);
end;

procedure TFormHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  exit;
end;

{ ������� �� ������� F1 }
procedure TFormHome.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // VK_F1 == 'F1'
  if key = VK_F1 then
  // �������� ������
    ShellExecute(Handle, 'Open', 'static\helpDoc.chm', nil, nil,SW_SHOW);
end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Grids, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Label10: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Button4: TButton;
    Edit6: TEdit;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    StringGrid2: TStringGrid;
    Button5: TButton;
    Button6: TButton;
    Label15: TLabel;
    GroupBox3: TGroupBox;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Label16: TLabel;
    Label17: TLabel;
    StringGrid3: TStringGrid;
    Button7: TButton;
    Button8: TButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Button9: TButton;
    Button10: TButton;
    Label21: TLabel;
    Memo1: TMemo;
    Label22: TLabel;
    StringGrid4: TStringGrid;
    Memo2: TMemo;
    Label23: TLabel;
    Label24: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormActivate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Chane(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Type gromadjany=record
     vul:string[20];
     bud:integer;
     nkv:integer;
     pl:real;
     pib:string[20];
     kpr:integer;
     datap:TDate;
     end;
var f:file of gromadjany;           //���� ������
    z:gromadjany;                   //�����
    namefile:string;                //��'� �����
    nbtn2:integer;
          
{������������ ���������� ������������ ���������� �� ������������ �� ������� �� ����}

//ϳ��������� ������������ �����
procedure TForm1.FormActivate(Sender: TObject);
var i:integer;
begin
 for i:=0 to ComponentCount-1 do     //���������� �������
  begin
   if components[i] is TLabel then (components[i] as TLabel).Visible:=false;
   if components[i] is TEdit then (components[i] as TEdit).Visible:=false;
   if components[i] is TButton then (components[i] as TButton).Visible:=false;
   if components[i] is TCheckBox then (components[i] as
    TCheckBox).Visible:=false;
   if components[i] is TComboBox then (components[i] as
    TComboBox).Visible:=false;
   if components[i] is TStringGrid then (components[i] as
    TStringGrid).Visible:=false;
   if components[i] is TGroupBox then (components[i] as
    TGroupBox).Visible:=false;
   if components[i] is TDateTimePicker then (components[i] as
    TDateTimePicker).Visible:=false;
  end;
 N2.Enabled:=false;
 Memo1.Hide;
 Memo2.Hide;
end;

{������� �������� �����}

{��������� ��� �������� ���������� �����}

//ϳ��������� ������� ���� "�������� ����"
procedure TForm1.N5Click(Sender: TObject);
begin
 Label10.Show;Edit6.Show;Edit6.SetFocus;
 Button2.Show;Button2.Enabled:=false;
 nbtn2:=1;
end;

//ϳ��������� ������� ���� "³������ ����"
procedure TForm1.N6Click(Sender: TObject);
begin
 Label10.Show;Edit6.Show;Edit6.SetFocus;
 Button2.Show;Button2.Enabled:=false;
 nbtn2:=2;
end;

//ϳ��������� ���������� ������ Button2
procedure TForm1.Edit6Change(Sender: TObject);
begin
 Button2.Enabled:=true;
end;

//ϳ��������� ������ "��������!"
procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
 if Edit6.Text='' then
  begin
   ShowMessage('�� �� ����� �� � �����!'+#13+'�������� ��������!');
   Exit;
  end;
 namefile:=Edit6.Text;     //�������� ���� �����
 AssignFile(f,namefile);   //��'���� ������� ����� � �������� ������
 if nbtn2=1
  then rewrite(f)           //��������� �����
 else
  begin                     //³������� �����
   {$I-}
   reset(f);
   {$I+}
   if IOResult<>0 then
    begin
     ShowMessage('������ ����� �� ����!'+#13+'�������� ��������!');
     Edit6.Clear;Edit6.SetFocus;exit;
    end;
  end;
CloseFile(f);                //������� ����

{���������� ���������� �� ���������}

for i:=0 to ComponentCount-1 do
 begin
  //�� ���� �����
  if components[i] is TLabel then (components[i]as TLabel).Visible:=true;
  //�� ���������� Edit �����  ����������
  if components[i] is TEdit then (components[i] as TEdit).Visible:=true;
 end;

{�������� �������� �����}

Edit6.Clear;Edit6.Hide;        //Edit6 �������� � ����������
Label10.Hide;Button2.Hide;     //���������� ��������
GroupBox1.Visible:=true;
GroupBox1.Enabled:=true;
Edit1.SetFocus;                //��������� ������ ������ ��������
Edit2.Enabled:=false;          //���������� ������������
Edit3.Enabled:=false;
Edit4.Enabled:=false;
Edit5.Enabled:=false;
DateTimePicker1.Visible:=true;  //��������� �������
DateTimePicker1.Enabled:=false; //���������� ������������
ComboBox1.Enabled:=false;
ComboBox1.Visible:=true;        //���������� �����
Button1.Visible:=true;
Button2.Enabled:=false;         //��������� ��������������

{�������� �������� �����}

Button3.Visible:=true;          //������ ������

{�������� �����1}
GroupBox2.Visible:=true;         //��������� �������
Edit8.Enabled:=false;            //��������� ��������������
Edit9.Enabled:=false;            //��������� ��������������
Button5.Visible:=true;           //������ ������
Button5.Enabled:=false;          //������ �������������
StringGrid2.Hide;
Button6.Visible:=false;          //������ ��������
 {�������� �����2}
Button7.Visible:=true;           //������ ������
Button7.Enabled:=false;          //������ �������������
GroupBox3.Visible:=true;         //���������� �����
DateTimePicker2.Visible:=true;
DateTimePicker3.Visible:=true;
DateTimePicker3.Enabled:=false;  //��������� ��������������
Label18.Visible:=false;          //���������� �������
Label19.Visible:=false;

{�������� ����� 3}
Button9.Visible:=true;           //������ ������
StringGrid4.Enabled:=false;      //��������� ��������������
Label21.Visible:=false;          //���������� �������
Label22.Visible:=false;
Label23.Visible:=false;
Label24.Visible:=false;


 {����� ���� ��������}
N2.Enabled:=true;            //����� ���� ������������
end;

//���������� ���������� Edit2
procedure TForm1.Edit1Change(Sender: TObject);
begin
 Edit2.Enabled:=true;
end;
//���������� ���������� Edit3
procedure TForm1.Edit2Change(Sender: TObject);
begin
 Edit3.Enabled:=true;
end;
//���������� ���������� Edit4
procedure TForm1.Edit3Chane(Sender: TObject);
begin
 Edit4.Enabled:=true;
end;
//���������� ���������� Edit5
procedure TForm1.Edit4Change(Sender: TObject);
begin
 Edit5.Enabled:=true;
end;
//���������� ���������� ComboBox1
procedure TForm1.Edit5Change(Sender: TObject);
begin
 ComboBox1.Enabled:=true;
end;
//���������� ���������� DateTimePicker1
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
 DateTimePicker1.Enabled:=true;
end;
//���������� ������ Button1 "������"
procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
 Button1.Enabled:=true;
end;

//ϳ��������� ������ "������"
procedure TForm1.Button1Click(Sender: TObject);
begin
 {�������� �������� ����� � ����� ��������}
 if(length(Edit1.Text)=0)or(length(Edit2.Text)=0)or
   (length(Edit3.Text)=0)or(length(Edit4.Text)=0)or
   (length(Edit5.Text)=0)or
   (length(ComboBox1.Text)=0)then
    begin
     ShowMessage('�� �� ����� ��� ��� ������!');
     exit;
    end;
 {����������� � ���� ������� ��� �����}
 reset(f);                          //³������ ����
 seek(f,FileSize(f));               //����������� ��������� �� ����� �����
 with z do
  begin
   vul:=Edit1.Text;
   bud:=StrToInt(Edit2.Text);
   nkv:=StrToInt(Edit3.Text);
   pl:=StrToFloat(Edit4.Text);
   pib:=Edit5.Text;
   kpr:=StrToInt(ComboBox1.Text);
   datap:=DateTimePicker1.Date;
  end;
 write(f,z);
 CloseFile(f);
 {�������� ���� ��� ����� �������}
 Edit1.Clear;Edit2.Clear;Edit3.Clear;Edit4.Clear;Edit5.Clear;
 {���������� ��������}
 Edit2.Enabled:=false;Edit3.Enabled:=false;Edit4.Enabled:=false;Edit5.Enabled:=false;
end;

{������� �������� �����}

//ϳ��������� ��������� ����� � ����
procedure TForm1.Button3Click(Sender: TObject);
 var i:integer;
 begin
  reset(f);
  seek(f,0);
  with StringGrid1 do               //ϳ���� ��������
   begin
    cells[0,0]:='������';
    cells[1,0]:='�������';
    cells[2,0]:='����� ��������';
    cells[3,0]:='�����';
    cells[4,0]:='ϲ�';
    cells[5,0]:='ʳ������ �����������';
    cells[6,0]:='���� �����������';
    Visible:=false;
   end;
  StringGrid1.Show;
  Button4.Enabled;
  i:=0;
  while not eof(f) do
   begin                             //������� ����� � �����
    read(f,z);
    i:=i+1;
    with z do                         //��������� �����
     begin
      StringGrid1.Cells[0,i]:=vul;
      StringGrid1.Cells[1,i]:=IntToStr(bud);
      StringGrid1.Cells[2,i]:=IntToStr(nkv);
      StringGrid1.Cells[3,i]:=FloatToStr(pl);
      StringGrid1.Cells[4,i]:=pib;
      StringGrid1.Cells[5,i]:=IntToStr(kpr);
      StringGrid1.Cells[6,i]:=DateToStr(datap);
     end;
   end;
 CloseFile(f);
 Button4.Show;
end;

//ϳ��������� ���������� ��������� ����� � ����
procedure TForm1.Button4Click(Sender: TObject);
 var i,j:integer;
begin
 for i:=0 to StringGrid1.RowCount-1 do
  for j:=0 to 6 do StringGrid1.Cells[j,i]:='';
 StringGrid1.Height:=150;
 StringGrid1.Hide;
 Button4.Hide;
end;

{������� �����1}

//ϳ��������� ���������� Edit8
procedure TForm1.Edit7Change(Sender: TObject);
begin
 Edit8.Enabled:=true;
end;

//ϳ��������� ���������� Edit9
procedure TForm1.Edit8Change(Sender: TObject);
begin
 Edit9.Enabled:=true;
end;

//ϳ��������� ���������� Button5
procedure TForm1.Edit9Change(Sender: TObject);
begin
 Button5.Enabled:=true;
end;

//ϳ��������� ������ 1
procedure TForm1.Button5Click(Sender: TObject);
var i,kz:integer;
    r1:string;
    r2:integer;
    r3:integer;
begin
 //�������� �������� ������� � ����� Edit
 if(length(Edit7.Text)=0)or(length(Edit8.Text)=0)or(length(Edit9.Text)=0)then
  begin
   ShowMessage('�� �� ����� ��� ��� ������!');
   exit;
  end;
 begin
  r1:=Edit7.Text;
  r2:=StrToInt(Edit8.Text);
  r3:=StrToInt(Edit9.Text);
 end;
 begin
  reset(f);
  seek(f,0);
  with StringGrid2 do
   begin
    cells[0,0]:='������';
    cells[1,0]:='�������';
    cells[2,0]:='����� ��������';
    cells[3,0]:='ϲ�';
    cells[4,0]:='ʳ������ �����������';
    Visible:=false;
   end;
  StringGrid2.Show;
  Button4.Enabled;
  i:=0;
  while not eof(f) do
   begin
    read(f,z);
    with z do
     if (vul=r1)and(bud=r2)and(nkv=r3) then
      begin
       i:=i+1;
       StringGrid2.Cells[0,i]:=vul;
       StringGrid2.Cells[1,i]:=IntToStr(bud);
       StringGrid2.Cells[2,i]:=IntToStr(nkv);
       StringGrid2.Cells[3,i]:=pib;
       StringGrid2.Cells[4,i]:=IntToStr(kpr);
      end;
    end;
  CloseFile(f);                //������� ����
  Button6.Show;
 end;
end;

 //��������� ��������
procedure TForm1.Button6Click(Sender: TObject);
 var i,j: integer;
begin
  for i:=0 to StringGrid2.RowCount-1 do
  for j:=0 to 4 do StringGrid2.Cells[j,i]:='';
 Edit7.Clear;Edit7.SetFocus;
 Edit8.Clear;Edit8.Enabled:=false;
 Edit9.Clear;Edit9.Enabled:=false;
 Button5.Enabled:=false;
 Button6.Visible:=false;
end;


{������� ����� 2}

//ϳ��������� ���������� DateTimePicker3
procedure TForm1.DateTimePicker2Change(Sender: TObject);
begin
DateTimePicker3.Enabled:=true;
end;

//ϳ��������� ���������� Button7
procedure TForm1.DateTimePicker3Change(Sender: TObject);
begin
Button7.Enabled:=true;
end;

//ϳ��������� ������2
procedure TForm1.Button7Click(Sender: TObject);
var  d1,d2:TDate;
     i,k:integer;
begin
 d1:=DateTimePicker2.Date;
 d2:=DateTimePicker3.Date;
 reset(f);
 seek(f,0);
 with StringGrid3 do
  begin
   cells[0,0]:='���� �������';
   cells[1,0]:='ϲ� ��������';
   cells[2,0]:='������';
   cells[3,0]:='ʳ������ ���';
   Visible:=false;
  end;
 StringGrid3.Show;
 Button8.Enabled;
 i:=0;
 k:=0;
 while not eof(f) do
  begin
   read(f,z);
   with z do
    if (datap>=d1) and (datap<=d2) then
     begin
      i:=i+1;
      StringGrid3.RowCount:=StringGrid3.RowCount+1;
      StringGrid3.Cells[0,i]:=DateToStr(datap);
      StringGrid3.Cells[1,i]:=pib;
      StringGrid3.Cells[2,i]:=vul+', �.'+IntToStr(bud)+', ��.'+IntToStr(nkv);
      StringGrid3.Cells[3,i]:=IntToStr(kpr);
      k:=k+kpr;
     end;
   end;
 CloseFile(f);
 Label19.Caption:=IntToStr(k);
 Button7.Show;
 Button8.Show;
 Label18.Visible:=true;
 Label19.Visible:=true;
 Button8.Visible:=true;
end;


 //��������� ��������
procedure TForm1.Button8Click(Sender: TObject);
 var i,j:integer;
begin
 for i:=0 to StringGrid3.RowCount-1 do
  for j:=0 to 4 do StringGrid3.Cells[j,i]:='';
 DateTimePicker3.SetFocus;
 DateTimePicker3.Enabled:=false;
 StringGrid3.Enabled:=false;
 StringGrid3.Visible:=false;
 Button7.Enabled:=false;
 Button8.Visible:=false;
 Label18.Visible:=false;
 Label19.Visible:=false;
end;

{������� �����3}


//ϳ��������� ������3
procedure TForm1.Button9Click(Sender: TObject);
 var mins, maxs: real;
     i: integer;
     s: string;
begin
 reset(f);                         //³������ ����
 seek(f,0);                        //��������� �������� �� ������� �����
 //ϳ���� �������� ���������� StringGrid4
 with StringGrid4 do
 begin
  cells[0,0]:='������';
  cells[1,0]:='�����';
  cells[2,0]:='ʳ������ �����������';
  cells[3,0]:='����� �� 1 �����';
  Visible:=false;
 end;
 //���������� ������� � ����������� �����
 i:=0;
while not eof(f) do
 begin
  read(f,z);
  with z do
   begin
    i:=i+1;
    StringGrid4.RowCount:=StringGrid3.RowCount+1;
    StringGrid4.Cells[0,i]:=vul+', �.'+IntToStr(bud)+', ��.'+IntToStr(nkv);
    StringGrid4.Cells[1,i]:=FloatToStr(pl);
    StringGrid4.Cells[2,i]:=IntToStr(kpr);
    StringGrid4.Cells[3,i]:=FloatToStrF(pl/kpr,ffFixed,10,2);
   end;
 end;
  //�������� ��������
 mins:=100;
 maxs:=0;
 //����� �������� �� ����������� ����� �� �����
 seek(f,0);
 while not eof(f) do
  begin
   read(f,z);
   with z do
    begin
     if  pl/kpr>maxs then maxs:= pl/kpr;
     if  pl/kpr<mins then mins:= pl/kpr;
    end;
  end;
 Label23.Caption:=FloatToStr(mins);
 Label24.Caption:=FloatToStr(maxs);
 //��������� �������
  seek(f,0);
  while not eof(f) do
  begin
   read(f,z);
   with z do
    begin
     if  pl/kpr=maxs then
       begin
        s:=vul+', �.'+IntToStr(bud)+', ��.'+IntToStr(nkv);
        Memo1.Lines.Add(s);
       end;
     if  pl/kpr=mins then
       begin
        s:=vul+', �.'+IntToStr(bud)+', ��.'+IntToStr(nkv);
        Memo2.Lines.Add(s);
       end;
     end;
   end;
 Label21.Visible:=true;
 Label22.Visible:=true;
 Label23.Visible:=true;
 Label24.Visible:=true;
 Memo1.Visible:=true;
 Memo2.Visible:=true;
 StringGrid4.Visible:=true;
 Button10.Visible:=true;
 Button10.Enabled:=true;
 Button9.Enabled:=false;


end;



//��������� ��������
procedure TForm1.Button10Click(Sender: TObject);
 var i,j: integer;
begin
 Memo1.Clear;                             //�������� Memo1
 Memo2.Clear;                             //�������� Memo2
 Memo1.Visible:=false;                    //��������� ���������
 Memo2.Visible:=false;                    //��������� ���������
 for i:=0 to StringGrid4.RowCount-1 do          //�������� StringGrid4
 for j:=0 to 4 do StringGrid4.Cells[j,i]:='';
 Label21.Visible:=false;                   //��������� ���������
 Label22.Visible:=false;                   //��������� ���������
 Label23.Visible:=false;                   //��������� ���������
 Label24.Visible:=false;                   //��������� ���������
 StringGrid4.Visible:=false;               //��������� ���������
 Button10.Visible:=false;                  //��������� ���������
 Button9.Enabled:=true;


end;
//ϳ��������� ������� ���� ��� ������
procedure TForm1.N3Click(Sender: TObject);
begin
 ShowMessage('�����:��������� ����� ���-32 ����������� ����� ������������')
end;


 //���������� ������� ���� �����
procedure TForm1.N4Click(Sender: TObject);
begin
 close;
end;

//ϳ��������� ������ ���� ��������/�������� ����
procedure TForm1.N7Click(Sender: TObject);
 var i,j:integer;
begin
  Memo1.Clear; Memo2.Clear;
   Edit1.Clear;Edit2.Clear;Edit3.Clear;Edit4.Clear;Edit5.Clear;
   Edit6.Clear;Edit7.Clear;Edit8.Clear;Edit9.Clear;
   for i:=0 to StringGrid1.RowCount-1 do
    for j:=0 to 8 do StringGrid1.Cells[j,i]:='';
   for i:=0 to StringGrid2.RowCount-1 do
    for j:=0 to 6 do StringGrid2.Cells[j,i]:='';
   for i:=0 to StringGrid3.RowCount-1 do
    for j:=0 to 5 do StringGrid3.Cells[j,i]:='';
   for i:=0 to StringGrid4.RowCount-1 do
    for j:=0 to 5 do StringGrid4.Cells[j,i]:='';
end;

//ϳ��������� ������ ���� ��������/�������� ����
procedure TForm1.N8Click(Sender: TObject);
begin
 rewrite(f);
 CloseFile(f);
end;

end.




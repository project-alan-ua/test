{
     ��������:
     ���� �������� ����� TAboutBox "� ���������".



     ������� ���������:

     �������       ���� �����������
     ������ �.�.      24.01.2007    - �������� ��������� �� ������.
                                      ������� ������� ������ � ������ �� �������.

}

unit AboutBoxUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    OKButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UtilConst, UnilWin, Dialogs;

{$R *.dfm}

procedure TAboutBox.FormShow(Sender: TObject);
begin
  ProductName.Caption := 'Project.  ������ '+GetFileVersionString(ParamStr(0));
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  Close;
end;

end.


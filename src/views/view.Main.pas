unit view.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite, Vcl.ComCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, MPG.Model.Database, Vcl.StdCtrls,
  Generics.Collections, connection.Interfaces, JvgGroupBox;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    imgIcons: TImageList;
    tvDatabases: TTreeView;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    gbConnection: TJvgGroupBox;
    LabeledEdit1: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DbList: TObjectList<TMPGDatabase>;
    FCon : IConnection;
  public
    procedure LoadList;
    procedure AddDatabase(Name : String);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  repository.database, connection.Factory.Conexao;

{$R *.dfm}

procedure TfrmMain.AddDatabase(Name: String);
var
  node: TTreeNode;
  Repository : TRepositoryDatabase;
  objDB : TMPGDatabase;
begin
  if (name.Trim = '') then exit;

  Repository := TRepositoryDatabase.Create(FCon);
  try
    if not Repository.Exists(Name) then
    begin
      objDB := TMPGDatabase.Create;
      objDB.Name := Name;
      Repository.Insert(objDB);
      DbList.Add(objDB);

      node := tvDatabases.Items.AddObject(nil, name, objDB);
      node.ImageIndex := 1;
      node.SelectedIndex := 1;
      node.StateIndex := 1;
      node.Selected := true;
    end
    else
      ShowMessage('Nome já ultilizado');

  finally
    Repository.Free;
  end;


end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
  node: TTreeNode;
  name: string;

begin
  name := InputBox('Connection Name', 'Enter your connection name', '');
  AddDatabase(name);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  fileName : String;
begin
  fileName :=  ExtractFilePath(ParamStr(0))+'MPG.db';
  DbList := TObjectList<TMPGDatabase>.Create;

  FCon := TFactoryConexao
            .New
            .Connect(cdnSQLite,fileName);

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  DbList.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  LoadList;
end;

procedure TfrmMain.LoadList;
var
  Repository : TRepositoryDatabase;
  obj : TMPGDatabase;
  node : TTreeNode;
begin
  Repository := TRepositoryDatabase.Create(FCon);
  try
    tvDatabases.Items.Clear;
    Repository.List(DbList);
    for obj in DbList do
    begin
      node :=   tvDatabases.Items.AddObject(nil, obj.Name, obj);
       node.ImageIndex := 1;
      node.SelectedIndex := 1;
      node.StateIndex := 1;
      node.Selected := true;
    end;
  finally
    Repository.Free;
  end;
end;

end.


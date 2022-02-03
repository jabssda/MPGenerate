unit view.Config.Connection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, JvPageList,
  JvExControls, Vcl.Mask, JvExMask, JvToolEdit;

type
  TfrmConfigConnection = class(TForm)
    Panel1: TPanel;
    rbMySQL: TRadioButton;
    rbSQLite: TRadioButton;
    Panel2: TPanel;
    pageLIst: TJvPageList;
    pageMySQL: TJvStandardPage;
    pageSQLite: TJvStandardPage;
    edDatabase: TLabeledEdit;
    edServer: TLabeledEdit;
    edPort: TLabeledEdit;
    edUser: TLabeledEdit;
    edPass: TLabeledEdit;
    edDatabaseDir: TJvComboEdit;
    edPassSQlite: TLabeledEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    procedure edDatabaseDirButtonClick(Sender: TObject);
    procedure rbMySQLClick(Sender: TObject);
    procedure rbSQLiteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    function GetDatabase: String;
    procedure SetDataBase(const Value: String);
    function GetServer: String;
    procedure SetServer(const Value: String);
    function GetPort: Integer;
    procedure SetPort(const Value: Integer);
    function GetUsername: string;
    procedure SetName(const Value: string);
    function GetPassword: string;
    procedure SetPassword(const Value: string);
    { Private declarations }
  public
    property DataBase : String read GetDatabase write SetDataBase;
    property Server : String read GetServer write SetServer;
    property Port   : Integer read GetPort write SetPort;
    property Username : string read GetUsername write SetName;
    property Password  : string read GetPassword write SetPassword;
  end;

var
  frmConfigConnection: TfrmConfigConnection;

implementation

{$R *.dfm}

{ TfrmConfigConnection }

procedure TfrmConfigConnection.edDatabaseDirButtonClick(Sender: TObject);
begin
  OpenDialog1.Execute();
  edDatabaseDir.Text := OpenDialog1.FileName;
end;

procedure TfrmConfigConnection.FormCreate(Sender: TObject);
begin
  pageLIst.ActivePage :=  pageMySQL;
end;

function TfrmConfigConnection.GetDatabase: String;
begin
  if rbMySQL.Checked then
    Result := edDatabase.Text
  else
    Result := edDatabaseDir.Text;

end;

function TfrmConfigConnection.GetPassword: string;
begin
  if rbMySQL.Checked then
    Result := edPass.Text
  else
    Result := edPassSQlite.Text ;


end;

function TfrmConfigConnection.GetPort: Integer;
begin
  Result := StrToIntDef(edPort.Text,0);
end;

function TfrmConfigConnection.GetServer: String;
begin
  Result :=  edServer.Text;
end;

function TfrmConfigConnection.GetUsername: string;
begin
  Result :=  edUser.Text;
end;

procedure TfrmConfigConnection.rbMySQLClick(Sender: TObject);
begin
  pageLIst.ActivePage :=  pageMySQL;
end;

procedure TfrmConfigConnection.rbSQLiteClick(Sender: TObject);
begin
  pageLIst.ActivePage :=  pageSQLite;
end;

procedure TfrmConfigConnection.SetDataBase(const Value: String);
begin
  if rbMySQL.Checked then
    edDatabase.Text :=  Value
  else
    edDatabaseDir.Text :=  Value;

end;

procedure TfrmConfigConnection.SetName(const Value: string);
begin
  edUser.Text := Value;
end;

procedure TfrmConfigConnection.SetPassword(const Value: string);
begin
  if rbMySQL.Checked then
    edPass.Text := Value
  else
    edPassSQlite.Text := Value;

end;

procedure TfrmConfigConnection.SetPort(const Value: Integer);
begin
  edPort.Text :=  value.ToString;
end;

procedure TfrmConfigConnection.SetServer(const Value: String);
begin
  edServer.Text :=  Value;
end;

end.

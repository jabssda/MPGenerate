unit MPG.Model.Database;

interface

uses Generics.Collections, MPG.Model.Table, connection.Interfaces,iniFiles ;

type
  TMPGDatabase = class

  private
    FName: string;
    FTable: TMPGTable;
    FConn : IConnection;
    FPort: integer;
    FPassWord: string;
    FUserName: string;
    FServer: string;
    FDataBase: string;
  public
    property Name     : string read FName write FName;
    property DataBase : string  read FDataBase    write FDataBase;
    property Server   : string  read FServer    write FServer;
    property UserName : string  read FUserName  write FUserName;
    property PassWord : string  read FPassWord  write FPassWord;
    property Port     : integer read FPort      write FPort default 0;
    property Table    : TMPGTable read FTable write FTable;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TMPGDatabase }

constructor TMPGDatabase.Create;
begin
  FTable:= TMPGTable.Create;
end;

destructor TMPGDatabase.Destroy;
begin
  FTable.Free;
  inherited;
end;



end.

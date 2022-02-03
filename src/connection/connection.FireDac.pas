unit Connection.FireDac;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client, Connection.Interfaces,
  FireDAC.Phys.SQLite;

type
  TConnectionFireDac = class(TInterfacedObject, IConnection)
  private
    FConnection: TFDConnection;
  public
    function Connect(_Driver: TConnectionDriverName;  _dataBase : String ; _server : String ='';  _userName: string ='';
    _pass: string = ''; _port: integer = 0): IConnection;
    function Connected: Boolean;
    procedure Disconnect;
    function Connection: TCustomConnection;
    constructor Create;
    destructor Destroy; override;
    class function New: IConnection;
  end;

implementation

uses
  System.SysUtils;

{ TConexaoFireDac }

function TConnectionFireDac.Connected: Boolean;
begin
  Result := FConnection.Connected;
end;

function TConnectionFireDac.Connect(_Driver: TConnectionDriverName; _dataBase : String ;
_server : String =''; _userName : string =''; _pass: string = ''; _port: integer = 0): IConnection;
begin
  result := Self;
  FConnection.Params.Clear;
  case _Driver of
    cdnMySQL:
      begin
        FConnection.Params.AddPair('DriverID', 'MySQL');
        FConnection.Params.AddPair('Server', _server);
        if _port > 0 then
          FConnection.Params.AddPair('port', _port.ToString);
        FConnection.Params.AddPair('Database', _dataBase);
        FConnection.Params.AddPair('User_Name', _userName);
        if _pass <> '' then
          FConnection.Params.AddPair('Password', _pass);
      end;
    cdnSQLite:
      begin
        FConnection.Params.AddPair('DriverID', 'SQLite');
        FConnection.Params.AddPair('Database', _dataBase);
      end;
  end;

  FConnection.Connected := true;
end;

function TConnectionFireDac.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

constructor TConnectionFireDac.Create;
begin
  FConnection := TFDConnection.Create(nil);
end;

procedure TConnectionFireDac.Disconnect;
begin
  FConnection.Connected := false;
end;

destructor TConnectionFireDac.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

class function TConnectionFireDac.New: IConnection;
begin
  Result := TConnectionFireDac.Create;
end;

end.


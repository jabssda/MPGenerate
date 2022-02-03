unit Utils.Database;

interface

uses
  SYsUtils;

const
  DB_NAME: string = 'MPG.db';

type
  TUtilDatabase = class
  public
    class function dbExists: boolean;
    class function CreateDB: Boolean;
  end;

implementation

uses
  connection.Interfaces, connection.Factory.Conexao, connection.Factory.Query;

{ TUtilDatabase }

class function TUtilDatabase.CreateDB: Boolean;
var
  con: IConnection;
  qry :IQuery;
  Filename : String;
  SB : TStringBuilder;
begin

  fileName := ExtractFilePath(ParamStr(0)) + DB_NAME;

  if not TUtilDatabase.dbExists then
  begin
    con := TFactoryConexao.New.Connect(cdnSQLite,Filename );
    qry := TFactoryQuery.Query(con);
    SB := TStringBuilder.Create;
    try
      sb.Append('CREATE TABLE "databases" (');
      sb.Append('"name"  TEXT(20) NOT NULL,');
      sb.Append('"database"  TEXT(30),');
      sb.Append('"serverName"  TEXT(80),');
      sb.Append('"userName"  TEXT(20),');
      sb.Append('"Password"  TEXT(50),');
      sb.Append('"port"  INTEGER,');
      sb.Append('PRIMARY KEY ("name"));');

      qry.Close;
      qry.AddSQL(sb.ToString);
      qry.ExecSQL;

    finally
      SB.Free;
    end;
  end;

end;

class function TUtilDatabase.dbExists: boolean;
var
  fileName: string;
begin
  fileName := ExtractFilePath(ParamStr(0)) + DB_NAME;
  Result := FileExists(fileName);
end;

end.


unit repository.base;

interface

uses
  connection.Interfaces;

type
  TRepositoryBase = class
  private
    FConn: IConnection;
    FQ  : IQuery;
  public
  property qrySQl : IQuery read FQ;
  function getConn : IConnection;
  function CreateNewQuery : IQuery;
  constructor Create(aConn: IConnection);
  end;

implementation

uses
  connection.Factory.Query;

{ TRepositoryBase }

constructor TRepositoryBase.Create(aConn: IConnection);
begin
  FConn := aConn;
  FQ := TFactoryQuery.Query(FConn);
end;

function TRepositoryBase.CreateNewQuery: IQuery;
begin
  Result := TFactoryQuery.Query(FConn);
end;

function TRepositoryBase.getConn: IConnection;
begin
  Result := FConn;
end;

end.


unit Connection.Factory.Query;

interface

uses Connection.Interfaces, Connection.FireDac,   Connection.Query.FireDac ;

type
  TFactoryQuery =class

  private

  public

  class function Query(aConnection: IConnection) : IQuery;

  end;

implementation

{ TFactoryQuery }

class function TFactoryQuery.Query(aConnection: IConnection): IQuery;


begin
  Result := TConnectionQueryFireDac.New(aConnection);
end;

end.

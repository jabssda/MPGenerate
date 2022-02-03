unit Connection.Query.FireDac;

interface
uses
  Connection.Interfaces, FireDAC.Comp.Client, Data.DB,
   System.Classes,FireDAC.Stan.Param,FireDAC.DApt;

type
  TConnectionQueryFireDac = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
    FConnection: IConnection;
    FUpdateTableName : String;
    function getSQL : TStrings;
    procedure SetSQl(Value : TStrings);

    function GetField(Index: Integer): TField;
   procedure SetField(Index: Integer; Value: TField);
    function GetParam(Index: Integer): TFDParam;
    procedure SetParam(Index: Integer; Value: TFDParam);
  public

    property Fields[Index: Integer]: TField read GetField write SetField; default;
    property Params[Index: Integer]: TFDParam read GetParam write SetParam;

    property SQL : TStrings read getSQL write setSQL;
    function GetUpdateTableName: string;
    procedure SetUpdateTableName( Value: string);
    procedure Open; overload;
    procedure Open(aSQL: string); overload;
    function AddSQL(aSQL: string): IQuery;
    function ParamByName(aFieldName : String): TFDParam;
    function IsEmpty : Boolean;
    function FieldByName(aFieldName : String): TField;
    function  InsertMySQLReturnID : Integer;
    procedure ExecSQL;
    procedure Next;
    procedure Last;
    procedure First;
    procedure Prior;
    function RecordCount : Integer;
    function EOF : Boolean;
    function  Close: IQuery;
    function ClearSQL : IQuery;
    function DataSet: TDataSet;
    constructor Create(aConexao: IConnection);
    destructor Destroy; override;
    class function New(aConnection: IConnection): TConnectionQueryFireDac;
  end;

implementation

uses
  System.SysUtils;

{ TConexaoQueryUnidac }

function TConnectionQueryFireDac.AddSQL(aSQL: string): IQuery;
begin
  Result := Self;
  FQuery.SQL.Add(aSQL);
end;

function TConnectionQueryFireDac.ClearSQL: IQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

function TConnectionQueryFireDac.Close: IQuery;
begin
  Result := Self;
  FQuery.Close;
end;

constructor TConnectionQueryFireDac.Create(aConexao: IConnection);
begin
  FQuery            :=  TFDQuery.Create(nil);
  FConnection          :=  aConexao;
  FQuery.Connection :=  TFDConnection(FConnection.Connection);

end;

function TConnectionQueryFireDac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TConnectionQueryFireDac.Destroy;
begin
  freeAndNil(FQuery);
  inherited;
end;

function TConnectionQueryFireDac.EOF: Boolean;
begin
  Result := FQuery.Eof;
end;

procedure TConnectionQueryFireDac.ExecSQL;
begin
  FQuery.ExecSQL;
end;



function TConnectionQueryFireDac.FieldByName(aFieldName: String): TField;
begin
  Result :=  FQuery.FieldByName(aFieldName);
end;

procedure TConnectionQueryFireDac.First;
begin
  FQuery.First;
end;

function TConnectionQueryFireDac.GetField(Index: Integer): TField;
begin
  Result := FQuery.Fields[Index];
end;

function TConnectionQueryFireDac.GetParam(Index: Integer): TFDParam;
begin
  Result := TFDParam(FQuery.Params[index]);
end;

function TConnectionQueryFireDac.getSQL: TStrings;
begin
  Result :=  FQuery.SQL;
end;

function TConnectionQueryFireDac.GetUpdateTableName: string;
begin
  Result := FUpdateTableName;
end;

function TConnectionQueryFireDac.InsertMySQLReturnID: Integer;
begin
  ExecSQL;
  Close;
  Open('SELECT LAST_INSERT_ID()');
  Result :=     Fields[0].AsInteger;
end;

function TConnectionQueryFireDac.IsEmpty: Boolean;
begin
  Result :=  FQuery.IsEmpty;
end;

procedure TConnectionQueryFireDac.Last;
begin
  FQuery.Last;
end;

class function TConnectionQueryFireDac.New(aConnection: IConnection): TConnectionQueryFireDac;
begin
  Result := Self.Create(aConnection);
end;

procedure TConnectionQueryFireDac.Next;
begin
  FQuery.Next;
end;

procedure TConnectionQueryFireDac.Open;
begin
  FQuery.Close;
  FQuery.Open;
end;

procedure TConnectionQueryFireDac.Open(aSQL: string);
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  FQuery.Open;
end;

function TConnectionQueryFireDac.ParamByName(aFieldName: String): TFDParam;
begin
  Result := TFDParam(FQuery.ParamByName(aFieldName));
end;


procedure TConnectionQueryFireDac.Prior;
begin
  FQuery.Prior;
end;

function TConnectionQueryFireDac.RecordCount: Integer;
begin
  result := FQuery.RecordCount;
end;

procedure TConnectionQueryFireDac.SetField(Index: Integer; Value: TField);
begin
  FQuery.Fields[Index] := Value;
end;

procedure TConnectionQueryFireDac.SetParam(Index: Integer;
   Value: TFDParam);
begin
  FQuery.Params[Index] := TFDParam(value);
end;

procedure TConnectionQueryFireDac.SetSQl(Value: TStrings);
begin
  FQuery.SQL := Value;
end;

procedure TConnectionQueryFireDac.SetUpdateTableName(Value: string);
begin
  FUpdateTableName := Value;
end;



end.

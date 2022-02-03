unit connection.Interfaces;

interface

uses
  Data.DB,classes,FireDAC.Stan.Param ;

type
  TConnectionDriverName = (cdnMySQL,cdnSQLite);
  IConnection = interface
    ['{E15AB6F4-9122-4BC6-A714-2136B0F4F156}']

    function Connect(_Driver : TConnectionDriverName; _dataBase : String ; _server : String =''; _userName : string =''; _pass : String=''; _port : integer =0) : IConnection;
    function Connected: Boolean;
    procedure Disconnect;
    function Connection: TCustomConnection;
  end;

  IQuery = interface
    ['{B0AF0BAC-AB2C-4458-8DE5-EE1382CC8514}']

   function getSQL : TStrings;
   procedure SetSQl(Value : TStrings);
   procedure Open;overload;
   procedure Open(aSQL : string);overload;
   function DataSet : TDataSet;
   function AddSQL(aSQL : String) : IQuery;
   procedure ExecSQL;
   function  Close: IQuery;
   function ClearSQL : IQuery;
   function  InsertMySQLReturnID : Integer;
   function GetField(Index: Integer): TField;
   procedure SetField(Index: Integer; Value: TField);
   function GetUpdateTableName: string;
   procedure SetUpdateTableName( Value: string);
   function GetParam(Index: Integer): TFDParam;
   procedure SetParam(Index: Integer; Value: TFDParam);
   function IsEmpty : Boolean;
   function FieldByName(aFieldName : String): TField;
   function ParamByName(aParamName : String) : TFDParam;
   procedure Next;
   procedure Last;
   procedure First;
   procedure Prior;
   function RecordCount : Integer;
   function EOF : Boolean;
   property SQL : TStrings read getSQL write setSQL;
   property Fields[Index: Integer]: TField read GetField write SetField;
   property Params[Index: Integer]: TFDParam read GetParam write SetParam;
   property UpdateTableName : string read GetUpdateTableName write SetUpdateTableName;
  end;



implementation

end.


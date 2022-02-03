unit MPG.Model.Field;

interface

uses Data.DB;

type
  TMPGField = class
  private
    FName: string;
    FFieldType: TFieldType;
    FKey: Boolean;
  public
    property Name : string read FName write FName;
    property Key  : Boolean read FKey write FKey;
    property FieldType : TFieldType read FFieldType;


  end;

implementation

end.

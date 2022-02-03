unit MPG.Model.Table;

interface

uses Generics.Collections, MPG.Model.Field;

type
  TMPGTable = class
  private
    FName: string;
    FFields: TObjectList<TMPGField>;
  public

    property Name : string read FName write FName;
    property Fields : TObjectList<TMPGField> read FFields;
    constructor Create;
   destructor Destroy; override;
  end;

implementation

{ TMPGTable }

constructor TMPGTable.Create;
begin
  FFields:= TObjectList<TMPGField>.Create;
end;

destructor TMPGTable.Destroy;
begin
  FFields.Clear;
  FFields.Free;
  inherited;
end;

end.

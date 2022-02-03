unit repository.database;

interface

uses
  repository.base, Generics.Collections, MPG.Model.Database, SysUtils,StrUtils;

type
  TRepositoryDatabase = class(TRepositoryBase)
  private
  public
    procedure List(aList : TObjectList<TMPGDatabase>) ;
    procedure Insert(obj : TMPGDatabase );
    procedure Update(obj : TMPGDatabase );
    procedure Delete(obj : TMPGDatabase  );
    function Exists (aName : String) : Boolean;
    function Get(aName : String ) : TMPGDatabase;

  end;

implementation

{ TRepositoryDatabase }

procedure TRepositoryDatabase.Update(obj: TMPGDatabase);
begin
  try
    qrySQl.Close;
    qrySQl.SQL.Clear;
    qrySQl.SQL.Add('UPDATE databases SET');
    qrySQl.SQL.Add('name= :name,');
    qrySQl.SQL.Add('database = :database,');
    qrySQl.SQL.Add('serverName = :serverName,');
    qrySQl.SQL.Add('userName = :userName,');
    qrySQl.SQL.Add('Password = :Password,');
    qrySQl.SQL.Add('port =:port');
    qrySQl.SQL.Add('where name = '+ obj.Name.QuotedString);
    qrySQl.ParamByName('name').AsString :=  obj.Name;
    qrySQl.ParamByName('database').AsString :=  obj.DataBase;
    qrySQl.ParamByName('serverName').AsString :=  obj.Server;
    qrySQl.ParamByName('userName').AsString :=  obj.UserName;
    qrySQl.ParamByName('Password').AsString :=  obj.Password;
    qrySQl.ParamByName('port').AsInteger :=  obj.Port;
    qrySQl.ExecSQL;
  except
    on e : Exception do
    begin
      raise Exception.Create('Insert-> '+ e.Message );
    end;
  end;
end;

{ TRepositoryDatabase }

procedure TRepositoryDatabase.Delete(obj : TMPGDatabase );
begin
  try
    qrySQl.Close;
    qrySQl.SQL.Clear;
    qrySQl.SQL.Add('Delete from databases ');
    qrySQl.SQL.Add('where name='+obj.Name.QuotedString);
    qrySQl.ExecSQL;

  except
    on e : Exception do
    begin
      raise Exception.Create('Delete-> '+ e.Message );
    end;
  end;

end;



function TRepositoryDatabase.Exists(aName: String): Boolean;
begin
  qrySQl.Close;
  qrySQl.SQL.Clear;
  qrySQl.SQL.Add('Select name from databases ');
  qrySQl.SQL.Add('where name=' + aName.QuotedString);
  qrySQl.Open;

  Result := not qrySQl.IsEmpty;

end;

function TRepositoryDatabase.Get(aName: String): TMPGDatabase;
var
  obj           :  TMPGDatabase;
begin
  Result := nil;
  try
    qrySQl.Close;
    qrySQl.SQL.Clear;
    qrySQl.SQL.Add('Select * from databases ');
    qrySQl.SQL.Add('where name='+obj.Name.QuotedString);
    qrySQl.Open;

    if not qrySQl.IsEmpty then
    begin
      obj           :=  TMPGDatabase.Create;
      obj.Name      :=  qrySQl.FieldByName('name').AsString;
      obj.DataBase  :=  qrySQl.FieldByName('database').AsString;
      obj.Server    :=  qrySQl.FieldByName('serverName').AsString;
      obj.UserName  :=  qrySQl.FieldByName('UserName').AsString;
      obj.PassWord  :=  qrySQl.FieldByName('PassWord').AsString;
      Result := obj;
    end;
  except
    on e : Exception do
    begin
      raise Exception.Create('List-> '+  e.Message );
    end;
  end;

end;

procedure TRepositoryDatabase.Insert(obj: TMPGDatabase);
begin
  try
    qrySQl.Close;
    qrySQl.SQL.Clear;
    qrySQl.SQL.Add('Insert into databases ');
    qrySQl.SQL.Add('(name, database, serverName,');
    qrySQl.SQL.Add(' userName, Password, port)');
    qrySQl.SQL.Add(' values');
    qrySQl.SQL.Add('(:name, :database, :serverName,');
    qrySQl.SQL.Add(' :userName, :Password, :port)');
    qrySQl.ParamByName('name').AsString :=  obj.Name;
    qrySQl.ParamByName('database').AsString :=  obj.DataBase;
    qrySQl.ParamByName('serverName').AsString :=  obj.Server;
    qrySQl.ParamByName('userName').AsString :=  obj.UserName;
    qrySQl.ParamByName('Password').AsString :=  obj.Password;
    qrySQl.ParamByName('port').AsInteger :=  obj.Port;
    qrySQl.ExecSQL;



  except
    on e : Exception do
    begin
      raise Exception.Create('Insert-> '+ e.Message );
    end;
  end;


end;

procedure TRepositoryDatabase.List(aList : TObjectList<TMPGDatabase>) ;
var

  obj : TMPGDatabase;
begin
  aList.Clear;
  try
    qrySQl.Close;
    qrySQl.SQL.Clear;
    qrySQl.SQL.Add('Select * from databases order by name ');
    qrySQl.Open;

    while not qrySQl.EOF  do
    begin
      obj           :=  TMPGDatabase.Create;
      obj.Name      :=  qrySQl.FieldByName('name').AsString;
      obj.DataBase  :=  qrySQl.FieldByName('database').AsString;
      obj.Server    :=  qrySQl.FieldByName('serverName').AsString;
      obj.UserName  :=  qrySQl.FieldByName('UserName').AsString;
      obj.PassWord  :=  qrySQl.FieldByName('PassWord').AsString;
      aList.Add(obj);
      qrySQl.Next;
    end;
  except
    on e : Exception do
    begin
      raise Exception.Create('List-> '+  e.Message );
    end;
  end;

end;

end.


unit Connection.Factory.Conexao;

interface

uses Connection.Interfaces,  Connection.FireDac;

type

  TFactoryConexao = class
  private

  public
   constructor Create();
    class function New() : IConnection;
  end;

implementation

uses
  System.SysUtils;

{ TFactoryConexao }

constructor TFactoryConexao.Create();

begin

   raise Exception.Create('Método inválido use o New');

end;



class function TFactoryConexao.New(): IConnection;
begin
  Result :=  TConnectionFireDac.New;

end;

end.

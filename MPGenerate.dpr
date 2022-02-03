program MPGenerate;

uses
  Vcl.Forms,
  view.Main in 'src\views\view.Main.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  MPG.Model.Database in 'src\models\MPG.Model.Database.pas',
  MPG.Model.Table in 'src\models\MPG.Model.Table.pas',
  MPG.Model.Field in 'src\models\MPG.Model.Field.pas',
  connection.Interfaces in 'src\connection\connection.Interfaces.pas',
  connection.FireDac in 'src\connection\connection.FireDac.pas',
  connection.Factory.Conexao in 'src\connection\connection.Factory.Conexao.pas',
  connection.Query.FireDac in 'src\connection\connection.Query.FireDac.pas',
  connection.Factory.Query in 'src\connection\connection.Factory.Query.pas',
  controller.MPG in 'src\controllers\controller.MPG.pas',
  Utils.Database in 'src\utils\Utils.Database.pas',
  repository.database in 'src\repositories\repository.database.pas',
  repository.base in 'src\repositories\repository.base.pas',
  view.Config.Connection in 'src\views\view.Config.Connection.pas' {frmConfigConnection};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Waikawa Light');

  if not TUtilDatabase.dbExists then TUtilDatabase.CreateDB;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

program CalcOld;

uses
  System.StartUpCopy,
  FMX.Forms,
  CalcOld.Main in 'CalcOld.Main.pas' {FormMain},
  FMX.StyleChanger in '..\Source\FMX.StyleChanger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

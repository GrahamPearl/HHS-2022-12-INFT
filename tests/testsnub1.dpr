program testsnub1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  oop in '..\app\oop.pas';

VAR aReport : TReport;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    aReport := TReport.Create('12345',25);

    WriteLN('Loading');
    WriteLN(aReport.display);
    WriteLN('Passsed: ', aReport.isPassed);
    WriteLN(' Symbol: ', aReport.calcSymbol);
    WriteLN('Closing');
     ReadLN;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

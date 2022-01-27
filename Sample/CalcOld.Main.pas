unit CalcOld.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.TabControl,
  FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Filter.Effects;

type
  TFormMain = class(TForm)
    StyleBookDark: TStyleBook;
    Panel1: TPanel;
    Layout1: TLayout;
    EditResult: TEdit;
    GridPanelLayout1: TGridPanelLayout;
    ButtonCalcC: TButton;
    ButtonCalcDiv: TButton;
    ButtonCalcMul: TButton;
    ButtonCalc7: TButton;
    ButtonCalc8: TButton;
    ButtonCalc9: TButton;
    ButtonCalcMinus: TButton;
    ButtonCalc4: TButton;
    ButtonCalc5: TButton;
    ButtonCalc6: TButton;
    ButtonCalcPlus: TButton;
    ButtonCalc1: TButton;
    ButtonCalc2: TButton;
    ButtonCalc3: TButton;
    ButtonCalc0: TButton;
    ButtonCalc00: TButton;
    ButtonCalcDelim: TButton;
    ButtonCalcRes: TButton;
    StyleBookWhite: TStyleBook;
    Label1: TLabel;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label1Click(Sender: TObject);
  end;

var
  FormMain: TFormMain;


implementation

uses
  FMX.StyleChanger;

{$R *.fmx}

procedure TFormMain.Label1Click(Sender: TObject);
type
  EffectClass = TBlurTransitionEffect;
begin
  if StyleBook = StyleBookDark then
  begin
    Label1.Text := '🌙';
    TStyleExt.Change<EffectClass>(Self, StyleBookWhite,
      function(Effect: EffectClass): TBitmap
      begin
        Result := Effect.Target;
        Effect.Progress := 0;
      end);
  end
  else
  begin
    Label1.Text := '☀';
    TStyleExt.Change<EffectClass>(Self, StyleBookDark,
      function(Effect: EffectClass): TBitmap
      begin
        Result := Effect.Target;
        Effect.Progress := 0;
      end);
  end;
end;

procedure TFormMain.Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  StartWindowDrag;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.


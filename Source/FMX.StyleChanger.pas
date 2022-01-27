unit FMX.StyleChanger;

interface

uses
  FMX.Ani, FMX.Filter.Effects, FMX.Forms, FMX.Controls, FMX.Graphics, FMX.Types,
  System.SysUtils;

{
// ������ ������������� (������)
TStyleExt.Change<EffectClass>(Self, StyleBookWhite,
  function(Effect: EffectClass): TBitmap
  begin
    Result := Effect.Target;
    Effect.Progress := 0;
  end);
}

type
  TStyleExt = class
    /// <summary>
    /// ����� ��� ����� ����� ������ � ���������.
    /// �������� Setting - �������, ������� ������ ������� ������ �� �������� � �������
    /// � ����� �������������� ��� ��������������� ��������� �������
    /// </summary>
    class procedure Change<T: TImageFXEffect>(Form: TForm; NewStyle: TStyleBook; Setting: TFunc<T, TBitmap>; Duration: Integer = -1);
  end;

implementation

uses
  FMX.Objects;

class procedure TStyleExt.Change<T>(Form: TForm; NewStyle: TStyleBook; Setting: TFunc<T, TBitmap>; Duration: Integer);
var
  Image: TImage;
  Target: TBitmap;
  TransEffect: T;
begin
  Image := TImage.Create(nil);
  try
    Image.Visible := False;
    Image.Parent := Form;
    Image.Align := TAlignLayout.Contents;

    TransEffect := T.Create(Image);
    TransEffect.Enabled := False;
    TransEffect.Parent := Image;

    Image.Bitmap.SetSize(Form.ClientWidth, Form.ClientHeight);
    Form.PaintTo(Image.Bitmap.Canvas);

    Form.StyleBook := NewStyle;

    Target := Setting(TransEffect);

    Target.SetSize(Form.ClientWidth, Form.ClientHeight);
    Form.PaintTo(Target.Canvas);
    Image.Visible := True;

    TransEffect.Enabled := True;
    if Duration >= 0 then
      TAnimator.AnimateFloatWait(TransEffect, 'Progress', 100, Duration)
    else
      TAnimator.AnimateFloatWait(TransEffect, 'Progress', 100);
  finally
    Image.Free;
  end;
end;

end.


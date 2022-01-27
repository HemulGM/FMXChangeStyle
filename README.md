# FMXChangeStyle
 FMX style change with use default effects (Transition effects, like TBlurTransitionEffect, TFadeTransitionEffect, ...)

```Pascal

type
  EffectClass = TBlurTransitionEffect;

TStyleExt.Change<EffectClass>(Self, StyleBookDark,
   function(Effect: EffectClass): TBitmap
   begin
     Result := Effect.Target;
     Effect.Progress := 0;
   end);
```

![Ani](https://github.com/HemulGM/FMXChangeStyle/blob/main/Media/screen1.gif)


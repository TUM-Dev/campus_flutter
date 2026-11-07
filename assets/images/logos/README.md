The Open Source @ TUM logo is sourced from the association's official website:
https://www.tum.dev/ (retrieved 2026-11-07).

`open-source-tum-white.svg` is a reversed version of the official artwork, with
white silhouettes and TUM blue lettering for the blue native launch screens.

The shared 200 × 80 point/dp footer includes “For Students, From Students”.
Regenerate the iOS and Android footer PNGs and Android 12 icon from the repository
root with:

```sh
flutter test tool/generate_splash_assets.dart
```

The generator uses Arial from macOS by default. On other hosts, set
`SPLASH_FONT_PATH` to an Arial TTF file. The Android center logo is a 720 × 379
copy of `ios/Runner/Assets.xcassets/LaunchImage.imageset/logo-white.png`.

iOS positions the footer 24 points above the safe area bottom. Android 11 and
earlier use a 24dp bottom inset; Android 12+ positions the same footer in the
system's branding slot. Its center TUM logo fits within the system icon safe area.

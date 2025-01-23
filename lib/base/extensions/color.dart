import 'dart:ui';

extension IntColorComponents on Color {
  int get intValue {
    return _floatToInt8(a) << 24 |
        _floatToInt8(r) << 16 |
        _floatToInt8(g) << 8 |
        _floatToInt8(b) << 0;
  }

  int get intAlpha => _floatToInt8(a);
  int get intRed => _floatToInt8(r);
  int get intGreen => _floatToInt8(g);
  int get intBlue => _floatToInt8(b);

  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}

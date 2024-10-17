import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalTheme {
  static Colors colors = const Colors();
}

class Colors {
  const Colors();
  Color get primaryColor => const Color.fromRGBO(224, 245, 115, 1);
  Color get secondaryColor => const Color.fromRGBO(64, 64, 64, 1);

  Color get textColor => const Color.fromRGBO(220, 220, 220, 1);

  Color get backgroundColor => const Color.fromRGBO(25, 23, 23, 1);

  Color get successColor => const Color.fromRGBO(45, 158, 43, 1);
  Color get warningColor => const Color.fromRGBO(189, 182, 28, 1);
  Color get errorColor => const Color.fromRGBO(158, 43, 43, 1);
}

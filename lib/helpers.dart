import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class Helpers {
  static Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}

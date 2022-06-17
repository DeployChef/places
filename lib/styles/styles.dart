import 'package:flutter/widgets.dart';
import 'package:places/styles/color_constants.dart';

class AppTypography {
  static const textLargeTitle32 = TextStyle(
  fontSize: 32.0,
  height: 1.125,
  fontWeight: FontWeight.w700,
);

static const textTitle24 = TextStyle(
  fontSize: 24.0,
  height: 1.2,
  fontWeight: FontWeight.w700,
);

static const textSubtitle18 = TextStyle(
  fontSize: 18.0,
  height: 1.33,
  fontWeight: FontWeight.w500,
);

static const textText16 = TextStyle(
  fontSize: 16.0,
  height: 1.25,
  fontWeight: FontWeight.w500,
);

static const textSmall14 = TextStyle(
  fontSize: 14.0,
  height: 1.29,
  fontWeight: FontWeight.w400,
);

static final textSmall14Bold = textSmall14.copyWith(
  fontWeight: FontWeight.w700,
);

static final textButton = textSmall14Bold.copyWith(
  letterSpacing: 0.3,
);
}

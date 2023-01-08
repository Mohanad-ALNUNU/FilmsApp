import 'dart:math';

import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, int stringLength, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;



    double val = (width/ stringLength) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
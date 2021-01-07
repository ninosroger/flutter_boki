import 'package:flutter/material.dart';

class Styles {
  static const linearGradientYellowToRedForLight = LinearGradient(
    colors: [Color(0xFFFBB663), Color(0xFFFB6463)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const linearGradientYellowToRedForDrak = LinearGradient(
    colors: [Color(0xFFB8741A), Color(0xFFD14B64)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static BorderRadius borderRadius = BorderRadius.circular(14);
}

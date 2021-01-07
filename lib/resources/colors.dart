import 'package:flutter/material.dart';

class ThemeColors {
  Color background = Color(0xFFF5F5F5);
  Color red = Color(0xFFFB6463);
  Color transparent = Color(0x00000000);
  Color yellow = Color(0xFFFBB663);
  Color white = Color(0xFFFFFFFF);
  Color black = Color(0xFF333333);
  Color lightGreen = Color(0xFF93D047);
  Color gray = Color(0xFFC0C3D0);
  Color lightGray = Color(0xFFF3EBEC);
}

///亮色模式主题色
ThemeColors lightColors() => ThemeColors()
  ..background = Color(0xFFF5F5F5)
  ..red = Color(0xFFFB6463)
  ..transparent = Color(0x00000000)
  ..yellow = Color(0xFFFBB663)
  ..white = Color(0xFFFFFFFF)
  ..black = Color(0xFF333333)
  ..lightGreen = Color(0xFF93D047)
  ..gray = Color(0xFFC0C3D0)
  ..lightGray = Color(0xFFF3EBEC);

///暗色模式主题色
ThemeColors darkColors() => ThemeColors()
  ..background = Color(0xFF071724)
  ..red = Color(0xFFD14B64)
  ..transparent = Color(0x00000000)
  ..yellow = Color(0xFFB8741A)
  ..white = Color(0xFFFFFFFF)
  ..black = Color(0xFFCED3E9)
  ..lightGreen = Color(0xFF00998F)
  ..gray = Color(0xFFC0C3D0)
  ..lightGray = Color(0xFFF3EBEC);

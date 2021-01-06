import 'package:flutter_boki/common/global_field.dart';
import 'package:flutter_boki/common/parameter.dart';
import 'package:flutter_boki/resources/colors.dart';

///获取主题名称
String getThemeName() =>
    GlobalField.prefs.getString(Parameters.prefsThemeName) ?? "light";

///获取主题色对象
ThemeColors getThemeColorsForName(String themeName) {
  ThemeColors themeColors;
  switch (themeName) {
    case 'light':
      themeColors = lightColors();
      break;
    case 'dark':
      themeColors = darkColors();
      break;
  }
  return themeColors;
}

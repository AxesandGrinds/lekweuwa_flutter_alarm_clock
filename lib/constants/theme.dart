import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

MaterialColor defcolor = MaterialColor(0xffF5F5F5, color);


class ThemeColors {
  
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = Color(0xFF2D2F41);
  static Color menuBackgroundColor = Color(0xFF242634);

  static Color clockBG = Color(0xFF444974);
  static Color clockOutline = Color(0xFFEAECFF);
  static Color secHandColor = Colors.orange[300];
  static Color minHandStatColor = Color(0xFF748EF6);
  static Color minHandEndColor = Color(0xFF77DDFF);
  static Color hourHandStatColor = Color(0xFFC279FB);
  static Color hourHandEndColor = Color(0xFFEA74AB);
  
}

class GradientThemeColors {
  
  final List<Color> colors;
  
  GradientThemeColors(this.colors);

  static List<Color> sunrise = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> blue = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> lightBlue = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> pink = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
  
}

class GradientThemeTemplate {
  
  static List<GradientThemeColors> gradientTemplate = [

    GradientThemeColors(GradientThemeColors.sunrise),
    GradientThemeColors(GradientThemeColors.sunset),
    GradientThemeColors(GradientThemeColors.blue),
    GradientThemeColors(GradientThemeColors.lightBlue),
    GradientThemeColors(GradientThemeColors.pink),
    
  ];
  
}

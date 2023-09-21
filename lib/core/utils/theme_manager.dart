import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'values_manager.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(255, 0, 100, .1),
  100: Color.fromRGBO(255, 0, 100, .2),
  200: Color.fromRGBO(255, 0, 100, .3),
  300: Color.fromRGBO(255, 0, 100, .4),
  400: Color.fromRGBO(255, 0, 100, .5),
  500: Color.fromRGBO(255, 0, 100, .6),
  600: Color.fromRGBO(255, 0, 100, .7),
  700: Color.fromRGBO(255, 0, 100, .8),
  800: Color.fromRGBO(255, 0, 100, .9),
  900: Color.fromRGBO(255, 0, 100, 1),
};

class ThemeManager {
  static var myTheme = ThemeData(
      fontFamily: 'Somar',
      dividerColor: ColorManager.white,
      primarySwatch: MaterialColor(ColorManager.primaryColor.value, color),
      primaryColor: ColorManager.primaryColor,
      iconTheme: const IconThemeData(
        color: ColorManager.primaryColor,
      ),
      primaryColorLight: ColorManager.primaryColor,
      primaryIconTheme: const IconThemeData(color: ColorManager.primaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.white,
        centerTitle: true,
       elevation: 0.0
      ),
      scaffoldBackgroundColor: ColorManager.white);
}

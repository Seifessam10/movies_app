

import 'package:flutter/material.dart';
import 'package:movies_app/core/colors_manger.dart';

class AppTheme{

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorsManger.black,
    indicatorColor: ColorsManger.yellow,
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      backgroundColor: ColorsManger.lightBlack,
      selectedItemColor: ColorsManger.yellow,
      unselectedItemColor: ColorsManger.lightGrey
    )
  );
}
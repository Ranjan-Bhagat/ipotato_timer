import 'package:flutter/material.dart';

class IPotatoThemes {

  //This not allow to create instance of this class
  IPotatoThemes._();

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static final dark = light.copyWith(
    brightness: Brightness.dark,
  );

}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IPotatoThemes {
  //This not allow to create instance of this class
  IPotatoThemes._();

  static const white = Color(0xFFFFFFFF);
  static const lightBlack = Color(0xFF191C1E);

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF006782),
      onPrimary: white,
      primaryContainer: Color(0xFFB6EAFF),
      onPrimaryContainer: Color(0xFF001F2A),
      secondary: Color(0xFF216C2E),
      onSecondary: white,
      secondaryContainer: Color(0xFFA7F5A7),
      onSecondaryContainer: Color(0xFF002106),
      tertiary: Color(0xFF5B5B7D),
      onTertiary: white,
      tertiaryContainer: Color(0xFFE1DFFF),
      onTertiaryContainer: Color(0xFF181837),
      error: Color(0xFFBA1B1B),
      onError: white,
      errorContainer: Color(0xFFFFDAD4),
      onErrorContainer: Color(0xFF410001),
      background: Color(0xFFFBFCFE),
      onBackground: lightBlack,
      surface: Color(0xFFFBFCFE),
      onSurface: lightBlack,
      surfaceVariant: Color(0xFFDCE4E8),
      onSurfaceVariant: Color(0xFF40484C),
      outline: Color(0XFF70787D),
    ),
    fontFamily: GoogleFonts.roboto().fontFamily,
    textTheme: const TextTheme(
      //Display
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 57,
        height: 1.12,
        letterSpacing: -0.25,
        color: lightBlack,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 45,
        height: 1.16,
        color: lightBlack,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 36,
        height: 1.22,
        color: lightBlack,
      ),

      //headline
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 32,
        height: 1.25,
        color: lightBlack,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1.29,
        color: lightBlack,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1.33,
        color: lightBlack,
      ),

      //Title
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        height: 1.27,
        color: lightBlack,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.1,
        color: lightBlack,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        color: lightBlack,
      ),

      //Label
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        color: lightBlack,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.5,
        color: lightBlack,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 1.45,
        letterSpacing: 0.5,
        color: lightBlack,
      ),

      ///Body
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.5,
        color: lightBlack,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.25,
        color: lightBlack,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.4,
        color: lightBlack,
      ),
    ),
  );

  static final dark = light.copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF5FD4FD),
      onPrimary: Color(0xFF003545),
      primaryContainer: Color(0xFF004D62),
      onPrimaryContainer: Color(0xFFB6EAFF),
      secondary: Color(0xFF8BD88D),
      onSecondary: Color(0xFF00390C),
      secondaryContainer: Color(0xFF005319),
      onSecondaryContainer: Color(0xFFA7F5A7),
      tertiary: Color(0xFFC4C3EA),
      onTertiary: Color(0xFF2D2D4D),
      tertiaryContainer: Color(0xFF444465),
      onTertiaryContainer: Color(0xFFE1DFFF),
      error: Color(0xFFFFB4A9),
      onError: Color(0xFF680003),
      errorContainer: Color(0xFF930006),
      onErrorContainer: Color(0xFFFFDAD4),
      background: lightBlack,
      onBackground: Color(0xFFE1E3E5),
      surface: Color(0xFFFBFCFE),
      onSurface: lightBlack,
      surfaceVariant: Color(0xFFE1E3E5),
      onSurfaceVariant: Color(0xFFC0C8CC),
      outline: Color(0XFF8A9296),
    ),
  );
}

extension IPotatoThemesExtension on BuildContext {

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ///Color getter
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;
  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => Theme.of(this).colorScheme.onTertiaryContainer;
  Color get error => Theme.of(this).colorScheme.error;
  Color get onError => Theme.of(this).colorScheme.onError;
  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;
  Color get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;
  Color get background => Theme.of(this).colorScheme.background;
  Color get onBackground => Theme.of(this).colorScheme.onBackground;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get surfaceVariant => Theme.of(this).colorScheme.surfaceVariant;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get outline => Theme.of(this).colorScheme.outline;

  //TextStyle Getters
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

}

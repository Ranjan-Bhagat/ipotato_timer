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


  ///Color getter
  static Color get primary => light.colorScheme.primary;
  static Color get onPrimary => light.colorScheme.onPrimary;
  static Color get primaryContainer => light.colorScheme.primaryContainer;
  static Color get onPrimaryContainer => light.colorScheme.onPrimaryContainer;
  static Color get secondary => light.colorScheme.secondary;
  static Color get onSecondary => light.colorScheme.onSecondary;
  static Color get secondaryContainer => light.colorScheme.secondaryContainer;
  static Color get onSecondaryContainer => light.colorScheme.onSecondaryContainer;
  static Color get tertiary => light.colorScheme.tertiary;
  static Color get onTertiary => light.colorScheme.onTertiary;
  static Color get tertiaryContainer => light.colorScheme.tertiaryContainer;
  static Color get onTertiaryContainer => light.colorScheme.onTertiaryContainer;
  static Color get error => light.colorScheme.error;
  static Color get onError => light.colorScheme.onError;
  static Color get errorContainer => light.colorScheme.errorContainer;
  static Color get onErrorContainer => light.colorScheme.onErrorContainer;
  static Color get background => light.colorScheme.background;
  static Color get onBackground => light.colorScheme.onBackground;
  static Color get surface => light.colorScheme.surface;
  static Color get onSurface => light.colorScheme.onSurface;
  static Color get surfaceVariant => light.colorScheme.surfaceVariant;
  static Color get onSurfaceVariant => light.colorScheme.onSurfaceVariant;
  static Color get outline => light.colorScheme.outline;

  //TextStyle Getters
  static TextStyle? get displayLarge => light.textTheme.displayLarge;
  static TextStyle? get displayMedium => light.textTheme.displayMedium;
  static TextStyle? get displaySmall => light.textTheme.displaySmall;
  static TextStyle? get headlineLarge => light.textTheme.headlineLarge;
  static TextStyle? get headlineMedium => light.textTheme.headlineMedium;
  static TextStyle? get headlineSmall => light.textTheme.headlineSmall;
  static TextStyle? get titleLarge => light.textTheme.titleLarge;
  static TextStyle? get titleMedium => light.textTheme.titleMedium;
  static TextStyle? get titleSmall => light.textTheme.titleSmall;
  static TextStyle? get labelLarge => light.textTheme.labelLarge;
  static TextStyle? get labelMedium => light.textTheme.labelMedium;
  static TextStyle? get labelSmall => light.textTheme.labelSmall;
  static TextStyle? get bodyLarge => light.textTheme.bodyLarge;
  static TextStyle? get bodyMedium => light.textTheme.bodyMedium;
  static TextStyle? get bodySmall => light.textTheme.bodySmall;

  ///Dark Color getter
  static Color get darkPrimary => dark.colorScheme.primary;
  static Color get darkOnPrimary => dark.colorScheme.onPrimary;
  static Color get darkPrimaryContainer => dark.colorScheme.primaryContainer;
  static Color get darkOnPrimaryContainer => dark.colorScheme.onPrimaryContainer;
  static Color get darkSecondary => dark.colorScheme.secondary;
  static Color get darkOnSecondary => dark.colorScheme.onSecondary;
  static Color get darkSecondaryContainer => dark.colorScheme.secondaryContainer;
  static Color get darkOnSecondaryContainer => dark.colorScheme.onSecondaryContainer;
  static Color get darkTertiary => dark.colorScheme.tertiary;
  static Color get darkOnTertiary => dark.colorScheme.onTertiary;
  static Color get darkTertiaryContainer => dark.colorScheme.tertiaryContainer;
  static Color get darkOnTertiaryContainer => dark.colorScheme.onTertiaryContainer;
  static Color get darkError => dark.colorScheme.error;
  static Color get darkOnError => dark.colorScheme.onError;
  static Color get darkErrorContainer => dark.colorScheme.errorContainer;
  static Color get darkOnErrorContainer => dark.colorScheme.onErrorContainer;
  static Color get darkBackground => dark.colorScheme.background;
  static Color get darkOnBackground => dark.colorScheme.onBackground;
  static Color get darkSurface => dark.colorScheme.surface;
  static Color get darkOnSurface => dark.colorScheme.onSurface;
  static Color get darkSurfaceVariant => dark.colorScheme.surfaceVariant;
  static Color get darkOnSurfaceVariant => dark.colorScheme.onSurfaceVariant;
  static Color get darkOutline => dark.colorScheme.outline;


}

extension IPotatoThemesExtension on BuildContext {

  ThemeData get _theme => Theme.of(this);

  bool get isDark => _theme.brightness == Brightness.dark;

  ///Color getter
  Color get primary => _theme.colorScheme.primary;
  Color get onPrimary => _theme.colorScheme.onPrimary;
  Color get primaryContainer => _theme.colorScheme.primaryContainer;
  Color get onPrimaryContainer => _theme.colorScheme.onPrimaryContainer;
  Color get secondary => _theme.colorScheme.secondary;
  Color get onSecondary => _theme.colorScheme.onSecondary;
  Color get secondaryContainer => _theme.colorScheme.secondaryContainer;
  Color get onSecondaryContainer => _theme.colorScheme.onSecondaryContainer;
  Color get tertiary => _theme.colorScheme.tertiary;
  Color get onTertiary => _theme.colorScheme.onTertiary;
  Color get tertiaryContainer => _theme.colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => _theme.colorScheme.onTertiaryContainer;
  Color get error => _theme.colorScheme.error;
  Color get onError => _theme.colorScheme.onError;
  Color get errorContainer => _theme.colorScheme.errorContainer;
  Color get onErrorContainer => _theme.colorScheme.onErrorContainer;
  Color get background => _theme.colorScheme.background;
  Color get onBackground => _theme.colorScheme.onBackground;
  Color get surface => _theme.colorScheme.surface;
  Color get onSurface => _theme.colorScheme.onSurface;
  Color get surfaceVariant => _theme.colorScheme.surfaceVariant;
  Color get onSurfaceVariant => _theme.colorScheme.onSurfaceVariant;
  Color get outline => _theme.colorScheme.outline;

  //TextStyle Getters
  TextStyle? get displayLarge => _theme.textTheme.displayLarge;
  TextStyle? get displayMedium => _theme.textTheme.displayMedium;
  TextStyle? get displaySmall => _theme.textTheme.displaySmall;
  TextStyle? get headlineLarge => _theme.textTheme.headlineLarge;
  TextStyle? get headlineMedium => _theme.textTheme.headlineMedium;
  TextStyle? get headlineSmall => _theme.textTheme.headlineSmall;
  TextStyle? get titleLarge => _theme.textTheme.titleLarge;
  TextStyle? get titleMedium => _theme.textTheme.titleMedium;
  TextStyle? get titleSmall => _theme.textTheme.titleSmall;
  TextStyle? get labelLarge => _theme.textTheme.labelLarge;
  TextStyle? get labelMedium => _theme.textTheme.labelMedium;
  TextStyle? get labelSmall => _theme.textTheme.labelSmall;
  TextStyle? get bodyLarge => _theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => _theme.textTheme.bodyMedium;
  TextStyle? get bodySmall => _theme.textTheme.bodySmall;

}

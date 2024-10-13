import 'package:flutter/material.dart';

String _appTheme = "lightCode";

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.red50,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.purple40001,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          shadowColor: colorScheme.primary,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primary.withOpacity(1),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 48,
          fontFamily: 'PoetsenOne',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 36,
          fontFamily: 'Kavoon',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 28,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 24,
          fontFamily: 'Hanuman',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 13,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray800,
          fontSize: 14,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xff3f000000),
    primaryContainer: Color(0xFF870658),
    secondaryContainer: Color(0xFF0E9CFF),
    errorContainer: Color(0xFFA1A1A1),
    onError: Color(0xFFF5F5F5),
    onPrimary: Color(0xFF292032),
    onPrimaryContainer: Color(0xFFE9DCD6),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Blue
  Color get blueA200 => const Color(0xFF4285F4);

  // BlueGray
  Color get blueGray100 => const Color(0xFFD9D9D9);

  Color get blueGray400 => const Color(0xFF888888);

  Color get blueGray900 => const Color(0xFF333333);

  // DeepOrange
  Color get deepOrange200 => const Color(0xFFFCB394);

  Color get deepOrange500 => const Color(0xFFF4672A);

  // Gray
  Color get gray100 => const Color(0xFFF4F4F4);

  Color get gray200 => const Color(0xFFEEEEEE);

  Color get gray600 => const Color(0xFF7A787A);

  Color get gray700 => const Color(0xFF646464);

  Color get gray800 => const Color(0xFF3D3D3D);

  Color get gray80001 => const Color(0xFF3E3E3E);

  Color get gray88002 => const Color(0xFF4F4F4F);

  // Green
  Color get green400 => const Color(0xFF520976);

  // Pink
  Color get pink100 => const Color(0xFFF5B202);

  Color get pink10001 => const Color(0xFFF4B2D2);

  // Purple
  Color get purple488 => const Color(0xFFCC3140);

  // Red
  Color get purple40001 => const Color(0xFFDF3289);

  Color get red50 => const Color(0xFFFFEFF7);

  Color get red500 => const Color(0xFFEA4335);

  // White
  Color get whiteA700 => const Color(0xFFFDFDFD);

  Color get whiteA70001 => const Color(0xFFFFFFFF);
}

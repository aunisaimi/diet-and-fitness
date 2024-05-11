import 'dart:ui';
import 'package:dietandfitness/utils/size_utils.dart';
import 'package:flutter/material.dart';

String _appTheme = "primary";
PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

// Helper class for managing themes and colors

class ThemeHelper {
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  // changes the app theme to [_newTheme]
void changeTheme(String _newTheme){
  _appTheme = _newTheme;
}

// Return primary color for current theme
PrimaryColors _getThemeColors(){
  return _supportedCustomColor[_appTheme] ?? PrimaryColors();
}

// Return current theme data
ThemeData _getThemeData() {
  var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
  return ThemeData(
    visualDensity: VisualDensity.standard,
    colorScheme: colorScheme,
    textTheme: TextThemes.textTheme(colorScheme),
    scaffoldBackgroundColor: colorScheme.onErrorContainer,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: const EdgeInsets.all(0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.gray100,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: const EdgeInsets.all(0),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      visualDensity: const VisualDensity(
      vertical: -4,
      horizontal: -4,
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: 5,
      space: 5,
    )
  );
}

// Return the primary color for current theme
PrimaryColors themeColor() => _getThemeColors();

// return current theme data
ThemeData themeData() => _getThemeData();
}

class TextThemes{
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.whiteA70002,
      fontSize: 16.fSize,
      fontFamily: 'BentonSans Bold',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.gray800.withOpacity(0.46),
      fontSize: 14.fSize,
      fontFamily: 'BentonSans Regular',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.black90002,
      fontSize: 12.fSize,
      fontFamily: 'BentonSans Book',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: appTheme.greenA200,
      fontSize: 40.fSize,
      fontFamily: 'Viga',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 31.fSize,
      fontFamily: 'BentonSans Bold',
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: appTheme.black90001,
      fontSize: 27.fSize,
      fontFamily: 'BentonSans Bold',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: appTheme.black900,
      fontSize: 25.fSize,
      fontFamily: 'BentonSans Bold',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: appTheme.whiteA70002,
      fontSize: 13.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: appTheme.yellow800,
      fontSize: 22.fSize,
      fontFamily: 'BentonSans Bold',
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: appTheme.whiteA70002,
      fontSize: 14.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w700,
    ),
  );
}

class ColorSchemes{
  static final primaryColorScheme = ColorScheme.light(
      primary: Colors.cyan.shade700,
      primaryContainer: Colors.green.shade700,
      secondaryContainer: Colors.green,
      errorContainer: Colors.red.shade700,
      onError: Colors.redAccent,
      onErrorContainer: Colors.red,
      onPrimary: Colors.cyanAccent,
      onPrimaryContainer: Colors.cyanAccent.shade700,
      onSecondaryContainer: Colors.green.shade400,);
}

class PrimaryColors{
  // Amber

  Color get amber300 => const Color(0XFFFFE14D);

// Black

  Color get black900 => const Color(0XFF090418);

  Color get black90001 => const Color(0XFF09051C);

  Color get black90002 => const Color(0XFF000000);

// Blackf

  Color get black9007f => const Color(0X7F010107);

// BlueGray

  Color get blueGray200 => const Color(0XFFB0BEC5);

  Color get blueGray400 => const Color (0XFF888888);

// Cyan

  Color get cyan90033 => const Color(0X33134D5A);

// DeepOrange

  //Color get deepOrange300 => Color (OXFF84D);

  Color get deepOrange700 => const Color(0XFFDA6317);
  Color get deepOrangeA200 => const Color (0XFFFF7B32);

  //Color get deepOrangeA400 => Color (OXFFFF4600);


// Gray
  Color get gray100 => const Color(0XFFF4F4F4);

  Color get gray10001 => const Color(0XFFF6F6F6);

  Color get gray200 => const Color (0XFFE7E7E7);

  // Color get gray400 => Color (OXFFBEBEBE);
  //
  // Color get gray700 => Color (OXFF8C466A);

  Color get gray70001 => const Color (0XFF6B3A5B);

  Color get gray800 => const Color(0XFF3B3B3B);


// Green
  Color get greenA200 => Colors.greenAccent;

// Indigo
  Color get indigo800 => const Color(0XFF253880);
  Color get indigoA20011 => const Color (0X115A6CEA);

// Lime

  Color get lime100 => const Color(0XFFE9F7BA);

  //Color get lime50 => Color (OXFFFEF6ED);

// Orange

  Color get orangeA200 => const Color(0XFFF9A84D);

  Color get orangeA20001 => const Color(0XFFFEB436);

// Red

 // Color get red500 => Color (OXFFEB4335);

  Color get red700 => const Color(0XFFE21B1B);

  //Color get redA200 => Color(OXFFFF4A4A);

  Color get redA20001 => const Color(0XFFFF4155);

  Color get redA400 => const Color(0XFFFF1C1C);

// Teal

  Color get tea1300 => const Color(0XFF3FDA85);

  //Color get teal400 => Color (OXFF2ECF80);

  Color get teal700 => const Color(0XFF009C51);

// White

  //Color get whiteA700 => Color(OXFFFAFDFF);

  Color get whiteA70001 => Color (0XFFFEFEFF);

  Color get whiteA70002 => Colors.white70;

// Yellow

  Color get yellow300 => const Color(0XFFFBDF69);

  Color get yellow700 => const Color(0XFFFFBB33);

  Color get yellow800 => Color(0XFFFEAD1D);
}
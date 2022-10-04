import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0B0813), elevation: 0),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xff1F1B28),
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(color: const Color(0xff3B3C3C), borderRadius: BorderRadius.circular(12)),
  ),
  cardColor: Colors.white.withOpacity(0.1),
  cardTheme: const CardTheme(),
  // Use these as per your design scheme
  colorScheme: ColorScheme.fromSwatch().copyWith(
    background: const Color(0xff0B0813),
    primaryContainer: const Color(0xffFE9800),
    surface: const Color(0xff1F1B28),
    surfaceVariant: const Color(0xff130E1E),
    tertiary: const Color(0xff2F3234),
    error: const Color(0xffE63349),
    shadow: const Color(0xff00CA72),
    primary: const Color(0xffFCFCFD),
    secondary: const Color(0xff8D869B),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 48,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFD),
    ),
    headline2: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 40,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: const Color(0xffFCFCFD),
    ),
    headline3: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 32,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: const Color(0xffFCFCFD),
    ),
    headline4: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 28,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFD),
    ),
    headline5: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 24,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFD),
    ),
    headline6: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 20,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFD),
    ),
    subtitle1: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 24,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    ),
    subtitle2: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    ),
    bodyText1: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    ),
    bodyText2: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    ),
  ),
);

// If your design contains text styling not provided by the default Theme
extension CustomTextTheme on TextTheme {
  TextStyle get buttonText1 {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFD),
    );
  }

  TextStyle get buttonText2 {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    );
  }

  TextStyle get bodyText3 {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: const Color(0xffFCFCFD),
    );
  }

  TextStyle get subText1 {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFCFCFD),
    );
  }

  TextStyle get subText2 {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w300,
      color: const Color(0xffFCFCFD),
    );
  }
}

class Spacing {
  static const extraSmall = 4.0;
  static const small = 8.0;
  static const compact = 12.0;
  static const regular = 16.0;
  static const medium = 24.0;
  static const large = 40.0;
  static const extraLarge = 60.0;
}

BoxDecoration cardDecoration({double? opacity, double? borderRadius}) {
  return BoxDecoration(
    color: Colors.white.withOpacity(opacity ?? 0.1),
    borderRadius: BorderRadius.circular(borderRadius ?? 12),
    border: Border.all(color: Colors.white.withOpacity(opacity ?? 0.1)),
  );
}

enum SnackBarVariant {
  error,
  info,
  success,
}

enum CardType {
  small,
  medium,
  large,
}

enum ButtonType {
  primary,
  secondary,
  tertiary,
}

enum ButtonSize {
  small,
  medium,
  large,
}

enum ButtonWidth {
  flexible,
  half,
  twoThird,
  full,
}

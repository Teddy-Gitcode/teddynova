import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0A0F2C); // Deep cosmic blue
  static const Color accentBlue = Color(0xFF3A8DFF); // Glowing blue
  static const Color accentPurple = Color(0xFFB16DFF); // Glowing purple
  static const Color glassBackground = Color(0x33FFFFFF); // Glassmorphism

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: accentBlue,
      colorScheme: ColorScheme.dark(
        primary: accentBlue,
        secondary: accentPurple,
        background: background,
        surface: glassBackground,
      ),
      textTheme: GoogleFonts.orbitronTextTheme(
        Typography.whiteCupertino,
      ).copyWith(
        headlineLarge: GoogleFonts.orbitron(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        headlineMedium: GoogleFonts.orbitron(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.orbitron(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.robotoMono(fontSize: 18),
        bodyMedium: GoogleFonts.robotoMono(fontSize: 16),
      ),
      cardTheme: CardTheme(
        color: glassBackground,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        shadowColor: accentBlue.withOpacity(0.3),
        margin: const EdgeInsets.all(16),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.orbitron(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: accentBlue,
        ),
        iconTheme: const IconThemeData(color: accentBlue),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentPurple,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: glassBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: accentBlue.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: accentPurple, width: 2),
        ),
        labelStyle: TextStyle(color: accentBlue),
      ),
    );
  }
}

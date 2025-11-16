import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // AMMOcoin brand colors
  static const Color ammoBlue = Color(0xFF1E88E5);
  static const Color ammoGold = Color(0xFFFFB300);
  static const Color ammoDarkBlue = Color(0xFF0D47A1);
  static const Color ammoLightBlue = Color(0xFF64B5F6);

  // Light theme
  static ThemeData get lightTheme {
    const ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: ammoBlue,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFE3F2FD),
      onPrimaryContainer: ammoDarkBlue,
      secondary: ammoGold,
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFFFF8E1),
      onSecondaryContainer: Color(0xFF8A6C00),
      tertiary: Color(0xFF6B5B95),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFF3E5F5),
      onTertiaryContainer: Color(0xFF2E1B47),
      error: Color(0xFFD32F2F),
      onError: Colors.white,
      errorContainer: Color(0xFFFFEBEE),
      onErrorContainer: Color(0xFF8C1D18),
      surface: Color(0xFFFAFAFA),
      onSurface: Color(0xFF1A1A1A),
      surfaceContainerHighest: Color(0xFFE0E0E0),
      onSurfaceVariant: Color(0xFF424242),
      outline: Color(0xFFBDBDBD),
      outlineVariant: Color(0xFFE0E0E0),
      shadow: Colors.black26,
      scrim: Colors.black54,
      inverseSurface: Color(0xFF2E2E2E),
      onInverseSurface: Color(0xFFF5F5F5),
      inversePrimary: ammoLightBlue,
      surfaceTint: ammoBlue,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: GoogleFonts.interTextTheme(),
      fontFamily: GoogleFonts.inter().fontFamily,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.transparent,
        foregroundColor: ammoBlue,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ammoBlue,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightColorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.error),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        height: 80,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: lightColorScheme.outline.withOpacity(0.2),
        thickness: 1,
      ),
    );
  }

  // Dark theme
  static ThemeData get darkTheme {
    const ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: ammoLightBlue,
      onPrimary: Color(0xFF001A33),
      primaryContainer: ammoDarkBlue,
      onPrimaryContainer: Color(0xFFB3E5FC),
      secondary: ammoGold,
      onSecondary: Color(0xFF2D1B00),
      secondaryContainer: Color(0xFF5C4200),
      onSecondaryContainer: Color(0xFFFFD95A),
      tertiary: Color(0xFFB39DDB),
      onTertiary: Color(0xFF2E1B47),
      tertiaryContainer: Color(0xFF4527A0),
      onTertiaryContainer: Color(0xFFE1BEE7),
      error: Color(0xFFEF5350),
      onError: Color(0xFF5F1C1C),
      errorContainer: Color(0xFFC62828),
      onErrorContainer: Color(0xFFFFCDD2),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFE0E0E0),
      surfaceContainerHighest: Color(0xFF2C2C2C),
      onSurfaceVariant: Color(0xFFBDBDBD),
      outline: Color(0xFF757575),
      outlineVariant: Color(0xFF424242),
      shadow: Colors.black54,
      scrim: Colors.black87,
      inverseSurface: Color(0xFFF5F5F5),
      onInverseSurface: Color(0xFF1A1A1A),
      inversePrimary: ammoBlue,
      surfaceTint: ammoLightBlue,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      fontFamily: GoogleFonts.inter().fontFamily,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.transparent,
        foregroundColor: ammoLightBlue,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ammoLightBlue,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkColorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkColorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkColorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkColorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: darkColorScheme.error),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        height: 80,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: darkColorScheme.outline.withOpacity(0.2),
        thickness: 1,
      ),
    );
  }
}
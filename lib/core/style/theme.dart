// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // Color constants
  static const Color primaryColor = Color(0xFFDF5532);
  static const Color selectedColor = Color(0xFFDF5532);
  static const Color unselectedColor = Color(0xFFE0E0E0);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFF5F5F5);
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);

  // Text styles
  static TextStyle get headingLarge => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static TextStyle get headingMedium => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static TextStyle get headingSmall => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: textPrimaryColor,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: textPrimaryColor,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: textPrimaryColor,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: textSecondaryColor,
  );

  static TextStyle get labelLarge => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: textPrimaryColor,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: textPrimaryColor,
  );

  // Main theme data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',

      // Color scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: selectedColor,
        onSecondary: Colors.white,
        surface: surfaceColor,
        onSurface: textPrimaryColor,
        background: backgroundColor,
        onBackground: textPrimaryColor,
        error: errorColor,
        onError: Colors.white,
      ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
        // centerTitle: true,
        titleTextStyle: headingMedium,
        iconTheme: IconThemeData(color: textPrimaryColor, size: 24.w),
      ),

      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedLabelStyle: labelMedium.copyWith(color: selectedColor),
        unselectedLabelStyle: labelMedium.copyWith(color: unselectedColor),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedIconTheme: IconThemeData(size: 28.w, color: selectedColor),
        unselectedIconTheme: IconThemeData(size: 24.w, color: unselectedColor),
      ),

      // Elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: labelLarge.copyWith(color: Colors.white),
          elevation: 2,
        ),
      ),

      // Text Button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          textStyle: labelLarge.copyWith(color: primaryColor),
        ),
      ),

      // Outlined Button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor, width: 1.w),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: labelLarge.copyWith(color: primaryColor),
        ),
      ),

      // Icon theme
      iconTheme: IconThemeData(color: textPrimaryColor, size: 24.w),

      // Card theme
      cardTheme: CardThemeData(
        color: backgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(8.w),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: unselectedColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: primaryColor, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: errorColor, width: 1.w),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        hintStyle: bodyMedium.copyWith(color: textSecondaryColor),
        labelStyle: labelMedium.copyWith(color: textSecondaryColor),
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return selectedColor;
          }
          return unselectedColor;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),

      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return selectedColor;
          }
          return unselectedColor;
        }),
      ),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return selectedColor;
          }
          return unselectedColor;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return selectedColor.withOpacity(0.5);
          }
          return unselectedColor.withOpacity(0.3);
        }),
      ),

      // Tab Bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: selectedColor,
        unselectedLabelColor: unselectedColor,
        labelStyle: labelLarge.copyWith(color: selectedColor),
        unselectedLabelStyle: labelLarge.copyWith(color: unselectedColor),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: selectedColor, width: 3.w),
        ),
      ),

      // List Tile theme
      listTileTheme: ListTileThemeData(
        selectedTileColor: selectedColor.withOpacity(0.1),
        selectedColor: selectedColor,
        iconColor: textPrimaryColor,
        textColor: textPrimaryColor,
        titleTextStyle: bodyLarge,
        subtitleTextStyle: bodyMedium.copyWith(color: textSecondaryColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: surfaceColor,
        selectedColor: selectedColor,
        labelStyle: labelMedium,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: selectedColor,
        linearTrackColor: selectedColor.withOpacity(0.2),
        circularTrackColor: selectedColor.withOpacity(0.2),
      ),

      // Floating Action Button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: selectedColor,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}

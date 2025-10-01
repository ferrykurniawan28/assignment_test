import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/theme.dart';

class CustomBottomNavItem extends StatelessWidget {
  final String iconPath;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final String label;

  const CustomBottomNavItem({
    super.key,
    required this.iconPath,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Selection indicator line
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(1.r),
                ),
              ),
              SizedBox(height: 4.h),
              // Icon with error handling
              Image.asset(
                iconPath,
                color: isSelected
                    ? AppTheme.selectedColor
                    : AppTheme.unselectedColor,
                width: 24.sp,
                height: 24.sp,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 24.sp, color: Colors.red);
                },
              ),
              // Label with animation
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: isSelected
                      ? AppTheme.selectedColor
                      : AppTheme.unselectedColor,
                  fontSize: 12.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

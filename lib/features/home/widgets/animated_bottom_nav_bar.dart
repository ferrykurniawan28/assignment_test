import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/theme.dart';

class AnimatedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavItem> items;

  const AnimatedBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A303030),
            blurRadius: 6.r,
            offset: Offset(0, -3.h),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: AppTheme.surfaceColor,
      ),
      child: Stack(
        children: [
          // Top indicator line that moves
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 5.h,
            left:
                (currentIndex * (1.sw / items.length)) +
                (1.sw / items.length - 24.w) / 2,
            child: Container(
              width: 24.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: AppTheme.selectedColor,
                // borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) => Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        4.verticalSpace,
                        AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: currentIndex == index ? 1.1 : 1.0,
                          child: Image.asset(
                            items[index].iconPath,
                            color: currentIndex == index
                                ? AppTheme.selectedColor
                                : Color(0XFFD6D1D5),
                            width: 24.sp,
                            height: 24.sp,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.error,
                                size: 24.sp,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                        5.verticalSpace,
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            color: currentIndex == index
                                ? AppTheme.selectedColor
                                : Color(0XFFD6D1D5),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          child: Text(items[index].label),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem {
  final String iconPath;
  final String label;

  const BottomNavItem({required this.iconPath, required this.label});
}

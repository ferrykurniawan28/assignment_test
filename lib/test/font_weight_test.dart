import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontTestWidget extends StatelessWidget {
  const FontTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Font Weight Test')),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Default System Font w500',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            Text(
              'Roboto w400 (Regular)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Roboto w500 (Medium)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Roboto w600 (Semi-bold)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Roboto Bold',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

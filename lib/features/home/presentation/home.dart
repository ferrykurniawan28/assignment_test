import 'package:assignment_test/core/style/theme.dart';
import 'package:assignment_test/features/portofoliio/presentation/pages/portofolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_bottom_nav_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          DummyPage(title: 'Home'),
          PortofolioPage(),
          DummyPage(title: 'Input'),
          DummyPage(title: 'Profile'),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        // padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomNavItem(
              iconPath: 'assets/icons/Home.png',
              index: 0,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              label: 'Home',
            ),
            CustomBottomNavItem(
              iconPath: 'assets/icons/Portfolio.png',
              index: 1,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              label: 'Portfolio',
            ),
            CustomBottomNavItem(
              iconPath: 'assets/icons/Input.png',
              index: 2,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              label: 'Input',
            ),
            CustomBottomNavItem(
              iconPath: 'assets/icons/Profile.png',
              index: 3,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy pages for each tab
class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title page')),
    );
  }
}

import 'package:assignment_test/features/portofoliio/presentation/pages/portofolio.dart';
import 'package:flutter/material.dart';
import '../widgets/animated_bottom_nav_bar.dart';

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
      bottomNavigationBar: AnimatedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavItem(iconPath: 'assets/icons/Home.png', label: 'Home'),
          BottomNavItem(
            iconPath: 'assets/icons/Portfolio.png',
            label: 'Portfolio',
          ),
          BottomNavItem(iconPath: 'assets/icons/Input.png', label: 'Input'),
          BottomNavItem(iconPath: 'assets/icons/Profile.png', label: 'Profile'),
        ],
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

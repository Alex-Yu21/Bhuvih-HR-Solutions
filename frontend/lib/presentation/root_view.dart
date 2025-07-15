import 'package:bhuvih_hr_solutions/presentation/home_view.dart';
import 'package:flutter/material.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomeView(),
    Center(child: Text('Jobs')), // TODO: real screens
    Center(child: Text('Companies')),
    Center(child: Text('Labs')),
    Center(child: Text('Training')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        titleSpacing: 16,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Image.asset('assets/icons/koluvu.png', height: 40),
            const SizedBox(width: 12),
            const Text(
              'Koluvu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_outlined),
            label: 'Companies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: 'Labs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Training',
          ),
        ],
      ),
    );
  }
}

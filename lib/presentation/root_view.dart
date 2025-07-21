import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KoluvuScaffold extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const KoluvuScaffold({super.key, required this.child, required this.state});

  static const _paths = ['/', '/jobs', '/companies', '/govt-jobs', '/training'];

  @override
  Widget build(BuildContext context) {
    final currentIndex = _paths.indexOf(state.matchedLocation);

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
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        onTap: (index) => context.go(_paths[index]),
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
            icon: Icon(Icons.business_outlined),
            label: 'Govt jobs',
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

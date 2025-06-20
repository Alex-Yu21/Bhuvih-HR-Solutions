import 'package:bhuvih_hr_solutions/presentation/home_view.dart';
import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: наполнить AppBar
        title: const Text('Label'),
        centerTitle: true,
      ),
      body: const HomeView(),
      bottomNavigationBar: NavigationBar(
        // TODO: наполнить NavigationBar
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.business), label: 'Label'),
        ],
      ),
    );
  }
}

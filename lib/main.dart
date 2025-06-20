import 'package:bhuvih_hr_solutions/presentation/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhuvih HR Solutions',
      debugShowCheckedModeBanner: false,
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: наполнить AppBar
        title: const Text('Label'),
        centerTitle: true,
      ),
      body: const LandingPage(),
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

import 'package:flutter/material.dart';
import 'companies_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhuvih HR Solutions',
      debugShowCheckedModeBanner: false,
      home: CompaniesScreen(), // ✅ Correct class name!
    );
  }
}

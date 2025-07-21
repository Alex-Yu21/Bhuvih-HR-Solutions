import 'package:bhuvih_hr_solutions/presentation/resources/theme.dart';
import 'package:bhuvih_hr_solutions/presentation/root_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhuvih HR Solutions',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const RootView(),
    );
  }
}

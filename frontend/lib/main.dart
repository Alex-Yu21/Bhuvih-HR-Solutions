import 'package:bhuvih_hr_solutions/app_router.dart';
import 'package:bhuvih_hr_solutions/presentation/resources/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const KoluvuApp());

class KoluvuApp extends StatelessWidget {
  const KoluvuApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'Koluvu',
    theme: appTheme,
    routerConfig: appRouter,
  );
}

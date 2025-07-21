import 'package:bhuvih_hr_solutions/app_router.dart';
import 'package:bhuvih_hr_solutions/presentation/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const KoluvuApp());
}

class KoluvuApp extends StatelessWidget {
  const KoluvuApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    useInheritedMediaQuery: true,
    designSize: Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Koluvu',
        theme: appTheme,
        routerConfig: appRouter,
      );
    },
  );
}

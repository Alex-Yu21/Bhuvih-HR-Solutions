import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  static final _basePillWidth = 220.w;

  @override
  Widget build(BuildContext context) {
    final double pillWidth = _basePillWidth.w;
    final double drawerWidth = pillWidth + 32.w;
    final green = Theme.of(context).colorScheme.secondary;
    final orange = Theme.of(context).colorScheme.primary;

    Widget pill({
      required String label,
      required IconData icon,
      required Color color,
      required String route,
    }) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: SizedBox(
          width: pillWidth,
          child: InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: () {
              Navigator.of(context).pop();
              context.go(route);
            },
            child: Ink(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(40.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 20.sp),
                  SizedBox(width: 10.w),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.6),
      width: drawerWidth,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                  child: Text(
                    'Log in/Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                pill(
                  label: 'Employee',
                  icon: Icons.person_outline,
                  color: green,
                  route: '/employee',
                ),
                pill(
                  label: 'Employer',
                  icon: Icons.apartment_outlined,
                  color: green,
                  route: '/employer',
                ),
                pill(
                  label: 'Partner',
                  icon: Icons.groups_outlined,
                  color: green,
                  route: '/partner',
                ),
                SizedBox(height: 32.h),

                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                  child: Text(
                    'Koluvu Labs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                pill(
                  label: 'ATS',
                  icon: Icons.bar_chart_outlined,
                  color: orange,
                  route: '/ats',
                ),
                pill(
                  label: 'Resume Builder',
                  icon: Icons.note_add_outlined,
                  color: orange,
                  route: '/resume-builder',
                ),
                pill(
                  label: 'AI Mock Interview',
                  icon: Icons.chat_bubble_outline,
                  color: orange,
                  route: '/ai-mock-interview',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

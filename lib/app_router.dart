import 'package:bhuvih_hr_solutions/presentation/root_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/home_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          KoluvuScaffold(state: state, child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeView()),
        ),
        GoRoute(
          path: '/jobs',
          name: 'jobs',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: JobsView()),
        ),
        GoRoute(
          path: '/companies',
          name: 'companies',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CompaniesView()),
        ),
        GoRoute(
          path: '/govt-jobs',
          name: 'govt-jobs',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: GovtJobsView()),
        ),
        GoRoute(
          path: '/training',
          name: 'training',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TrainingView()),
        ),
      ],
    ),
  ],
);

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Jobs'));
  }
}

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Companies'));
  }
}

class GovtJobsView extends StatelessWidget {
  const GovtJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Govt jobs'));
  }
}

class TrainingView extends StatelessWidget {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Training'));
  }
}

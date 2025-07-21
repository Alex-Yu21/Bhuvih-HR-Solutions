import 'package:bhuvih_hr_solutions/presentation/widgets/root_scaffold.dart';
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
        GoRoute(
          path: '/employee',
          name: 'employee',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: EmployeeView()),
        ),
        GoRoute(
          path: '/employer',
          name: 'employer',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: EmployerView()),
        ),
        GoRoute(
          path: '/partner',
          name: 'partner',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: PartnerView()),
        ),
        GoRoute(
          path: '/ats',
          name: 'ats',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AtsView()),
        ),
        GoRoute(
          path: '/resume-builder',
          name: 'resume-builder',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ResumeBuilderView()),
        ),
        GoRoute(
          path: '/ai-mock-interview',
          name: 'ai-mock-interview',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AiMockInterviewView()),
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

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Employee'));
}

class EmployerView extends StatelessWidget {
  const EmployerView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Employer'));
}

class PartnerView extends StatelessWidget {
  const PartnerView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Partner'));
}

class AtsView extends StatelessWidget {
  const AtsView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('ATS'));
}

class ResumeBuilderView extends StatelessWidget {
  const ResumeBuilderView({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Resume Builder'));
}

class AiMockInterviewView extends StatelessWidget {
  const AiMockInterviewView({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('AI Mock Interview'));
}

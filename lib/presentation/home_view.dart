import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const _labels = ['Employee', 'Employer', 'Training'];
  static const _adsFraction = 0.10;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, c) {
        final adsH = c.maxHeight * _adsFraction;
        final sectionH = (c.maxHeight - adsH) / 3;
        final pad = c.maxWidth * 0.06;

        Widget section(String title) => Container(
          height: sectionH,
          padding: EdgeInsets.symmetric(horizontal: pad),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    ctx,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: pad),
              ElevatedButton(onPressed: () {}, child: Text('Sign up')),
              SizedBox(width: pad),
              ElevatedButton(onPressed: () {}, child: Text('Sign in')),
            ],
          ),
        );

        return Column(
          children: [
            Expanded(child: Column(children: _labels.map(section).toList())),
            Container(
              height: adsH,
              alignment: Alignment.center,
              color: Colors.black12,
              child: Text('Ads', style: Theme.of(ctx).textTheme.titleMedium),
            ),
          ],
        );
      },
    );
  }
}

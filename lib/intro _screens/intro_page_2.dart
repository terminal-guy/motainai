import 'package:flutter/material.dart';
import 'package:motainai/components/intro_widget.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenWidget(
      heading: 'Motainai connects surplus to purpose',
      subtitle:
          'We help businesses save food, people access it, and the planet breathe easier.',
      imagepath: 'assets/illustrations/motainai_logoorg.png',
      height: 260,
      distancebet: 95,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:motainai/components/intro_widget.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenWidget(
      heading: 'Help us protect Food, People, and our Planet',
      subtitle:
          'No single person can do it alone                       But together, we can.',
      imagepath: 'assets/illustrations/save_earth_gen.png',
      height: 90,
      distancebet: 30,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:motainai/components/intro_widget.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenWidget(
      heading: 'Sustainability isn’t invisible anymore.',
      subtitle: 'Every action reduces CO₂ emissions and we show you how.',
      imagepath: 'assets/illustrations/carbon_emissions.png',
      height: 150,
      distancebet: 30,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:motainai/components/intro_widget.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenWidget(
      heading: 'Food is wasted every day',
      subtitle: 'While people and the planet pay the price',
      imagepath: 'assets/illustrations/food_illustration.png',
      height: 120,
      distancebet: 23,
    );
  }
}

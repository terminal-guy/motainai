import 'package:flutter/material.dart';
import 'package:motainai/components/today_imapct.dart';

class ImpactPage extends StatelessWidget {
  const ImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodaysImpactCard(),
          ),
        ],
      ),
    );
  }
}

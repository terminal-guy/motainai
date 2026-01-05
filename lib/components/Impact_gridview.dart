import 'package:flutter/material.dart';

class ImpactGrid extends StatelessWidget {
  const ImpactGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.all(4),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
        children: const [
          _ImpactStatCard(
            title: 'CO₂e\navoided',
            icon: Icons.phone_iphone,
            value: '35,282',
            unit: '',
          ),
          _ImpactStatCard(
            title: 'Money\nsaved',
            icon: Icons.savings,
            value: '4,357',
            unit: 'YEN',
          ),
        ],
      ),
    );
  }
}

class _ImpactStatCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final String unit;

  const _ImpactStatCard({
    required this.title,
    required this.icon,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFFFDF8F0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Color(0xFF828368), // matches your selected label color
            ),
          ),
          const SizedBox(height: 10),

          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFDDE6D1), // soft eco green bg
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(
              icon,
              size: 30,
              color: const Color(0xFF2E7D32), // eco green
            ),
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xFF828368),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            unit,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

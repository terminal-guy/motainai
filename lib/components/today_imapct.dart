import 'package:flutter/material.dart';

class TodaysImpactCard extends StatelessWidget {
  const TodaysImpactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // card outer
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8F0),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 14,
            offset: Offset(0, 6),
            color: Color(0x14000000),
          ),
        ],
        border: Border.all(color: const Color(0x12000000)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            "Today’s Impact",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF3D3A36),
            ),
          ),
          const SizedBox(height: 10),

          // Metrics row
          Row(
            children: const [
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.restaurant, // fork/knife
                  iconColor: Color(0xFFB8794F),
                  value: "2 meals",
                  label: "rescued",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.apple, // hand/food-ish
                  iconColor: Color(0xFFB8794F),
                  value: "3.8 kg",
                  label: "food saved",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.eco,
                  iconColor: Color(0xFF6E8B5E),
                  value: "7.1 kg",
                  label: "CO₂e reduced",
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Bottom info bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F1ED),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0x12000000)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.info, size: 18, color: Color(0xFFB8794F)),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimating waste savings",
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3D3A36),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Motainai estimates CO₂e reductions based on food type, weight, and local data.",
                        style: TextStyle(
                          fontSize: 11.5,
                          height: 1.25,
                          color: Color(0xFF6E6A66),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.help_outline, size: 18, color: Color(0xFF9A958F)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _ImpactMetric({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon bubble
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 17, color: iconColor),
        ),
        const SizedBox(width: 8),

        // text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3D3A36),
                ),
              ),
              const SizedBox(height: 1),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF7A756F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

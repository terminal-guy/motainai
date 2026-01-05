import 'package:flutter/material.dart';

class AutoRescueGoalsCard extends StatelessWidget {
  const AutoRescueGoalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const int goal = 3;
    const int current = 1;
    final double progress = current / goal;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F1E8), // same warm card background vibe
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Auto-Rescue Goals / Per Week',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          // Keep the "top metrics row" spacing/layout feel (optional labels)
          Row(
            children: [
              _MiniPill(
                icon: Icons.flag_outlined,
                label: 'Goal',
                value: '$goal',
              ),
              const SizedBox(width: 10),
              _MiniPill(
                icon: Icons.check_circle_outline,
                label: 'Current',
                value: '$current',
              ),
              const SizedBox(width: 10),
              _MiniPill(
                icon: Icons.trending_up,
                label: 'Progress',
                value: '${(progress * 100).round()}%',
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Replaces "Estimating waste savings" with a progress section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.auto_mode,
                      size: 18,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Auto-Rescue progress',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$current / $goal',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: progress, // 1/3
                    minHeight: 10,
                    backgroundColor: const Color(0xFFE6E1DA),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green.shade700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete $goal auto-rescues. You’ve done $current so far.',
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MiniPill({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.65),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

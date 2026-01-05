import 'package:flutter/material.dart';

class LeaderboardEntry {
  final int rank;
  final String name;
  final int treesSaved;
  final double co2eKg;
  final String? avatarAsset;

  const LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.treesSaved,
    required this.co2eKg,
    this.avatarAsset,
  });
}

class LeaderboardCard extends StatelessWidget {
  final List<LeaderboardEntry> entries;

  const LeaderboardCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final shown = entries.take(4).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F1E8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Leaderboard',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Top Users for this Month',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),

          // Header
          _HeaderRow(),

          const SizedBox(height: 10),

          // Rows
          ...shown.map((e) => _Row(entry: e)),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(56), // Rank
          1: FlexColumnWidth(2.2), // User (flex)
          2: FixedColumnWidth(96), // Trees
          3: FixedColumnWidth(120), // CO2 pill
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const [
          TableRow(
            children: [
              _HeaderText('Rank'),
              _HeaderText('User'),
              _HeaderText('Trees Saved'),
              _HeaderText('CO₂e Avoided'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final LeaderboardEntry entry;
  const _Row({required this.entry});

  Color _rankColor(int rank) {
    if (rank == 1) return const Color(0xFFD88355);
    if (rank == 2) return const Color(0xFFE2B07A);
    if (rank == 3) return const Color(0xFFD1966A);
    return const Color(0xFFBFBFBF);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.70),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(56),
          1: FlexColumnWidth(2.2),
          2: FixedColumnWidth(96),
          3: FixedColumnWidth(120),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              // Rank
              Align(
                alignment: Alignment.centerLeft,
                child: _RankCircle(
                  rank: entry.rank,
                  color: _rankColor(entry.rank),
                ),
              ),

              // User (avatar + name) — SAFE: ellipsis
              Row(
                children: [
                  _Avatar(name: entry.name, asset: entry.avatarAsset),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      entry.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              // Trees saved
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDE6D1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Icon(
                      Icons.eco,
                      size: 18,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${entry.treesSaved}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // CO2 pill — stays within fixed width
              Align(
                alignment: Alignment.centerLeft,
                child: _Co2Pill(kg: entry.co2eKg),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _RankCircle extends StatelessWidget {
  final int rank;
  final Color color;
  const _RankCircle({required this.rank, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        '$rank',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String name;
  final String? asset;
  const _Avatar({required this.name, this.asset});

  @override
  Widget build(BuildContext context) {
    final initial = name.trim().isNotEmpty ? name.trim()[0].toUpperCase() : '?';
    return CircleAvatar(
      radius: 20,
      backgroundColor: const Color(0xFFE7E1D8),
      backgroundImage: asset != null ? AssetImage(asset!) : null,
      child: asset == null
          ? Text(
              initial,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            )
          : null,
    );
  }
}

class _Co2Pill extends StatelessWidget {
  final double kg;
  const _Co2Pill({required this.kg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4E4D6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          children: [
            const TextSpan(
              text: 'CO₂ ',
              style: TextStyle(color: Color(0xFFD88355)),
            ),
            TextSpan(
              text: '${kg.toStringAsFixed(0)} kg',
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class Leadershipforforest extends StatelessWidget {
  const Leadershipforforest({super.key});

  @override
  Widget build(BuildContext context) {
    return LeaderboardCard(
      entries: const [
        LeaderboardEntry(rank: 1, name: 'David', treesSaved: 11, co2eKg: 247),
        LeaderboardEntry(rank: 2, name: 'Sota', treesSaved: 9, co2eKg: 192),
        LeaderboardEntry(rank: 3, name: 'Jin', treesSaved: 8, co2eKg: 201),
        LeaderboardEntry(rank: 4, name: 'Christy', treesSaved: 7, co2eKg: 171),
      ],
    );
  }
}

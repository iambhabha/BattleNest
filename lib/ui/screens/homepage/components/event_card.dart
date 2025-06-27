import 'package:flutter/material.dart';
import 'package:tournament_app/core/utils/screen_util.dart';
import 'package:tournament_app/ui/widgets/common/c_image.dart';

// --- EventCard Widget (reuse previous code ya import karo) ---
class EventCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String subtitle;
  final String teamType;
  final int participants;
  final int prizepool;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.teamType,
    required this.participants,
    required this.prizepool,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF23243B),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner image
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(imageUrl, height: 80, width: double.infinity, fit: BoxFit.cover),
                // Prizepool badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFFFA726), borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Icon(Icons.emoji_events, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '₺ $prizepool',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Status badge
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: status == "Ongoing" ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Title & subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                Text(subtitle, style: const TextStyle(color: Color(0xFF6C7A89), fontSize: 13)),
              ],
            ),
          ),
          // Team type & participants
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text('Team Type: $teamType', style: const TextStyle(color: Color(0xFFB0B3C7), fontSize: 12)),
                const Spacer(),
                Text('Participants: $participants', style: const TextStyle(color: Color(0xFFB0B3C7), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TournamentCard extends StatelessWidget {
  const TournamentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Width fixed, height auto
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C2E),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ← auto height
        children: [
          Stack(
            children: [
              CImage(
                borderRadius: BorderRadius.circular(12),
                width: double.infinity,
                height: 100,
                imageUrl:
                    'https://media.istockphoto.com/id/1149107202/photo/boy-holding-golden-trophy-and-celebrating-sport-success-with-team.jpg?s=612x612&w=0&k=20&c=xSEcKk-jN50Mngqggloi_U8LrecdBeHUUPZTpHw2oiY=',
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'ONGOING',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: const [
                      Icon(Icons.emoji_events, size: 12, color: Colors.white),
                      SizedBox(width: 4),
                      Text('1,000\$', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Community Tournament',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          const Text('League of Legends', style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Team: 5v5', style: TextStyle(fontSize: 11, color: Colors.grey)),
              Text('64 Players', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

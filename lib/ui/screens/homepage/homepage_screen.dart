import 'package:flutter/material.dart';

class G4GHomeScreen extends StatelessWidget {
  const G4GHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text('G4G'),
        actions: const [Padding(padding: EdgeInsets.only(right: 12.0), child: Icon(Icons.login))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1F36),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Slider Section
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: 5,
              itemBuilder:
                  (context, index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dpc/2021/fall/tournament_banner.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Popular Events
          sectionTitle('Popular Events'),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder:
                  (context, index) => Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 220,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF1A1F36)),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(6)),
                              child: const Text('ONGOING', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(6)),
                              child: const Text('🏆 5,000', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Community Tournament',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const Text('League of Legends', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        const SizedBox(height: 6),
                        const Text('Team Type: 5v5', style: TextStyle(fontSize: 12, color: Colors.white)),
                        const Text('Participants: 64', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 20),
          // Upcoming Tournaments
          sectionTitle('Upcoming Tournaments'),
          tournamentCard(
            imageUrl: 'https://i.ytimg.com/vi/bD5Tn7iYOKk/maxresdefault.jpg',
            title: 'Rocket League Championship',
            time: 'Nov 4, 2:00 PM',
            prize: '🏆 3,000',
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      ],
    );
  }

  Widget tournamentCard({
    required String imageUrl,
    required String title,
    required String time,
    required String prize,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF1A1F36)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    Text(prize, style: const TextStyle(color: Colors.orange, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

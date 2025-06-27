import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/ui/screens/homepage/components/slider_block.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/ui/widgets/common/c_image.dart';
import 'package:tournament_app/ui/widgets/common/x_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeNavigationViewModel navViewModel;
  const HomeScreen({super.key, required this.navViewModel});

  final List<Widget> _screens = const [
    DashBoard(),
    Center(child: Text('Events', style: TextStyle(color: Colors.white))),
    Center(child: Text('Chat', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      appBar: XAppBar(
        title: 'ClashZone',
        leading: const Icon(Icons.menu, color: ColorSchemeX.titleColor),
        actions: const [Padding(padding: EdgeInsets.only(right: 12.0), child: Icon(Icons.login))],
      ),
      bottomNavigationBar: Observer(
        builder:
            (_) => BottomNavigationBar(
              backgroundColor: const Color(0xFF1A1F36),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: navViewModel.selectedTabIndex,
              onTap: navViewModel.updateTabIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              ],
            ),
      ),
      body: Observer(builder: (_) => _screens[navViewModel.selectedTabIndex]),
    );
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> config = {
      "items": [
        {"imageUrl": "https://mir-s3-cdn-cf.behance.net/projects/404/34f8f5121381261.Y3JvcCwxMDcwLDgzNyw1NjQsMA.jpg"},
        {"imageUrl": "https://w0.peakpx.com/wallpaper/125/739/HD-wallpaper-call-of-duty-mobile-poster.jpg"},
        {"imageUrl": "https://wallpapers.com/images/hd/call-of-duty-warzone-4k-poster-jij79ziyns3oegfu.jpg"},
        {"imageUrl": "https://wallpapers.com/images/featured/call-of-duty-modern-warfare-zh69toakzofabqid.jpg"},
      ],
    };

    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        // Slider Section
        SliderBlock(config: config),
        20.hh,
        // Popular Events
        sectionTitle('Popular Events'),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder:
                (context, index) => Container(
                  width: 164,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C2E),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner & Trophy Row
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CImage(
                              width: double.infinity,
                              height: 100,
                              imageUrl:
                                  'https://media.istockphoto.com/id/1149107202/photo/boy-holding-golden-trophy-and-celebrating-sport-success-with-team.jpg?s=612x612&w=0&k=20&c=xSEcKk-jN50Mngqggloi_U8LrecdBeHUUPZTpHw2oiY=',
                            ),
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
                                  Text(
                                    '1,000\$',
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
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
    );
  }

  Widget sectionTitle(String title) {
    return SectionTitle();
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
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[800],
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  ),
            ),
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

class SectionTitle extends StatelessWidget {
  final String title = 'Popular Events';
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      ],
    );
  }
}

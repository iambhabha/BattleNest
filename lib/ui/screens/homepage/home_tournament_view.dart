import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/ui/screens/homepage/components/section_title.dart';
import 'package:tournament_app/ui/screens/homepage/components/slider_block.dart';
import 'package:tournament_app/ui/screens/homepage/components/tournament_card.dart';
import 'package:tournament_app/ui/screens/homepage/components/upcoming_tournament_card.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_content_store.dart';
import 'package:tournament_app/ui/widgets/common/x_scroll_deck.dart';

class HomeTournamentView extends StatefulWidget {
  final HomeContentStore store;
  const HomeTournamentView({required this.store, super.key});

  @override
  State<HomeTournamentView> createState() => _HomeTournamentViewState();
}

class _HomeTournamentViewState extends State<HomeTournamentView> {
  final List<TournamentBannerModel> items = [
    TournamentBannerModel(
      imageUrl:
          'https://img.freepik.com/free-vector/gradient-tournament-schedule-template_23-2149661236.jpg',
    ),
    TournamentBannerModel(
      imageUrl:
          'https://media.istockphoto.com/id/1149107202/photo/boy-holding-golden-trophy-and-celebrating-sport-success-with-team.jpg?s=612x612&w=0&k=20&c=xSEcKk-jN50Mngqggloi_U8LrecdBeHUUPZTpHw2oiY=',
    ),
    TournamentBannerModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdlXdOuuKc3Tb_gQKw60FZpdr3_w_169MVNA&s',
    ),
    TournamentBannerModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUdNxRBL3x3V_nExdA41G-YajjEVbI1VNmHg&s',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView(
          padding: EdgeInsets.all(10),
          children: [
            TournamentBanner(items: items),
            35.hh,
            PopularEventsListView(
              events: [
                {
                  'imageUrl':
                      'https://static.wikia.nocookie.net/leagueoflegends/images/6/6e/Worlds_2020_Trophy.png',
                  'status': 'Ongoing',
                  'title': 'Community Tournament',
                  'subtitle': 'League of Legends',
                  'teamType': '5v5',
                  'participants': 64,
                  'prizepool': 1000,
                },
                {
                  'imageUrl':
                      'https://staticg.sportskeeda.com/editor/2022/10/2e2e2-16661096338241-1920.jpg',
                  'status': 'Ongoing',
                  'title': 'Fight Night #16',
                  'subtitle': 'PUBG Mobile',
                  'teamType': '4v4',
                  'participants': 48,
                  'prizepool': 5000,
                },
                {
                  'imageUrl':
                      'https://staticg.sportskeeda.com/editor/2022/10/2e2e2-16661096338241-1920.jpg',
                  'status': 'Ongoing',
                  'title': 'Fight Night #16',
                  'subtitle': 'PUBG Mobile',
                  'teamType': '4v4',
                  'participants': 48,
                  'prizepool': 5000,
                },
                {
                  'imageUrl':
                      'https://staticg.sportskeeda.com/editor/2022/10/2e2e2-16661096338241-1920.jpg',
                  'status': 'Ongoing',
                  'title': 'Fight Night #16',
                  'subtitle': 'PUBG Mobile',
                  'teamType': '4v4',
                  'participants': 48,
                  'prizepool': 5000,
                },
              ],
            ),
            10.hh,
            UpcomingTournamentCard(),
          ],
        );
      },
    );
  }
}

class PopularEventsListView extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  const PopularEventsListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        SectionTitle(title: "Popular Events", pageIndicator: '1-2'),
        8.hh,
        XScrollDeck(
          children:
              events.map((event) {
                return TournamentCard();
              }).toList(),
        ),
      ],
    );
  }
}

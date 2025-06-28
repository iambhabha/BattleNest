import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tournament_app/core/di/setup_locator.dart';
import 'package:tournament_app/ui/screens/homepage/home_tournament_view.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_content_store.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final homeContentStore = getIt<HomeContentStore>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => homeContentStore.fetchSections());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => HomeTournamentView(store: homeContentStore),
    );
  }
}

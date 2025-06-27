import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/ui/screens/homepage/dashboard.dart';
import 'package:tournament_app/ui/screens/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/ui/widgets/common/home_bottom_nav_bar.dart';
import 'package:tournament_app/ui/widgets/common/x_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final HomeNavigationViewModel navigationViewModel;

  /// Creates a [HomeScreen] with the provided [navigationViewModel].
  const HomeScreen({super.key, required this.navigationViewModel});

  static const List<Widget> _pages = <Widget>[
    DashBoard(),
    Center(child: Text('Events', style: TextStyle(color: Colors.white))),
    Center(child: Text('Chat', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      appBar: const XAppBar(
        title: 'ClashZone',
        leading: Icon(Icons.menu, color: ColorSchemeX.titleColor),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.login),
          ),
        ],
      ),
      bottomNavigationBar: Observer(
        builder:
            (_) => HomeBottomNavBar(
              currentIndex: widget.navigationViewModel.selectedTabIndex,
              onTap: widget.navigationViewModel.updateTabIndex,
            ),
      ),
      body: Observer(
        builder:
            (_) =>
                HomeScreen._pages[widget.navigationViewModel.selectedTabIndex],
      ),
    );
  }
}

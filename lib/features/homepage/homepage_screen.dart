import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/features/chat/services/support_chat_client.dart';
import 'package:tournament_app/features/drawer/x_drawer.dart';
import 'package:tournament_app/features/homepage/dashboard.dart';
import 'package:tournament_app/features/homepage/store/home_navigation_view_model.dart';
import 'package:tournament_app/features/widgets/common/home_bottom_nav_bar.dart';
import 'package:tournament_app/features/widgets/common/x_app_bar.dart';
import 'package:tournament_app/main.dart';

class HomeScreen extends StatefulWidget {
  final HomeNavigationViewModel navigationViewModel;

  /// Creates a [HomeScreen] with the provided [navigationViewModel].
  const HomeScreen({super.key, required this.navigationViewModel});

  static const List<Widget> _pages = <Widget>[
    DashBoard(),
    Center(child: Text('Events', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final streamClient = GetIt.I<SupportChatClient>();

  @override
  void initState() {
    super.initState();
    streamClient.addDevice(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      drawer: XDrawer(
        userName: "John Doe",
        email: "john@example.com",
        onLogout: () {
          // Handle logout
        },
        isDarkMode: true,
        onThemeToggle: (bool value) {},
      ),
      appBar: XAppBar(
        title: 'ClashZone',
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
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

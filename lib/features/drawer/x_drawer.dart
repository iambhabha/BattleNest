import 'package:flutter/material.dart';
import 'package:tournament_app/features/chat/pages/support_chat_page.dart';

class XDrawer extends StatefulWidget {
  final String userName;
  final String email;
  final VoidCallback onLogout;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const XDrawer({
    super.key,
    required this.userName,
    required this.email,
    required this.onLogout,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<XDrawer> createState() => _XDrawerState();
}

class _XDrawerState extends State<XDrawer> {
  bool settingsExpanded = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isDarkMode ? Colors.white : Colors.black87;
    final bgColor = widget.isDarkMode ? const Color(0xFF0F1320) : Colors.white;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(color),
          const Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _navItem(icon: Icons.home, label: 'Home', color: color, route: '/home', context: context),
                _navItem(
                  icon: Icons.chat_bubble_outline,
                  label: 'Chat',
                  color: color,
                  // route: '/chat',
                  context: context,
                  badgeCount: 3,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportChatPage(userId: '9a5fd02e-b77a-4cb2-a820-37a1fa61e6cf'),
                      ),
                    );
                  },
                ),
                _navItem(
                  icon: Icons.notifications,
                  label: 'Notifications',
                  color: color,
                  route: '/notifications',
                  context: context,
                  badgeCount: 5,
                ),

                // Collapsible Settings Menu
                _expandableNavItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  color: color,
                  expanded: settingsExpanded,
                  onTap: () {
                    setState(() {
                      settingsExpanded = !settingsExpanded;
                    });
                  },
                ),
                if (settingsExpanded) ...[
                  _submenuItem(label: 'Account', color: color, onTap: () => Navigator.pushNamed(context, '/account')),
                  _submenuItem(label: 'Security', color: color, onTap: () => Navigator.pushNamed(context, '/security')),
                ],

                _navItem(icon: Icons.help_outline, label: 'Help', color: color, route: '/help', context: context),

                const SizedBox(height: 20),
                _themeToggleSwitch(color),
              ],
            ),
          ),
          const Divider(),
          _navItem(
            icon: Icons.logout,
            label: 'Logout',
            color: Colors.redAccent,
            onTap: widget.onLogout,
            context: context,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader(Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const CircleAvatar(radius: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.userName, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(widget.email, style: TextStyle(color: color.withOpacity(0.6), fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required BuildContext context,
    required Color color,
    String? route,
    VoidCallback? onTap,
    int badgeCount = 0,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) onTap();
        if (route != null) Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: TextStyle(color: color, fontSize: 16))),
            if (badgeCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(12)),
                child: Text('$badgeCount', style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _expandableNavItem({
    required IconData icon,
    required String label,
    required bool expanded,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: TextStyle(color: color, fontSize: 16))),
            Icon(expanded ? Icons.expand_less : Icons.expand_more, color: color),
          ],
        ),
      ),
    );
  }

  Widget _submenuItem({required String label, required Color color, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 72),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: TextStyle(color: color.withOpacity(0.85))),
        onTap: onTap,
      ),
    );
  }

  Widget _themeToggleSwitch(Color color) {
    return SwitchListTile(
      value: widget.isDarkMode,
      onChanged: widget.onThemeToggle,
      title: Text('Dark Mode', style: TextStyle(color: color)),
      secondary: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode, color: color),
      activeColor: Colors.amber,
    );
  }
}

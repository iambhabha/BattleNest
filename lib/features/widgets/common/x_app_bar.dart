import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onBack;
  const XAppBar({super.key, required this.title, this.onBack, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          leading ??
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: onBack ?? () => Navigator.of(context).maybePop(),
          ),
      actions: actions,

      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 0.2),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF111622),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

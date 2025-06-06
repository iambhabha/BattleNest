import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/stores/auth_store.dart';
import 'package:tournament_app/ui/widgets/common/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = GetIt.I<AuthStore>();
    
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.homeTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: AppLocalizations.of(context)!.signOut,
            onPressed: () => authStore.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(
                '${AppLocalizations.of(context)!.welcomeMessage} ${authStore.currentUser?.displayName ?? AppLocalizations.of(context)!.guestUser}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.appName),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/stores/theme_store.dart';
import 'package:tournament_app/ui/screens/auth/store/auth_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _themeStore = GetIt.I<ThemeStore>();
  final _authStore = GetIt.I<AuthStore>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Tooltip(
                message:
                    _themeStore.isDarkMode
                        ? AppLocalizations.of(context)!.lightTheme
                        : AppLocalizations.of(context)!.darkTheme,
                child: IconButton(
                  icon: Icon(
                    _themeStore.isDarkMode
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color:
                        _themeStore.isDarkMode
                            ? Colors.white
                            : Colors.grey.shade900,
                  ),
                  onPressed: () {
                    _themeStore.toggleTheme();
                  },
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.login),
                onPressed: () async {
                  try {
                    // Sign in with Google
                    final googleUser = await _authStore.signInWithGoogle();
                    if (googleUser != null) {
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: context.heightPercent(20),
                top: context.heightPercent(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcomeBack,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: context.widthPercent(10),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: 30,
                            image: AssetImage('assets/icons/google.png'),
                          ),
                          const SizedBox(width: 40),
                          Image(
                            width: 30,
                            image: AssetImage('assets/icons/facebook.png'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                AppLocalizations.of(context)!.emailOrPhone,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)!.password,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        minWidth: double.infinity,
                        padding: const EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.blue,
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

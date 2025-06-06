import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/services/app_localizations.dart';
import 'package:tournament_app/stores/theme_store.dart';
import 'package:tournament_app/stores/auth_store.dart';
import 'package:tournament_app/ui/widgets/common/text_form_field.dart';
import 'package:tournament_app/ui/widgets/gradient_button.dart';

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

class CreateTournamentScreen extends StatefulWidget {
  const CreateTournamentScreen({super.key});

  @override
  State<CreateTournamentScreen> createState() => _CreateTournamentScreenState();
}

class _CreateTournamentScreenState extends State<CreateTournamentScreen> {
  final _tournamentNameController = TextEditingController();

  String selectedGameMode = '5 v 5';
  String selectedCapacity = '32';
  String selectedEntryFee = 'Free';
  String selectedCurrency = 'USD';

  final List<String> gameModes = ['1 v 1', '3 v 3', '5 v 5'];
  final List<String> capacities = ['8', '16', '32', '64'];
  final List<String> entryFees = ['Free', '1', '5', '10'];
  final List<String> currencies = ['USD', 'INR', 'EUR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10131A),
      appBar: AppBar(
        title: const Text("Create Your Tournament"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Game"),
                _buildDisabledTextField("League of Legends"),
                16.hh,

                _buildLabel("Tournament's Name"),
                _buildTextField(
                  "Custom Tournament Name",
                  _tournamentNameController,
                ),
                16.hh,

                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        "Game Mode",
                        selectedGameMode,
                        gameModes,
                        (val) => setState(() => selectedGameMode = val!),
                      ),
                    ),
                    12.ww,
                    Expanded(
                      child: _buildDropdownField(
                        "Capacity",
                        selectedCapacity,
                        capacities,
                        (val) => setState(() => selectedCapacity = val!),
                      ),
                    ),
                  ],
                ),
                16.hh,
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        "Entry Fee",
                        selectedEntryFee,
                        entryFees,
                        (val) => setState(() => selectedEntryFee = val!),
                      ),
                    ),
                    12.ww,
                    Expanded(
                      child: _buildDropdownField(
                        "Currency",
                        selectedCurrency,
                        currencies,
                        (val) => setState(() => selectedCurrency = val!),
                      ),
                    ),
                  ],
                ),
                16.hh,

                _buildLabel("Prize Pool"),
                4.hh,
                Row(
                  children: [
                    Text("#1", style: TextStyle(color: Colors.white)),
                    8.ww,
                    Expanded(child: _buildTextField("100", null)),
                    12.ww,
                    SizedBox(
                      width: 100,
                      child: _buildDropdownButton(
                        selectedCurrency,
                        currencies,
                        (val) => setState(() => selectedCurrency = val!),
                      ),
                    ),
                  ],
                ),
                30.hh,

                GradientButton(
                  text: "Create Tournament",
                  onPressed: () {},
                  showShimmer: true,
                  shimmerColor: Colors.white,
                  shimmerWidth: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextStyle(color: AppColor.titleColor));
  }

  Widget _buildDisabledTextField(String value) {
    return Textformfield(value: value, enabled: false, hintText: '');
  }

  Widget _buildTextField(String hint, TextEditingController? controller) {
    return Textformfield(controller: controller, hintText: hint);
  }

  Widget _buildDropdownField(
    String label,
    String selectedValue,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        4.hh,
        _buildDropdownButton(selectedValue, options, onChanged),
      ],
    );
  }

  Widget _buildDropdownButton(
    String selectedValue,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white12,
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        dropdownColor: const Color(0xFF1A1D26),
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
        items:
            options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
      ),
    );
  }
}

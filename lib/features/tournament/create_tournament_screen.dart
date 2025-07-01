import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/features/tournament/store/tournament_dropdown_store.dart';
import 'package:tournament_app/features/widgets/common/create_tournament_shimmer.dart';
import 'package:tournament_app/features/widgets/common/text_form_field.dart';
import 'package:tournament_app/features/widgets/common/x_app_bar.dart';
import 'package:tournament_app/features/widgets/gradient_button.dart';

class CreateTournamentScreen extends StatefulWidget {
  const CreateTournamentScreen({super.key});

  @override
  State<CreateTournamentScreen> createState() => _CreateTournamentScreenState();
}

class _CreateTournamentScreenState extends State<CreateTournamentScreen> {
  final _tournamentNameController = TextEditingController();
  final dropdownStore = GetIt.I<TournamentDropdownStore>();

  String selectedGameMode = '';
  String selectedCapacity = '';
  String selectedEntryFee = '';
  String selectedCurrency = '';

  @override
  void initState() {
    super.initState();
    dropdownStore.fetchAllDropdowns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111622),
      appBar: const XAppBar(title: "Create Your Tournament"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Observer(
            builder: (_) {
              if (dropdownStore.gameModes.isEmpty ||
                  dropdownStore.capacities.isEmpty ||
                  dropdownStore.entryFees.isEmpty ||
                  dropdownStore.currencies.isEmpty) {
                return const CreateTournamentShimmer();
              }

              // Set defaults if not already set
              selectedGameMode =
                  selectedGameMode.isEmpty
                      ? dropdownStore.gameModes.first.title
                      : selectedGameMode;
              selectedCapacity =
                  selectedCapacity.isEmpty
                      ? dropdownStore.capacities.first.title
                      : selectedCapacity;
              selectedEntryFee =
                  selectedEntryFee.isEmpty
                      ? dropdownStore.entryFees.first.title
                      : selectedEntryFee;
              selectedCurrency =
                  selectedCurrency.isEmpty
                      ? dropdownStore.currencies.first.title
                      : selectedCurrency;

              return SingleChildScrollView(
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
                            dropdownStore.gameModes
                                .map((e) => e.title)
                                .toList(),
                            (val) => setState(() => selectedGameMode = val!),
                          ),
                        ),
                        12.ww,
                        Expanded(
                          child: _buildDropdownField(
                            "Capacity",
                            selectedCapacity,
                            dropdownStore.capacities
                                .map((e) => e.title)
                                .toList(),
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
                            dropdownStore.entryFees
                                .map((e) => e.title)
                                .toList(),
                            (val) => setState(() => selectedEntryFee = val!),
                          ),
                        ),
                        12.ww,
                        Expanded(
                          child: _buildDropdownField(
                            "Currency",
                            selectedCurrency,
                            dropdownStore.currencies
                                .map((e) => e.title)
                                .toList(),
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
                        const Text("#1", style: TextStyle(color: Colors.white)),
                        8.ww,
                        Expanded(child: _buildTextField("100", null)),
                        12.ww,
                        SizedBox(
                          width: 100,
                          child: _buildDropdownButton(
                            selectedCurrency,
                            dropdownStore.currencies
                                .map((e) => e.title)
                                .toList(),
                            (val) => setState(() => selectedCurrency = val!),
                          ),
                        ),
                      ],
                    ),
                    30.hh,

                    GradientButton(
                      text: "Create Tournament",
                      onPressed: () {
                        // TODO: Implement submission logic
                      },
                      showShimmer: true,
                      shimmerColor: Colors.white,
                      shimmerWidth: 100,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextStyle(color: ColorSchemeX.titleColor));
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

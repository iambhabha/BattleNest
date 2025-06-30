import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';

class CreateTournamentShimmer extends StatelessWidget {
  const CreateTournamentShimmer({super.key});

  Widget _shimmerBox({double height = 48, double width = double.infinity}) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white24,
      highlightColor: Colors.white38,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shimmerBox(height: 14, width: 100), // Label: Game
              _shimmerBox(), // Game field

              16.hh,
              _shimmerBox(height: 14, width: 180), // Label: Tournament Name
              _shimmerBox(), // Tournament name input

              16.hh,
              Row(
                children: [
                  Expanded(child: _shimmerBox()), // Game Mode
                  12.ww,
                  Expanded(child: _shimmerBox()), // Capacity
                ],
              ),
              16.hh,
              Row(
                children: [
                  Expanded(child: _shimmerBox()), // Entry Fee
                  12.ww,
                  Expanded(child: _shimmerBox()), // Currency
                ],
              ),
              16.hh,

              _shimmerBox(height: 14, width: 120), // Label: Prize Pool
              Row(
                children: [
                  _shimmerBox(width: 30), // #1
                  8.ww,
                  Expanded(child: _shimmerBox()), // Amount
                  12.ww,
                  _shimmerBox(width: 100), // Currency
                ],
              ),

              16.hh,
              Container(
                height: 48,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24, style: BorderStyle.solid, width: 1),
                  color: Colors.white10,
                ),
                child: Center(child: Container(height: 14, width: 100, color: Colors.white12)),
              ), // Add More Button

              16.hh,
              _shimmerBox(height: 14, width: 160), // Select a Platform
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(12)),
                  );
                }),
              ),

              16.hh,
              _shimmerBox(height: 14, width: 160), // Tournament Stages
              _shimmerBox(),

              16.hh,
              Row(
                children: [
                  Expanded(child: _shimmerBox()), // Date
                  12.ww,
                  Expanded(child: _shimmerBox()), // Time
                ],
              ),

              30.hh,
              _shimmerBox(height: 50), // Create Tournament Button
            ],
          ),
        ),
      ),
    );
  }
}

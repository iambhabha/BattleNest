import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DropdownShimmer extends StatelessWidget {
  const DropdownShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white24,
      child: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

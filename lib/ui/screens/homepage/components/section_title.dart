import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String pageIndicator;
  const SectionTitle({
    super.key,
    required this.title,
    required this.pageIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 16, color: Colors.orange[200]),
            Text(
              pageIndicator,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange[200]),
          ],
        ),
      ],
    );
  }
}

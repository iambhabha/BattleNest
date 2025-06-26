import 'package:flutter/material.dart';

class BannerBlock extends StatelessWidget {
  final Map<String, dynamic> config;
  const BannerBlock({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final item = (config['items'] ?? []).isNotEmpty ? config['items'][0] : null;
    if (item == null || item['image'] == null) return const SizedBox.shrink();
    return Image.network(item['image'], fit: BoxFit.cover);
  }
}

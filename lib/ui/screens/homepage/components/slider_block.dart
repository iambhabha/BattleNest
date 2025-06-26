import 'package:flutter/material.dart';

class SliderBlock extends StatelessWidget {
  final Map<String, dynamic> config;
  const SliderBlock({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final items = List<Map<String, dynamic>>.from(config['items'] ?? []);
    final layout = config['layout'] ?? {};
    final height = (layout['height'] ?? 180).toDouble();

    return SizedBox(
      height: height,
      child: PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Image.network(items[index]['image'], fit: BoxFit.cover),
      ),
    );
  }
}

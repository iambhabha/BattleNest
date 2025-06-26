import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBlock extends StatefulWidget {
  final Map<String, dynamic> config;
  const SliderBlock({super.key, required this.config});

  @override
  State<SliderBlock> createState() => _SliderBlockState();
}

class _SliderBlockState extends State<SliderBlock> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items = widget.config['items'] ?? [];

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, _) {
            final imageUrl = items[index]['imageUrl'];
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder:
                    (_, __, ___) => Container(
                      color: Colors.grey[800],
                      child: const Center(child: Icon(Icons.broken_image, color: Colors.white)),
                    ),
              ),
            );
          },
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              items.asMap().entries.map((entry) {
                return Container(
                  width: _current == entry.key ? 16 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _current == entry.key ? Colors.purple : Colors.grey,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

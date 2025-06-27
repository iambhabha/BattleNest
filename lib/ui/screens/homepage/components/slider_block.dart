import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/utils/screen_util.dart';
import 'package:tournament_app/ui/widgets/common/c_image.dart';

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

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, _) {
            final imageUrl = items[index]['imageUrl'];
            return CImage(width: double.infinity, height: 180, imageUrl: imageUrl);
          },
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),

        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                items.asMap().entries.map((entry) {
                  return Container(
                    width: 25,
                    height: 5.5,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _current == entry.key ? ColorSchemeX.sliderIndicator : ColorSchemeX.grey,
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

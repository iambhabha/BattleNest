import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/features/widgets/common/c_image.dart';

/// Model representing a single tournament banner item.
class TournamentBannerModel {
  final String imageUrl;

  TournamentBannerModel({required this.imageUrl});

  factory TournamentBannerModel.fromMap(Map<String, dynamic> map) {
    return TournamentBannerModel(
      imageUrl: map['image'] ?? map['imageUrl'] ?? '',
    );
  }
}

/// Widget to display a tournament banner carousel on the homepage.
class TournamentBanner extends StatefulWidget {
  final List<TournamentBannerModel> items;
  const TournamentBanner({super.key, required this.items});

  @override
  State<TournamentBanner> createState() => _TournamentBannerState();
}

class _TournamentBannerState extends State<TournamentBanner> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<TournamentBannerModel> items = widget.items;

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, _) {
            final bannerItem = items[index];
            return CImage(
              borderRadius: BorderRadius.circular(10),
              width: double.infinity,
              height: 180,
              imageUrl: bannerItem.imageUrl,
            );
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
                      color:
                          _current == entry.key
                              ? ColorSchemeX.sliderIndicator
                              : ColorSchemeX.grey,
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

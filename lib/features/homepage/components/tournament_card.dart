import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/features/widgets/common/c_image.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw, // Width fixed, height auto

      decoration: BoxDecoration(
        color: const Color(0xFF1C1C2E),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ← auto height
        children: [
          Stack(
            children: [
              CImage(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                height: 100,
                imageUrl:
                    'https://media.istockphoto.com/id/1149107202/photo/boy-holding-golden-trophy-and-celebrating-sport-success-with-team.jpg?s=612x612&w=0&k=20&c=xSEcKk-jN50Mngqggloi_U8LrecdBeHUUPZTpHw2oiY=',
              ),
              Positioned(
                bottom: 4,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorSchemeX.tagOngoing,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'ONGOING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorSchemeX.tagTrophies,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.emoji_events, size: 12, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        '1,000\$',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          12.hh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const Text(
              'Community Tournament',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'League of Legends',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: ColorSchemeX.smallCardSubTitle,
              ),
            ),
          ),
          5.hh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team: 5v5',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemeX.titleColor,
                  ),
                ),
                Text(
                  'participants: 64',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorSchemeX.titleColor,
                  ),
                ),
              ],
            ),
          ),
          15.hh,
        ],
      ),
    );
  }
}

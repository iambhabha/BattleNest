import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/core/extensions/screen_size_extension.dart';
import 'package:tournament_app/ui/screens/homepage/components/section_title.dart';
import 'package:tournament_app/ui/widgets/common/c_image.dart';

class UpcomingTournamentCard extends StatelessWidget {
  const UpcomingTournamentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        SectionTitle(title: "Upcoming Tournaments"),
        12.hh,
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF181F2A), // Background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background image
                  CImage(
                    borderRadius: BorderRadius.circular(8),
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd8Qj3JJkNnULSmNIlrHunxU5Nku-S2VA8ww&s', // Replace with your image
                    height: 180,

                    fit: BoxFit.cover,
                  ),
                  // Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // Top Row: Icons and Prize
                  Positioned(
                    top: 12,
                    left: 12,
                    right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFA726),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.emoji_events,
                                color: Colors.white,
                                size: 10,
                              ),
                              6.ww,
                              Text(
                                "25,000\$",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bottom Row: Status and Date
                  Positioned(
                    left: 16,
                    bottom: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: ColorSchemeX.upcoming,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "UPCOMING",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: ColorSchemeX.tagtTime,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Nov 4 2:00 PM -03",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              12.hh,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                child: Text(
                  "World Championship Series 2021",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              15.hh,
            ],
          ),
        ),
      ],
    );
  }
}

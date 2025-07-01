import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_app/constants/app_color.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? pageIndicator;
  const SectionTitle({super.key, required this.title, this.pageIndicator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        if (pageIndicator != null)
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: ColorSchemeX.arowColor,
              ),
              Text(
                pageIndicator!,
                style: TextStyle(
                  color: ColorSchemeX.arowColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: ColorSchemeX.arowColor,
              ),
            ],
          ),
      ],
    );
  }
}

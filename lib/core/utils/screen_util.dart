import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenUtil {
  static void init(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Common design size (iPhone X)
      minTextAdapt: true,
    );
  }
}

// Extension for easy access to responsive values
extension SizeExtension on num {
  double get w => w.toDouble();
  double get h => h.toDouble();
  double get sp => sp.toDouble();
  double get sw => sw.toDouble();
  double get sh => sh.toDouble();
}

import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  // Screen size
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Safe area padding
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;
  double get paddingLeft => MediaQuery.of(this).padding.left;
  double get paddingRight => MediaQuery.of(this).padding.right;

  // Screen size with safe area
  double get safeAreaHeight => screenHeight - paddingTop - paddingBottom;
  double get safeAreaWidth => screenWidth - paddingLeft - paddingRight;

  // Responsive sizing
  double widthPercent(double percent) => screenWidth * (percent / 100);
  double heightPercent(double percent) => screenHeight * (percent / 100);

  // Check device type
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  // Text scale factor
  double get textScaleFactor =>
      MediaQuery.of(this).textScaler.scale(16.0) / 16.0;

  double scaleFont(double baseSize) =>
      MediaQuery.of(this).textScaler.scale(baseSize);
}

extension SizeExtension on num {
  SizedBox get hh => SizedBox(height: toDouble());
  SizedBox get ww => SizedBox(width: toDouble());
}

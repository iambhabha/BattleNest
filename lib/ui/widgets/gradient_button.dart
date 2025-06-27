import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:tournament_app/constants/app_color.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double borderRadius;
  final double height;
  final bool showShimmer;
  final Color shimmerColor;
  final double shimmerWidth;
  final Duration shimmerDuration;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradientColors = const [ColorSchemeX.primaryGradientButtonFirst, ColorSchemeX.primaryGradientButtonSecond],
    this.borderRadius = 12,
    this.height = 50,
    this.showShimmer = false,
    this.shimmerColor = Colors.white,
    this.shimmerWidth = 100,
    this.shimmerDuration = const Duration(seconds: 6),
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(vsync: this, duration: widget.shimmerDuration)..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main button
        GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: widget.gradientColors),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Shimmer effect
        if (widget.showShimmer)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: AnimatedBuilder(
                animation: _shimmerController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _ShimmerPainter(
                      ticker: _shimmerController,
                      color: widget.shimmerColor,
                      width: widget.shimmerWidth,
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class _ShimmerPainter extends CustomPainter {
  _ShimmerPainter({required this.ticker, required this.color, required this.width}) : super(repaint: ticker);

  final Animation<double> ticker;
  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final double x = size.width * 2.0 * ticker.value - width;

    final rect = Rect.fromLTWH(x, 0, width, size.height);

    // Diagonal gradient shimmer
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color.withOpacity(0.0),
        color.withOpacity(0.25),
        color.withOpacity(0.6),
        color.withOpacity(0.25),
        color.withOpacity(0.0),
      ],
      stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
    );

    final Paint shimmerPaint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..blendMode =
              BlendMode
                  .srcATop // visually smoother than BlendMode.plus
          ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 3); // soft blur

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(size.height / 2)), shimmerPaint);
  }

  @override
  bool shouldRepaint(_ShimmerPainter oldDelegate) => false;
}

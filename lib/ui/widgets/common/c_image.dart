import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BlendMode? colorBlendMode;
  final Color? overlayColor;
  final BorderRadiusGeometry? borderRadius;

  const CImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.colorBlendMode,
    this.overlayColor,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,

      colorBlendMode: colorBlendMode,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: overlayColor,
            image: DecorationImage(fit: fit, image: imageProvider),
          ),
        );
      },
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => CImage(width: double.infinity, height: 180, imageUrl: imageUrl),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BlendMode? colorBlendMode;
  final Color? overlayColor;

  const CImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.colorBlendMode,
    this.overlayColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: overlayColor,
      colorBlendMode: colorBlendMode,

      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

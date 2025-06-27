import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_app/stores/app_config_store.dart';

final appConfigStore = GetIt.I<AppConfigStore>();

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
      errorWidget: (context, url, error) {
        final fallbackUrl = appConfigStore.errorImageUrl;

        // Show fallback image if available, else show error icon
        if (fallbackUrl != null && fallbackUrl.isNotEmpty) {
          return CImage(imageUrl: fallbackUrl, width: width, height: height, fit: fit);
        } else {
          return const Icon(Icons.error);
        }
      },
    );
  }
}

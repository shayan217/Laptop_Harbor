import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';

class LHCircularImage extends StatelessWidget {
  const LHCircularImage({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.overlayColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = 8,
    this.isNetworkImage = false,
  }) : super(key: key);

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const LHShimmerEffect(width: 55, height: 55),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: fit,
                image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                color: overlayColor,
              ),
      ),
    );
  }
}

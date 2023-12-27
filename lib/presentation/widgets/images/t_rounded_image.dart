import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width = 150,
    this.height = 158,
    this.clip = false,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.backgroundColor = TColors.light,
  });

  final double? width, height;
  final String imageUrl;
  final bool clip;
  final BoxFit? fit;
  final Color backgroundColor;
  final BoxBorder? border;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        child: ClipRRect(
          borderRadius: clip
              ? BorderRadius.circular(TSizes.productImageRadius)
              : BorderRadius.zero,
          child: Image(fit: fit, image: AssetImage(imageUrl)),
        ),
      ),
    );
  }
}

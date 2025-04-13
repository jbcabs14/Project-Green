import 'package:flutter/material.dart';
import 'package:proj_hiraya/utils/constants/colors.dart';
import 'package:proj_hiraya/utils/constants/sizes.dart';

class MainCircularImage extends StatelessWidget {
  const MainCircularImage(
      {super.key,
      this.width,
      this.height,
      required this.image,
      this.applyImageRadius = true,
      this.borderRadius = MainSizes.md,
      this.border,
      this.backgroundColor = MainColors.light,
      this.fit = BoxFit.contain,
      this.padding,
      this.isNetworkImage = false,
      this.onPressed});

  final double? width, height;
  final String image;
  final bool applyImageRadius;
  final double borderRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

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
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
                fit: fit,
                image: isNetworkImage
                    ? NetworkImage(image)
                    : AssetImage(image) as ImageProvider),
          )),
    );
  }
}

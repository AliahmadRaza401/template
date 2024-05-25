import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxShape shape;
  final String imageUrl;
  final Widget? loadingWidget;
  final BoxFit? fit;

  final Widget Function(BuildContext, Object)? errorBuilder;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.loadingWidget,
    this.fit,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit??BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return loadingWidget ?? const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return errorBuilder != null
              ? errorBuilder!(context, error)
              : Container(
            height: height,
            width: width,
            color: Colors.grey.withOpacity(0.5),
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }
}

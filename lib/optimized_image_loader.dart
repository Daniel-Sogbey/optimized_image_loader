library optimized_image_loader;

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class OptimizedImageLoader extends StatelessWidget {
  final String url;
  final double imageHeight;
  final double imageWidth;
  final double spinnerHeight;
  final double spinnerWidth;
  Indicator? loadingSpinnerIndicatorType;
  final List<Color>? loadingSpinnerColors;
  Decoration? errorContainerDecoration;

  OptimizedImageLoader({
    Key? key,
    required this.url,
    required this.imageHeight,
    required this.imageWidth,
    required this.spinnerHeight,
    required this.spinnerWidth,
  this.loadingSpinnerIndicatorType,
  required this.loadingSpinnerColors,
  this.errorContainerDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: Container(
            width: spinnerWidth,
            height: spinnerHeight,
            margin: const EdgeInsets.all(10.0),
            child: LoadingIndicator(
              indicatorType:loadingSpinnerIndicatorType != null? loadingSpinnerIndicatorType! : Indicator.lineSpinFadeLoader,
              colors: loadingSpinnerColors,
            ),
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        debugPrint("StackTrace $stackTrace");
        return Container(
          height: imageHeight,
          width: imageWidth,
          decoration: errorContainerDecoration,
        );
      },
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class DiamondCard extends StatelessWidget {
  final double size;
  final String? imagePath;
  final Widget? child;
  final List<Color>? gradientColors;

  const DiamondCard({
    super.key,
    required this.size,
    this.imagePath,
    this.child,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4, // 45 degrees rotation
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Smooth rounded diamond corners
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          image: imagePath != null
              ? DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                  // Counter-rotate the image inside so it stands perfectly upright
                  alignment: Alignment.center, 
                )
              : null,
        ),
        // Counter-rotate child content (like your App Logo) so it remains vertical
        child: child != null
            ? Transform.rotate(
                angle: -pi / 4,
                child: child,
              )
            : null,
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CircularDotsLoader extends StatefulWidget {
  const CircularDotsLoader({super.key});

  @override
  State<CircularDotsLoader> createState() => _CircularDotsLoaderState();
}

class _CircularDotsLoaderState extends State<CircularDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const int dotCount = 8;
    const double radius = 22;

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: List.generate(dotCount, (index) {
                final double angle =
                    (index * (2 * pi / dotCount)) + (_controller.value * 2 * pi);

                final double size = 10 - (index * 0.8); // big first, then smaller

                return Positioned(
                  left: 30 + radius * cos(angle) - size / 2,
                  top: 30 + radius * sin(angle) - size / 2,
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(1 - (index * 0.1)),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

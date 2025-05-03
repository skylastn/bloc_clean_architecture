import 'dart:math';

import 'package:flutter/material.dart';

class FloatingLoadingAnimation extends StatefulWidget {
  const FloatingLoadingAnimation({super.key});

  @override
  State<FloatingLoadingAnimation> createState() =>
      _FloatingLoadingAnimationState();
}

class _FloatingLoadingAnimationState extends State<FloatingLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(double angle) {
    return Transform.translate(
      offset: Offset(30 * cos(angle), 30 * sin(angle)),
      child: const Dot(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final angle = _controller.value * 2 * pi;
          return Stack(
            alignment: Alignment.center,
            children: List.generate(8, (i) {
              final dotAngle = angle + (pi / 4 * i);
              return _buildDot(dotAngle);
            }),
          );
        },
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
    );
  }
}

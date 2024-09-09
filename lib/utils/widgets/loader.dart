import 'package:flutter/material.dart';
import 'package:salary_calculator/utils/colors.dart';

class LoadingDots extends StatefulWidget {
  final Color color;
  const LoadingDots({super.key, this.color = AppColors.primaryColor});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(
          animation: _animation,
          delay: 0,
          color: widget.color,
        ),
        Dot(
          animation: _animation,
          delay: 500,
          color: widget.color,
        ),
        Dot(
          animation: _animation,
          delay: 1000,
          color: widget.color,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final Animation<double> animation;
  final int delay;
  final Color color;

  const Dot({super.key, required this.animation, required this.delay, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double scale = 1 + 0.3 * (1 - (animation.value - delay / 1200).abs());
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

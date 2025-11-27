import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TapToPlay extends StatelessWidget {
  const TapToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
          child: Text(
            'TAP TO START',
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: 4,
            ),
          ),
        )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .scale(
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
          duration: 500.ms,
        );
  }
}

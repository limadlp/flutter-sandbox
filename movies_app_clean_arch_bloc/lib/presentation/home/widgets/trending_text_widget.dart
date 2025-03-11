import 'package:flutter/material.dart';

class TrendingTextWidget extends StatelessWidget {
  const TrendingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Trending 🔥',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}

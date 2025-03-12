import 'package:flutter/material.dart';

class TrendingTextWidget extends StatelessWidget {
  const TrendingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12.0, left: 16.0),
      child: Text(
        'Trendings 🔥',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Image.asset(
        'assets/images/banner.png',
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

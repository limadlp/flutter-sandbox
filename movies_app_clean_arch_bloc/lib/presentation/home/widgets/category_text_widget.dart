import 'package:flutter/material.dart';

class CategoryTextWidget extends StatelessWidget {
  final String title;
  const CategoryTextWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}

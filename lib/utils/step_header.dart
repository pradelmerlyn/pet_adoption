import 'package:flutter/material.dart';

class StepsHeader extends StatelessWidget {
  final int step;
  final String title;

  const StepsHeader({
    super.key,
    required this.step,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '🐾 Step $step: $title',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? width;
  final bool useFullWidth;

  const RoundedButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.width,
    this.useFullWidth = true, // default to full width behavior
  });

  @override
  Widget build(BuildContext context) {
    // Determine final width
    double? resolvedWidth;
    if (width != null) {
      resolvedWidth = width;
    } else if (useFullWidth) {
      resolvedWidth = MediaQuery.of(context).size.width * 0.8;
    }

    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(label),
    );

    return resolvedWidth != null
        ? SizedBox(width: resolvedWidth, child: button)
        : button; // if null & useFullWidth = false → shrink-wrap
  }
}

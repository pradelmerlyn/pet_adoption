import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class ShadowedPageIndicator extends StatelessWidget {
  const ShadowedPageIndicator({
    super.key,
    required this.currentItem,
    required this.count,
    required this.onItemClicked,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.black26,
    this.boxShape = BoxShape.rectangle,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.height = 16,
    this.shadowColor = Colors.black,
    this.blurRadius = 6,
    this.offset = const Offset(0, 2),
    this.backgroundColor = Colors.white,
    this.borderRadius = BorderRadius.zero,
  });

  final int currentItem;
  final int count;
  final ValueChanged<int> onItemClicked;
  final Color selectedColor;
  final Color unselectedColor;
  final BoxShape boxShape;
  final EdgeInsets padding;
  final double height;
  final Color shadowColor;
  final double blurRadius;
  final Offset offset;
  final Color backgroundColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      padding: padding,
      child: SizedBox(
        height: height,
        child: 
        PageViewDotIndicator(
          currentItem: currentItem,
          count: count,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
          duration: const Duration(milliseconds: 200),
          boxShape: boxShape,
          onItemClicked: onItemClicked,
        ),
      ),
    );
  }
}

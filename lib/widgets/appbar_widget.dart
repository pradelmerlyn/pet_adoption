import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool showUserGreeting;
  final Color? backgroundColor;

  const AppBarWidget({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.showUserGreeting = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: backgroundColor ?? Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: showUserGreeting
            ? _buildUserGreeting()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showBackButton)
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  Expanded(
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (actions != null) ...actions!,
                ],
              ),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/3.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Hi Hooman!',
              style: TextStyle(
                color: AppColor.darker,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: actions ?? [],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // custom height
}

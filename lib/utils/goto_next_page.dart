import 'package:flutter/material.dart';

void goToNextPage({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required int currentPage,
  required int totalPages,
  required VoidCallback onPageAdvanced,
  Widget? nextScreen,
}) {
  if (formKey.currentState?.validate() ?? false) {
    formKey.currentState?.save();
    print("Current Page: $currentPage / Total: $totalPages");
    if (currentPage < totalPages - 1) {
      onPageAdvanced();
    } else if (nextScreen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => nextScreen),
      );
    }
  }
}

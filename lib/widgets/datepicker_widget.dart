import 'package:flutter/material.dart';

class DateFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? topLabel;
  final String? Function(String?)? validator;
  final VoidCallback onTap;
  final FormFieldSetter<String>? onSaved;

  const DateFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onTap,
    this.topLabel,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
            ),
          ),
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}

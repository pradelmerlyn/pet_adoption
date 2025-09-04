import 'package:flutter/material.dart';

class TextareaWidget extends StatelessWidget {
  final String title;
  final String? initialValue;
  final String? hintText;
  final TextStyle? hintStyle;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;

  const TextareaWidget({
    Key? key,
    required this.title,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.maxLines = 3,
    this.validator,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        controller ?? TextEditingController(text: initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: effectiveController,
          maxLines: maxLines,
          autovalidateMode: autovalidateMode,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.redAccent.withOpacity(0.8),
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(8),
            labelText: title,
            labelStyle: const TextStyle(fontSize: 14),
            floatingLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

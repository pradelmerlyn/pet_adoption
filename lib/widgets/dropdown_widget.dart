import 'package:flutter/material.dart';

class DropdownWidget extends FormField<String> {
  DropdownWidget({
    super.key,
    required String title,
    required List<String> choices,
    super.initialValue,
    ValueChanged<String?>? onChanged,
    super.validator,
    super.onSaved,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  }) : super(
          autovalidateMode: autoValidateMode,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: state.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    errorText: state.errorText,
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: choices.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    state.didChange(value);
                    onChanged?.call(value);
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
}

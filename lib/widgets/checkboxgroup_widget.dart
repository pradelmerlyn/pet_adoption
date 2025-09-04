import 'package:flutter/material.dart';

class CheckboxGroupWidget extends FormField<List<String>> {
  CheckboxGroupWidget({
    Key? key,
    required String title,
    required List<String> choices,
    List<String>? initialSelectedValues,
    FormFieldSetter<List<String>>? onSaved,
    FormFieldValidator<List<String>>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    ValueChanged<List<String>>? onChanged,
  }) : super(
          key: key,
          initialValue: initialSelectedValues ?? [],
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<List<String>> state) {
            final selected = state.value ?? [];

            void _toggle(String choice, bool? checked) {
              final updated = [...selected];
              if (checked == true) {
                updated.add(choice);
              } else {
                updated.remove(choice);
              }
              state.didChange(updated);
              onChanged?.call(updated);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: choices.map((choice) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: selected.contains(choice),
                          onChanged: (checked) => _toggle(choice, checked),
                        ),
                        Text(choice),
                      ],
                    );
                  }).toList(),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        );
}

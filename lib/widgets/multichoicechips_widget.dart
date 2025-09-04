import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';

class MultiChoiceChipWidget extends FormField<List<String>> {
  MultiChoiceChipWidget({
    super.key,
    required String title,
    required List<String> choices,
    List<String>? initialSelectedValues,
    Color? activeColor,
    Color? unselectedColor,
    super.onSaved,
    super.validator,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    ValueChanged<List<String>>? onChanged,
  }) : super(
          initialValue: initialSelectedValues ?? [],
          builder: (FormFieldState<List<String>> state) {
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
                Wrap(
                  spacing: 8.0,
                  children: choices.map((choice) {
                    final bool isSelected = state.value!.contains(choice);
                    return ChoiceChip(
                      label: Text(
                        choice,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      avatar: isSelected
                          ? const Icon(Icons.check,
                              color: Colors.white, size: 18)
                          : null,
                      selected: isSelected,
                      selectedColor: activeColor ?? AppColor.red,
                      backgroundColor: unselectedColor ?? Colors.grey[300],
                      onSelected: (bool selected) {
                        final currentValue = List<String>.from(state.value!);
                        if (selected && !currentValue.contains(choice)) {
                          currentValue.add(choice);
                        } else {
                          currentValue.remove(choice);
                        }
                        state.didChange(currentValue);
                        if (onChanged != null) {
                          onChanged(currentValue);
                        }
                      },
                    );
                  }).toList(),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(
                        color: Theme.of(state.context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

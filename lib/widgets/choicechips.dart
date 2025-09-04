import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';

class ChoiceChipWidget extends FormField<String> {
  ChoiceChipWidget({
    Key? key,
    required String title,
    required List<String> choices,
    String? initialValue,
    Color? activeColor,
    Color? inactiveColor,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    ValueChanged<String>? onChanged,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<String> state) {
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
                  spacing: 8.0,
                  children: choices.map((choice) {
                    return ChoiceChip(
                      label: Text(choice),
                      selectedColor: activeColor ?? AppColor.red,
                      backgroundColor: inactiveColor ?? Colors.grey[300],
                      labelStyle: TextStyle(
                        color: state.value == choice
                            ? Colors.white
                            : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      selected: state.value == choice,
                      onSelected: (bool selected) {
                        state.didChange(selected ? choice : null);
                        if (onChanged != null && selected) {
                          onChanged(choice);
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

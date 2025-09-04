import 'package:flutter/material.dart';

class RadiobuttonsWidgets extends FormField<String> {
  RadiobuttonsWidgets({
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
                Text(title, 
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 20,
                  children: choices.map((choice) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Radio<String>(
                            value: choice,
                            groupValue: state.value,
                            onChanged: (val) {
                              state.didChange(val);
                              if (onChanged != null) {
                                onChanged(val);
                              }
                            },
                            activeColor: Colors.blue, // ✅ Selected color
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                                horizontal: -2, vertical: -2),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(choice,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    );
                  }).toList(),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

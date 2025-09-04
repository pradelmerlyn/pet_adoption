import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart'; 

class CheckboxWidget extends FormField<bool> {
  CheckboxWidget({
    super.key,
    required String label,
    bool super.initialValue = false,
    super.onSaved,
    super.validator,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    ValueChanged<bool>? onChanged,
    Color activeColor = AppColor.red, 
    Color? checkColor,
  }) : super(
          builder: (FormFieldState<bool> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: Text(label),
                  value: state.value ?? false,
                  onChanged: (bool? newValue) {
                    state.didChange(newValue);
                    if (onChanged != null) {
                      onChanged(newValue!);
                    }
                  },
                  activeColor: activeColor, 
                  checkColor: checkColor,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  static final RegExp _validPhoneRegex = RegExp(r'^\d{4}-\d{3}-\d{4}$');

  /// Static validator function
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!_validPhoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (e.g., 0908-889-2124)';
    }
    return null;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters
    var digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Limit digits to 11 characters
    if (digitsOnly.length > 11) {
      digitsOnly = digitsOnly.substring(0, 11);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if (i == 3 || i == 6) {
        buffer.write('-');
      }
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

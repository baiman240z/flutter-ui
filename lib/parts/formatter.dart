import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
    ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;

    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + '-');
      if (newValue.selection.end >= 3)
        selectionIndex += 1;
    }

    if (newTextLength >= 8) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 7) + '-');
      if (newValue.selection.end >= 7) {
        selectionIndex++;
      }
    }

    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class TrimFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.trim(),
      selection: TextSelection.collapsed(offset: newValue.selection.end),
    );
  }
}

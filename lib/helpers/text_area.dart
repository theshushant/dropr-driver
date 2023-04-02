import 'package:flutter/material.dart';

class DroprTextArea extends StatelessWidget {
  final String? helpText;

  const DroprTextArea({
    Key? key,
    this.helpText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 3,
      maxLines: 5,
      controller: TextEditingController(text: helpText),
      readOnly: true,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

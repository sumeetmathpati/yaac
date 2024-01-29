import 'package:flutter/material.dart';

class UrlInputField extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLines;
  final bool expands;
  TextStyle? style;
  final Function(String)? onChanged;

  UrlInputField(
      {super.key,
      this.controller,
      this.maxLines = 1,
      this.expands = false,
      this.style,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    if (style == null) {
      style = Theme.of(context).textTheme!.bodySmall;
    }

    if (controller != null) {
      controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
    }

    return TextField(
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      expands: expands,
      style: Theme.of(context).textTheme!.bodySmall,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Theme.of(context).colorScheme.secondaryContainer,
        // focusColor: Theme.of(context).colorScheme.secondaryContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 0,
          ),
        ),
      ),
    );
  }
}

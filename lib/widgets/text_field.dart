import 'package:flutter/material.dart';

import 'constants.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLines;
  final bool expands;
  TextStyle? style;
  final String? hint;
  final String? label;
  final String? initialValue;
  final Function(String)? onChanged;
  VoidCallback? onEditingComplete;
  GestureTapCallback? onTap;
  TapRegionCallback? onTapOutside;

  TextFieldWidget({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.expands = false,
    this.style,
    this.onChanged,
    this.hint,
    this.label,
    this.initialValue,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    style ??= Theme.of(context).textTheme!.bodySmall;
    return TextFormField(
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      initialValue: initialValue,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      expands: expands,
      style: Theme.of(context).textTheme!.bodySmall,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Theme.of(context).colorScheme.secondaryContainer,
        // focusColor: Theme.of(context).colorScheme.secondaryContainer,
        border: inputBorder,
        enabledBorder: inputBorder,
        hintText: hint,
        labelText: label,
        focusedBorder: inputBorder,
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   borderSide: BorderSide(
        //     width: 1,
        //     color: Theme.of(context).colorScheme.primary,
        //   ),
        // ),
      ),
    );
  }
}

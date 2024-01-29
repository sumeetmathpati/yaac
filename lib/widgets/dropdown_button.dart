import 'package:flutter/material.dart';
import 'package:yaac/widgets/constants.dart';

class DropdownButtonWidget<T> extends StatelessWidget {

  final List<T?> options;
  final T? value;
  final ValueChanged<T?>? onChanged;

  const DropdownButtonWidget({super.key, required this.options, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.secondaryContainer, //background color of dropdown button
        border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer, width:3), //border of dropdown button
        borderRadius: BorderRadius.circular(16), //border raiuds of dropdown button
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton<T>(
          value: value,
          elevation: 16,
          underline: Container(
            height: 0,
          ),
          borderRadius: BorderRadius.circular(16),
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<T>>((T? option) {
            return DropdownMenuItem<T>(
              value: option,
              child: Text(option.displayText()),
            );
          }).toList(),
        ),
      ),
    );
  }
}



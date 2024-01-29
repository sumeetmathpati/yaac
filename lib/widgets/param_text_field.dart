import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/models/name_value.dart';
import 'package:yaac/widgets/text_field.dart';

import 'constants.dart';


class NameValueTextFieldWidget
    extends ConsumerWidget {

  final String? initialValue;
  final NameValueType type;
  final Function(String)? onChanged;


  const NameValueTextFieldWidget(
      {super.key,
        required this.type,
        this.initialValue,
        this.onChanged,
      });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    debugPrint('Building NameValueTextFieldWidget with initialValue: $initialValue');
    return TextFieldWidget(
      initialValue: initialValue,
      hint: type.hintName(),
      onTap: () { },
      onChanged: (val) {
        if (onChanged != null) {
          onChanged!(val);
        }
      },
    );
  }
}

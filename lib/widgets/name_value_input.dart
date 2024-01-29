import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/headers_provider.dart';
import 'package:yaac/models/name_value.dart';
import 'package:yaac/widgets/param_text_field.dart';

import '../data/params_controller_provider.dart';
import '../data/params_provider.dart';
import 'constants.dart';

class NameValueInput extends ConsumerWidget {

  final NameValue nameValue;
  final String id;
  final NameValueType type;

  const NameValueInput({
    super.key,
    required this.type,
    required this.nameValue,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    debugPrint('Building NameValueInput: ${nameValue.name}, ${nameValue.value}');
    NotifierProvider provider;
    AlwaysAliveRefreshable notifier;

    if (type == NameValueType.param) {
      provider = inputParamsProvider;
    } else {
      provider = inputHeadersProvider;
    }

    notifier = provider.notifier;
    return Row(
      children: [
        Checkbox(
            value: nameValue.active,
            onChanged: (value) {
              ref.watch(notifier).toggle(id);
            }),
        kWidth16,
        Expanded(
            child: NameValueTextFieldWidget(
              type: type,
              initialValue: nameValue.name,
              onChanged: (val) {
                  ref.read(nameValueNameInputControllerProvider.notifier).set(type, val, id);
                }
            )),
        kWidth16,
        Expanded(
            child: NameValueTextFieldWidget(
              type: type,
              initialValue: nameValue.value,
                onChanged: (val) {
                  ref.read(nameValueValueInputControllerProvider.notifier).set(type, val, id);
                }
            )),
        kWidth16,
      ],
    );
  }
}

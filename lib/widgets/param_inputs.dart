import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/params_provider.dart';
import 'package:yaac/widgets/name_value_input.dart';

import '../models/name_value.dart';
import 'constants.dart';

class ParamInputs extends ConsumerWidget {
  const ParamInputs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, NameValue> params = ref.watch(inputParamsProvider);

    debugPrint('Build Param inputs');
    return Column(
      children: [
        kHeight16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.watch(inputParamsProvider.notifier).addNew();
                },
                child: const Text('Add Param'))
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              kHeight16,
              ...params.entries.map((entry) {
                return Column(
                  children: [
                    NameValueInput(
                      type: NameValueType.param,
                      id: entry.key,
                      nameValue: entry.value,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      thickness: 1,
                    ),
                  ],
                );
              }).toList()
            ],
          ),
        ),
      ],
    );
  }
}

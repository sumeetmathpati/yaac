import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/headers_provider.dart';
import 'package:yaac/widgets/name_value_input.dart';

import '../models/name_value.dart';
import 'constants.dart';

class HeaderInputs extends ConsumerWidget {
  const HeaderInputs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, NameValue> headers = ref.watch(inputHeadersProvider);

    debugPrint('Build header inputs');
    return Column(
      children: [
        kHeight16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.watch(inputHeadersProvider.notifier).addNew();
                },
                child: const Text('Add Header'))
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              kHeight16,
              ...headers.entries.map((entry) {
                return Column(
                  children: [
                    NameValueInput(
                      type: NameValueType.header,
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

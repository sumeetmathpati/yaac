import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/request_method_provider.dart';
import 'package:yaac/data/request_url_provider.dart';
import 'package:yaac/widgets/constants.dart';
import 'package:yaac/widgets/url_input_field.dart';

import '../data/response_provider.dart';
import '../models/request_model.dart';
import 'dropdown_button.dart';

class RequestUrlInput extends ConsumerWidget {
  const RequestUrlInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController url = ref.watch(requestUrlProvider);

    RequestMethods requestMethod = ref.watch(requestMethodProvider);

    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer, //background color of dropdown button
            border: Border.all(
                color: Theme.of(context).colorScheme.secondaryContainer,
                width: 3), //border of dropdown button
            borderRadius:
                BorderRadius.circular(16), //border raiuds of dropdown button
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonWidget(
              options: RequestMethods.values,
              value: requestMethod,
              onChanged: (RequestMethods? v) {
                ref.read(requestMethodProvider.notifier).set(v);
              },
            ),
          ),
        ),
        kWidth16,
        Expanded(
          flex: 12,
          child: UrlInputField(
            controller: url,
            onChanged: (String value) {
              ref.watch(requestUrlProvider.notifier).set(value);
            },
          ),
        ),
        kWidth16,
        ElevatedButton(
          onPressed: () {
            ref.read(requestResponseProvider.notifier).getResponse();
          },
          child: Text('Send'),
        )
      ],
    );
  }
}

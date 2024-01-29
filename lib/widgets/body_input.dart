import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/body_provider.dart';
import 'package:yaac/data/text_input_type_provider.dart';
import 'package:yaac/widgets/bearer_token_input.dart';
import 'package:yaac/widgets/form_input.dart';
import 'package:yaac/widgets/text_input.dart';

import 'api_key_input.dart';
import 'basic_auth.dart';
import 'constants.dart';
import 'dropdown_button.dart';

class BodyInput extends ConsumerWidget {

  BodyInput({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    BodyOptions body = ref.watch(bodyProvider);
    TextBodyType textInputType = ref.watch(textInputTypeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DropdownButtonWidget(
              options: BodyOptions.values,
              value: body,
              onChanged: (option){
                ref.read(bodyProvider.notifier).set(option ?? body);
              },
            ),
            kWidth16,
            if (body == BodyOptions.text)
              DropdownButtonWidget(
                options: TextBodyType.values,
                value: textInputType,
                onChanged: (option){
                  ref.read(textInputTypeProvider.notifier).set(option ?? textInputType);
                },
              ),
          ],
        ),

        kHeight16,
        if (body == BodyOptions.form)
          FormInput(),
        if (body == BodyOptions.text)
          TextInput(),

      ],
    );
  }
}

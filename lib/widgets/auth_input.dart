import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/auth_provider.dart';
import 'package:yaac/models/name_value.dart';
import 'package:yaac/widgets/bearer_token_input.dart';
import 'package:yaac/widgets/text_field.dart';

import 'api_key_input.dart';
import 'basic_auth.dart';
import 'constants.dart';
import 'dropdown_button.dart';

class AuthInput extends ConsumerWidget {

  AuthInput({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    AuthOptions auth = ref.watch(authProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonWidget(
          options: AuthOptions.values,
          value: auth,
          onChanged: (option){
            ref.read(authProvider.notifier).set(option ?? auth);
          },
        ),
        kHeight16,
        if (auth == AuthOptions.basicAuth)
          BasicAuthWidget(),

        if (auth == AuthOptions.bearerToken)
          BearerTokenWidget(),

        if (auth == AuthOptions.apiKey)
          ApiKeyInput(),
      ],
    );
  }
}

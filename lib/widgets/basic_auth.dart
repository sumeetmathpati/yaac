import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/auth_provider.dart';
import 'package:yaac/models/name_value.dart';
import 'package:yaac/widgets/text_field.dart';

import 'constants.dart';
import 'dropdown_button.dart';

class BasicAuthWidget extends ConsumerWidget {

  BasicAuthWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFieldWidget(hint: 'Username',),
        Divider(
          color: Theme.of(context).colorScheme.secondaryContainer,
          thickness: 1,
        ),
        kHeight16,
        TextFieldWidget(hint: 'Password',),
        Divider(
          color: Theme.of(context).colorScheme.secondaryContainer,
          thickness: 1,
        )
      ],
    );
  }
}

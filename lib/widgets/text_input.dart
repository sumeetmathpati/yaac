import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/auth_provider.dart';
import 'package:yaac/models/name_value.dart';
import 'package:yaac/widgets/text_field.dart';

import 'constants.dart';
import 'dropdown_button.dart';

class TextInput extends ConsumerWidget {

  TextInput({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final controller = CodeController(
    );

    return Expanded(
      child: CodeTheme(
        data: CodeThemeData(
          styles: codeTheme,
        ),
        child: CodeField(
          controller: controller,
          expands: true,
          maxLines: null,
        ),
      ),
    );
  }
}

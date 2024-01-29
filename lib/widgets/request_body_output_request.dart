import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/response_provider.dart';
import 'package:yaac/widgets/async_value_widget.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/monokai.dart';

import 'constants.dart';

class RequestBodyOutputRequest extends ConsumerWidget {


  const RequestBodyOutputRequest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Response<dynamic>?> response =
        ref.watch(requestResponseProvider);

    return AsyncValueWidget(
      value: response,
      data: (Response<dynamic>? response) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(),
        );
      },
    );
  }
}

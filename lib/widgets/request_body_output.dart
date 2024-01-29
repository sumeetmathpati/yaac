import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/response_provider.dart';
import 'package:yaac/widgets/async_value_widget.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:yaac/widgets/request_body_output_request.dart';
import 'package:yaac/widgets/request_body_output_response.dart';

import 'constants.dart';

class RequestBodyOutput extends ConsumerWidget {


  const RequestBodyOutput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Response<dynamic>?> response =
        ref.watch(requestResponseProvider);

    return AsyncValueWidget(
      value: response,
      data: (Response<dynamic>? response) {
        TextEditingController outputController = TextEditingController();

        final controller = CodeController(
          language: json,
        );

        if (response != null) {
          controller.text = response.data.toString();
        }

        return DefaultTabController(
          length: 2,
          child: Expanded(
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Response'),
                    Tab(text: 'Request'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      RequestBodyOutputResponse(),
                      RequestBodyOutputRequest(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

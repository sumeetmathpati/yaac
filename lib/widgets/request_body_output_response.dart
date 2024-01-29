import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaac/data/response_provider.dart';
import 'package:yaac/widgets/async_value_widget.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/monokai.dart';

import 'constants.dart';

class RequestBodyOutputResponse extends ConsumerWidget {
  const RequestBodyOutputResponse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Response<dynamic>?> response = ref.watch(requestResponseProvider);

    return AsyncValueWidget(
      value: response,
      data: (Response<dynamic>? response) {

        final controller = CodeController(
          language: json,
        );

        if (response != null) {
          controller.text = response.headers.toString();
          controller.text = controller.text + "\n" + response.data.toString();
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${response?.statusCode.toString() ?? ""} ${response?.statusMessage ?? ""}",
                    style: TextStyle(
                        color: _colorForStatus(
                          context,
                          response?.statusCode,
                        ),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.copy)),
                      kWidth16,
                      Checkbox(value: false, onChanged: (vale){}),
                      const Text('Show headers')
                    ],
                  ),

                ],
              ),
              // Text(ref.watch(requestResponseProvider.notifier).headers(), maxLines: 6,),
              Expanded(
                child: response != null ? CodeTheme(
                  data: CodeThemeData(
                    styles: codeTheme,
                  ),
                  child: CodeField(
                    readOnly: true,
                    controller: controller,
                    expands: true,
                    maxLines: null,
                    // decoration: InputDecoration(
                    //   border: InputBorder.none,
                    //   enabledBorder: InputBorder.none,
                    //   focusedBorder: InputBorder.none,
                    // ),
                  ),
                ) : Center(child: Text('No Reponse, try sending a request.'),),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _colorForStatus(BuildContext context, int? statusCode) {
    if (statusCode == null) {
      return Theme.of(context).colorScheme.onBackground;
    }
    // For 1XX, and 2XX
    if (statusCode < 300) {
      return Colors.greenAccent;
    }

    // For 3XX
    if (statusCode < 400) {
      return Colors.blueAccent;
    }
    return Colors.redAccent;
  }
}

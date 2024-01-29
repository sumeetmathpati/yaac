import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaac/data/headers_provider.dart';
import 'package:yaac/data/params_provider.dart';

import '../models/name_value.dart';
part 'params_controller_provider.g.dart';

@riverpod
class NameValueNameInputController extends _$NameValueNameInputController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  void set(NameValueType type, String value, String id) {
    if (type == NameValueType.param) {
      ref.read(inputParamsProvider.notifier).setName(id, value);
    } else if (type == NameValueType.header) {
      ref.read(inputHeadersProvider.notifier).setName(id, value);
    }
  }
}

@riverpod
class NameValueValueInputController extends _$NameValueValueInputController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  void set(NameValueType type, String value, String id) {
    if (type == NameValueType.param) {
      ref.read(inputParamsProvider.notifier).setValue(id, value);
    } else if (type == NameValueType.header) {
      ref.read(inputHeadersProvider.notifier).setValue(id, value);
    }
  }
}

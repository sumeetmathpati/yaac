

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:yaac/data/params_provider.dart';
import 'package:yaac/models/name_value.dart';

import '../widgets/constants.dart';
part 'request_url_provider.g.dart';



@riverpod
class RequestUrl extends _$RequestUrl {

  @override
  TextEditingController build() {
    // The logic we previously had in our FutureProvider is now in the build method.
    return TextEditingController();
  }

  void setString(String data) {
    final newController = TextEditingController.fromValue(state.value);
    newController.text = data;
    state = newController;
  }

  String get() {
    return state.text;
  }

  void set(String value) {
    debugPrint('Setting url to $value');
    final newController = TextEditingController.fromValue(state.value);
    newController.text = value;
    state = newController;

    var uri = Uri.parse(value);
    Map<String, NameValue> params = {};
    uri.queryParametersAll.forEach((String key, List<String> value) {
      value.forEach((String element) {
        params[getUuid4()] = NameValue(name: key, value: element);
      });
    });

    ref.read(inputParamsProvider.notifier).state = params;
  }
}
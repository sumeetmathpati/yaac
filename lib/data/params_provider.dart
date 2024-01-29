import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaac/data/request_url_provider.dart';
import 'package:yaac/widgets/constants.dart';

import '../models/name_value.dart';
part 'params_provider.g.dart';

@Riverpod(keepAlive: true)
class InputParams extends _$InputParams {
  @override
  Map<String, NameValue> build() {
    return {
      getUuid4(): NameValue(name: "1", value: "2"),
      getUuid4(): NameValue(name: "3", value: "4"),
      getUuid4(): NameValue(name: "5", value: "6"),
      getUuid4(): NameValue(name: "7", value: "8"),
    };
  }

  void setString() {
  }

  void toggle(String id) {
    if (state.containsKey(id)) {
      state.remove(id);
      state = Map<String, NameValue>.from(state);

      var newState = Map<String, NameValue>.from(state);
      newState[id]!.active = !(newState[id]!.active);
      state = newState;
    }
  }

  void remove(String id) {
    if (state.containsKey(id)) {
      state.remove(id);
      state = Map<String, NameValue>.from(state);
    }
  }

  void addNew() {
    var newState = Map<String, NameValue>.from(state);
    newState[getUuid4()] = NameValue(name: '', value: '');
    state = newState;
  }

  void setName(String id, String name) {
    if (state[id] != null) {
      debugPrint(
          "Setting param name, from '${state[id]!.name}' to '$name'");
      state[id]!.name = name;
      state = Map<String, NameValue>.from(state);
      updateUrl();
    }
  }

  void setValue(String id, String value) {
    if (state[id] != null) {
      debugPrint(
          "Setting param value, from '${state[id]!.value}' to '$value'");
      state[id]!.value = value;
      state = Map<String, NameValue>.from(state);
      updateUrl();
    }
  }

  void updateUrl() {
    String url = ref.read(requestUrlProvider.notifier).get();
    var uri = Uri.parse(url);
    Map<String, List<String>> params = {};

    state.forEach((key, value) {
      if (params.containsKey(value.name)) {
        params[value.name]!.add(value.value);
      } else {
        params[value.name] = [value.value];
      }
    });

    Uri new_uri = Uri(scheme: uri.scheme, userInfo: uri.userInfo, host: uri.host, path: uri.path, queryParameters: params);
    ref.read(requestUrlProvider.notifier).set(new_uri.toString());
  }
}

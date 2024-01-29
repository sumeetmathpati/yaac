import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaac/widgets/constants.dart';

import '../models/name_value.dart';
part 'headers_provider.g.dart';

@Riverpod(keepAlive: true)
class InputHeaders extends _$InputHeaders {
  @override
  Map<String, NameValue> build() {
    // The logic we previously had in our FutureProvider is now in the build method.

    return {
      getUuid4(): NameValue(name: "1", value: "2"),
      getUuid4(): NameValue(name: "3", value: "4"),
      getUuid4(): NameValue(name: "5", value: "6"),
      getUuid4(): NameValue(name: "7", value: "8"),
    };
  }

  void setString() {}

  void toggle(String id) {
    if (state.containsKey(id)) {
      var newState = Map<String, NameValue>.from(state);
      newState[id]!.active = !(newState[id]!.active);
      state = newState;
    }
  }

  void remove(String id) {
    if (state.containsKey(id)) {
      var newState = Map<String, NameValue>.from(state);
      newState.remove(id);
      state = newState;
    }
  }

  void addNew() {
    var newState = Map<String, NameValue>.from(state);
    newState[getUuid4()] = NameValue(name: 'name', value: 'value');
    state = newState;
  }

  void setName(String id, String name) {
    if (state[id] != null) {
      debugPrint("Setting header name, from '${state[id]!.name}' to '$name'");
      state[id]!.name = name;
      state = Map<String, NameValue>.from(state);
    }
  }

  void setValue(String id, String value) {
    debugPrint("Setting header at id $id value to '$value'");
    if (state[id] != null) {
      debugPrint(
          "Setting header value, from '${state[id]!.value}' to '$value'");
      state[id]!.value = value;
      state = Map<String, NameValue>.from(state);
    }
  }
}

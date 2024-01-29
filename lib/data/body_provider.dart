

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:yaac/data/request_url_provider.dart';

import '../widgets/constants.dart';
part 'body_provider.g.dart';



@riverpod
class Body extends _$Body {

  @override
  BodyOptions build() {
    return BodyOptions.none;
  }

  void set(BodyOptions option) {
    state = option;
  }

}
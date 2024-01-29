

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:yaac/data/request_url_provider.dart';

import '../widgets/constants.dart';
part 'text_input_type_provider.g.dart';



@riverpod
class TextInputType extends _$TextInputType {

  @override
  TextBodyType build() {
    return TextBodyType.plain;
  }

  void set(TextBodyType option) {
    state = option;
  }

}


import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../widgets/constants.dart';
part 'request_method_provider.g.dart';



@riverpod
class RequestMethod extends _$RequestMethod {

  @override
  RequestMethods build() {
    return RequestMethods.get;
  }

  void set(RequestMethods? method) {
    if (method != null)  {
      state = method;
    }
  }

}
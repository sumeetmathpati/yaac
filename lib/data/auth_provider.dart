

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:yaac/data/request_url_provider.dart';

import '../widgets/constants.dart';
part 'auth_provider.g.dart';



@riverpod
class Auth extends _$Auth {

  @override
  AuthOptions build() {
    return AuthOptions.none;
  }

  void set(AuthOptions option) {
    state = option;
  }

}
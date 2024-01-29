

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:yaac/data/request_method_provider.dart';
import 'package:yaac/data/request_url_provider.dart';

import '../widgets/constants.dart';
part 'response_provider.g.dart';



@riverpod
class RequestResponse extends _$RequestResponse {

  @override
  Future<Response<dynamic>?> build() async {
    return null;
  }

  void getResponse() async {
    String url = ref.watch(requestUrlProvider.notifier).get();
    RequestMethods method = ref.watch(requestMethodProvider);

    final dio = Dio();
    debugPrint('Fetching $url');

    Response response;

    if (method == RequestMethods.get) {
      response = await dio.get(url);
    } else if (method == RequestMethods.head) {
      response = await dio.head(url);
    } else if (method == RequestMethods.post) {
      response = await dio.post(url);
    } else if (method == RequestMethods.put) {
      response = await dio.put(url);
    } else if (method == RequestMethods.patch) {
      response = await dio.patch(url);
    } else if (method == RequestMethods.delete) {
      response = await dio.delete(url);
    } else {
      response = await dio.get(url);
    }

    print(response.headers);
    state = AsyncData(response);
  }

}
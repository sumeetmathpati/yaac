import 'package:flutter/cupertino.dart';

import 'name_value.dart';

enum RequestMethod { get, head, post, put, patch, delete, options }

class RequestModel {
  TextEditingController url;
  RequestMethod method;
  Map<String, NameValue> params;
  Map<String, NameValue> headers;

  RequestModel({
    required this.url,
    this.method = RequestMethod.get,
    this.params = const {},
    this.headers = const {},
  });
}

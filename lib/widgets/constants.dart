

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const padding8 = EdgeInsets.all(8);
const padding16 = EdgeInsets.all(16);
const kWidth16 = SizedBox(width: 16);
const kHeight16 = SizedBox(height: 16);
final borderRadius16 = BorderRadius.circular(16);

enum AuthOptions {
  none,
  basicAuth,
  bearerToken,
  apiKey
}

enum BodyOptions {
  none,
  text,
  form,
}

enum TextBodyType {
  plain,
  json,
  yaml,
  xml,
}

enum RequestMethods {
  get,
  head,
  post,
  put,
  patch,
  delete,
  options,
}

Map<dynamic, String> displayTextMap = {
  AuthOptions.none.name: "None",
  AuthOptions.apiKey.name: "API Key",
  AuthOptions.basicAuth.name: "Basic Auth",
  AuthOptions.bearerToken.name: "Bearer Token",
  BodyOptions.none.name: "None",
  BodyOptions.text.name: "Text",
  BodyOptions.form.name: "Form",
};


extension StringExtension on String {

  String displayText() {
    if (displayTextMap.containsKey(this)) {
      return displayTextMap[this] ?? "";
    }
    return titleCase();
  }

  String titleCase() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension ObjectExtention on Object? {
  String displayText() {
    if (this is AuthOptions) {
      if (displayTextMap.containsKey((this as AuthOptions).name)) {
        return displayTextMap[(this as AuthOptions).name] ?? "";
      }
      return (this as AuthOptions).name;
    }

    if (this is RequestMethods) {
      return (this as RequestMethods).name.toString().toUpperCase();
    }
    return this.toString();
  }
}

final inputBorder = OutlineInputBorder(
  borderRadius: borderRadius16,
  borderSide: const BorderSide(
    width: 1,
    color: Colors.transparent,
  ),
);

var uuid = const Uuid();
String getUuid4() {
  return uuid.v4();
}

final Map<String, TextStyle> codeTheme = const {
  'root': TextStyle(
    backgroundColor: Colors.transparent,
    color: Color(0xffdddddd),
  ),
  'tag': TextStyle(color: Color(0xfff92672)),
  'keyword': TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
  'selector-tag':
  TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
  'literal': TextStyle(color: Color(0xfff92672), fontWeight: FontWeight.bold),
  'strong': TextStyle(color: Color(0xfff92672)),
  'name': TextStyle(color: Color(0xfff92672)),
  'code': TextStyle(color: Color(0xff66d9ef)),
  'attribute': TextStyle(color: Color(0xffbf79db)),
  'symbol': TextStyle(color: Color(0xffbf79db)),
  'regexp': TextStyle(color: Color(0xffbf79db)),
  'link': TextStyle(color: Color(0xffbf79db)),
  'string': TextStyle(color: Color(0xffa6e22e)),
  'bullet': TextStyle(color: Color(0xffa6e22e)),
  'subst': TextStyle(color: Color(0xffa6e22e)),
  'title': TextStyle(color: Color(0xffa6e22e), fontWeight: FontWeight.bold),
  'section': TextStyle(color: Color(0xffa6e22e), fontWeight: FontWeight.bold),
  'emphasis': TextStyle(color: Color(0xffa6e22e)),
  'type': TextStyle(color: Color(0xffa6e22e), fontWeight: FontWeight.bold),
  'built_in': TextStyle(color: Color(0xffa6e22e)),
  'builtin-name': TextStyle(color: Color(0xffa6e22e)),
  'selector-attr': TextStyle(color: Color(0xffa6e22e)),
  'selector-pseudo': TextStyle(color: Color(0xffa6e22e)),
  'addition': TextStyle(color: Color(0xffa6e22e)),
  'variable': TextStyle(color: Color(0xffa6e22e)),
  'template-tag': TextStyle(color: Color(0xffa6e22e)),
  'template-variable': TextStyle(color: Color(0xffa6e22e)),
  'comment': TextStyle(color: Color(0xff75715e)),
  'quote': TextStyle(color: Color(0xff75715e)),
  'deletion': TextStyle(color: Color(0xff75715e)),
  'meta': TextStyle(color: Color(0xff75715e)),
  'doctag': TextStyle(fontWeight: FontWeight.bold),
  'selector-id': TextStyle(fontWeight: FontWeight.bold),
};
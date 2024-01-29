import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaac/widgets/constants.dart';

import '../models/files.dart';
import '../models/name_value.dart';
part 'files_provider.g.dart';

@Riverpod(keepAlive: true)
class Files extends _$Files {

  @override
  FileModel build() {

    String home = "";
    Map<String, String> envVars = Platform.environment;

    if (Platform.isMacOS) {
      home = envVars['HOME'] ?? "";
    } else if (Platform.isLinux) {
      home = envVars['HOME'] ?? "";
    }
    return FileModel(dir: Directory(home));
  }

}

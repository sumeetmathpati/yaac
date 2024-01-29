

import 'dart:io';

import 'package:flutter/material.dart';

class FileModel{

  Directory dir;
  List<String> files;

  FileModel({required this.dir, this.files = const[]});

  List<FileSystemEntity> list() {
    return dir.listSync();
  }
}

extension FileSystemEntityExtension on FileSystemEntity {
  String type() {
    if (this is File) {
      return this.uri.pathSegments.last;
    } else {
      return this.path.split(Platform.pathSeparator).last;
    }
  }

  Icon icon() {
    if (this is File) {
      return const Icon(Icons.note_outlined);
    } else {
      return const Icon(Icons.folder_outlined);
    }
  }
}
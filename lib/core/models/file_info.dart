import 'dart:io';

import 'package:flutter/foundation.dart';

/// Represents information about image that will be used to upload
class FileInfo {
  /// name of this file
  final String name;

  /// url of this file
  String url;

  /// file data
  final File file;

  /// mime file type
  final String mimeType;

  int fileSize;

  FileInfo.fromData({
    @required this.name,
    @required this.file,
    @required this.mimeType,
  })  : fileSize = file?.lengthSync(),
        url = null;

  FileInfo.fromUrl({
    @required this.url,
    @required this.mimeType,
    this.fileSize,
    this.name,
  }) : file = null;

  bool get hasBinary => file != null;
  bool get hasSource => file != null || (url != null && url != '');
}

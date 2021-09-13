import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:system_alert_window/models/system_window_padding.dart';
import 'package:system_alert_window/system_alert_window.dart';

class SystemWindowImageButton {
  static const int MATCH_PARENT = -1;
  static const int WRAP_CONTENT = -2;

  Uint8List image;
  double size;
  SystemWindowPadding padding;
  String tag;
  int width;
  int height;

  SystemWindowImageButton(
      {@required this.image,
      this.size,
      this.padding,
      this.tag,
      this.width,
      this.height})
      : assert(image != null);

  Map<String, dynamic> getMap() {
    final Map<String, dynamic> map = <String, dynamic>{
      'image': image,
      'size': size ?? 14.0,
      'padding': padding?.getMap(),
      'tag': tag,
      'width': width ?? WRAP_CONTENT,
      'height': height ?? WRAP_CONTENT,
    };
    return map;
  }
}

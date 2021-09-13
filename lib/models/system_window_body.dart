import 'package:system_alert_window/models/system_window_decoration.dart';
import 'package:system_alert_window/models/system_window_botton_image.dart';
import 'package:system_alert_window/models/system_window_margin.dart';
import 'package:system_alert_window/models/system_window_padding.dart';
import 'package:system_alert_window/models/system_window_text.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:system_alert_window/utils/commons.dart';

class SystemWindowBody {
  List<EachRow> rows;
  SystemWindowPadding padding;
  SystemWindowDecoration decoration;

  SystemWindowBody({this.rows, this.padding, this.decoration});

  Map<String, dynamic> getMap() {
    final Map<String, dynamic> map = <String, dynamic>{
      'rows': (rows == null)
          ? null
          : List<dynamic>.from(rows.map((x) => x?.getMap())),
      'padding': padding?.getMap(),
      'decoration': decoration?.getMap()
    };
    return map;
  }
}

class EachRow {
  List<EachColumn> columns;
  SystemWindowPadding padding;
  SystemWindowMargin margin;
  ContentGravity gravity;
  SystemWindowDecoration decoration;

  EachRow(
      {this.columns, this.padding, this.margin, this.gravity, this.decoration});

  Map<String, dynamic> getMap() {
    final Map<String, dynamic> map = <String, dynamic>{
      'columns': (columns == null)
          ? null
          : List<dynamic>.from(columns.map((x) => x?.getMap())),
      'padding': padding?.getMap(),
      'margin': margin?.getMap(),
      'gravity': Commons.getContentGravity(gravity),
      'decoration': decoration?.getMap()
    };
    return map;
  }
}

class EachColumn {
  SystemWindowText text;
  SystemWindowImageButton imgBtn;
  SystemWindowPadding padding;
  SystemWindowMargin margin;
  SystemWindowDecoration decoration;
  int widgetStyle = 0; //控件类型 文本 按键0文本，1按键

  EachColumn(
      {this.widgetStyle = 0,
      this.text,
      this.imgBtn,
      this.padding,
      this.margin,
      this.decoration});

  Map<String, dynamic> getMap() {
    final Map<String, dynamic> map = <String, dynamic>{
      'widgetStyle': widgetStyle,
      'text': text?.getMap(),
      'imgBtn': imgBtn?.getMap(),
      'padding': padding?.getMap(),
      'margin': margin?.getMap(),
      'decoration': decoration?.getMap()
    };
    return map;
  }
}

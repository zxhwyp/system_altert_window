import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isShowingWindow = false;
  bool _isUpdatedWindow = false;
  SystemWindowPrefMode prefMode = SystemWindowPrefMode.OVERLAY;

  @override
  void initState() {
    super.initState();
    _initPlatformState();
    _requestPermissions();
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SystemAlertWindow.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _requestPermissions() async {
    await SystemAlertWindow.requestPermissions(prefMode: prefMode);
  }

  void _showOverlayWindow() async {
    if (await canLaunch('youkuad://')) {
      Future.delayed(Duration(seconds: 2), () async {
        await launch('youkuad://');
      });
    }
    Uint8List uint8list =
        (await rootBundle.load('assets/images/test.png')).buffer.asUint8List();
    if (!_isShowingWindow) {
      SystemWindowBody body = SystemWindowBody(
        rows: [
          EachRow(columns: [
            EachColumn(
                text: SystemWindowText(
                    text: "自由模式",
                    fontSize: 12,
                    textColor: Colors.black87,
                    fontWeight: FontWeight.BOLD),
                padding: SystemWindowPadding.setSymmetricPadding(6, 8),
                decoration: SystemWindowDecoration(
                    startColor: Colors.black12, borderRadius: 25.0),
                margin: SystemWindowMargin(top: 4)),
          ], gravity: ContentGravity.CENTER),
          EachRow(
            margin: SystemWindowMargin.setSymmetricMargin(20, 0),
            columns: [
              EachColumn(
                  widgetStyle: 1,
                  margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                  imgBtn: SystemWindowImageButton(
                      width: 25,
                      height: 25,
                      image: uint8list,
                      size: 30,
                      tag: 'simple_button')),
              EachColumn(
                  widgetStyle: 1,
                  margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                  imgBtn: SystemWindowImageButton(
                      width: 25,
                      height: 25,
                      image: uint8list,
                      size: 30,
                      tag: 'simple_button')),
              EachColumn(
                  widgetStyle: 1,
                  margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                  imgBtn: SystemWindowImageButton(
                      width: 25,
                      height: 25,
                      image: uint8list,
                      size: 30,
                      tag: 'simple_button')),
            ],
            gravity: ContentGravity.CENTER,
          ),
          EachRow(
            columns: [
              EachColumn(
                margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                text: SystemWindowText(
                    text: "00\n\n力量", fontSize: 10, textColor: Colors.black45),
              ),
              EachColumn(
                margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                text: SystemWindowText(
                    text: "00\n\n力量", fontSize: 10, textColor: Colors.black45),
              ),
              EachColumn(
                margin: SystemWindowMargin.setSymmetricMargin(0, 10),
                text: SystemWindowText(
                    text: "00\n\n力量", fontSize: 10, textColor: Colors.black45),
              ),
            ],
            gravity: ContentGravity.CENTER,
          )
        ],
        padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
      );
      SystemAlertWindow.showSystemWindow(
          height: 160,
          width: 220,
          body: body,
          margin: SystemWindowMargin(left: 8, right: 8, top: 200, bottom: 0),
          gravity: SystemWindowGravity.CENTER,
          notificationTitle: "Incoming Call",
          notificationBody: "+1 646 980 4741",
          prefMode: prefMode);
      setState(() {
        _isShowingWindow = true;
      });
    } else if (!_isUpdatedWindow) {
      SystemWindowBody body = SystemWindowBody(
        rows: [
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: "Updated body",
                    fontSize: 12,
                    textColor: Colors.black45),
              ),
            ],
            gravity: ContentGravity.CENTER,
          ),
          EachRow(columns: [
            EachColumn(
                text: SystemWindowText(
                    text: "Updated long data of the body",
                    fontSize: 12,
                    textColor: Colors.black87,
                    fontWeight: FontWeight.BOLD),
                padding: SystemWindowPadding.setSymmetricPadding(6, 8),
                decoration: SystemWindowDecoration(
                    startColor: Colors.black12, borderRadius: 25.0),
                margin: SystemWindowMargin(top: 4)),
          ], gravity: ContentGravity.CENTER),
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: "Notes", fontSize: 10, textColor: Colors.black45),
              ),
            ],
            gravity: ContentGravity.LEFT,
            margin: SystemWindowMargin(top: 8),
          ),
          EachRow(
            columns: [
              EachColumn(
                text: SystemWindowText(
                    text: "Updated random notes.",
                    fontSize: 13,
                    textColor: Colors.black54,
                    fontWeight: FontWeight.BOLD),
              ),
            ],
            gravity: ContentGravity.LEFT,
          ),
        ],
        padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
      );
      SystemAlertWindow.updateSystemWindow(
          height: 230,
          body: body,
          margin: SystemWindowMargin(left: 8, right: 8, top: 200, bottom: 0),
          gravity: SystemWindowGravity.TOP,
          notificationTitle: "Outgoing Call",
          notificationBody: "+1 646 980 4741",
          prefMode: prefMode);
      setState(() {
        _isUpdatedWindow = true;
      });
    } else {
      setState(() {
        _isShowingWindow = false;
        _isUpdatedWindow = false;
      });
      SystemAlertWindow.closeSystemWindow(prefMode: prefMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('System Alert Window Example App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MaterialButton(
                  onPressed: _showOverlayWindow,
                  textColor: Colors.white,
                  child: !_isShowingWindow
                      ? Text("Show system alert window")
                      : !_isUpdatedWindow
                          ? Text("Update system alert window")
                          : Text("Close system alert window"),
                  color: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
/// Whenever a button is clicked, this method will be invoked with a tag (As tag is unique for every button, it helps in identifying the button).
/// You can check for the tag value and perform the relevant action for the button click
///
void callBack(String tag) {
  print(tag);
  switch (tag) {
    case "simple_button":
    case "updated_simple_button":
      SystemAlertWindow.closeSystemWindow(
          prefMode: SystemWindowPrefMode.OVERLAY);
      break;
    case "focus_button":
      print("Focus button has been called");
      break;
    default:
      print("OnClick event of $tag");
  }
}

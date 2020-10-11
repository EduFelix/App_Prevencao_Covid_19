import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoTreis extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vídeos"),
      ),
      body: WebView(
        initialUrl: "https://www.youtube.com/watch?v=LwUjglzIUhc",

      ),
    );
  }
}

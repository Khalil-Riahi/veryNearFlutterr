import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String payUrl;
  const WebViewScreen({Key? key, required this.payUrl}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"),),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.payUrl)),
          onWebViewCreated: (controller){
            webViewController = controller;
          },
        ),
      ),
      // body: ,
    );
  }
}

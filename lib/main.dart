import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(const FixamApp());
}

class FixamApp extends StatelessWidget {
  const FixamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fixam Application',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const FixamWebView(),
    );
  }
  
}

class FixamWebView extends StatefulWidget {
  const FixamWebView({Key? key}) : super(key: key);

  @override
  State<FixamWebView> createState() => _FixamWebViewState();
}

class _FixamWebViewState extends State<FixamWebView> {
  WebViewController controller = WebViewController();

  @override
  void initState(){
    super.initState();
    controller..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => {},
          onPageStarted: (url) {},
          onPageFinished: (url) {},
        ),
      )
      ..loadRequest(Uri.parse('https://www.fixam.africa'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Fixam Africa'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}




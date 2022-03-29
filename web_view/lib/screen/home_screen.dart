import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  final url = 'https://github.com/jemmajeon';
  // 널이 가능한 WebviewController
  WebViewController? controller;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(37, 41, 46, 1),
        elevation: 0,
        title: const Text('My Github'),
        // 안드로이드와 iOS 세팅값이 다름
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (controller == null) return;
                controller!.loadUrl(url);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: WebView(
        // 처음 시작할 때 WebViewController를 불러옴
        // on : 어떤 행동을 시작했을 때
        onWebViewCreated: (WebViewController controller) {
          // 상단에 선언한 context의 controller가 곧 이 controller
          this.controller = controller;
        },
        initialUrl: url,
        // 자바스크립트 사용 중지를 풀어줌
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

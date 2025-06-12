/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 15:10:19
 * @FilePath: /flutter_mvvm/library_base/lib/page/web_view_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:library_base/widget/button/back_button.dart';
import 'package:library_base/utils/toast_util.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';

class WebViewPage extends StatefulWidget {
  final String? url;
  final String? title;

  const WebViewPage(this.url, this.title, {super.key});
  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url!))
      ..addJavaScriptChannel('method',
          onMessageReceived: (JavaScriptMessage message) {
        ToastUtil.success(message.message);
      });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        final bool canGoBack = await _controller.canGoBack();
        if (canGoBack) {
          // 网页可以返回时，优先返回上一页
          await _controller.goBack();
          return Future.value(false);
        } else {
          // 网页无法返回时，关闭页面
          return Future.value(true);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const BackButtonEx(),
            elevation: 1,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light),
            backgroundColor: Colours.white,
            centerTitle: true,
            title: Text(widget.title ?? '', style: TextStyles.textBlack18),
          ),
          body: WebViewWidget(controller: _controller)),
    );
  }
}

/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:15:13
 * @FilePath: /flutter_mvvm/library_base/lib/router/app_analysis.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/utils/device_util.dart';

//埋点拦截器
class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (!DeviceUtil.isMobile) {
      return;
    }

    if (previousRoute != null && previousRoute.settings.name != null) {
      print("onPageEnd");
    }

    if (route.settings.name != null) {
      print("onPageStart");
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (!DeviceUtil.isMobile) {
      return;
    }

    if (route.settings.name != null) {
      print("onPageEnd");
    }

    if (previousRoute != null && previousRoute.settings.name != null) {
      print("onPageStart");
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (!DeviceUtil.isMobile) {
      return;
    }

    if (oldRoute != null && oldRoute.settings.name != null) {
      print("onPageEnd");
    }

    if (newRoute != null && newRoute.settings.name != null) {
      print("onPageStart");
    }
  }
}

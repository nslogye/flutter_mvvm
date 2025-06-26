/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:21:33
 * @FilePath: /flutter_mvvm/library_base/lib/net/intercept.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:library_base/global/rt_account.dart';
import 'package:library_base/model/account.dart';
import 'package:library_base/net/apis.dart';
import 'package:library_base/utils/channel_util.dart';
import 'package:library_base/utils/date_util.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/encrypt_util.dart';
import 'package:package_info/package_info.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String timestamp = (DateUtil.getNowDateMs() * 1000).toString();

    if (DeviceUtil.isWeb) {
      String version = '1.0.0';
      String language =
          WidgetsBinding.instance.platformDispatcher.locale.toString();
      String channel = 'official';

      options.headers[Apis.KEY_VER] = version;
      options.headers[Apis.KEY_LANGUAGE] = language;
      options.headers[Apis.KEY_CHANNEL] = channel;
    } else if (DeviceUtil.isDesktop) {
      String version = '1.0.0';
      String language =
          WidgetsBinding.instance.platformDispatcher.locale.toString();
      String channel = 'official';
      options.headers[Apis.KEY_VER] = version;
      options.headers[Apis.KEY_LANGUAGE] = language;
      options.headers[Apis.KEY_CHANNEL] = channel;
    } else {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String? version = packageInfo.version;
      String language =
          WidgetsBinding.instance.platformDispatcher.locale.toString();
      String dev = DeviceUtil.isAndroid
          ? 'Android'
          : (DeviceUtil.isIOS ? 'iOS' : 'Other');
      String channel = await ChannelUtil.getChannel();

      options.headers[Apis.KEY_VER] = version;
      options.headers[Apis.KEY_LANGUAGE] = language;
      options.headers[Apis.KEY_CHANNEL] = channel;
    }

    if (RTAccount().isLogin()) {
      Account? account = RTAccount().getActiveAccount();
      String sign =
          EncryptUtil.encodeAes(account?.token, "", timestamp).substring(0, 64);
      options.headers[Apis.KEY_USER_TOKEN] = account?.token;
      options.headers[Apis.KEY_USER_U_ID] = account?.account_id.toString();
    } else {
      options.headers[Apis.KEY_USER_TOKEN] = '';
      options.headers[Apis.KEY_USER_U_ID] = '';
    }

    super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }
}

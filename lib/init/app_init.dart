/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:35:06
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-23 20:06:15
 * @FilePath: /flutter_mvvm/lib/init/app_init.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/init/default_app.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/utils/date_util.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/object_util.dart';
import 'package:library_base/utils/path_util.dart';

class AppInit {
  static Future<void> run() async {
    if (DeviceUtil.isAndroid) {
      catchException(() => DefaultApp.run());
    } else {
      //捕获异常
      catchException(() => DefaultApp.run());
    }
  }

  ///异常捕获处理
  static void catchException<T>(T callback()) {
    //捕获异常的回调
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    runZoned<Future<Null>>(
      () async {
        callback();
      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          collectLog(parent, zone, line); // 收集日志
        },
      ),
      //未捕获的异常的回调
      onError: (Object obj, StackTrace stack) {
        var details = makeDetails(obj, stack);
        reportErrorAndLog(details);
      },
    );
  }

  //日志拦截, 收集日志
  static void collectLog(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, line);
  }

  //上报错误和日志逻辑
  static void reportErrorAndLog(FlutterErrorDetails details) {
    print(details);
    saveErrorToFile(details.toString());

    if (DeviceUtil.isMobile && Constant.isReleaseMode) {}
  }

  static Future<void> saveErrorToFile(String error) async {
    if (!DeviceUtil.isMobile) {
      return;
    }

    String? dirPath = '';
    if (DeviceUtil.isIOS) {
      dirPath = await PathUtils.getCacheDirPath();
      if (ObjectUtil.isEmpty(dirPath)) {
        return;
      }
    } else {
      dirPath = await PathUtils.getExternalCacheDirPath();
      if (ObjectUtil.isEmpty(dirPath)) {
        return;
      }
    }

    Directory? crashDir = PathUtils.createDirSync('$dirPath/crash');
    String? crashDirPath = crashDir?.path;
    if (ObjectUtil.isEmpty(dirPath)) {
      return;
    }

    String fileName =
        'crash_${DateUtil.getNowDateStr()!.replaceAll(' ', '_')}.txt';

    File file = File('$crashDirPath/$fileName');
    if (!file.existsSync()) {
      file.createSync();
    }

    file.writeAsString(error);
  }

  // 构建错误信息
  static FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
    return FlutterErrorDetails(exception: obj, stack: stack);
  }
}

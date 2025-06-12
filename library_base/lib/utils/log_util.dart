/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:24:53
 * @FilePath: /flutter_mvvm/library_base/lib/utils/log_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Widget Util.
 * @Date: 2018/9/29
 */

import 'package:flutter/foundation.dart';

/// Log Util.
class LogUtil {
  static const String _TAG_DEF = "LogUtil";

  static bool debuggable = true; //是否是debug模式,true: log v 不输出.
  static String TAG = _TAG_DEF;

  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(Object object, {String? tag}) {
    _printLog(tag, '  e  ', object);
  }

  static void v(Object object, {String? tag}) {
    if (debuggable) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String? tag, String stag, Object object) {
    String da = object.toString();
    String tag0 = (tag == null || tag.isEmpty) ? TAG : tag;
    while (da.isNotEmpty) {
      if (da.length > 512) {
        if (kDebugMode) {
          print("$tag0 $stag ${da.substring(0, 512)}");
        }
        da = da.substring(512, da.length);
      } else {
        if (kDebugMode) {
          print("$tag0 $stag $da");
        }
        da = "";
      }
    }
  }
}

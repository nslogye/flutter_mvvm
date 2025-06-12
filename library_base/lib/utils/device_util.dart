/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 14:47:20
 * @FilePath: /flutter_mvvm/library_base/lib/utils/device_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/foundation.dart';

class DeviceUtil {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows =>
      (defaultTargetPlatform == TargetPlatform.windows);
  static bool get isLinux => (defaultTargetPlatform == TargetPlatform.linux);
  static bool get isMacOS => (defaultTargetPlatform == TargetPlatform.macOS);
  static bool get isAndroid =>
      (defaultTargetPlatform == TargetPlatform.android);
  static bool get isFuchsia =>
      (defaultTargetPlatform == TargetPlatform.fuchsia);
  static bool get isIOS => (defaultTargetPlatform == TargetPlatform.iOS);
}

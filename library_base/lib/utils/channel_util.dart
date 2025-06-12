/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:21:57
 * @FilePath: /flutter_mvvm/library_base/lib/utils/channel_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/services.dart';
import 'package:library_base/utils/device_util.dart';

class ChannelUtil {
  static const MethodChannel _kChannel =
      MethodChannel('fblock.flutter_mvvm/methodchannel');

  static Future<String> getChannel() async {
    if (DeviceUtil.isAndroid) {
      var result = await _kChannel.invokeMethod('getChannel');
      return result;
    } else if (DeviceUtil.isIOS) {
      return 'iOS';
    }
    return 'unknown';
  }
}

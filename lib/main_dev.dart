/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:33:11
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 10:08:37
 * @FilePath: /flutter_mvvm/lib/main_dev.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_mvvm/init/app_init.dart';
import 'package:library_base/constant/app_config.dart';
import 'package:library_base/net/apis.dart';

void main() {
  AppConfig.env = EnvModel(
      envMode: EnvEmum.dev,
      apiUrl: Apis.BASE_URL_DEV,
      articleApiUrl: Apis.BASE_URL_ARITCLE_DEV,
      wsUrl: Apis.WEB_SOCKET_URL_DEV);
  print("AppConfig.env---dev");
  AppInit.run();
}

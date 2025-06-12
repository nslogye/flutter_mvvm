/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:37:28
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-03 18:59:57
 * @FilePath: /flutter_mvvm/library_base/lib/constant/app_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/net/apis.dart';

class AppConfig {
  static EnvModel env = EnvModel(
      envMode: EnvEmum.test,
      apiUrl: Apis.BASE_URL_TEST,
      articleApiUrl: Apis.BASE_URL_ARITCLE_TEST,
      wsUrl: Apis.WEB_SOCKET_URL_TEST); // 环境变量配置, 默认配置

  static bool get isTestEnvironment => (env.envMode == EnvEmum.test);
}

enum EnvEmum {
  dev,
  test,
  uat,
  prod,
}

class EnvModel {
  EnvEmum envMode;
  String apiUrl;
  String articleApiUrl;
  String wsUrl;

  EnvModel({
    required this.envMode,
    required this.apiUrl,
    required this.articleApiUrl,
    required this.wsUrl,
  });
}

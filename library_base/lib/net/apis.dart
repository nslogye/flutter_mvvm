/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-12 10:20:41
 * @FilePath: /flutter_mvvm/library_base/lib/net/apis.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
class Apis {
  static const String CODE = 'code';
  static const String MESSAGE = 'msg';
  static const String SUCCESS_OK = "0";
  static const String ERRNO_DIO_ERROR = "DIOERROR";
  static const String ERRNO_UNKNOWN = "UNKNOWN";
  static const String ERRNO_UNKNOWN_MESSAGE = "UNKNOWN MESSAGE";
  static const String ERRNO_FORBIDDEN = "FORBIDDEN";

  static const String KEY_VER = "version";
  static const String KEY_DEVICE_ID = "DeviceId";
  static const String KEY_LANGUAGE = "Language";
  static const String KEY_CHANNEL = "Channel";
  static const String KEY_USER_TOKEN = "Token";
  static const String KEY_USER_U_ID = "Uid";
//开发环境
  static const String BASE_URL_DEV = '';
  static const String BASE_URL_ARITCLE_DEV = '';
  static const String WEB_SOCKET_URL_DEV = '';

  //测试环境
  static const String BASE_URL_TEST = '';
  static const String BASE_URL_ARITCLE_TEST = '';
  static const String WEB_SOCKET_URL_TEST = '';

  //正式环境
  static const String BASE_URL_PROD = '';
  static const String BASE_URL_ARITCLE_PROD = '';
  static const String WEB_SOCKET_URL_PROD = '';
}

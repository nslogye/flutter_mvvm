/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-23 15:17:56
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
  static const String BASE_URL_PROD = 'http://81.70.145.64/api';
  static const String BASE_URL_ARITCLE_PROD = 'https://news.idengta.com/api';
  static const String WEB_SOCKET_URL_PROD = 'ws://81.70.145.64:8083/api/ws';

  static const String URL_GET_HOME = '/home';
  static const String URL_GET_MILESTONES = '/milestone';
  static const String URL_GET_GLOBAL_QUOTE = '/global_quote';
  static const String URL_GET_TREEMAP = '/thermodynamic_diagram';
  static const String URL_GET_COIN_QUOTE = '/coin_quote';
  static const String URL_GET_CHAIN_DETAIL = '/chain/detail';
  static const String URL_GET_CHAIN_QUOTE = '/chain/quote';
  static const String URL_GET_CHAIN_DATA = '/chain/data';
  static const String URL_GET_QUOTE = '/quote';
  static const String COIN_BITCOIN = 'bitcoin';
  static const String COIN_ETHEREUM = 'ethereum';
}

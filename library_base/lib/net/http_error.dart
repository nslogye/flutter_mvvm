/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-03 16:14:35
 * @FilePath: /flutter_mvvm/library_base/lib/net/http_error.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:dio/dio.dart';

class HttpError {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  ///解析错误
  static const String PARSE_ERROR = "PARSE_ERROR";

  ///网络错误
  static const String NETWORK_ERROR = "NETWORK_ERROR";

  ///协议错误
  static const String HTTP_ERROR = "HTTP_ERROR";

  ///证书错误
  static const String SSL_ERROR = "SSL_ERROR";

  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

  String? code;

  String? message;

  HttpError(this.code, this.message);
  HttpError.dioError(DioException error) {
    message = error.message;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        code = CONNECT_TIMEOUT;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioExceptionType.receiveTimeout:
        code = RECEIVE_TIMEOUT;
        message = "服务器异常，请稍后重试！";
        break;
      case DioExceptionType.sendTimeout:
        code = SEND_TIMEOUT;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioExceptionType.badResponse:
        code = HTTP_ERROR;
        message = "服务器异常，请稍后重试！";
        break;
      case DioExceptionType.cancel:
        code = CANCEL;
        message = "请求已被取消，请重新请求";
        break;
      case DioExceptionType.unknown:
        code = UNKNOWN;
        message = "网络异常，请稍后重试！";
        break;
      case DioExceptionType.badCertificate:
        code = SSL_ERROR;
        message = "证书异常，请稍后重试！";
        break;
      case DioExceptionType.connectionError:
        code = NETWORK_ERROR;
        message = "网络异常，请稍后重试！";
        break;
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}

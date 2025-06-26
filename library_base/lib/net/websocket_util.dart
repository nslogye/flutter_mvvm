import 'dart:async';
import 'dart:convert';

import 'package:library_base/constant/app_config.dart';
import 'package:library_base/event/event.dart';
import 'package:library_base/event/ws_event.dart';
import 'package:library_base/model/quote_ws.dart';
import 'package:library_base/utils/device_util.dart';
import 'package:library_base/utils/log_util.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket工具类
class WebSocketUtil {
  static const String _TAG = "WebSocketUtil";

// 静态私有实例
  static final WebSocketUtil _instance = WebSocketUtil._internal();
  // 工厂方法返回单例实例
  factory WebSocketUtil() {
    return _instance;
  }
  // 私有构造函数
  WebSocketUtil._internal();

  static void initWS() {
    WebSocketUtil._instance.initWebSocket(openCallback: () {
      Map<String, dynamic> params = {
        'op': 'subscribe',
        'group': 'public.quote',
        'message': 'eth,btc',
      };
      WebSocketUtil._instance.sendMessage(json.encode(params));
    }, messageCallback: (data) {
      Map<String, dynamic>? result = json.decode(data);
      if (result != null) {
        String? group = result['group'];
        switch (group) {
          case 'public.quote':
            {
              QuoteWs quoteWs = QuoteWs.fromJson(result['message']);
              Event.eventBus.fire(WsEvent(quoteWs, WsEventState.quote));
              break;
            }
          default:
            break;
        }
      }
    });
  }

  WebSocketChannel? _channel; // WebSocket
  bool _isConnect = false;
  bool _handleClose = false;

  num _heartTimes = 10000; // 心跳间隔(毫秒)
  num _rcMaxCount = 600; // 重连次数，默认60次
  num _rcTimes = 0; // 重连计数器
  Timer? _rcTimer; // 重连定时器

  Function? openCallback; // 连接开启回调
  Function? errorCallback; // 连接错误回调
  Function? messageCallback; // 接收消息回调

  void initWebSocket({
    Function? openCallback,
    Function? errorCallback,
    Function? messageCallback,
  }) {
    this.openCallback = openCallback;
    this.errorCallback = errorCallback;
    this.messageCallback = messageCallback;
    openSocket();
  }

  /// 开启WebSocket连接
  void openSocket() {
    _handleClose = false;
    closed();

    if (DeviceUtil.isWeb) {
      _channel = WebSocketChannel.connect(Uri.parse(AppConfig.env.wsUrl));
    } else {
      _channel = IOWebSocketChannel.connect(AppConfig.env.wsUrl,
          pingInterval: Duration(milliseconds: _heartTimes.toInt()));
    }

    LogUtil.v('websocket connect:  ${AppConfig.env.wsUrl}', tag: _TAG);

    _channel!.stream
        .listen((data) => _onMessage(data), onError: _onError, onDone: _onDone);
  }

  _onMessage(data) {
    if (!_isConnect) {
      _isConnect = true;

      _rcTimes = 0;
      _rcTimer?.cancel();
      _rcTimer = null;

      if (openCallback != null) {
        openCallback!();
      }
    }

    LogUtil.v('websocket onmessage:  $data', tag: _TAG);

    if (messageCallback != null) {
      messageCallback!(data);
    }
  }

  _onDone() {
    LogUtil.v(
        'websocket done isconnect: $_isConnect _handleClose: $_handleClose',
        tag: _TAG);
    if (!_handleClose) {
      reconnect();
    }
  }

  /// WebSocket连接错误回调
  _onError(e) {
    LogUtil.v('websocket error: $e', tag: _TAG);

    if (errorCallback != null) {
      errorCallback!(e);
    }
    closed();
  }

  void closeSocket() {
    _handleClose = true;
    closed();
  }

  /// 关闭WebSocket
  void closed() {
    if (_channel != null) {
      _channel!.sink.close();
      _isConnect = false;

      LogUtil.v('websocket closed', tag: _TAG);
    }
  }

  /// 发送消息
  void sendMessage(message) {
    if (_channel != null) {
      LogUtil.v('websocket send: $message, isconnect: $_isConnect', tag: _TAG);
      if (_isConnect) {
        _channel!.sink.add(message);
      }
    }
  }

  /// 重连机制
  void reconnect() {
    if (_rcTimes < _rcMaxCount) {
      _rcTimes++;

      _rcTimer ??=
          Timer.periodic(Duration(milliseconds: _heartTimes.toInt()), (timer) {
        LogUtil.v('websocket reconnect:  ${AppConfig.env.wsUrl}', tag: _TAG);

        if (DeviceUtil.isWeb) {
          _channel = WebSocketChannel.connect(Uri.parse(AppConfig.env.wsUrl));
        } else {
          _channel = IOWebSocketChannel.connect(AppConfig.env.wsUrl,
              pingInterval: Duration(milliseconds: _heartTimes.toInt()));
        }

        _channel!.stream.listen((data) => _onMessage(data),
            onError: _onError, onDone: _onDone);
      });
    } else {
      LogUtil.v('websocket exceed reconncet limits', tag: _TAG);
      _rcTimer?.cancel();
      _rcTimer = null;
      return;
    }
  }
}

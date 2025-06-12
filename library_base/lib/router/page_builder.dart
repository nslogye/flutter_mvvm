/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2023-03-01 03:44:13
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:19:39
 * @FilePath: /lighthouse_flutter-master/library_base/lib/router/page_builder.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_base/router/parameters.dart';

typedef PageBuilderFunc = Widget Function(Parameters? parameters);

class PageBuilder {
  final String path;
  final PageBuilderFunc builderFunc;
  Parameters? parameters;

  Handler? _handler;

  PageBuilder(this.path, this.builderFunc, {this.parameters}) {
    _handler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<Object>> params) {
      return builderFunc(parameters);
    });
  }

  Handler? get handler => _handler;
}

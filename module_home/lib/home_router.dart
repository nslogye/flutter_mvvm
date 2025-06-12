/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-10 11:24:35
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 15:20:32
 * @FilePath: /flutter_mvvm/module_home/lib/home_router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/router/i_router.dart';
import 'package:library_base/router/page_builder.dart';
import 'package:library_base/router/routers.dart';
import 'package:module_home/page/home_page.dart';

//home模块路由表
class HomeRouter implements IRouter {
  static bool isRunModule = false;

  @override
  List<PageBuilder> getPageBuilders() {
    return [
      PageBuilder(Routers.homePage, (params) {
        Key? key = params?.getObj('key');
        return HomePage(key: key);
      }),
    ];
  }
}

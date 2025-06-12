import 'package:flutter/material.dart';
import 'package:library_base/router/i_router.dart';
import 'package:library_base/router/page_builder.dart';
import 'package:library_base/router/routers.dart';
import 'package:module_user/page/user_page.dart';

//home模块路由表
class UserRouter implements IRouter {
  static bool isRunModule = false;

  @override
  List<PageBuilder> getPageBuilders() {
    return [
      PageBuilder(Routers.minePage, (params) {
        Key? key = params?.getObj('key');
        return UserPage(key: key);
      }),
    ];
  }
}

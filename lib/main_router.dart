/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:34:37
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-06 11:54:56
 * @FilePath: /flutter_mvvm/lib/main_router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:library_base/router/i_router.dart';
import 'package:library_base/router/page_builder.dart';
import 'package:library_base/router/routers.dart';
import 'package:flutter_mvvm/page/main_page.dart';

class MainRouter implements IRouter {
  @override
  List<PageBuilder> getPageBuilders() {
    return [
      PageBuilder(Routers.mainPage, (_) => const MainPage()),
    ];
  }
}

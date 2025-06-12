/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-10 11:26:26
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 15:44:30
 * @FilePath: /flutter_mvvm/module_home/lib/page/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/widget/appbar/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 点击空白处收起键盘
        child: Scaffold(
            appBar: CustomAppBar(title: S.current.home, onBackPressed: null),
            body: Container(color: Colors.white)));
  }
}

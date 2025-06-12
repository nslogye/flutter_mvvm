/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-10 11:43:43
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-11 15:44:56
 * @FilePath: /flutter_mvvm/module_user/lib/page/user_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/widget/appbar/appbar_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 点击空白处收起键盘
        child: Scaffold(
            appBar: CustomAppBar(title: S.current.mine, onBackPressed: null),
            body: Container(color: Colors.white)));
  }
}

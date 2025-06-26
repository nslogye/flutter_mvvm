/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-25 17:27:09
 * @FilePath: /flutter_mvvm/library_base/lib/page/not_found_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';

//404页面
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("404",
                style: TextStyle(
                    color: Colours.gray_500,
                    fontSize: 35,
                    fontWeight: FontWeight.w800)),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(S.of(context).notFoundPage,
                  style: TextStyles.textGray500_w400_14),
            )
          ],
        ),
      ),
    ));
  }
}

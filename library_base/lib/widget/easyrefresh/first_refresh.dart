/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 11:52:21
 * @FilePath: /flutter_mvvm/library_base/lib/widget/easyrefresh/first_refresh.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';

class FirstRefresh extends StatelessWidget {
  const FirstRefresh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: SpinKitCircle(
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
          ),
          Text(S.of(context).loading,
              style: const TextStyle(
                  color: Colours.gray_400,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.0,
                  decoration: TextDecoration.none)),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-30 17:28:50
 * @FilePath: /flutter_mvvm/library_base/lib/widget/dialog/loading_dialog.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/res/colors.dart';

//loading加载框
class LoadingDialog extends Dialog {
  //loading动画
  final Widget? loadingView;
  //提示内容
  final String? content;
  //是否显示提示文字
  final bool showContent;
  //圆角大小
  final double radius;
  //文字颜色
  final Color textColor;
  //背景颜色
  final Color backgroundColor;

  LoadingDialog(
      {super.key,
      this.loadingView,
      this.content,
      this.showContent = true,
      this.radius = 5,
      this.textColor = Colours.white,
      this.backgroundColor = Colours.app_main});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 280,
              maxHeight: 50,
            ),
            margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                loadingView ?? SpinKitCircle(color: textColor, size: 25.0),
                showContent
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(content ?? S.current.loading,
                            style: TextStyle(fontSize: 14.0, color: textColor)),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}

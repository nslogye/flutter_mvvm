/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:27:05
 * @FilePath: /flutter_mvvm/library_base/lib/utils/other_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:library_base/generated/l10n.dart';
import 'package:library_base/utils/toast_util.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherUtil {
  OtherUtil._internal();

  static KeyboardActionsConfig getKeyboardActionsConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(S.of(context).close),
                      ),
                    );
                  },
                ],
              )),
    );
  }

  ///处理链接
  static void launchURL(String url) async {
    if (await canLaunchUrl(WebUri(url))) {
      await launchUrl(WebUri(url));
    } else {
      ToastUtil.error("暂不能处理这条链接:$url");
    }
  }
}

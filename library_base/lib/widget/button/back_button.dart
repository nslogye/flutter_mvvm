/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:33:33
 * @FilePath: /flutter_mvvm/library_base/lib/widget/button/back_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/widget/image/local_image.dart';

class BackButtonEx extends StatelessWidget {
  const BackButtonEx({super.key, this.icon, this.onPressed});

  final Widget? icon;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: icon ??
          const LocalImage('icon_back',
              package: Constant.baseLib, width: 20, height: 20),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}

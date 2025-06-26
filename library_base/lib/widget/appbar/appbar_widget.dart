/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-11 15:04:42
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-26 15:05:34
 * @FilePath: /flutter_mvvm/library_base/lib/widget/appbar/appbar_widget.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/extension/extension_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? logo;
  final bool titleIsLogo;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final String? leftIconName;
  final bool automaticallyImplyLeading; // 是否展示默认的返回按钮

  const CustomAppBar({
    this.title,
    this.titleIsLogo = false,
    this.logo,
    this.actions = const [],
    this.onBackPressed,
    this.leftIconName,
    this.automaticallyImplyLeading = true, // 默认为true
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleIsLogo ? buildLogo() : buildTitle(),
      leading: onBackPressed != null
          ? IconButton(
              icon: leftIconName != null
                  ? Image(
                      image: AssetImage("$leftIconName"),
                      width: 24,
                    )
                  : const Icon(Icons.arrow_back),
              onPressed: onBackPressed,
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            )
          : null,
      automaticallyImplyLeading: false, // 禁用原生的自动添加返回按钮
      actions: actions,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    );
  }

// 图片
  Widget? buildLogo() {
    return !isEmptyString(logo)
        ? Image(
            image: AssetImage("$logo"),
            width: 100,
            height: 26,
          )
        : null;
  }

// 标题
  Text? buildTitle() {
    return !isEmptyString(title)
        ? Text(title!,
            style: const TextStyle(
                fontSize: 16.0,
                fontFamily: "IBMPlexSans",
                color: Colors.black,
                fontWeight: FontWeight.w600))
        : null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

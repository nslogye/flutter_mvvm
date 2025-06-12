/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:46:07
 * @FilePath: /flutter_mvvm/library_base/lib/widget/clickbar/setting_clickbar.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/gaps.dart';
import 'package:library_base/res/styles.dart';

/// 列表项
class SettingClickBar extends StatefulWidget {
  // 标题
  final String title;

  final String? subTitle;

  // 点击事件
  final Function()? onPressed;

  final OutlinedBorder? shape;

  final TextStyle? titleStyle;

  final EdgeInsetsGeometry? padding;

  final bool iconSpace;

  // 构造函数
  const SettingClickBar(
      {super.key,
      required this.title,
      this.titleStyle,
      this.subTitle,
      this.onPressed,
      this.shape,
      this.padding,
      this.iconSpace = true});

  @override
  SettingClickBarState createState() => SettingClickBarState();
}

class SettingClickBarState extends State<SettingClickBar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: widget.shape,
        backgroundColor: Colours.white,
      ),
      onPressed: widget.onPressed ?? () {},
      child: Container(
          height: 52.0,
          width: double.infinity,
          padding: widget.padding ?? const EdgeInsets.only(left: 16, right: 16),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.6, color: Colours.default_line))),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  widget.title,
                  style: widget.titleStyle ?? TextStyles.textGray800_w400_16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.subTitle ?? '',
                      style: TextStyles.textGray400_w400_14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
              widget.onPressed != null
                  ? const Icon(Icons.keyboard_arrow_right,
                      color: Colours.gray_200, size: 24)
                  : Container(width: widget.iconSpace ? 24 : 0),
            ],
          )),
    );
  }
}

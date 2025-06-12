/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:44:49
 * @FilePath: /flutter_mvvm/library_base/lib/widget/clickbar/mine_clickbar.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/gaps.dart';
import 'package:library_base/res/styles.dart';

/// 列表项
class MineClickBar extends StatefulWidget {
  // 标题
  final String title;

  final String? subTitle;
  // 右侧控件
  final Widget? icon;
  // 点击事件
  final Function()? onPressed;

  final OutlinedBorder? shape;
  // 构造函数
  const MineClickBar({
    super.key,
    required this.title,
    this.subTitle,
    this.icon,
    this.onPressed,
    this.shape,
  });

  @override
  MineClickBarState createState() => MineClickBarState();
}

class MineClickBarState extends State<MineClickBar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: widget.shape,
      ),
      onPressed: widget.onPressed,
      child: Container(
          height: 54.0,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: <Widget>[
              widget.icon != null
                  ? IconButton(
                      onPressed: null,
                      constraints: const BoxConstraints(minWidth: 0),
                      padding: const EdgeInsets.all(10),
                      icon: widget.icon!,
                    )
                  : Gaps.empty,
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(right: 16),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.6, color: Colours.default_line))),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        widget.title,
                        style: TextStyles.textGray800_w400_16,
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
                            style: TextStyles.textGray800_w400_14,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    widget.onPressed != null
                        ? const Icon(Icons.keyboard_arrow_right,
                            color: Colours.gray_200, size: 24)
                        : Container(),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}

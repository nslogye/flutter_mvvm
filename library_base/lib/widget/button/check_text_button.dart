/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:35:26
 * @FilePath: /flutter_mvvm/library_base/lib/widget/button/check_text_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';

class CheckTextButton extends StatefulWidget {
  bool value = false;

  String? text;

  Function(bool)? onChanged;

  CheckTextButton({super.key, required this.value, this.text, this.onChanged});

  @override
  RoundCheckBoxState createState() => RoundCheckBoxState();
}

class RoundCheckBoxState extends State<CheckTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.value = !widget.value;
          if (widget.onChanged != null) {
            widget.onChanged!(widget.value);
          }
        },
        child: Container(
            height: 30,
            color: Colours.white,
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 9),
            child: widget.value
                ? Text(widget.text ?? '', style: TextStyles.textMain500_11)
                : Text(widget.text ?? '',
                    style: TextStyles.textGray400_w400_11)));
  }
}

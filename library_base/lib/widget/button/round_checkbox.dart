/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:36:30
 * @FilePath: /flutter_mvvm/library_base/lib/widget/button/round_checkbox.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/constant/constant.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/widget/image/local_image.dart';

class RoundCheckBox extends StatefulWidget {
  var value = false;

  Function(bool)? onChanged;

  RoundCheckBox({super.key, required this.value, this.onChanged});

  @override
  RoundCheckBoxState createState() => RoundCheckBoxState();
}

class RoundCheckBoxState extends State<RoundCheckBox> {
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
            height: 36,
            color: Colours.white,
            padding: const EdgeInsets.all(10.0),
            child: widget.value
                ? const LocalImage('check_on',
                    package: Constant.baseLib, width: 16, height: 16)
                : const LocalImage('check_off',
                    package: Constant.baseLib, width: 16, height: 16)));
  }
}

/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:36:09
 * @FilePath: /flutter_mvvm/library_base/lib/widget/button/gradient_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';
import 'package:library_base/res/styles.dart';

class GradientButton extends StatefulWidget {
  final List<Color> colors;
  final String? text;
  final TextStyle textStyle;
  final double? width;
  final double? height;
  final Function()? onPressed;

  const GradientButton({
    super.key,
    required this.colors,
    this.text,
    this.textStyle = TextStyles.textWhite16,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  GradientButtonState createState() => GradientButtonState();
}

class GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0), //圆角
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: widget.colors,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          disabledBackgroundColor: const Color(0xff93b8fd),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text ?? '',
          style: widget.textStyle,
        ),
      ),
    );
  }
}

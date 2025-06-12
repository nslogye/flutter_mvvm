/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-05 16:37:22
 * @FilePath: /flutter_mvvm/library_base/lib/widget/button/sort_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:library_base/res/colors.dart';

enum SortButtonState {
  normal,
  assuper, //升序
  descend, //降序
}

class SortButton extends StatelessWidget {
  final SortButtonState state;

  const SortButton({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 20,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 2,
              bottom: 4,
              child: Icon(Icons.arrow_drop_up,
                  color: state == SortButtonState.assuper
                      ? Colours.dark_app_main
                      : Colours.gray_300,
                  size: 14)),
          Positioned(
              top: 6,
              bottom: 0,
              child: Icon(Icons.arrow_drop_down,
                  color: state == SortButtonState.descend
                      ? Colours.dark_app_main
                      : Colours.gray_300,
                  size: 14)),
        ],
      ),
    );
  }
}

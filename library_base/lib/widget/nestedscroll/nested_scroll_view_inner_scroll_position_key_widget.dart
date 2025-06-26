/*
 * @Author: wanku.ye nslogye@gmail.com
 * @Date: 2025-06-03 15:38:36
 * @LastEditors: wanku.ye nslogye@gmail.com
 * @LastEditTime: 2025-06-24 16:30:56
 * @FilePath: /flutter_mvvm/library_base/lib/widget/nestedscroll/nested_scroll_view_inner_scroll_position_key_widget.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
//pack your inner scrollables which are in  NestedScrollView body
//so that it can find the active scrollable
//compare with NestedScrollViewInnerScrollPositionKeyBuilder
import 'package:flutter/material.dart';

class NestedScrollViewInnerScrollPositionKeyWidget extends StatefulWidget {
  const NestedScrollViewInnerScrollPositionKeyWidget(
      this.scrollPositionKey, this.child,
      {super.key});
  final Key scrollPositionKey;
  final Widget child;
  static State? of(BuildContext context) {
    return context.findAncestorStateOfType<
        NestedScrollViewInnerScrollPositionKeyWidgetState>();
  }

  @override
  NestedScrollViewInnerScrollPositionKeyWidgetState createState() =>
      NestedScrollViewInnerScrollPositionKeyWidgetState();
}

class NestedScrollViewInnerScrollPositionKeyWidgetState
    extends State<NestedScrollViewInnerScrollPositionKeyWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
